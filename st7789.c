#include "mcc_generated_files/mcc.h"
#include <xc.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include "fonts.h"
#include "st7789.h"



//------------------------------ Definitions ---------------------------------//


  #define ST7789_SPI_Write(x)  SPI1_ExchangeByte((uint8_t)x)


uint8_t
  _width,     ///< Display width as modified by current rotation
  _height,    ///< Display height as modified by current rotation
  _xstart,    ///< Internal framebuffer X offset
  _ystart,    ///< Internal framebuffer Y offset
  _colstart,  ///< Some displays need this changed to offset
  _rowstart,  ///< Some displays need this changed to offset
  rotation;   ///< Display rotation (0 thru 3)

uint8_t
  cursor_x = 0,          ///< x location to start print()ing text
  cursor_y = 0;          ///< y location to start print()ing text
uint16_t 
  textcolor = 0xFFFF,    ///< 16-bit background color for print()
  textbgcolor = 0xFFFF;  ///< 16-bit text color for print()
uint8_t textsize = 1;          ///< Desired magnification of text to print()
bool wrap = true;           ///< If set, 'wrap' text at right edge of display

// SCREEN INITIALIZATION ***************************************************

// Rather than a bazillion writecommand() and writedata() calls, screen
// initialization commands and arguments are organized in these tables
// stored in PROGMEM.  The table may look bulky, but that's mostly the
// formatting -- storage-wise this is hundreds of bytes more compact
// than the equivalent code.  Companion function follows.

#define ST7789_240x240_XSTART 0
#define ST7789_240x240_YSTART 80

const uint8_t
  cmd_240x240[] =  {                // Init commands for 7789 screens
    9,                              //  9 commands in list:
    ST77XX_SWRESET,   ST_CMD_DELAY, //  1: Software reset, no args, w/delay
      150,                          //    150 ms delay
    ST77XX_SLPOUT ,   ST_CMD_DELAY, //  2: Out of sleep mode, no args, w/delay
      255,                          //     255 = 500 ms delay
    ST77XX_COLMOD , 1+ST_CMD_DELAY, //  3: Set color mode, 1 arg + delay:
      0x55,                         //     16-bit color
      10,                           //     10 ms delay
    ST77XX_MADCTL , 1,              //  4: Mem access ctrl (directions), 1 arg:
      0x08,                         //     Row/col addr, bottom-top refresh
    ST77XX_CASET  , 4,              //  5: Column addr set, 4 args, no delay:
      0x00,
      ST7789_240x240_XSTART,        //     XSTART = 0
      (240+ST7789_240x240_XSTART)>>8,
      (240+ST7789_240x240_XSTART)&0xFF,  //     XEND = 240
    ST77XX_RASET  , 4,              //  6: Row addr set, 4 args, no delay:
      0x00,
      ST7789_240x240_YSTART,             //     YSTART = 0
      (240+ST7789_240x240_YSTART)>>8,
      (240+ST7789_240x240_YSTART)&0xFF,  //     YEND = 240
    ST77XX_INVON  ,   ST_CMD_DELAY,  //  7: hack
      10,
    ST77XX_NORON  ,   ST_CMD_DELAY, //  8: Normal display on, no args, w/delay
      10,                           //     10 ms delay
    ST77XX_DISPON ,   ST_CMD_DELAY, //  9: Main screen turn on, no args, delay
    255 };                          //     255 = max (500 ms) delay

//*************************** User Functions ***************************//


//************************* Non User Functions *************************//


/////////////////////////////////////////////////////////////////////////



/**************************************************************************/
/*!
    @brief  Write a single command byte to the display. Chip-select and
            transaction must have been previously set -- this ONLY sets
            the device to COMMAND mode, issues the byte and then restores
            DATA mode. There is no corresponding explicit writeData()
            function -- just use ST7789_SPI_Write().
    @param  cmd  8-bit command to write.
*/
/**************************************************************************/
void writeCommand(uint8_t cmd) {
  TFT_DC = 0;
  ST7789_SPI_Write(cmd);
  TFT_DC = 1;
}

/**************************************************************************/
/*!
    @brief  Companion code to the initiliazation tables. Reads and issues
            a series of LCD commands stored in ROM byte array.
    @param  addr  Flash memory array with commands and data to send
*/
/**************************************************************************/
void displayInit(const uint8_t *addr){
  uint8_t  numCommands, numArgs;
  uint16_t ms;
  
  numCommands = *addr++;   // Number of commands to follow
  
  while(numCommands--) {                 // For each command...

    writeCommand(*addr++); // ReaST7789_SPI_Writed
    numArgs  = *addr++;    // Number of args to follow
    ms       = numArgs & ST_CMD_DELAY;   // If hibit set, delay follows args
    numArgs &= ~ST_CMD_DELAY;            // Mask out delay bit
    while(numArgs--) {                   // For each argument...
      ST7789_SPI_Write(*addr++);   // Read, issue argument
    }

    if(ms) {
      ms = *addr++; // Read post-command delay time (ms)
      if(ms == 255) ms = 500;     // If 255, delay for 500 ms
      while(ms--) __delay_ms(1);
    }
  }
  
}

/**************************************************************************/
/*!
    @brief  Initialization code for ST7789 display
*/
/**************************************************************************/
void tft_init(void) {
 
    TFT_RST = 1;
    __delay_ms(100);
    TFT_RST = 0;
    __delay_ms(100);
    TFT_RST = 1;
    __delay_ms(200);
 
  displayInit(cmd_240x240);

  _colstart = ST7789_240x240_XSTART;
  _rowstart = ST7789_240x240_YSTART;
  _height   = 240;
  _width    = 240;
  setRotation(2);
}

/**************************************************************************/
/*!
  @brief  SPI displays set an address window rectangle for blitting pixels
  @param  x  Top left corner x coordinate
  @param  y  Top left corner x coordinate
  @param  w  Width of window
  @param  h  Height of window
*/
/**************************************************************************/
void setAddrWindow(uint8_t x, uint8_t y, uint8_t w, uint8_t h) {
  x += _xstart;
  y += _ystart;

  writeCommand(ST77XX_CASET); // Column addr set
  ST7789_SPI_Write(0);
  ST7789_SPI_Write(x);
  ST7789_SPI_Write(0);
  ST7789_SPI_Write(x+w-1);

  writeCommand(ST77XX_RASET); // Row addr set
  ST7789_SPI_Write(0);
  ST7789_SPI_Write(y);
  ST7789_SPI_Write(0);
  ST7789_SPI_Write(y+h-1);

  writeCommand(ST77XX_RAMWR); // write to RAM
}

/**************************************************************************/
/*!
    @brief  Set origin of (0,0) and orientation of TFT display
    @param  m  The index for rotation, from 0-3 inclusive
*/
/**************************************************************************/
void setRotation(uint8_t m) {
  uint8_t madctl = 0;

  rotation = m & 3; // can't be higher than 3

  switch (rotation) {
   case 0:
     madctl  = ST77XX_MADCTL_MX | ST77XX_MADCTL_MY | ST77XX_MADCTL_RGB;
     _xstart = _colstart;
     _ystart = _rowstart;
     break;
   case 1:
     madctl  = ST77XX_MADCTL_MY | ST77XX_MADCTL_MV | ST77XX_MADCTL_RGB;
     _xstart = _rowstart;
     _ystart = _colstart;
     break;
  case 2:
     madctl  = ST77XX_MADCTL_RGB;
     _xstart = 0;
     _ystart = 0;
     break;
   case 3:
     madctl  = ST77XX_MADCTL_MX | ST77XX_MADCTL_MV | ST77XX_MADCTL_RGB;
     _xstart = 0;
     _ystart = 0;
     break;
  }
 
  writeCommand(ST77XX_MADCTL);
  ST7789_SPI_Write(madctl);
  
}

void drawPixel(uint8_t x, uint8_t y, uint16_t color) {
  if((x < _width) && (y < _height)) {
    
    setAddrWindow(x, y, 1, 1);
    ST7789_SPI_Write(color >> 8);
    ST7789_SPI_Write(color & 0xFF);
    
  }
}

/**************************************************************************/
/*!
   @brief    Draw a perfectly horizontal line (this is often optimized in a subclass!)
    @param    x   Left-most x coordinate
    @param    y   Left-most y coordinate
    @param    w   Width in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void drawHLine(uint8_t x, uint8_t y, uint8_t w, uint16_t color) {
  if( (x < _width) && (y < _height) && w) {   
   uint8_t hi = (uint8_t)(color >> 8), lo = (uint8_t)color;

    if((x + w - 1) >= _width)  
      w = _width  - x;
    
    setAddrWindow(x, y, w, 1);
    while (w--) {
    ST7789_SPI_Write(hi);
    ST7789_SPI_Write(lo);
    }
   
  }
}

/**************************************************************************/
/*!
   @brief    Draw a perfectly vertical line (this is often optimized in a subclass!)
    @param    x   Top-most x coordinate
    @param    y   Top-most y coordinate
    @param    h   Height in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void drawVLine(uint8_t x, uint8_t y, uint8_t h, uint16_t color) {
  if( (x < _width) && (y < _height) && h) {  
    uint8_t hi = (uint8_t)(color >> 8), lo = (uint8_t)color;
    if((y + h - 1) >= _height) 
      h = _height - y;
  
    setAddrWindow(x, y, 1, h);
    while (h--) {
      ST7789_SPI_Write(hi);
      ST7789_SPI_Write(lo);
    }
   
  }
}

/**************************************************************************/
/*!
   @brief    Fill a rectangle completely with one color. Update in subclasses if desired!
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void fillRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint16_t color) {
  if( (x < _width) && (y < _height) && w && h) {                            // Nonzero width and height?
    uint8_t hi = (uint8_t)(color >> 8), lo = (uint8_t)color;
    uint16_t px;
    if((x + w - 1) >= _width)  
      w = _width  - x;
    if((y + h - 1) >= _height) 
      h = _height - y;
  
    setAddrWindow(x, y, w, h);
    px = (uint16_t)w * h;
    while (px--) {
      ST7789_SPI_Write(hi);
      ST7789_SPI_Write(lo);
    }
   
  }
}

/**************************************************************************/
/*!
   @brief    Fill the screen completely with one color. Update in subclasses if desired!
    @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void fillScreen(uint16_t color) {
    fillRect(0, 0, _width, _height, color);
}

/**************************************************************************/
/*!
    @brief  Invert the colors of the display (if supported by hardware).
            Self-contained, no transaction setup required.
    @param  i  true = inverted display, false = normal display.
*/
/**************************************************************************/
void invertDisplay(bool i) {
   
    writeCommand(i ? ST77XX_INVON : ST77XX_INVOFF);
    
}

/*!
    @brief  Essentially writePixel() with a transaction around it. I don't
            think this is in use by any of our code anymore (believe it was
            for some older BMP-reading examples), but is kept here in case
            any user code relies on it. Consider it DEPRECATED.
    @param  color  16-bit pixel color in '565' RGB format.
*/
void pushColor(uint16_t color) {
    uint8_t hi = (uint8_t)(color >> 8), lo = (uint8_t)color;
  
    ST7789_SPI_Write(hi);
    ST7789_SPI_Write(lo);
   
}

/**
 * @brief Draw a big Pixel at a point
 * @param x&y -> coordinate of the point
 * @param color -> color of the Pixel
 * @return none
 */
void DrawPixel_4px(uint8_t x, uint8_t y, uint16_t color)
{
	if ((x <= 0) || (x > _width) ||
		 (y <= 0) || (y > _height))	return;
	
	fillRect(x - 1, y - 1, x + 1, y + 1, color);
	
}


/*!
    @brief  Print one byte/character of data
    @param  c  The 8-bit ascii character to write
*/
/**************************************************************************/
void display_putc(uint8_t c) {
  uint8_t i, j;
  if (c == ' ' && cursor_x == 0 && wrap)
    return;
  if(c == '\r') {
    cursor_x = 0;
    return;
  }
  if(c == '\n') {
    cursor_y += textsize * 8;
    return;
  }

  for(i = 0; i < 5; i++ ) {
    uint8_t line = font[c][i];
    for(j = 0; j < 8; j++, line >>= 1) {
      if(line & 1) {
        if(textsize == 1)
          drawPixel(cursor_x + i, cursor_y + j, textcolor);
        else
          fillRect(cursor_x + i * textsize, cursor_y + j * textsize, textsize, textsize, textcolor);
      } 
      else 
        if(textbgcolor != textcolor) {
          if(textsize == 1)
            drawPixel(cursor_x + i, cursor_y + j, textbgcolor);
          else
            fillRect(cursor_x + i * textsize, cursor_y + j * textsize, textsize, textsize, textbgcolor);
        }
    }
  }

  if(textbgcolor != textcolor) {  // If opaque, draw vertical line for last column
    if(textsize == 1)  drawVLine((uint8_t)(cursor_x + 5), (uint8_t)(cursor_y), 8, textbgcolor);
    else               fillRect((uint8_t)(cursor_x + 5 * textsize), (uint8_t)(cursor_y), textsize, (uint8_t)(8 * textsize), textbgcolor);
  }

  cursor_x += textsize * 6;

  if( cursor_x > ((uint16_t)_width + textsize * 6) )
    cursor_x = _width;

  if (wrap && (cursor_x + (textsize * 5)) > _width)
  {
    cursor_x = 0;
    cursor_y += textsize * 8;
    if( cursor_y > ((uint16_t)_height + textsize * 8) )
      cursor_y = _height;
  }
}


/*!
    @brief  Print string character of data
    @param  c  The 8-bit ascii string character to write
*/
/**************************************************************************/
void display_puts(uint8_t *s) {
  while(*s)
    display_putc(*s++);
}

/*!
    @brief   Set text 'magnification' size. Each increase in s makes 1 pixel that much bigger.
    @param  s  Desired text size. 1 is default 6x8, 2 is 12x16, 3 is 18x24, etc
*/
/**************************************************************************/
void setTextSize(uint8_t s) {
    textsize = (s > 0) ? s : 1;
}

/*!
    @brief      Whether text that is too long should 'wrap' around to the next line.
    @param  w Set true for wrapping, false for clipping
*/
/**************************************************************************/
void setTextWrap(bool w) {
    wrap = w;
}

/*!
    @brief  Set text cursor location
    @param  x    X coordinate in pixels
    @param  y    Y coordinate in pixels
*/
/**************************************************************************/
void setCursor(uint8_t x, uint8_t y) {
    cursor_x = x;
    cursor_y = y;
}

/*!
    @brief   Set text font color with custom background color
    @param   c   16-bit 5-6-5 Color to draw text with
    @param   b   16-bit 5-6-5 Color to draw background/fill with
*/
/**************************************************************************/
void setTextColor(uint16_t c, uint16_t b) {
    textcolor   = c;
    textbgcolor = b;
}

/*!
   @brief   Draw a single character
    @param    x   Bottom left corner x coordinate
    @param    y   Bottom left corner y coordinate
    @param    c   The 8-bit font-indexed character (likely ascii)
    @param    color 16-bit 5-6-5 Color to draw chraracter with
    @param    bg 16-bit 5-6-5 Color to fill background with (if same as color, no background)
    @param    size  Font magnification level, 1 is 'original' size
*/
/**************************************************************************/
void display_drawChar(uint8_t x, uint8_t y, uint8_t c, uint16_t color, uint16_t bg,
     uint8_t size) {
  uint16_t prev_color = textcolor,
           prev_bg    = textbgcolor;
  uint8_t  prev_size  = textsize,
           prev_x     = cursor_x,
           prev_y     = cursor_y ;

  setCursor(x, y);
  setTextSize(size);
  setTextColor(color, bg);
  display_putc(c);

  cursor_x    = prev_x;
  cursor_y    = prev_y;
  textcolor   = prev_color;
  textbgcolor = prev_bg;
  textsize    = prev_size;
}

/*!
    @brief  Get text cursor X location
    @returns    X coordinate in pixels
*/
/**************************************************************************/
uint8_t getCursorX(void) {
    return cursor_x;
}

/*!
    @brief      Get text cursor Y location
    @returns    Y coordinate in pixels
*/
/**************************************************************************/
uint8_t getCursorY(void) {
    return cursor_y;
}

/*!
    @brief      Get rotation setting for display
    @returns    0 thru 3 corresponding to 4 cardinal rotations
*/
/**************************************************************************/
uint8_t getRotation(void) {
    return rotation;
}

/*!
    @brief      print custom char (dimension: 7x5 or 8x5 pixel)
*/
/**************************************************************************/
void display_customChar(const uint8_t *c) {
  uint8_t i, j;
  for(i = 0; i < 5; i++ ) {
    uint8_t line = c[i];
    for(j = 0; j < 8; j++, line >>= 1) {
      if(line & 1) {
        if(textsize == 1)
          drawPixel(cursor_x + i, cursor_y + j, textcolor);
        else
          fillRect(cursor_x + i * textsize, cursor_y + j * textsize, textsize, textsize, textcolor);
      } 
      else 
        if(textbgcolor != textcolor) {
          if(textsize == 1)
            drawPixel(cursor_x + i, cursor_y + j, textbgcolor);
          else
            fillRect(cursor_x + i * textsize, cursor_y + j * textsize, textsize, textsize, textbgcolor);
        }
    }
  }

  if(textbgcolor != textcolor) {  // If opaque, draw vertical line for last column
    if(textsize == 1)  drawVLine(cursor_x + 5, cursor_y, 8, textbgcolor);
    else               fillRect(cursor_x + 5 * textsize, cursor_y, textsize, 8 * textsize, textbgcolor);
  }

  cursor_x += textsize * 6;

  if( cursor_x > ((uint16_t)_width + textsize * 6) )
    cursor_x = _width;

  if (wrap && (cursor_x + (textsize * 5)) > _width)
  {
    cursor_x = 0;
    cursor_y += textsize * 8;
    if( cursor_y > ((uint16_t)_height + textsize * 8) )
      cursor_y = _height;
  }
}

/*!
    @brief   Given 8-bit red, green and blue values, return a 'packed'
             16-bit color value in '565' RGB format (5 bits red, 6 bits
             green, 5 bits blue). This is just a mathematical operation,
             no hardware is touched.
    @param   red    8-bit red brightnesss (0 = off, 255 = max).
    @param   green  8-bit green brightnesss (0 = off, 255 = max).
    @param   blue   8-bit blue brightnesss (0 = off, 255 = max).
    @return  'Packed' 16-bit color value (565 format).
*/
/**************************************************************************/
uint16_t display_color565(uint8_t red, uint8_t green, uint8_t blue) {
    return ((uint16_t)(red & 0xF8) << 8) | ((uint16_t)(green & 0xFC) << 3) | (blue >> 3);
}

/*!
   @brief   Draw a rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void display_drawRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint16_t color) {
    drawHLine(x, y, w, color);
    drawHLine(x, y+h-1, w, color);
    drawVLine(x, y, h, color);
    drawVLine(x+w-1, y, h, color);
}

/*!
    @brief    Quarter-circle drawer, used to do circles and roundrects
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    cornername  Mask bit #1 or bit #2 to indicate which quarters of the circle we're doing
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void display_drawCircleHelper(uint8_t x0, uint8_t y0, uint8_t r, uint8_t cornername, uint16_t color) {
    int16_t f     = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    uint8_t x     = 0;
    uint8_t y     = r;

    while (x<y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f     += ddF_y;
        }
        x++;
        ddF_x += 2;
        f     += ddF_x;
        if (cornername & 0x4) {
            drawPixel(x0 + x, y0 + y, color);
            drawPixel(x0 + y, y0 + x, color);
        }
        if (cornername & 0x2) {
            drawPixel(x0 + x, y0 - y, color);
            drawPixel(x0 + y, y0 - x, color);
        }
        if (cornername & 0x8) {
            drawPixel(x0 - y, y0 + x, color);
            drawPixel(x0 - x, y0 + y, color);
        }
        if (cornername & 0x1) {
            drawPixel(x0 - y, y0 - x, color);
            drawPixel(x0 - x, y0 - y, color);
        }
    }
}

/*!
    @brief  Quarter-circle drawer with fill, used for circles and roundrects
    @param  x0       Center-point x coordinate
    @param  y0       Center-point y coordinate
    @param  r        Radius of circle
    @param  corners  Mask bits indicating which quarters we're doing
    @param  delta    Offset from center-point, used for round-rects
    @param  color    16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void display_fillCircleHelper(uint8_t x0, uint8_t y0, uint8_t r, uint8_t corners, uint8_t delta, uint16_t color) {
    int16_t f     = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    uint8_t x     = 0;
    uint8_t y     = r;
    uint8_t px    = x;
    uint8_t py    = y;

    delta++; // Avoid some +1's in the loop

    while(x < y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f     += ddF_y;
        }
        x++;
        ddF_x += 2;
        f     += ddF_x;
        // These checks avoid double-drawing certain lines, important
        // for the SSD1306 library which has an INVERT drawing mode.
        if(x < (y + 1)) {
            if(corners & 1) drawVLine(x0+x, y0-y, 2*y+delta, color);
            if(corners & 2) drawVLine(x0-x, y0-y, 2*y+delta, color);
        }
        if(y != py) {
            if(corners & 1) drawVLine(x0+py, y0-px, 2*px+delta, color);
            if(corners & 2) drawVLine(x0-py, y0-px, 2*px+delta, color);
            py = y;
        }
        px = x;
    }
}

/*!
   @brief   Draw a rounded rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    r   Radius of corner rounding
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void display_drawRoundRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint8_t r, uint16_t color) {
    uint8_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
    if(r > max_radius) r = max_radius;
    // smarter version
    drawHLine(x+r  , y    , w-2*r, color); // Top
    drawHLine(x+r  , y+h-1, w-2*r, color); // Bottom
    drawVLine(x    , y+r  , h-2*r, color); // Left
    drawVLine(x+w-1, y+r  , h-2*r, color); // Right
    // draw four corners
    display_drawCircleHelper(x+r    , y+r    , r, 1, color);
    display_drawCircleHelper(x+w-r-1, y+r    , r, 2, color);
    display_drawCircleHelper(x+w-r-1, y+h-r-1, r, 4, color);
    display_drawCircleHelper(x+r    , y+h-r-1, r, 8, color);
}

/*!
   @brief   Draw a rounded rectangle with fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    r   Radius of corner rounding
    @param    color 16-bit 5-6-5 Color to draw/fill with
*/
/**************************************************************************/
void display_fillRoundRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint8_t r, uint16_t color) {
    uint8_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
    if(r > max_radius) r = max_radius;
    fillRect(x+r, y, w-2*r, h, color);
    // draw four corners
    display_fillCircleHelper(x+w-r-1, y+r, r, 1, h-2*r-1, color);
    //display_fillCircleHelper(94, 18, 8, 1, 43, color);
    display_fillCircleHelper(x+r    , y+r, r, 2, h-2*r-1, color);
}

/**
 * @brief Draw an Image on the screen
 * @param x&y -> start point of the Image
 * @param w&h -> width & height of the Image to Draw
 * @param data -> pointer of the Image array
 * @return none
 */
void display_DrawImage(uint8_t x, uint8_t y, uint8_t w, uint8_t h, const uint16_t *data)
{
	if ((x >= _width) || (y >= _height))
		return;
	if ((x + w - 1) >= _width)
		return;
	if ((y + h - 1) >= _height)
		return;
	
	setAddrWindow(x, y, x + w - 1, y + h - 1);
	SPI1_ExchangeBlock((uint8_t *)data, sizeof(uint16_t) * w * h);
	
}
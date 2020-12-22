#ifndef ST7789_H
#define	ST7789_H

// define ST7789 TFT module pin connections
#define TFT_RST   PORTDbits.RD0        // reset pin
#define TFT_DC    PORTAbits.RA1        // data/command pin

#define ST_CMD_DELAY      0x80    // special signifier for command lists

#define ST77XX_NOP        0x00
#define ST77XX_SWRESET    0x01
#define ST77XX_RDDID      0x04
#define ST77XX_RDDST      0x09

#define ST77XX_SLPIN      0x10
#define ST77XX_SLPOUT     0x11
#define ST77XX_PTLON      0x12
#define ST77XX_NORON      0x13

#define ST77XX_INVOFF     0x20
#define ST77XX_INVON      0x21
#define ST77XX_DISPOFF    0x28
#define ST77XX_DISPON     0x29
#define ST77XX_CASET      0x2A
#define ST77XX_RASET      0x2B
#define ST77XX_RAMWR      0x2C
#define ST77XX_RAMRD      0x2E

#define ST77XX_PTLAR      0x30
#define ST77XX_VSCRDEF    0x33
#define ST77XX_COLMOD     0x3A
#define ST77XX_MADCTL     0x36
#define ST77XX_VSCRSADD   0x37

#define ST77XX_MADCTL_MY  0x80
#define ST77XX_MADCTL_MX  0x40
#define ST77XX_MADCTL_MV  0x20
#define ST77XX_MADCTL_ML  0x10
#define ST77XX_MADCTL_RGB 0x00

#define ST77XX_FRMCTR1    0xB1
#define ST77XX_FRMCTR2    0xB2
#define ST77XX_FRMCTR3    0xB3
#define ST77XX_INVCTR     0xB4
#define ST77XX_PWCTR1     0xC0
#define ST77XX_PWCTR2     0xC1
#define ST77XX_PWCTR3     0xC2
#define ST77XX_PWCTR4     0xC3
#define ST77XX_PWCTR5     0xC4
#define ST77XX_VMCTR1     0xC5
#define ST77XX_GMCTRP1    0xE0
#define ST77XX_GMCTRN1    0xE1



#define ST77XX_RDID1      0xDA
#define ST77XX_RDID2      0xDB
#define ST77XX_RDID3      0xDC
#define ST77XX_RDID4      0xDD


// Some ready-made 16-bit ('565') color settings:
#define WHITE 0xFFFF
#define BLACK 0x0000
#define BLUE 0x001F
#define RED 0xF800
#define MAGENTA 0xF81F
#define GREEN 0x07E0
#define CYAN 0x7FFF
#define YELLOW 0xFFE0
#define GRAY 0X8430
#define BRED 0XF81F
#define GRED 0XFFE0
#define GBLUE 0X07FF
#define BROWN 0XBC40
#define BRRED 0XFC07
#define DARKBLUE 0X01CF
#define LIGHTBLUE 0X7D7C
#define GRAYBLUE 0X5458

#define LIGHTGREEN 0X841F
#define LGRAY 0XC618
#define LGRAYBLUE 0XA651
#define LBBLUE 0X2B12

void writeCommand(uint8_t cmd);
void tft_init(void);
void displayInit(const uint8_t *addr);
void setAddrWindow(uint8_t x, uint8_t y, uint8_t w, uint8_t h);

void drawPixel(uint8_t x, uint8_t y, uint16_t color);
void drawHLine(uint8_t x, uint8_t y, uint8_t w, uint16_t color);
void drawVLine(uint8_t x, uint8_t y, uint8_t h, uint16_t color);
void fillRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint16_t color);
void fillScreen(uint16_t color);
void setRotation(uint8_t m);
void invertDisplay(bool i);
void pushColor(uint16_t color);
void DrawPixel_4px(uint8_t x, uint8_t y, uint16_t color);
void display_putc(uint8_t c);
void display_puts(uint8_t *s);
void setTextSize(uint8_t s);
void setTextWrap(bool w);
void setCursor(uint8_t x, uint8_t y);
void setTextColor(uint16_t c, uint16_t bg);
void display_drawChar(uint8_t x, uint8_t y, uint8_t c, uint16_t color, uint16_t bg, uint8_t size);
void display_customChar(const uint8_t *c);
uint8_t getCursorX(void);
uint8_t getCursorY(void);
uint8_t getRotation();
uint16_t display_color565(uint8_t red, uint8_t green, uint8_t blue);
void display_drawRect(uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint16_t color);
void display_drawCircleHelper(uint8_t x0, uint8_t y0, uint8_t r, uint8_t cornername, uint16_t color);
void display_fillCircleHelper(uint8_t x0, uint8_t y0, uint8_t r, uint8_t corners, uint8_t delta, uint16_t color);
void display_drawRoundRect(uint8_t x0, uint8_t y0, uint8_t w, uint8_t h, uint8_t radius, uint16_t color);
void display_fillRoundRect(uint8_t x0, uint8_t y0, uint8_t w, uint8_t h, uint8_t radius, uint16_t color);
void display_DrawImage(uint8_t x, uint8_t y, uint8_t w, uint8_t h, const uint16_t *data);
void enterSleep (void);
void exitSleep (void);
void display_ColorBars(uint8_t height, uint8_t width);
void setScrollDefinition(uint8_t top_fix_height, uint8_t bottom_fix_height, bool _scroll_direction);
void VerticalScroll(uint8_t _vsp);
void NormalDisplay(void);


#endif	/* ST7789_H */


# 1 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/PIC18F-Q_DFP/1.8.154/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c" 2
# 48 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3
# 48 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdbool.h" 1 3
# 49 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdarg.h" 1 3







# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 1 3





typedef void * va_list[1];
# 8 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdarg.h" 2 3


#pragma intrinsic(__va_start)
#pragma intrinsic(__va_arg)

extern void * __va_start(void);
extern void * __va_arg(void *, ...);
# 50 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c" 2






void display_drawLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);
void display_drawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void display_drawCircle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color);
void display_drawCircleHelper(uint16_t x0, uint16_t y0, uint16_t r, uint8_t cornername, uint16_t color);
void display_fillCircle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color);
void display_fillCircleHelper(uint16_t x0, uint16_t y0, uint16_t r, uint8_t cornername, uint16_t delta, uint16_t color);
void display_drawTriangle(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color);
void display_fillTriangle(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color);
void display_drawRoundRect(uint16_t x0, uint16_t y0, uint16_t w, uint16_t h, uint16_t radius, uint16_t color);
void display_fillRoundRect(uint16_t x0, uint16_t y0, uint16_t w, uint16_t h, uint16_t radius, uint16_t color);

void display_setCursor(uint16_t x, uint16_t y);
void display_setTextColor(uint16_t c, uint16_t bg);
void display_setTextSize(uint8_t s);
void display_setTextWrap(_Bool w);
void display_putc(uint8_t c);
void display_puts(uint8_t *s);
void display_printf(const char *fmt, ...);
void display_customChar(const uint8_t *c);
void display_drawChar(uint16_t x, uint16_t y, uint8_t c, uint16_t color, uint16_t bg, uint8_t size);

uint8_t display_getRotation();
uint16_t getCursorX(void);
uint16_t getCursorY(void);
uint16_t display_getWidth();
uint16_t display_getHeight();
uint16_t display_color565(uint8_t red, uint8_t green, uint8_t blue);

void display_drawBitmapV1 (uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h, uint16_t color);
void display_drawBitmapV1_bg(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h, uint16_t color, uint16_t bg);
void display_drawBitmapV2 (uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h, uint16_t color);
void display_drawBitmapV2_bg(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h, uint16_t color, uint16_t bg);


void writeLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);
uint8_t printNumber(uint32_t n, int8_t n_width, uint8_t _flags);
void printFloat(float float_n, int8_t f_width, int8_t decimal, uint8_t _flags);
void v_printf(const char *fmt, va_list arp);
# 116 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
int16_t
  cursor_x = 0,
  cursor_y = 0;
uint16_t
  textcolor = 0xFFFF,
  textbgcolor = 0xFFFF;
uint8_t
  textsize = 1;
_Bool
  wrap = 1;



static const uint8_t font[256][5] = {
   0x00, 0x00, 0x00, 0x00, 0x00,
   0x3E, 0x5B, 0x4F, 0x5B, 0x3E,
   0x3E, 0x6B, 0x4F, 0x6B, 0x3E,
   0x1C, 0x3E, 0x7C, 0x3E, 0x1C,
   0x18, 0x3C, 0x7E, 0x3C, 0x18,
   0x1C, 0x57, 0x7D, 0x57, 0x1C,
   0x1C, 0x5E, 0x7F, 0x5E, 0x1C,
   0x00, 0x18, 0x3C, 0x18, 0x00,
   0xFF, 0xE7, 0xC3, 0xE7, 0xFF,
   0x00, 0x18, 0x24, 0x18, 0x00,
   0xFF, 0xE7, 0xDB, 0xE7, 0xFF,
   0x30, 0x48, 0x3A, 0x06, 0x0E,
   0x26, 0x29, 0x79, 0x29, 0x26,
   0x40, 0x7F, 0x05, 0x05, 0x07,
   0x40, 0x7F, 0x05, 0x25, 0x3F,
   0x5A, 0x3C, 0xE7, 0x3C, 0x5A,
   0x7F, 0x3E, 0x1C, 0x1C, 0x08,
   0x08, 0x1C, 0x1C, 0x3E, 0x7F,
   0x14, 0x22, 0x7F, 0x22, 0x14,
   0x5F, 0x5F, 0x00, 0x5F, 0x5F,
   0x06, 0x09, 0x7F, 0x01, 0x7F,
   0x00, 0x66, 0x89, 0x95, 0x6A,
   0x60, 0x60, 0x60, 0x60, 0x60,
   0x94, 0xA2, 0xFF, 0xA2, 0x94,
   0x08, 0x04, 0x7E, 0x04, 0x08,
   0x10, 0x20, 0x7E, 0x20, 0x10,
   0x08, 0x08, 0x2A, 0x1C, 0x08,
   0x08, 0x1C, 0x2A, 0x08, 0x08,
   0x1E, 0x10, 0x10, 0x10, 0x10,
   0x0C, 0x1E, 0x0C, 0x1E, 0x0C,
   0x30, 0x38, 0x3E, 0x38, 0x30,
   0x06, 0x0E, 0x3E, 0x0E, 0x06,
   0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x5F, 0x00, 0x00,
   0x00, 0x07, 0x00, 0x07, 0x00,
   0x14, 0x7F, 0x14, 0x7F, 0x14,
   0x24, 0x2A, 0x7F, 0x2A, 0x12,
   0x23, 0x13, 0x08, 0x64, 0x62,
   0x36, 0x49, 0x56, 0x20, 0x50,
   0x00, 0x08, 0x07, 0x03, 0x00,
   0x00, 0x1C, 0x22, 0x41, 0x00,
   0x00, 0x41, 0x22, 0x1C, 0x00,
   0x2A, 0x1C, 0x7F, 0x1C, 0x2A,
   0x08, 0x08, 0x3E, 0x08, 0x08,
   0x00, 0x80, 0x70, 0x30, 0x00,
   0x08, 0x08, 0x08, 0x08, 0x08,
   0x00, 0x00, 0x60, 0x60, 0x00,
   0x20, 0x10, 0x08, 0x04, 0x02,
   0x3E, 0x51, 0x49, 0x45, 0x3E,
   0x00, 0x42, 0x7F, 0x40, 0x00,
   0x72, 0x49, 0x49, 0x49, 0x46,
   0x21, 0x41, 0x49, 0x4D, 0x33,
   0x18, 0x14, 0x12, 0x7F, 0x10,
   0x27, 0x45, 0x45, 0x45, 0x39,
   0x3C, 0x4A, 0x49, 0x49, 0x31,
   0x41, 0x21, 0x11, 0x09, 0x07,
   0x36, 0x49, 0x49, 0x49, 0x36,
   0x46, 0x49, 0x49, 0x29, 0x1E,
   0x00, 0x00, 0x14, 0x00, 0x00,
   0x00, 0x40, 0x34, 0x00, 0x00,
   0x00, 0x08, 0x14, 0x22, 0x41,
   0x14, 0x14, 0x14, 0x14, 0x14,
   0x00, 0x41, 0x22, 0x14, 0x08,
   0x02, 0x01, 0x59, 0x09, 0x06,
   0x3E, 0x41, 0x5D, 0x59, 0x4E,
   0x7C, 0x12, 0x11, 0x12, 0x7C,
   0x7F, 0x49, 0x49, 0x49, 0x36,
   0x3E, 0x41, 0x41, 0x41, 0x22,
   0x7F, 0x41, 0x41, 0x41, 0x3E,
   0x7F, 0x49, 0x49, 0x49, 0x41,
   0x7F, 0x09, 0x09, 0x09, 0x01,
   0x3E, 0x41, 0x41, 0x51, 0x73,
   0x7F, 0x08, 0x08, 0x08, 0x7F,
   0x00, 0x41, 0x7F, 0x41, 0x00,
   0x20, 0x40, 0x41, 0x3F, 0x01,
   0x7F, 0x08, 0x14, 0x22, 0x41,
   0x7F, 0x40, 0x40, 0x40, 0x40,
   0x7F, 0x02, 0x1C, 0x02, 0x7F,
   0x7F, 0x04, 0x08, 0x10, 0x7F,
   0x3E, 0x41, 0x41, 0x41, 0x3E,
   0x7F, 0x09, 0x09, 0x09, 0x06,
   0x3E, 0x41, 0x51, 0x21, 0x5E,
   0x7F, 0x09, 0x19, 0x29, 0x46,
   0x26, 0x49, 0x49, 0x49, 0x32,
   0x03, 0x01, 0x7F, 0x01, 0x03,
   0x3F, 0x40, 0x40, 0x40, 0x3F,
   0x1F, 0x20, 0x40, 0x20, 0x1F,
   0x3F, 0x40, 0x38, 0x40, 0x3F,
   0x63, 0x14, 0x08, 0x14, 0x63,
   0x03, 0x04, 0x78, 0x04, 0x03,
   0x61, 0x59, 0x49, 0x4D, 0x43,
   0x00, 0x7F, 0x41, 0x41, 0x41,
   0x02, 0x04, 0x08, 0x10, 0x20,
   0x00, 0x41, 0x41, 0x41, 0x7F,
   0x04, 0x02, 0x01, 0x02, 0x04,
   0x40, 0x40, 0x40, 0x40, 0x40,
   0x00, 0x03, 0x07, 0x08, 0x00,
   0x20, 0x54, 0x54, 0x78, 0x40,
   0x7F, 0x28, 0x44, 0x44, 0x38,
   0x38, 0x44, 0x44, 0x44, 0x28,
   0x38, 0x44, 0x44, 0x28, 0x7F,
   0x38, 0x54, 0x54, 0x54, 0x18,
   0x00, 0x08, 0x7E, 0x09, 0x02,
   0x18, 0xA4, 0xA4, 0x9C, 0x78,
   0x7F, 0x08, 0x04, 0x04, 0x78,
   0x00, 0x44, 0x7D, 0x40, 0x00,
   0x20, 0x40, 0x40, 0x3D, 0x00,
   0x7F, 0x10, 0x28, 0x44, 0x00,
   0x00, 0x41, 0x7F, 0x40, 0x00,
   0x7C, 0x04, 0x78, 0x04, 0x78,
   0x7C, 0x08, 0x04, 0x04, 0x78,
   0x38, 0x44, 0x44, 0x44, 0x38,
   0xFC, 0x18, 0x24, 0x24, 0x18,
   0x18, 0x24, 0x24, 0x18, 0xFC,
   0x7C, 0x08, 0x04, 0x04, 0x08,
   0x48, 0x54, 0x54, 0x54, 0x24,
   0x04, 0x04, 0x3F, 0x44, 0x24,
   0x3C, 0x40, 0x40, 0x20, 0x7C,
   0x1C, 0x20, 0x40, 0x20, 0x1C,
   0x3C, 0x40, 0x30, 0x40, 0x3C,
   0x44, 0x28, 0x10, 0x28, 0x44,
   0x4C, 0x90, 0x90, 0x90, 0x7C,
   0x44, 0x64, 0x54, 0x4C, 0x44,
   0x00, 0x08, 0x36, 0x41, 0x00,
   0x00, 0x00, 0x77, 0x00, 0x00,
   0x00, 0x41, 0x36, 0x08, 0x00,
   0x02, 0x01, 0x02, 0x04, 0x02,
   0x3C, 0x26, 0x23, 0x26, 0x3C,
   0x1E, 0xA1, 0xA1, 0x61, 0x12,
   0x3A, 0x40, 0x40, 0x20, 0x7A,
   0x38, 0x54, 0x54, 0x55, 0x59,
   0x21, 0x55, 0x55, 0x79, 0x41,
   0x22, 0x54, 0x54, 0x78, 0x42,
   0x21, 0x55, 0x54, 0x78, 0x40,
   0x20, 0x54, 0x55, 0x79, 0x40,
   0x0C, 0x1E, 0x52, 0x72, 0x12,
   0x39, 0x55, 0x55, 0x55, 0x59,
   0x39, 0x54, 0x54, 0x54, 0x59,
   0x39, 0x55, 0x54, 0x54, 0x58,
   0x00, 0x00, 0x45, 0x7C, 0x41,
   0x00, 0x02, 0x45, 0x7D, 0x42,
   0x00, 0x01, 0x45, 0x7C, 0x40,
   0x7D, 0x12, 0x11, 0x12, 0x7D,
   0xF0, 0x28, 0x25, 0x28, 0xF0,
   0x7C, 0x54, 0x55, 0x45, 0x00,
   0x20, 0x54, 0x54, 0x7C, 0x54,
   0x7C, 0x0A, 0x09, 0x7F, 0x49,
   0x32, 0x49, 0x49, 0x49, 0x32,
   0x3A, 0x44, 0x44, 0x44, 0x3A,
   0x32, 0x4A, 0x48, 0x48, 0x30,
   0x3A, 0x41, 0x41, 0x21, 0x7A,
   0x3A, 0x42, 0x40, 0x20, 0x78,
   0x00, 0x9D, 0xA0, 0xA0, 0x7D,
   0x3D, 0x42, 0x42, 0x42, 0x3D,
   0x3D, 0x40, 0x40, 0x40, 0x3D,
   0x3C, 0x24, 0xFF, 0x24, 0x24,
   0x48, 0x7E, 0x49, 0x43, 0x66,
   0x2B, 0x2F, 0xFC, 0x2F, 0x2B,
   0xFF, 0x09, 0x29, 0xF6, 0x20,
   0xC0, 0x88, 0x7E, 0x09, 0x03,
   0x20, 0x54, 0x54, 0x79, 0x41,
   0x00, 0x00, 0x44, 0x7D, 0x41,
   0x30, 0x48, 0x48, 0x4A, 0x32,
   0x38, 0x40, 0x40, 0x22, 0x7A,
   0x00, 0x7A, 0x0A, 0x0A, 0x72,
   0x7D, 0x0D, 0x19, 0x31, 0x7D,
   0x26, 0x29, 0x29, 0x2F, 0x28,
   0x26, 0x29, 0x29, 0x29, 0x26,
   0x30, 0x48, 0x4D, 0x40, 0x20,
   0x38, 0x08, 0x08, 0x08, 0x08,
   0x08, 0x08, 0x08, 0x08, 0x38,
   0x2F, 0x10, 0xC8, 0xAC, 0xBA,
   0x2F, 0x10, 0x28, 0x34, 0xFA,
   0x00, 0x00, 0x7B, 0x00, 0x00,
   0x08, 0x14, 0x2A, 0x14, 0x22,
   0x22, 0x14, 0x2A, 0x14, 0x08,
   0x55, 0x00, 0x55, 0x00, 0x55,
   0xAA, 0x55, 0xAA, 0x55, 0xAA,
   0xFF, 0x55, 0xFF, 0x55, 0xFF,
   0x00, 0x00, 0x00, 0xFF, 0x00,
   0x10, 0x10, 0x10, 0xFF, 0x00,
   0x14, 0x14, 0x14, 0xFF, 0x00,
   0x10, 0x10, 0xFF, 0x00, 0xFF,
   0x10, 0x10, 0xF0, 0x10, 0xF0,
   0x14, 0x14, 0x14, 0xFC, 0x00,
   0x14, 0x14, 0xF7, 0x00, 0xFF,
   0x00, 0x00, 0xFF, 0x00, 0xFF,
   0x14, 0x14, 0xF4, 0x04, 0xFC,
   0x14, 0x14, 0x17, 0x10, 0x1F,
   0x10, 0x10, 0x1F, 0x10, 0x1F,
   0x14, 0x14, 0x14, 0x1F, 0x00,
   0x10, 0x10, 0x10, 0xF0, 0x00,
   0x00, 0x00, 0x00, 0x1F, 0x10,
   0x10, 0x10, 0x10, 0x1F, 0x10,
   0x10, 0x10, 0x10, 0xF0, 0x10,
   0x00, 0x00, 0x00, 0xFF, 0x10,
   0x10, 0x10, 0x10, 0x10, 0x10,
   0x10, 0x10, 0x10, 0xFF, 0x10,
   0x00, 0x00, 0x00, 0xFF, 0x14,
   0x00, 0x00, 0xFF, 0x00, 0xFF,
   0x00, 0x00, 0x1F, 0x10, 0x17,
   0x00, 0x00, 0xFC, 0x04, 0xF4,
   0x14, 0x14, 0x17, 0x10, 0x17,
   0x14, 0x14, 0xF4, 0x04, 0xF4,
   0x00, 0x00, 0xFF, 0x00, 0xF7,
   0x14, 0x14, 0x14, 0x14, 0x14,
   0x14, 0x14, 0xF7, 0x00, 0xF7,
   0x14, 0x14, 0x14, 0x17, 0x14,
   0x10, 0x10, 0x1F, 0x10, 0x1F,
   0x14, 0x14, 0x14, 0xF4, 0x14,
   0x10, 0x10, 0xF0, 0x10, 0xF0,
   0x00, 0x00, 0x1F, 0x10, 0x1F,
   0x00, 0x00, 0x00, 0x1F, 0x14,
   0x00, 0x00, 0x00, 0xFC, 0x14,
   0x00, 0x00, 0xF0, 0x10, 0xF0,
   0x10, 0x10, 0xFF, 0x10, 0xFF,
   0x14, 0x14, 0x14, 0xFF, 0x14,
   0x10, 0x10, 0x10, 0x1F, 0x00,
   0x00, 0x00, 0x00, 0xF0, 0x10,
   0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
   0xF0, 0xF0, 0xF0, 0xF0, 0xF0,
   0xFF, 0xFF, 0xFF, 0x00, 0x00,
   0x00, 0x00, 0x00, 0xFF, 0xFF,
   0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
   0x38, 0x44, 0x44, 0x38, 0x44,
   0xFC, 0x4A, 0x4A, 0x4A, 0x34,
   0x7E, 0x02, 0x02, 0x06, 0x06,
   0x02, 0x7E, 0x02, 0x7E, 0x02,
   0x63, 0x55, 0x49, 0x41, 0x63,
   0x38, 0x44, 0x44, 0x3C, 0x04,
   0x40, 0x7E, 0x20, 0x1E, 0x20,
   0x06, 0x02, 0x7E, 0x02, 0x02,
   0x99, 0xA5, 0xE7, 0xA5, 0x99,
   0x1C, 0x2A, 0x49, 0x2A, 0x1C,
   0x4C, 0x72, 0x01, 0x72, 0x4C,
   0x30, 0x4A, 0x4D, 0x4D, 0x30,
   0x30, 0x48, 0x78, 0x48, 0x30,
   0xBC, 0x62, 0x5A, 0x46, 0x3D,
   0x3E, 0x49, 0x49, 0x49, 0x00,
   0x7E, 0x01, 0x01, 0x01, 0x7E,
   0x2A, 0x2A, 0x2A, 0x2A, 0x2A,
   0x44, 0x44, 0x5F, 0x44, 0x44,
   0x40, 0x51, 0x4A, 0x44, 0x40,
   0x40, 0x44, 0x4A, 0x51, 0x40,
   0x00, 0x00, 0xFF, 0x01, 0x03,
   0xE0, 0x80, 0xFF, 0x00, 0x00,
   0x08, 0x08, 0x6B, 0x6B, 0x08,
   0x36, 0x12, 0x36, 0x24, 0x36,
   0x06, 0x0F, 0x09, 0x0F, 0x06,
   0x00, 0x00, 0x18, 0x18, 0x00,
   0x00, 0x00, 0x10, 0x10, 0x00,
   0x30, 0x40, 0xFF, 0x01, 0x01,
   0x00, 0x1F, 0x01, 0x01, 0x1E,
   0x00, 0x19, 0x1D, 0x17, 0x12,
   0x00, 0x3C, 0x3C, 0x3C, 0x3C,
   0x00, 0x00, 0x00, 0x00, 0x00
};
# 399 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void writeLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color) {
    _Bool steep = (((int16_t)(y1 - y0)) > 0 ? ((int16_t)(y1 - y0)) : -((int16_t)(y1 - y0))) > (((int16_t)(x1 - x0)) > 0 ? ((int16_t)(x1 - x0)) : -((int16_t)(x1 - x0)));
    int16_t dx, dy, err, ystep;
    if (steep) {
        {uint16_t t = x0; x0 = y0; y0 = t;};
        {uint16_t t = x1; x1 = y1; y1 = t;};
    }

    if (x0 > x1) {
        {uint16_t t = x0; x0 = x1; x1 = t;};
        {uint16_t t = y0; y0 = y1; y1 = t;};
    }

    dx = x1 - x0;
    dy = (((int16_t)(y1 - y0)) > 0 ? ((int16_t)(y1 - y0)) : -((int16_t)(y1 - y0)));

    err = dx / 2;
    ystep;

    if (y0 < y1) {
        ystep = 1;
    } else {
        ystep = -1;
    }

    for (; x0<=x1; x0++) {
        if (steep) {
            drawPixel(y0, x0, color);
        } else {
            drawPixel(x0, y0, color);
        }
        err -= dy;
        if (err < 0) {
            y0 += ystep;
            err += dx;
        }
    }
}
# 448 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color) {

    if(x0 == x1){
        if(y0 > y1) {uint16_t t = y0; y0 = y1; y1 = t;};
        drawVLine(x0, y0, y1 - y0 + 1, color);
    } else if(y0 == y1){
        if(x0 > x1) {uint16_t t = x0; x0 = x1; x1 = t;};
        drawHLine(x0, y0, x1 - x0 + 1, color);
    } else {
        writeLine(x0, y0, x1, y1, color);
    }
}
# 470 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawCircle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color) {
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    drawPixel(x0 , y0+r, color);
    drawPixel(x0 , y0-r, color);
    drawPixel(x0+r, y0 , color);
    drawPixel(x0-r, y0 , color);

    while (x<y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;

        drawPixel(x0 + x, y0 + y, color);
        drawPixel(x0 - x, y0 + y, color);
        drawPixel(x0 + x, y0 - y, color);
        drawPixel(x0 - x, y0 - y, color);
        drawPixel(x0 + y, y0 + x, color);
        drawPixel(x0 - y, y0 + x, color);
        drawPixel(x0 + y, y0 - x, color);
        drawPixel(x0 - y, y0 - x, color);
    }
}
# 513 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawCircleHelper(uint16_t x0, uint16_t y0, uint16_t r, uint8_t cornername, uint16_t color) {
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    while (x<y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;
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
# 557 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_fillCircle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color) {
    drawVLine(x0, y0-r, 2*r+1, color);
    display_fillCircleHelper(x0, y0, r, 3, 0, color);
}
# 574 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_fillCircleHelper(uint16_t x0, uint16_t y0, uint16_t r, uint8_t corners, uint16_t delta, uint16_t color) {
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;
    int16_t px = x;
    int16_t py = y;

    delta++;

    while(x < y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;


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
# 619 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    drawHLine(x, y, w, color);
    drawHLine(x, y+h-1, w, color);
    drawVLine(x, y, h, color);
    drawVLine(x+w-1, y, h, color);
}
# 637 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color) {
    int16_t max_radius = ((w < h) ? w : h) / 2;
    if(r > max_radius) r = max_radius;

    drawHLine(x+r , y , w-2*r, color);
    drawHLine(x+r , y+h-1, w-2*r, color);
    drawVLine(x , y+r , h-2*r, color);
    drawVLine(x+w-1, y+r , h-2*r, color);

    display_drawCircleHelper(x+r , y+r , r, 1, color);
    display_drawCircleHelper(x+w-r-1, y+r , r, 2, color);
    display_drawCircleHelper(x+w-r-1, y+h-r-1, r, 4, color);
    display_drawCircleHelper(x+r , y+h-r-1, r, 8, color);
}
# 663 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_fillRoundRect(uint16_t x, uint16_t y, uint16_t w,
  uint16_t h, uint16_t r, uint16_t color) {
    int16_t max_radius = ((w < h) ? w : h) / 2;
    if(r > max_radius) r = max_radius;

    fillRect(x+r, y, w-2*r, h, color);

    display_fillCircleHelper(x+w-r-1, y+r, r, 1, h-2*r-1, color);

    display_fillCircleHelper(x+r , y+r, r, 2, h-2*r-1, color);
}
# 687 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawTriangle(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1,
  uint16_t x2, uint16_t y2, uint16_t color) {
    display_drawLine(x0, y0, x1, y1, color);
    display_drawLine(x1, y1, x2, y2, color);
    display_drawLine(x2, y2, x0, y0, color);
}
# 706 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_fillTriangle(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1,
  uint16_t x2, uint16_t y2, uint16_t color) {
    int16_t a, b, y, last, dx01, dy01, dx02, dy02, dx12, dy12;
    int32_t
    sa = 0,
    sb = 0;


    if (y0 > y1) {
        {uint16_t t = y0; y0 = y1; y1 = t;}; {uint16_t t = x0; x0 = x1; x1 = t;};
    }
    if (y1 > y2) {
        {uint16_t t = y2; y2 = y1; y1 = t;}; {uint16_t t = x2; x2 = x1; x1 = t;};
    }
    if (y0 > y1) {
        {uint16_t t = y0; y0 = y1; y1 = t;}; {uint16_t t = x0; x0 = x1; x1 = t;};
    }

    if(y0 == y2) {
        a = b = x0;
        if(x1 < a) a = x1;
        else if(x1 > b) b = x1;
        if(x2 < a) a = x2;
        else if(x2 > b) b = x2;
        drawHLine(a, y0, b-a+1, color);
        return;
    }

    dx01 = x1 - x0;
    dy01 = y1 - y0;
    dx02 = x2 - x0;
    dy02 = y2 - y0;
    dx12 = x2 - x1;
    dy12 = y2 - y1;







    if(y1 == y2) last = y1;
    else last = y1-1;

    for(y=y0; y<=last; y++) {
        a = x0 + sa / dy01;
        b = x0 + sb / dy02;
        sa += dx01;
        sb += dx02;




        if(a > b) {uint16_t t = a; a = b; b = t;};
        drawHLine(a, y, b-a+1, color);
    }



    sa = dx12 * (y - y1);
    sb = dx02 * (y - y0);
    for(; y<=y2; y++) {
        a = x1 + sa / dy12;
        b = x0 + sb / dy02;
        sa += dx12;
        sb += dx02;




        if(a > b) {uint16_t t = a; a = b; b = t;};
        drawHLine(a, y, b-a+1, color);
    }
}







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

  if(textbgcolor != textcolor) {
    if(textsize == 1) drawVLine(cursor_x + 5, cursor_y, 8, textbgcolor);
    else fillRect(cursor_x + 5 * textsize, cursor_y, textsize, 8 * textsize, textbgcolor);
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


void display_puts(uint8_t *s) {
  while(*s)
    display_putc(*s++);
}


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

  if(textbgcolor != textcolor) {
    if(textsize == 1) drawVLine(cursor_x + 5, cursor_y, 8, textbgcolor);
    else fillRect(cursor_x + 5 * textsize, cursor_y, textsize, 8 * textsize, textbgcolor);
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
# 896 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawChar(uint16_t x, uint16_t y, uint8_t c, uint16_t color, uint16_t bg,
     uint8_t size) {
  uint16_t prev_x = cursor_x,
           prev_y = cursor_y,
           prev_color = textcolor,
           prev_bg = textbgcolor;
  uint8_t prev_size = textsize;

  display_setCursor(x, y);
  display_setTextSize(size);
  display_setTextColor(color, bg);
  display_putc(c);

  cursor_x = prev_x;
  cursor_y = prev_y;
  textcolor = prev_color;
  textbgcolor = prev_bg;
  textsize = prev_size;
}
# 923 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_setCursor(uint16_t x, uint16_t y) {
    cursor_x = x;
    cursor_y = y;
}







uint16_t display_getCursorX(void) {
    return cursor_x;
}







uint16_t display_getCursorY(void) {
    return cursor_y;
}







void display_setTextSize(uint8_t s) {
    textsize = (s > 0) ? s : 1;
}
# 965 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_setTextColor(uint16_t c, uint16_t b) {
    textcolor = c;
    textbgcolor = b;
}







void display_setTextWrap(_Bool w) {
    wrap = w;
}







uint8_t display_getRotation(void) {
    return rotation;
}







uint16_t display_getWidth(void) {
    return _width;
}







uint16_t display_getHeight(void) {
    return _height;
}
# 1022 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
uint16_t display_color565(uint8_t red, uint8_t green, uint8_t blue) {
    return ((uint16_t)(red & 0xF8) << 8) | ((uint16_t)(green & 0xFC) << 3) | (blue >> 3);
}
# 1038 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawBitmapV1(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h,
     uint16_t color) {
  uint16_t i, j;
  for( i = 0; i < h/8; i++)
  {
    for( j = 0; j < w * 8; j++)
    {
      if( bitmap[j/8 + i*w] & (1 << (j % 8)) )
        drawPixel(x + j/8, y + i*8 + (j % 8), color);
    }
  }
}
# 1064 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawBitmapV1_bg(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h,
     uint16_t color, uint16_t bg) {
  uint16_t i, j;
  for( i = 0; i < h/8; i++)
  {
    for( j = 0; j < w * 8; j++)
    {
      if( bitmap[j/8 + i*w] & (1 << (j % 8)) )
        drawPixel(x + j/8, y + i*8 + (j % 8), color);
      else
        drawPixel(x + j/8, y + i*8 + (j % 8), bg);
    }
  }
}
# 1091 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawBitmapV2(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h,
  uint16_t color) {

    uint16_t byteWidth = (w + 7) / 8;
    uint8_t _byte = 0;
    uint16_t i, j;

    for(j = 0; j < h; j++, y++) {
        for( i = 0; i < w; i++ ) {
            if(i & 7) _byte <<= 1;
            else _byte = bitmap[j * byteWidth + i / 8];
            if(_byte & 0x80)
              drawPixel(x+i, y, color);
        }
    }
}
# 1121 "C:/Users/wojte/MPLABXProjects/pic18f47q43_ST7789.X/gfx.c"
void display_drawBitmapV2_bg(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t w, uint16_t h,
  uint16_t color, uint16_t bg) {

    uint16_t byteWidth = (w + 7) / 8;
    uint8_t _byte = 0;
    uint16_t i, j;
    for(j = 0; j < h; j++, y++) {
        for(i = 0; i < w; i++ ) {
            if(i & 7) _byte <<= 1;
            else _byte = bitmap[j * byteWidth + i / 8];
            if(_byte & 0x80)
              drawPixel(x+i, y, color);
            else
              drawPixel(x+i, y, bg);
        }
    }
}

uint8_t printNumber(uint32_t n, int8_t n_width, uint8_t _flags) {
  uint8_t i=0, j, buff[10];
  do {
      buff[i] = (uint8_t)( n % (_flags & 0x1F) );
      if (buff[i] > 9)
        buff[i] += (_flags & 0x80) ? 0x07 : 0x27;
      buff[i++] += '0';
      n /= (_flags & 0x1F);
      } while (n);
  j = i;
  if(_flags & 0x40) {
    n_width--;
    j++;
    if(_flags & 0x20) {
      display_putc('-');
      _flags &= ~0x40;
    }
  }
  while (i < n_width--) {
    if (_flags & 0x20) display_putc('0');
    else display_putc(' ');
  }
  if (_flags & 0x40)
    display_putc('-');
  do {
      display_putc(buff[--i]);
      } while(i);
  return j;
}

void printFloat(float float_n, int8_t f_width, int8_t decimal, uint8_t _flags) {
  int32_t int_part = float_n;
  float rem_part;
  if(decimal == 0) decimal = 1;
  if(float_n < 0) {
    _flags |= 0x40;
    rem_part = (float)int_part - float_n;
    int_part = ~int_part + 1;
  }
  else
    rem_part = float_n - (float)int_part;
  _flags |= 10;
  f_width -= printNumber(int_part, f_width - decimal - 1, _flags);
  display_putc('.');
  f_width--;
  if(f_width < 1) f_width = 1;
  if(decimal > f_width) decimal = f_width;
  while( decimal > 0 && (rem_part != 0 || decimal > 0) ) {
    decimal--;
    rem_part *= 10;
    display_putc( (uint8_t)rem_part + '0' );
    rem_part -= (uint8_t)rem_part;
  }
}

void v_printf(const char *fmt, va_list arp) {
  uint8_t _flags, c, d=0, w=0;
  uint32_t nbr;
  while (1) {
    c = *fmt++;

    if (!c)
      break;

    if (c != '%') {
      display_putc(c);
      continue;
    }

    _flags = 0;
    c = *fmt++;

    if (c == '0') {
      _flags |= 0x20;
      c = *fmt++;
    }

    for (w = 0; c >= '0' && c <= '9'; c = *fmt++)
      w = w * 10 + c - '0';

    if (c == '.') {
      c = *fmt++;
      for (d = 0; c >= '0' && c <= '9'; c = *fmt++)
        d = d * 10 + c - '0';
    }

    if(c == 'f' || c == 'F') {
      printFloat((*(float *)__va_arg(*(float **)arp, (float)0)), w, d, _flags);
      continue;
    }

    if (c == 'l' || c == 'L') {
      _flags |= 0x40;
      c = *fmt++;
    }

    if (!c)
      break;

    if(c == 'X') {
      _flags |= 0x80;
    }

    if (c >= 'a')
      c -= 0x20;
    switch (c) {
      case 'C' :
        display_putc( (uint8_t)(*(uint8_t *)__va_arg(*(uint8_t **)arp, (uint8_t)0)) ); continue;
      case 'B' :
        _flags |= 2; break;
      case 'O' :
        _flags |= 8; break;
      case 'D' :
      case 'U' :
        _flags |= 10; break;
      case 'X' :
        _flags |= 16; break;
      default:
        display_putc(c); continue;
    }

    if(_flags & 0x40)
      nbr = (c == 'D') ? (*(int32_t *)__va_arg(*(int32_t **)arp, (int32_t)0)) : (*(uint32_t *)__va_arg(*(uint32_t **)arp, (uint32_t)0));
    else
      nbr = (c == 'D') ? (int32_t)(*(int16_t *)__va_arg(*(int16_t **)arp, (int16_t)0)) : (uint32_t)(*(uint16_t *)__va_arg(*(uint16_t **)arp, (uint16_t)0));
    if ( (c == 'D') && (nbr & 0x80000000) ) {
      _flags |= 0x40;
      nbr = ~nbr + 1;
    }
    else
      _flags &= ~0x40;
    printNumber(nbr, w, _flags);
  }
}

void display_printf(const char *fmt, ...) {
  va_list arg;
  *arg = __va_start();
  v_printf(fmt, arg);
}

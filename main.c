#include <stdio.h>
#include "mcc_generated_files/mcc.h"
#include "fonts.h"
#include "st7789.h"

#define top_to_bottom  0
#define bottom_to_top  1
#define TFA  100                                     // Top Fixed Area 0 pixel
#define BFA  0                                       // Bottom Fixed Area 0 pixel

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global Interrupts
    // Use the following macros to:

    // Enable the Global Interrupts
   //  INTERRUPT_GlobalInterruptEnable();
     SPI1_Open(SPI1_DEFAULT);
     __delay_ms(5);
    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();
    
     // initialize the ST7789 display
    tft_init();
             
    uint8_t MyString[] = {"HELLO WORLD"};
    fillScreen(BLACK);
    setTextSize(3);
    setCursor(20, 50);
    setTextColor(YELLOW, BLACK);
    display_puts(MyString);
   
    /* licznik
    uint8_t txt[5] ;  
    uint8_t k = 0;
    while(k++ < 50){
    sprintf(txt,"%02u",k);
    display_puts(txt);
    setCursor(100, 50);
    __delay_ms(500);
  }
    */
       
    uint8_t scroll = 0;
    setScrollDefinition(TFA, BFA, bottom_to_top);
    
    while (1)
    {
     /*Test Scroll Text*/
     
     VerticalScroll(scroll + TFA);
     scroll++;
     if(scroll >= (240 - TFA - BFA))
      scroll = 0;
    __delay_ms(100);
     
        
        
        /* Test SPI
        PORTDbits.RD0 = 1;
        SPI1_ExchangeByte('A');
        PORTDbits.RD0 = 0;
        __delay_ms(50);
        */
    }
}
/**
 End of File
*/
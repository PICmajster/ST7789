#include "mcc_generated_files/mcc.h"
#include "fonts.h"
#include "st7789.h"

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
            
    uint8_t MyString[] = {"Ala ma Kota"};
    fillScreen(GREEN);
    setTextSize(3);
    setCursor(20, 50);
    setTextColor(BLUE, GREEN);
    display_puts(MyString);
    
    while (1)
    {
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
/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides APIs for driver for .
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.6
        Device            :  PIC18F47Q43
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.30 and above
        MPLAB 	          :  MPLAB X 5.40	
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

/**
  Section: Included Files
*/

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set TFT_DC aliases
#define TFT_DC_TRIS                 TRISAbits.TRISA1
#define TFT_DC_LAT                  LATAbits.LATA1
#define TFT_DC_PORT                 PORTAbits.RA1
#define TFT_DC_WPU                  WPUAbits.WPUA1
#define TFT_DC_OD                   ODCONAbits.ODCA1
#define TFT_DC_ANS                  ANSELAbits.ANSELA1
#define TFT_DC_SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define TFT_DC_SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define TFT_DC_Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define TFT_DC_GetValue()           PORTAbits.RA1
#define TFT_DC_SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define TFT_DC_SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define TFT_DC_SetPullup()          do { WPUAbits.WPUA1 = 1; } while(0)
#define TFT_DC_ResetPullup()        do { WPUAbits.WPUA1 = 0; } while(0)
#define TFT_DC_SetPushPull()        do { ODCONAbits.ODCA1 = 0; } while(0)
#define TFT_DC_SetOpenDrain()       do { ODCONAbits.ODCA1 = 1; } while(0)
#define TFT_DC_SetAnalogMode()      do { ANSELAbits.ANSELA1 = 1; } while(0)
#define TFT_DC_SetDigitalMode()     do { ANSELAbits.ANSELA1 = 0; } while(0)

// get/set RB1 procedures
#define RB1_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define RB1_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define RB1_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define RB1_GetValue()              PORTBbits.RB1
#define RB1_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define RB1_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)
#define RB1_SetPullup()             do { WPUBbits.WPUB1 = 1; } while(0)
#define RB1_ResetPullup()           do { WPUBbits.WPUB1 = 0; } while(0)
#define RB1_SetAnalogMode()         do { ANSELBbits.ANSELB1 = 1; } while(0)
#define RB1_SetDigitalMode()        do { ANSELBbits.ANSELB1 = 0; } while(0)

// get/set RB3 procedures
#define RB3_SetHigh()            do { LATBbits.LATB3 = 1; } while(0)
#define RB3_SetLow()             do { LATBbits.LATB3 = 0; } while(0)
#define RB3_Toggle()             do { LATBbits.LATB3 = ~LATBbits.LATB3; } while(0)
#define RB3_GetValue()              PORTBbits.RB3
#define RB3_SetDigitalInput()    do { TRISBbits.TRISB3 = 1; } while(0)
#define RB3_SetDigitalOutput()   do { TRISBbits.TRISB3 = 0; } while(0)
#define RB3_SetPullup()             do { WPUBbits.WPUB3 = 1; } while(0)
#define RB3_ResetPullup()           do { WPUBbits.WPUB3 = 0; } while(0)
#define RB3_SetAnalogMode()         do { ANSELBbits.ANSELB3 = 1; } while(0)
#define RB3_SetDigitalMode()        do { ANSELBbits.ANSELB3 = 0; } while(0)

// get/set RC4 procedures
#define RC4_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define RC4_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define RC4_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define RC4_GetValue()              PORTCbits.RC4
#define RC4_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define RC4_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)
#define RC4_SetPullup()             do { WPUCbits.WPUC4 = 1; } while(0)
#define RC4_ResetPullup()           do { WPUCbits.WPUC4 = 0; } while(0)
#define RC4_SetAnalogMode()         do { ANSELCbits.ANSELC4 = 1; } while(0)
#define RC4_SetDigitalMode()        do { ANSELCbits.ANSELC4 = 0; } while(0)

// get/set TFT_RES aliases
#define TFT_RES_TRIS                 TRISDbits.TRISD0
#define TFT_RES_LAT                  LATDbits.LATD0
#define TFT_RES_PORT                 PORTDbits.RD0
#define TFT_RES_WPU                  WPUDbits.WPUD0
#define TFT_RES_OD                   ODCONDbits.ODCD0
#define TFT_RES_ANS                  ANSELDbits.ANSELD0
#define TFT_RES_SetHigh()            do { LATDbits.LATD0 = 1; } while(0)
#define TFT_RES_SetLow()             do { LATDbits.LATD0 = 0; } while(0)
#define TFT_RES_Toggle()             do { LATDbits.LATD0 = ~LATDbits.LATD0; } while(0)
#define TFT_RES_GetValue()           PORTDbits.RD0
#define TFT_RES_SetDigitalInput()    do { TRISDbits.TRISD0 = 1; } while(0)
#define TFT_RES_SetDigitalOutput()   do { TRISDbits.TRISD0 = 0; } while(0)
#define TFT_RES_SetPullup()          do { WPUDbits.WPUD0 = 1; } while(0)
#define TFT_RES_ResetPullup()        do { WPUDbits.WPUD0 = 0; } while(0)
#define TFT_RES_SetPushPull()        do { ODCONDbits.ODCD0 = 0; } while(0)
#define TFT_RES_SetOpenDrain()       do { ODCONDbits.ODCD0 = 1; } while(0)
#define TFT_RES_SetAnalogMode()      do { ANSELDbits.ANSELD0 = 1; } while(0)
#define TFT_RES_SetDigitalMode()     do { ANSELDbits.ANSELD0 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/
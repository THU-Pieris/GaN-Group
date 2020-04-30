// TI File $Revision: /main/4 $
// Checkin $Date: July 30, 2007   14:15:53 $
//###########################################################################
//
// FILE:	DSP2833x_Adc.c
//
// TITLE:	DSP2833x ADC Initialization & Support Functions.
//
//###########################################################################
// $TI Release: DSP2833x Header Files V1.01 $
// $Release Date: September 26, 2007 $
//###########################################################################

#include "DSP2833x_Device.h"     // DSP2833x Headerfile Include File
#include "DSP2833x_Examples.h"   // DSP2833x Examples Include File

#define ADC_usDELAY  5000L



//---------------------------------------------------------------------------
// InitAdc:
//---------------------------------------------------------------------------
// This function initializes ADC to a known state.
//
// ADC start parameters

void InitAdc(void)
{

    EALLOW;

    SysCtrlRegs.PCLKCR0.bit.ADCENCLK = 1;    // ADC clock enable
//  PieVectTable.ADCINT = &ISRAdc;          //Set Adc vector
//  PieVectTable.SEQ1INT = &ISR_Adc_Seq1;
//  PieVectTable.SEQ2INT = &ISR_Adc_Seq2;

   // *IMPORTANT*
   // The ADC_cal function, which  copies the ADC calibration values from TI reserved
   // OTP into the ADCREFSEL and ADCOFFTRIM registers, occurs automatically in the
   // Boot ROM. If the boot ROM code is bypassed during the debug process, the
   // following function MUST be called for the ADC to function according
   // to specification. The clocks to the ADC MUST be enabled before calling this
   // function.
   // See the device data manual and/or the ADC Reference
   // Manual for more information.

#ifndef _ONPC_
    ADC_cal();      //remark if on simulate
#endif

    SysCtrlRegs.HISPCP.all = 0x0003;    // HSPCLK = SYSCLKOUT/ADC_MODCLK 25MHZ
    EDIS;

    // AdcRegs.ADCTRL1.bit.RESET=1; //reset the adc module
    // DSP28x_usDelay(1);
    // AdcRegs.ADCTRL1.bit.RESET=0; //release the adc module from reset

    AdcRegs.ADCTRL1.bit.ACQ_PS = 2;     // 4 ADCLK sample time
    AdcRegs.ADCTRL1.bit.CPS = 0;            // HSPCLK/2 = 25/2 =12.5M
    AdcRegs.ADCTRL1.bit.CONT_RUN = 0;   //start STOP MODE
    AdcRegs.ADCTRL1.bit.SEQ_CASC = 0;   //QUALSEQ MODE
    AdcRegs.ADCTRL3.bit.ADCCLKPS = 0;
    AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 = 1; //enable the pwm_soc start convition    AdcRegs.ADCTRL2.bit.RST_SEQ1= RST_SEQ;
    AdcRegs.ADCTRL2.bit.EPWM_SOCB_SEQ2 = 1;//enable the pwm_soc start convition
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ2 = 1;
    AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;
    AdcRegs.ADCTRL2.bit.RST_SEQ2 = 1;

    AdcRegs.ADCMAXCONV.bit.MAX_CONV1 = 0x3; //8 channels
    AdcRegs.ADCMAXCONV.bit.MAX_CONV2 = 0x3; //8 channels

    AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0;
    AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 1;
    AdcRegs.ADCCHSELSEQ1.bit.CONV02 = 2;
    AdcRegs.ADCCHSELSEQ1.bit.CONV03 = 3;
    AdcRegs.ADCCHSELSEQ2.bit.CONV04 = 4;
    AdcRegs.ADCCHSELSEQ2.bit.CONV05 = 5;
    AdcRegs.ADCCHSELSEQ2.bit.CONV06 = 6;
    AdcRegs.ADCCHSELSEQ2.bit.CONV07 = 7;


    AdcRegs.ADCCHSELSEQ3.bit.CONV08 = 8;
    AdcRegs.ADCCHSELSEQ3.bit.CONV09 = 9;
    AdcRegs.ADCCHSELSEQ3.bit.CONV10 = 10;
    AdcRegs.ADCCHSELSEQ3.bit.CONV11 = 11;
    AdcRegs.ADCCHSELSEQ4.bit.CONV12 = 12;
    AdcRegs.ADCCHSELSEQ4.bit.CONV13 = 13;
    AdcRegs.ADCCHSELSEQ4.bit.CONV14 = 14;
    AdcRegs.ADCCHSELSEQ4.bit.CONV15 = 15;


    AdcRegs.ADCTRL3.bit.ADCBGRFDN = 3;  //bandgap/reference/ADC circuits is POWER ON
    DELAY_US(ADC_usDELAY);
    AdcRegs.ADCTRL3.bit.ADCPWDN = 1;    //others is POWER ON
    DELAY_US(ADC_usDELAY);
    AdcRegs.ADCTRL3.bit.ADCCLKPS = 0;   // ADCLK=HSPCLK/2*(CPS+1)=12.5MHZ
    AdcRegs.ADCTRL3.bit.SMODE_SEL = 0;//shun xu

}
//===========================================================================
// End of file.
//===========================================================================

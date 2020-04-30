#include "DSP2833x_Device.h"   // DSP2833x Headerfile Include File
#include "DSP2833x_Examples.h" // DSP2833x Examples Include File
#include "math.h"
// last change : 2019.08.04  16:18
//

// Prototype statements for functions found within this file.
interrupt void adc_isr(void);

// system initialize
void Config_ADC(void);
void Config_PWM_ADC_DC(void);
void InitEPwm1(void);
void InitEPwm2(void);
void InitEPwm3(void);
//void InitEPwm4(void);
void pwm23_sync(void);
void pfc_contol(void);

// control function
void SET_PWM_DCDC(int EPWM_PERIOD);
float Limit(float vara, float up_limit, float low_limit);
int sign(float value, float Theta);
void SET_PWM_PFC(int EPWM_cmpa, int Uac_sign, int EPWM_prd);
float max(float max[256]);

// constant used in this code
#define Udc_in 400
#define Udc_trgt 48
#define DB_AHC 0x2            // used for AHC mode
int EPWM_DB_PFC = 50;         // 500 / TBCLK = 500 / 75MHz
#define EPWM_DB_DCDC 20       // 500 / TBCLK = 500 / 75MHz
#define ADC2_PERIOD_CURR 300  // used for contorl the current sensor
#define ADC1_PERIOD_CURR 4000 // used for control the voltage sensor
#define pi 3.14159
int Tao = 1700;                             // sqrt(LC)*150e61700
const float L_pfc = 0.0001, T_neg_c = 8.75; //0.0001/sqrt(0.0001/2/17e-12)*15036

//Constant used in the control
const float Kp_DCDC = 10;
const float Ki_DCDC = 0.1;
const float Udc_PIout_uplimit = -5, Udc_PIout_lowlimit = 5;
const float PER_PIout_uplimit = 165, PER_PIout_lowlimit = 180; //375~300 350.215 365.205
float I_PFC_zero = 0.1;
const float k_unify = 1.0;
//const int VAC_c_max = 20;
//const int CAC_c_max = 3;
// Global variables used in this example:
Uint16 LoopCount;
float Duty_DCDC = 0.45;
Uint16 ConversionCount1;
Uint16 ConversionCount2;
Uint16 Pll_buffer_index;
float Voltage_AC[256];
float Current_AC[256];
float theta_buffer[256];
float Current_AC_view[256];
float Voltage_AC_view[256];
float Voltage_DC[256];
float Current_now;
float Current_Hua[5];
float Voltage_Hua[5];
float Voltage_Hua_DC[5];

unsigned int EPWM_PERIOD_PFC = 20000, EPWM_PERIOD_PFC_temp; // this period changes with the AC voltage phase Period = EPWM_PERIOD_PFC*2/75MHz  5k
int EPWM_PERIOD_DCDC = 750;                                 // this period changes with the parameter of the circuit 150MHz/2/180kHz = 208
int flag_adc_seq1 = 0;
int flag_adc_seq2 = 0;
float Udc_error = 0, Udc_error_last = 0;
float Udc_PIout = 0;
float Uac_now = 0, Uac_tar = 0, Udc_now = 0;
int Uac_sign[256]; // the sign of the Uac, 1 when Uac > 0, -1 when Uac < 0
int fs_sync = 0;   // make the pwm2 and pwm3 syncs

int EPWM_PERIOD_DCDC_trgt = 107;

int PWM1_cmpa = 1000;
int PWM2_cmpa;
int PWM2_cmpb;
int PWM3_cmpa;
int PWM3_cmpb;
float pfc_zero_correct, pfc_zero_voltage;
int VOLTAGE_ZERO_CLEAR = 10, VOLTAGE_ZERO_CLEAR_p = 10, VOLTAGE_ZERO_CLEAR_n = 10;
float V_PFC_in = 10, V_PFE_out = 15;
int VOLTAGE_ZERO_CLEAR_relay = 2;
int debug_PFC_prd = 20000;
int Uac_sign_pst = 0;
long int debug_up = 50000, debug_down = 1200; //8000
int safe = 500;                               //1000
float temp = 0, temp2 = 0;
unsigned int utemp = 0;
float T_neg = 0;

float omega = 300, theta = 0, Kp = 1, Ki = 0.0001;
float PLLin;
float Pllin_filter[5];
//float voltage_AC_filt[VAC_c_max];
//float current_AC_filt[CAC_c_max];
//int voltage_AC_filt_count,current_AC_filt_count;

main()
{

  // Step 1. Initialize System Control:
  // PLL, WatchDog, enable Peripheral Clocks
  // This example function is found in the DSP2833x_SysCtrl.c file.
  InitSysCtrl();

  EALLOW;
#if (CPU_FRQ_150MHZ)   // Default - 150 MHz SYSCLKOUT
#define ADC_MODCLK 0x3 // HSPCLK = SYSCLKOUT/2*ADC_MODCLK2 = 150/(2*3)   = 25.0 MHz
#endif
#if (CPU_FRQ_100MHZ)
#define ADC_MODCLK 0x2 // HSPCLK = SYSCLKOUT/2*ADC_MODCLK2 = 100/(2*2)   = 25.0 MHz
#endif
  EDIS;

  // Step 2. Initialize GPIO:
  // This example function is found in the DSP2833x_Gpio.c file and
  // illustrates how to set the GPIO to it's default state.
  // InitGpio();  // Skipped for this example

  // Step 3. Clear all interrupts and initialize PIE vector table:
  // Disable CPU interrupts
  DINT;

  // Initialize the PIE control registers to their default state.
  // The default state is all PIE interrupts disabled and flags
  // are cleared.
  // This function is found in the DSP2833x_PieCtrl.c file.
  InitPieCtrl();

  // Disable CPU interrupts and clear all CPU interrupt flags:
  IER = 0x0000;
  IFR = 0x0000;

  // Initialize the PIE vector table with pointers to the shell Interrupt
  // Service Routines (ISR).
  // This will populate the entire table, even if the interrupt
  // is not used in this example.  This is useful for debug purposes.
  // The shell ISR routines are found in DSP2833x_DefaultIsr.c.
  // This function is found in DSP2833x_PieVect.c.
  InitPieVectTable();
  MemCopy(&RamfuncsLoadStart, &RamfuncsLoadEnd, &RamfuncsRunStart);
  InitFlash();
  // Interrupts that are used in this example are re-mapped to
  // ISR functions found within this file.
  EALLOW; // This is needed to write to EALLOW protected register
  PieVectTable.ADCINT = &adc_isr;
  InitEPwm1Gpio(); //for PFC
  InitEPwm2Gpio(); //for DCDC1
  InitEPwm3Gpio(); //for DCDC2
  InitEPwm4Gpio(); //for DCDC2
  EDIS;            // This is needed to disable write to EALLOW protected registers

  // Step 4. Initialize all the Device Peripherals:
  // This function is found in DSP2833x_InitPeripherals.c
  // InitPeripherals(); // Not required for this example
  //InitAdc();  // For this example, init the ADC
  InitAdc();
  // Step 5. User specific code, enable interrupts:

  // Enable ADCINT in PIE
  PieCtrlRegs.PIEIER1.bit.INTx6 = 1;
  IER |= M_INT1; // Enable CPU Interrupt 1
  EINT;          // Enable Global interrupt INTM
  ERTM;          // Enable Global realtime interrupt DBGM
                 // Configure PWM
  InitEPwm1();
  InitEPwm2();
  InitEPwm3();
  //InitEPwm4();
  // initialize the variable
  LoopCount = 0;
  ConversionCount1 = 0;
  ConversionCount2 = 0;
  flag_adc_seq1 = 0;
  flag_adc_seq2 = 0;
  //EPWM_PERIOD_DCDC_trgt = 250;
  //voltage_AC_filt_count = 0;
  //current_AC_filt_count = 0;
  //SET_PWM_DCDC(EPWM_PERIOD_DCDC);
  // Configure ADC
  Config_ADC();

  // Assumes ePWM1 clock is already enabled in InitSysCtrl();
  // Configure EPWM
  Config_PWM_ADC_DC();
  pwm23_sync(); // make pwm2 and pwm3 sync;

  // Wait for ADC interrupt
  SET_PWM_DCDC(EPWM_PERIOD_DCDC_trgt);
  for (;;)
  {
    if (fs_sync == 1)
    {
      pwm23_sync(); // make pwm2 and pwm3 sync;
      fs_sync = 0;
    }
    LoopCount++;
    if (LoopCount == 0)
    {
      //fs_sync = 1;
    }
    if (flag_adc_seq1 == 1) // the voltage AC and DC are updated
    {
      // restore the adc result
      flag_adc_seq1 = 0;
      Uac_sign_pst = Uac_sign[ConversionCount1];
      if (ConversionCount1 == 255)
      {
        ConversionCount1 = 0;
      }
      else
        ConversionCount1++;
      Voltage_AC[ConversionCount1] = (((AdcRegs.ADCRESULT0 >> 4) + (AdcRegs.ADCRESULT1 >> 4) + (AdcRegs.ADCRESULT2 >> 4)) / 3.0 * 3.0 / 4096.0 - 0.009 - 1.497) * 227.7;
      Voltage_DC[ConversionCount1] = ((AdcRegs.ADCRESULT3 >> 4) + (AdcRegs.ADCRESULT4 >> 4)) / 2.0 * 3.0 / 4096.0 * 162.16 + 0.6;
      Voltage_Hua[0] = Voltage_Hua[1];
      Voltage_Hua[1] = Voltage_Hua[2];
      Voltage_Hua[2] = Voltage_Hua[3];
      Voltage_Hua[3] = Voltage_Hua[4];
      Voltage_Hua[4] = Voltage_AC[ConversionCount1];
      Uac_now = (Voltage_Hua[0] + Voltage_Hua[1] + Voltage_Hua[2] + Voltage_Hua[3] + Voltage_Hua[4]) / 5.0;
      pfc_contol();

      Voltage_Hua_DC[0] = Voltage_Hua_DC[1];
      Voltage_Hua_DC[1] = Voltage_Hua_DC[2];
      Voltage_Hua_DC[2] = Voltage_Hua_DC[3];
      Voltage_Hua_DC[3] = Voltage_Hua_DC[4];
      Voltage_Hua_DC[4] = Voltage_DC[ConversionCount1];
      // comment for testing in DC/**debug**/
      //Udc_now = (Voltage_Hua_DC[0] + Voltage_Hua_DC[1] + Voltage_Hua_DC[2] + Voltage_Hua_DC[3] + Voltage_Hua_DC[4]) / 5.0; // comment for testing in DC/**debug**/

      // the control code for DCDC********************************************
      /*
      Udc_now = Voltage_DC[ConversionCount1]; // used for further process and correction
      Udc_error = Udc_trgt - Udc_now;
      Udc_error = Limit(Udc_error, Udc_PIout_uplimit, Udc_PIout_lowlimit);
      Udc_PIout += Kp_DCDC * (Udc_error - Udc_error_last) + Ki_DCDC * Udc_error;
      */
      // open loop operaion
      //EPWM_PERIOD_DCDC_trgt = Udc_PIout + EPWM_PERIOD_DCDC;
      //EPWM_PERIOD_DCDC_trgt = Limit(EPWM_PERIOD_DCDC_trgt, PER_PIout_uplimit, PER_PIout_lowlimit);

      // the control code for PFC********************************************
      //Udc_PIout = 1;                          // to test the PFC part seperately, Udc_PIout needs to be given a value
    }

    if (flag_adc_seq2 == 1) // the curremt AC are updated
    {
      //restore the ADC result
      //Current_AC[ConversionCount2] = ((AdcRegs.ADCRESULT8 >> 4) + (AdcRegs.ADCRESULT9 >> 4)) / 2.0 * 3.0 / 4096.0;
      Current_AC[ConversionCount2] = (((AdcRegs.ADCRESULT8 >> 4) + (AdcRegs.ADCRESULT9 >> 4)) / 2 * 3.0 / 4096.0 - 2.525 + 1.178) * 10;

      Current_Hua[0] = Current_Hua[1];
      Current_Hua[1] = Current_Hua[2];
      Current_Hua[2] = Current_Hua[3];
      Current_Hua[3] = Current_Hua[4];
      Current_Hua[4] = Current_AC[ConversionCount2];
      Current_now = (Current_Hua[0] + Current_Hua[1] + Current_Hua[2] + Current_Hua[3] + Current_Hua[4]) / 5.0;
      Current_AC_view[ConversionCount2] = Current_now;

      flag_adc_seq2 = 0;
      // the control code for PFC
      /*
      if (Current_AC_view[ConversionCount2] < I_PFC_zero)
      {
        EPwm1Regs.TBCTR = 0xffff; // Clear counter and open the low bridge
      }
      */
      if (ConversionCount2 == 255)
      {
        ConversionCount2 = 0;
      }
      else
        ConversionCount2++;
    }
    /*
    if (EPwm1Regs.TBCTR >  debug_PFC_prd)
    {
      EPwm1Regs.TBCTR = 0xffff; // Clear counter and open the low bridge
    }*/
  }
}

void Config_ADC(void)
{
  //AdcRegs.ADCTRL1.bit.CONT_RUN = 0;      //
  //AdcRegs.ADCTRL3.bit.SMODE_SEL = 0x0;   //ͬ
  //AdcRegs.ADCTRL1.bit.SEQ_OVRD = 0;      //
  AdcRegs.ADCTRL1.bit.SEQ_CASC = 0;  //
  AdcRegs.ADCMAXCONV.all = 0x0000;   //
  AdcRegs.ADCCHSELSEQ1.all = 0x0000; //
  AdcRegs.ADCCHSELSEQ2.all = 0x0000; //
  AdcRegs.ADCCHSELSEQ3.all = 0x0000; //
  AdcRegs.ADCCHSELSEQ4.all = 0x0000; //
  // set up for the low sample rate group
  AdcRegs.ADCMAXCONV.bit.MAX_CONV1 = 0x4; //5-1
  AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0x5;  //
  AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 0x5;  //
  AdcRegs.ADCCHSELSEQ1.bit.CONV02 = 0x5;  //
  AdcRegs.ADCCHSELSEQ1.bit.CONV03 = 0x1;  //
  AdcRegs.ADCCHSELSEQ2.bit.CONV04 = 0x1;  //
  // set up for the high sample rate group
  AdcRegs.ADCMAXCONV.bit.MAX_CONV2 = 0x0;
  AdcRegs.ADCCHSELSEQ3.bit.CONV08 = 0x3; //
  AdcRegs.ADCCHSELSEQ3.bit.CONV09 = 0x3; //p
  // set up the interrupt for the low sample rate group
  AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 = 1; // Enable SOCA from ePWM to start SEQ1
  AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;   // Enable SEQ1 interrupt (every EOS)
  // set up the interrupt for the high sample rate group
  //AdcRegs.ADCTRL2.bit.EPWM_SOCB_SEQ2 = 1; // Enable SOCB from ePWM to start SEQ1
  //AdcRegs.ADCTRL2.bit.INT_ENA_SEQ2 = 1;   // Enable SEQ2 interrupt (every EOS)
}

void Config_PWM_ADC_DC(void) // sample trigger for the DC voltage and AC voltage, Pwm1 also used for PFC
{
  // low sample rate
  EPwm1Regs.ETSEL.bit.SOCAEN = 1;  // Enable SOC on A group
  EPwm1Regs.ETSEL.bit.SOCASEL = 6; // Select SOC from from CPMB on up count
  EPwm1Regs.ETPS.bit.SOCAPRD = 1;  // Generate pulse on 1st eventyh
  EPwm1Regs.CMPB = PWM1_cmpa / 2;
  //EPwm1Regs.TBPRD = PWM1_cmpa/2 + 1000;              // Set period for ePWM1 150MHz/2/4000=3000Hz
  //EPwm1Regs.TBCTL.bit.CTRMODE = 0;                 // count up and start
  // high sample rate
  /*
  EPwm4Regs.ETSEL.bit.SOCBEN = 1;                  // Enable SOC on B group
  EPwm4Regs.ETSEL.bit.SOCBSEL = 4;                 // Select SOC from from CPMA on up count
  EPwm4Regs.ETPS.bit.SOCBPRD = 1;                  // Generate pulse on 1st event
  EPwm4Regs.CMPA.half.CMPA = ADC2_PERIOD_CURR - 1; // Set compare A value
  EPwm4Regs.TBPRD = ADC2_PERIOD_CURR;              // Set period for ePWM1 150MHz/2/4000=3000Hz
  EPwm4Regs.TBCTL.bit.CTRMODE = 0;                 // count up and start*/
}

interrupt void adc_isr(void)
{

  if (AdcRegs.ADCST.bit.INT_SEQ1 == 1)
  {
    AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;   // Reset SEQ1
    AdcRegs.ADCST.bit.INT_SEQ1_CLR = 1; // Clear INT SEQ1 bit
    flag_adc_seq1 = 1;
  }
  if (AdcRegs.ADCST.bit.INT_SEQ2 == 1)
  {
    AdcRegs.ADCTRL2.bit.RST_SEQ2 = 1;   // Reset SEQ2
    AdcRegs.ADCST.bit.INT_SEQ2_CLR = 1; // Clear INT SEQ2 bit
    flag_adc_seq2 = 1;
  }
  // Reinitialize for next ADC sequence
  PieCtrlRegs.PIEACK.all = PIEACK_GROUP1; // Acknowledge interrupt to PIE
  return;
}

float Limit(float vara, float up_limit, float low_limit)
{
  float Limit_out = 0;
  Limit_out = vara;
  if (vara > up_limit)
    Limit_out = up_limit;
  else if (vara < low_limit)
    Limit_out = low_limit;
  return Limit_out;
}

void SET_PWM_DCDC(int EPWM_PERIOD)
{
  EPwm2Regs.TBPRD = EPWM_PERIOD;
  EPwm3Regs.TBPRD = EPWM_PERIOD;
  PWM2_cmpb = EPWM_PERIOD * Duty_DCDC;
  PWM2_cmpa = EPWM_PERIOD * (1 - Duty_DCDC);
  PWM3_cmpa = PWM2_cmpa;
  PWM3_cmpb = PWM2_cmpb;
  EPwm2Regs.CMPA.half.CMPA = PWM2_cmpa;
  EPwm2Regs.CMPB = PWM2_cmpb;
  EPwm3Regs.CMPA.half.CMPA = PWM3_cmpa;
  EPwm3Regs.CMPB = PWM3_cmpb;
}

void SET_PWM_PFC(int EPWM_cmpa, int Uac_sign, int EPWM_prd)
{
  EPwm1Regs.CMPA.half.CMPA = EPWM_cmpa; // update the cmpa
  EPwm1Regs.TBPRD = EPWM_prd;
  //EPwm5Regs.TBCTR = 0;
  if (Uac_sign == -1)
  {
    //EALLOW;
    //EPwm1Regs.TZCLR.bit.OST = 1;         // make sure that the pwm is on
    //EDIS;
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable up delay and down delay
    EPwm1Regs.AQCTLA.bit.ZRO = AQ_CLEAR;           // high
    EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;

    EPwm1Regs.AQCTLB.bit.ZRO = AQ_SET; // low
    EPwm1Regs.AQCTLB.bit.CAU = AQ_CLEAR;
  }
  else if (Uac_sign == 1)
  {
    //EALLOW;
    //EPwm1Regs.TZCLR.bit.OST = 1;
    //EDIS;
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable up delay and down delay
    EPwm1Regs.AQCTLA.bit.ZRO = AQ_SET;
    EPwm1Regs.AQCTLA.bit.CAU = AQ_CLEAR;

    EPwm1Regs.AQCTLB.bit.ZRO = AQ_CLEAR;
    EPwm1Regs.AQCTLB.bit.CAU = AQ_SET;
  }
  else
  {
    //EALLOW;
    //EPwm1Regs.TZFRC.bit.OST = 1;                  // shutdown the pwm
    //EDIS;
    EPwm1Regs.DBCTL.bit.OUT_MODE = 0; // enable up delay and down delay
    EPwm1Regs.AQCTLA.bit.ZRO = AQ_CLEAR;
    EPwm1Regs.AQCTLA.bit.CAU = AQ_CLEAR;

    EPwm1Regs.AQCTLB.bit.ZRO = AQ_CLEAR;
    EPwm1Regs.AQCTLB.bit.CAU = AQ_CLEAR;
  }
}

int sign(float value, float Theta)
{

  int SIGN;
  /*
  if (Theta > pi / 18 && Theta < 17 * 18 / pi)
  {
    SIGN = 1;
  }
  else if (Theta > 19 * pi / 18 && Theta < 35 * 18 / pi)
  {
    SIGN = -1;
  }
  else
  {
    SIGN = 0;
  } */
  if (value > 10)
  {
    SIGN = 1;
  }
  else if (value < -10)
  {
    SIGN = -1;
  }
  else
  {
    SIGN = 0;
  }
  return SIGN;
}

void pwm23_sync(void)
{
  Uint16 period_sync;
  EPwm2Regs.TBCTL.bit.PHSEN = 1;
  EPwm3Regs.TBCTL.bit.PHSEN = 1;
  period_sync = EPwm2Regs.TBCTR;
  EPwm2Regs.TBPHS.all = period_sync;
  EPwm3Regs.TBPHS.all = period_sync;
  EPwm2Regs.TBCTL.bit.SWFSYNC = 1;
  EPwm2Regs.TBCTL.bit.PHSEN = 0;
  EPwm3Regs.TBCTL.bit.PHSEN = 0;
}

float max(float max[256])
{
  int i = 0;
  float max_value = 0;
  for (i = 0; i < 256; i++)
  {
    if (max_value < max[i])
    {
      max_value = max[i];
    }
  }
  return max_value;
}
void InitEPwm1(void) // Pwm1 is used for PFC
{
  EPwm1Regs.TBPRD = 0xffff;            // Set timer period Period_updown = EPWM_PERIOD * 2 / TBCLK =
  EPwm1Regs.TBPHS.half.TBPHS = 0x0000; // Phase is 0
  EPwm1Regs.TBCTR = 0x0000;            // Clear counter

  // Setup TBCLK
  EPwm1Regs.TBCTL.bit.CTRMODE = 0x0;       // up mode
  EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE;  // Disable phase loading
  EPwm1Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1; // Clock ratio to SYSCLKOUT 1, total ratio is 2:TBCLK = SYSCLKOUT / 2 = 75MHz

  // Setup compare
  EPwm1Regs.CMPA.half.CMPA = 5000; // to be changed later
  //EPwm1Regs.CMPB = 0xfff0;   // used for emergency

  // Set actions
  EPwm1Regs.AQCTLA.bit.ZRO = AQ_CLEAR; // high
  EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;
  //EPwm1Regs.AQCTLA.bit.CBU = AQ_CLEAR;

  EPwm1Regs.AQCTLB.bit.ZRO = AQ_SET; // low
  EPwm1Regs.AQCTLB.bit.CAU = AQ_CLEAR;
  //EPwm1Regs.AQCTLB.bit.CBU = AQ_CLEAR;

  // Active high complementary PWMs - Setup the deadband**
  EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable up delay and down delay
  EPwm1Regs.DBCTL.bit.POLSEL = DB_AHC;           // AHC
  EPwm1Regs.DBCTL.bit.IN_MODE = DBA_ALL;
  EPwm1Regs.DBRED = EPWM_DB_PFC; // rise dead band period
  EPwm1Regs.DBFED = EPWM_DB_PFC;

  // setup the TZ block
  //EALLOW;
  //EPwm1Regs.TZCTL.bit.TZA = 0x2;
  //EPwm1Regs.TZCTL.bit.TZB = 0x2; // when the voltage ac is low, make all the pwm low.
  //EDIS;
}

void InitEPwm2(void) // pwm2 is used for the DCDC
{
  EPwm2Regs.TBPRD = EPWM_PERIOD_DCDC;  // Set timer period TBClK =
  EPwm2Regs.TBPHS.half.TBPHS = 0x0000; // Phase is 0
  EPwm2Regs.TBCTR = 0x0000;            // Clear counter

  // Setup TBCLK
  EPwm2Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;
  EPwm2Regs.TBCTL.bit.PHSEN = TB_DISABLE;  // Disable phase loading
  EPwm2Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1; // Clock ratio to SYSCLKOUT

  // Setup compare
  EPwm2Regs.CMPA.half.CMPA = PWM2_cmpa;
  EPwm2Regs.CMPB = PWM2_cmpb;
  // Set actions
  EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;
  EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;
  EPwm2Regs.AQCTLB.bit.CBU = AQ_CLEAR;
  EPwm2Regs.AQCTLB.bit.CBD = AQ_SET;

  // Active high complementary PWMs - Setup the dead band
  EPwm2Regs.DBCTL.bit.OUT_MODE = DB_DISABLE;
  EPwm2Regs.DBCTL.bit.POLSEL = DB_AHC;
  EPwm2Regs.DBCTL.bit.IN_MODE = DBA_ALL;
  EPwm2Regs.DBRED = EPWM_DB_DCDC;
  EPwm2Regs.DBFED = EPWM_DB_DCDC;
}

void InitEPwm3(void) // pwm3 is used for the DCDC
{
  EPwm3Regs.TBPRD = EPWM_PERIOD_DCDC;  // Set timer period
  EPwm3Regs.TBPHS.half.TBPHS = 0x0000; // Phase is 0
  EPwm3Regs.TBCTR = 0x0000;            // Clear counter

  // Setup TBCLK
  EPwm3Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;
  EPwm3Regs.TBCTL.bit.PHSEN = TB_DISABLE;  // Disable phase loading
  EPwm3Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1; // Clock ratio to SYSCLKOUT

  // Setup compare
  EPwm3Regs.CMPA.half.CMPA = PWM3_cmpa;
  EPwm3Regs.CMPB = PWM3_cmpb;

  // Set actions
  EPwm3Regs.AQCTLA.bit.CBU = AQ_CLEAR;
  EPwm3Regs.AQCTLA.bit.CBD = AQ_SET;
  EPwm3Regs.AQCTLB.bit.CAU = AQ_SET;
  EPwm3Regs.AQCTLB.bit.CAD = AQ_CLEAR;

  // Active high complementary PWMs - Setup the deadband
  EPwm3Regs.DBCTL.bit.OUT_MODE = DB_DISABLE;
  EPwm3Regs.DBCTL.bit.POLSEL = DB_AHC;
  EPwm3Regs.DBCTL.bit.IN_MODE = DBA_ALL;
  EPwm3Regs.DBRED = EPWM_DB_DCDC;
  EPwm3Regs.DBFED = EPWM_DB_DCDC;
}

void PLL(long int freq)
{
  Pll_buffer_index++;
  PLLin = Uac_now * cos(theta);

  Pllin_filter[0] = Pllin_filter[1];
  Pllin_filter[1] = Pllin_filter[2];
  Pllin_filter[2] = Pllin_filter[3];
  Pllin_filter[3] = Pllin_filter[4];
  Pllin_filter[4] = PLLin;

  PLLin = (Pllin_filter[0] + Pllin_filter[1] + Pllin_filter[2] + Pllin_filter[3] + Pllin_filter[4]) / 5.0;
  omega = omega + Kp * (PLLin - Pllin_filter[3]) + Ki * PLLin; //����ʽPID

  if (omega > 20)
    omega = 20;
  else if (omega < -20)
    omega = -20; //pid�޷�

  theta += (100 * pi + omega) * freq / 150000000;
  theta = fmod(theta, pi * 2);
  theta_buffer[Pll_buffer_index] = theta;
}

/*
void InitEPwm4(void) // pwm2 is used for the DCDC
{
  //EPwm4Regs.TBPRD = EPWM_PERIOD_DCDC;  // Set timer period TBClK =
  EPwm4Regs.TBPHS.half.TBPHS = 0x0000; // Phase is 0
  EPwm4Regs.TBCTR = 0x0000;            // Clear counter

  // Setup TBCLK
  //EPwm4Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;
  EPwm4Regs.TBCTL.bit.PHSEN = TB_DISABLE;  // Disable phase loading
  //EPwm4Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1; // Clock ratio to SYSCLKOUT

  // Setup compare
  EPwm4Regs.CMPA.half.CMPA = PWM2_cmpa;
  //EPwm4Regs.CMPB = PWM2_cmpb;
  // Set actions
  EPwm4Regs.AQCTLA.bit.CAU = AQ_SET;
  EPwm4Regs.AQCTLA.bit.ZRO = AQ_CLEAR;
  EPwm4Regs.AQCTLB.bit.ZRO = AQ_CLEAR;
  EPwm4Regs.AQCTLB.bit.CAU = AQ_SET;

  // Active high complementary PWMs - Setup the dead band
  EPwm4Regs.DBCTL.bit.OUT_MODE = DB_DISABLE;
  EPwm4Regs.DBCTL.bit.POLSEL = DB_AHC;
  EPwm4Regs.DBCTL.bit.IN_MODE = DBA_ALL;
  EPwm4Regs.DBRED = EPWM_DB_DCDC;
  EPwm4Regs.DBFED = EPWM_DB_DCDC;
}
*/

void pfc_contol(void)
{

  Voltage_AC_view[ConversionCount1] = Uac_now;
  Uac_sign[ConversionCount1] = sign(Uac_now, theta); /*****debug*****/
  V_PFC_in = Uac_now * Uac_sign[ConversionCount1]; /*****debug*****/

  /*
  float Voltage_AC_max;
  Voltage_AC_max = max(Voltage_AC_view);
  if (Voltage_AC_max < 20)
  {
    VOLTAGE_ZERO_CLEAR_p = 10;
    VOLTAGE_ZERO_CLEAR_n = 10;
    Uac_sign[ConversionCount1] = 0;
  }
*/

  if (Udc_now <= V_PFC_in)
  {
    EPWM_PERIOD_PFC_temp = (unsigned int)(PWM1_cmpa + V_PFC_in * PWM1_cmpa);
    T_neg = 0.01;
  }

  if (Udc_now > 2 * V_PFC_in)
  {
    //T_neg = acos(V_PFC_in / (Udc_now - V_PFC_in)) * Tao;
    T_neg = 0;
    EPWM_PERIOD_PFC_temp = (unsigned int)(PWM1_cmpa + V_PFC_in * PWM1_cmpa / (Udc_now - V_PFC_in));
  }

  if (Udc_now > V_PFC_in && Udc_now <= 2 * V_PFC_in)
  {
    T_neg = T_neg_c * sqrt((2 * V_PFC_in - Udc_now) * Udc_now) / (Udc_now - V_PFC_in);
    EPWM_PERIOD_PFC_temp = (unsigned int)(PWM1_cmpa + V_PFC_in * PWM1_cmpa / (Udc_now - V_PFC_in));
  }
  //T_neg = Limit(T_neg, 4000, 200);
  EPWM_PERIOD_PFC = Limit(EPWM_PERIOD_PFC_temp, debug_up, debug_down);
  EPWM_PERIOD_PFC = EPWM_PERIOD_PFC + T_neg;

  SET_PWM_PFC(PWM1_cmpa, Uac_sign[ConversionCount1], EPWM_PERIOD_PFC); // used for AC control
  //SET_PWM_PFC(PWM1_cmpa, 1, EPWM_PERIOD_PFC); // used for DC control 1 for positive and -1 for negative/**debug**/

  //PLL(EPWM_PERIOD_PFC);
}

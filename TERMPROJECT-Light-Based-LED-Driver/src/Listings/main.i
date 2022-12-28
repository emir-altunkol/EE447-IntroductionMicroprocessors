# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 386 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "main.c" 2
# 24 "main.c"
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h" 1
# 54 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef enum {

  Reset_IRQn = -15,
  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  MemoryManagement_IRQn = -12,

  BusFault_IRQn = -11,

  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,

  GPIOA_IRQn = 0,
  GPIOB_IRQn = 1,
  GPIOC_IRQn = 2,
  GPIOD_IRQn = 3,
  GPIOE_IRQn = 4,
  UART0_IRQn = 5,
  UART1_IRQn = 6,
  SSI0_IRQn = 7,
  I2C0_IRQn = 8,
  PWM0_FAULT_IRQn = 9,
  PWM0_0_IRQn = 10,
  PWM0_1_IRQn = 11,
  PWM0_2_IRQn = 12,
  QEI0_IRQn = 13,
  ADC0SS0_IRQn = 14,
  ADC0SS1_IRQn = 15,
  ADC0SS2_IRQn = 16,
  ADC0SS3_IRQn = 17,
  WATCHDOG0_IRQn = 18,
  TIMER0A_IRQn = 19,
  TIMER0B_IRQn = 20,
  TIMER1A_IRQn = 21,
  TIMER1B_IRQn = 22,
  TIMER2A_IRQn = 23,
  TIMER2B_IRQn = 24,
  COMP0_IRQn = 25,
  COMP1_IRQn = 26,
  SYSCTL_IRQn = 28,
  FLASH_CTRL_IRQn = 29,
  GPIOF_IRQn = 30,
  UART2_IRQn = 33,
  SSI1_IRQn = 34,
  TIMER3A_IRQn = 35,
  TIMER3B_IRQn = 36,
  I2C1_IRQn = 37,
  QEI1_IRQn = 38,
  CAN0_IRQn = 39,
  CAN1_IRQn = 40,
  HIB_IRQn = 43,
  USB0_IRQn = 44,
  PWM0_3_IRQn = 45,
  UDMA_IRQn = 46,
  UDMAERR_IRQn = 47,
  ADC1SS0_IRQn = 48,
  ADC1SS1_IRQn = 49,
  ADC1SS2_IRQn = 50,
  ADC1SS3_IRQn = 51,
  SSI2_IRQn = 57,
  SSI3_IRQn = 58,
  UART3_IRQn = 59,
  UART4_IRQn = 60,
  UART5_IRQn = 61,
  UART6_IRQn = 62,
  UART7_IRQn = 63,
  I2C2_IRQn = 68,
  I2C3_IRQn = 69,
  TIMER4A_IRQn = 70,
  TIMER4B_IRQn = 71,
  TIMER5A_IRQn = 92,
  TIMER5B_IRQn = 93,
  WTIMER0A_IRQn = 94,
  WTIMER0B_IRQn = 95,
  WTIMER1A_IRQn = 96,
  WTIMER1B_IRQn = 97,
  WTIMER2A_IRQn = 98,
  WTIMER2B_IRQn = 99,
  WTIMER3A_IRQn = 100,
  WTIMER3B_IRQn = 101,
  WTIMER4A_IRQn = 102,
  WTIMER4B_IRQn = 103,
  WTIMER5A_IRQn = 104,
  WTIMER5B_IRQn = 105,
  SYSEXC_IRQn = 106,
  PWM1_0_IRQn = 134,
  PWM1_1_IRQn = 135,
  PWM1_2_IRQn = 136,
  PWM1_3_IRQn = 137,
  PWM1_FAULT_IRQn = 138
} IRQn_Type;
# 167 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 1
# 29 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3





# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 35 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 2 3
# 63 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_version.h" 1 3
# 29 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_version.h" 3
# 64 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 2 3
# 162 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_compiler.h" 1 3
# 47 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_compiler.h" 3
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 1 3
# 31 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
# 64 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 260 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 295 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __CLZ(uint32_t value)
{
# 306 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 425 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 440 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 455 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 470 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 485 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 497 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 509 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 737 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}
# 750 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}
# 762 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 792 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
  __builtin_arm_isb(0xF);
}
# 818 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 890 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 914 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 944 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 995 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 1025 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 1053 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __enable_fault_irq(void)
{
  __asm volatile ("cpsie f" : : : "memory");
}







__attribute__((always_inline)) static __inline void __disable_fault_irq(void)
{
  __asm volatile ("cpsid f" : : : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 1105 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 1130 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 1171 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 1491 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
  int32_t result;

  __asm volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 48 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/cmsis_compiler.h" 2 3
# 163 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 2 3
# 264 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:16;
    uint32_t GE:4;
    uint32_t _reserved1:7;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 303 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 321 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t GE:4;
    uint32_t _reserved1:4;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 376 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 411 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RESERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 445 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHP[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t PFR[2U];
  volatile const uint32_t DFR;
  volatile const uint32_t ADR;
  volatile const uint32_t MMFR[4U];
  volatile const uint32_t ISAR[5U];
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;
} SCB_Type;
# 724 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;
  volatile uint32_t ACTLR;
} SCnSCB_Type;
# 764 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 816 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[32U];
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 904 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
} DWT_Type;
# 1051 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1213 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1309 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;
  volatile uint32_t FPCAR;
  volatile uint32_t FPDSCR;
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
} FPU_Type;
# 1421 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1653 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1684 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    __asm volatile("":::"memory");
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __asm volatile("":::"memory");
  }
}
# 1703 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1722 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
  }
}
# 1741 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1760 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1775 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1792 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1814 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 3)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 3)) & (uint32_t)0xFFUL);
  }
}
# 1836 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 3)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 3)));
  }
}
# 1861 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3)) ? (uint32_t)(3) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(3)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1888 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3)) ? (uint32_t)(3) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(3)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1911 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;

}
# 1927 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);

  for(;;)
  {
    __builtin_arm_nop();
  }
}
# 1960 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/mpu_armv7.h" 1 3
# 29 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/mpu_armv7.h" 3
# 183 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR;
  uint32_t RASR;
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __builtin_arm_dmb(0xF);
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

  __builtin_arm_dsb(0xF);
  __builtin_arm_isb(0xF);
}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dmb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
  __builtin_arm_dsb(0xF);
  __builtin_arm_isb(0xF);
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_OrderedMemcpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 1961 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 2 3
# 1981 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((FPU_Type *) ((0xE000E000UL) + 0x0F30UL) )->MVFR0;
  if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x020U)
  {
    return 1U;
  }
  else
  {
    return 0U;
  }
}
# 2022 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 3) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 2052 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
extern volatile int32_t ITM_RxBuffer;
# 2064 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 2085 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 2105 "C:/Users/ozgur/AppData/Local/Arm/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include\\core_cm4.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 168 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h" 2
# 1 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123/system_TM4C123.h" 1
# 35 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123/system_TM4C123.h"
extern uint32_t SystemCoreClock;
# 47 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123/system_TM4C123.h"
extern void SystemInit (void);
# 58 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123/system_TM4C123.h"
extern void SystemCoreClockUpdate (void);
# 169 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h" 2
# 208 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t LOAD;
  volatile uint32_t VALUE;
  volatile uint32_t CTL;
  volatile uint32_t ICR;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile const uint32_t RESERVED[256];
  volatile uint32_t TEST;
  volatile const uint32_t RESERVED1[505];
  volatile uint32_t LOCK;
} WATCHDOG0_Type;
# 231 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile const uint32_t RESERVED[255];
  volatile uint32_t DATA;
  volatile uint32_t DIR;
  volatile uint32_t IS;
  volatile uint32_t IBE;
  volatile uint32_t IEV;
  volatile uint32_t IM;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t AFSEL;
  volatile const uint32_t RESERVED1[55];
  volatile uint32_t DR2R;
  volatile uint32_t DR4R;
  volatile uint32_t DR8R;
  volatile uint32_t ODR;
  volatile uint32_t PUR;
  volatile uint32_t PDR;
  volatile uint32_t SLR;
  volatile uint32_t DEN;
  volatile uint32_t LOCK;
  volatile uint32_t CR;
  volatile uint32_t AMSEL;
  volatile uint32_t PCTL;
  volatile uint32_t ADCCTL;
  volatile uint32_t DMACTL;
} GPIOA_Type;
# 270 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CR0;
  volatile uint32_t CR1;
  volatile uint32_t DR;
  volatile uint32_t SR;
  volatile uint32_t CPSR;
  volatile uint32_t IM;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t DMACTL;
  volatile const uint32_t RESERVED[1000];
  volatile uint32_t CC;
} SSI0_Type;
# 295 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t DR;

  union {
    volatile uint32_t ECR_UART_ALT;
    volatile uint32_t RSR;
  };
  volatile const uint32_t RESERVED[4];
  volatile uint32_t FR;
  volatile const uint32_t RESERVED1;
  volatile uint32_t ILPR;
  volatile uint32_t IBRD;
  volatile uint32_t FBRD;
  volatile uint32_t LCRH;
  volatile uint32_t CTL;
  volatile uint32_t IFLS;
  volatile uint32_t IM;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t DMACTL;
  volatile const uint32_t RESERVED2[22];
  volatile uint32_t _9BITADDR;
  volatile uint32_t _9BITAMASK;
  volatile const uint32_t RESERVED3[965];
  volatile uint32_t PP;
  volatile const uint32_t RESERVED4;
  volatile uint32_t CC;
} UART0_Type;
# 335 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t MSA;

  union {
    volatile uint32_t MCS_I2C0_ALT;
    volatile uint32_t MCS;
  };
  volatile uint32_t MDR;
  volatile uint32_t MTPR;
  volatile uint32_t MIMR;
  volatile uint32_t MRIS;
  volatile uint32_t MMIS;
  volatile uint32_t MICR;
  volatile uint32_t MCR;
  volatile uint32_t MCLKOCNT;
  volatile const uint32_t RESERVED;
  volatile uint32_t MBMON;
  volatile const uint32_t RESERVED1[2];
  volatile uint32_t MCR2;
  volatile const uint32_t RESERVED2[497];
  volatile uint32_t SOAR;

  union {
    volatile uint32_t SCSR_I2C0_ALT;
    volatile uint32_t SCSR;
  };
  volatile uint32_t SDR;
  volatile uint32_t SIMR;
  volatile uint32_t SRIS;
  volatile uint32_t SMIS;
  volatile uint32_t SICR;
  volatile uint32_t SOAR2;
  volatile uint32_t SACKCTL;
  volatile const uint32_t RESERVED3[487];
  volatile uint32_t PP;
  volatile uint32_t PC;
} I2C0_Type;
# 383 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CTL;
  volatile uint32_t SYNC;
  volatile uint32_t ENABLE;
  volatile uint32_t INVERT;
  volatile uint32_t FAULT;
  volatile uint32_t INTEN;
  volatile uint32_t RIS;
  volatile uint32_t ISC;
  volatile uint32_t STATUS;
  volatile uint32_t FAULTVAL;
  volatile uint32_t ENUPD;
  volatile const uint32_t RESERVED[5];
  volatile uint32_t _0_CTL;
  volatile uint32_t _0_INTEN;
  volatile uint32_t _0_RIS;
  volatile uint32_t _0_ISC;
  volatile uint32_t _0_LOAD;
  volatile uint32_t _0_COUNT;
  volatile uint32_t _0_CMPA;
  volatile uint32_t _0_CMPB;
  volatile uint32_t _0_GENA;
  volatile uint32_t _0_GENB;
  volatile uint32_t _0_DBCTL;
  volatile uint32_t _0_DBRISE;
  volatile uint32_t _0_DBFALL;
  volatile uint32_t _0_FLTSRC0;
  volatile uint32_t _0_FLTSRC1;
  volatile uint32_t _0_MINFLTPER;
  volatile uint32_t _1_CTL;
  volatile uint32_t _1_INTEN;
  volatile uint32_t _1_RIS;
  volatile uint32_t _1_ISC;
  volatile uint32_t _1_LOAD;
  volatile uint32_t _1_COUNT;
  volatile uint32_t _1_CMPA;
  volatile uint32_t _1_CMPB;
  volatile uint32_t _1_GENA;
  volatile uint32_t _1_GENB;
  volatile uint32_t _1_DBCTL;
  volatile uint32_t _1_DBRISE;
  volatile uint32_t _1_DBFALL;
  volatile uint32_t _1_FLTSRC0;
  volatile uint32_t _1_FLTSRC1;
  volatile uint32_t _1_MINFLTPER;
  volatile uint32_t _2_CTL;
  volatile uint32_t _2_INTEN;
  volatile uint32_t _2_RIS;
  volatile uint32_t _2_ISC;
  volatile uint32_t _2_LOAD;
  volatile uint32_t _2_COUNT;
  volatile uint32_t _2_CMPA;
  volatile uint32_t _2_CMPB;
  volatile uint32_t _2_GENA;
  volatile uint32_t _2_GENB;
  volatile uint32_t _2_DBCTL;
  volatile uint32_t _2_DBRISE;
  volatile uint32_t _2_DBFALL;
  volatile uint32_t _2_FLTSRC0;
  volatile uint32_t _2_FLTSRC1;
  volatile uint32_t _2_MINFLTPER;
  volatile uint32_t _3_CTL;
  volatile uint32_t _3_INTEN;
  volatile uint32_t _3_RIS;
  volatile uint32_t _3_ISC;
  volatile uint32_t _3_LOAD;
  volatile uint32_t _3_COUNT;
  volatile uint32_t _3_CMPA;
  volatile uint32_t _3_CMPB;
  volatile uint32_t _3_GENA;
  volatile uint32_t _3_GENB;
  volatile uint32_t _3_DBCTL;
  volatile uint32_t _3_DBRISE;
  volatile uint32_t _3_DBFALL;
  volatile uint32_t _3_FLTSRC0;
  volatile uint32_t _3_FLTSRC1;
  volatile uint32_t _3_MINFLTPER;
  volatile const uint32_t RESERVED1[432];
  volatile uint32_t _0_FLTSEN;
  volatile const uint32_t _0_FLTSTAT0;
  volatile const uint32_t _0_FLTSTAT1;
  volatile const uint32_t RESERVED2[29];
  volatile uint32_t _1_FLTSEN;
  volatile const uint32_t _1_FLTSTAT0;
  volatile const uint32_t _1_FLTSTAT1;
  volatile const uint32_t RESERVED3[30];
  volatile const uint32_t _2_FLTSTAT0;
  volatile const uint32_t _2_FLTSTAT1;
  volatile const uint32_t RESERVED4[30];
  volatile const uint32_t _3_FLTSTAT0;
  volatile const uint32_t _3_FLTSTAT1;
  volatile const uint32_t RESERVED5[397];
  volatile uint32_t PP;
} PWM0_Type;
# 488 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CTL;
  volatile uint32_t STAT;
  volatile uint32_t POS;
  volatile uint32_t MAXPOS;
  volatile uint32_t LOAD;
  volatile uint32_t TIME;
  volatile uint32_t COUNT;
  volatile uint32_t SPEED;
  volatile uint32_t INTEN;
  volatile uint32_t RIS;
  volatile uint32_t ISC;
} QEI0_Type;
# 512 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CFG;
  volatile uint32_t TAMR;
  volatile uint32_t TBMR;
  volatile uint32_t CTL;
  volatile uint32_t SYNC;
  volatile const uint32_t RESERVED;
  volatile uint32_t IMR;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t TAILR;
  volatile uint32_t TBILR;
  volatile uint32_t TAMATCHR;
  volatile uint32_t TBMATCHR;
  volatile uint32_t TAPR;
  volatile uint32_t TBPR;
  volatile uint32_t TAPMR;
  volatile uint32_t TBPMR;
  volatile uint32_t TAR;
  volatile uint32_t TBR;
  volatile uint32_t TAV;
  volatile uint32_t TBV;
  volatile uint32_t RTCPD;
  volatile uint32_t TAPS;
  volatile uint32_t TBPS;
  volatile uint32_t TAPV;
  volatile uint32_t TBPV;
  volatile const uint32_t RESERVED1[981];
  volatile uint32_t PP;
} TIMER0_Type;
# 554 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CFG;
  volatile uint32_t TAMR;
  volatile uint32_t TBMR;
  volatile uint32_t CTL;
  volatile uint32_t SYNC;
  volatile const uint32_t RESERVED;
  volatile uint32_t IMR;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t TAILR;
  volatile uint32_t TBILR;
  volatile uint32_t TAMATCHR;
  volatile uint32_t TBMATCHR;
  volatile uint32_t TAPR;
  volatile uint32_t TBPR;
  volatile uint32_t TAPMR;
  volatile uint32_t TBPMR;
  volatile uint32_t TAR;
  volatile uint32_t TBR;
  volatile uint32_t TAV;
  volatile uint32_t TBV;
  volatile uint32_t RTCPD;
  volatile uint32_t TAPS;
  volatile uint32_t TBPS;
  volatile uint32_t TAPV;
  volatile uint32_t TBPV;
  volatile const uint32_t RESERVED1[981];
  volatile uint32_t PP;
} WTIMER0_Type;
# 596 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t ACTSS;
  volatile uint32_t RIS;
  volatile uint32_t IM;
  volatile uint32_t ISC;
  volatile uint32_t OSTAT;
  volatile uint32_t EMUX;
  volatile uint32_t USTAT;
  volatile uint32_t TSSEL;
  volatile uint32_t SSPRI;
  volatile uint32_t SPC;
  volatile uint32_t PSSI;
  volatile const uint32_t RESERVED;
  volatile uint32_t SAC;
  volatile uint32_t DCISC;
  volatile uint32_t CTL;
  volatile const uint32_t RESERVED1;
  volatile uint32_t SSMUX0;
  volatile uint32_t SSCTL0;
  volatile uint32_t SSFIFO0;
  volatile uint32_t SSFSTAT0;
  volatile uint32_t SSOP0;
  volatile uint32_t SSDC0;
  volatile const uint32_t RESERVED2[2];
  volatile uint32_t SSMUX1;
  volatile uint32_t SSCTL1;
  volatile uint32_t SSFIFO1;
  volatile uint32_t SSFSTAT1;
  volatile uint32_t SSOP1;
  volatile uint32_t SSDC1;
  volatile const uint32_t RESERVED3[2];
  volatile uint32_t SSMUX2;
  volatile uint32_t SSCTL2;
  volatile uint32_t SSFIFO2;
  volatile uint32_t SSFSTAT2;
  volatile uint32_t SSOP2;
  volatile uint32_t SSDC2;
  volatile const uint32_t RESERVED4[2];
  volatile uint32_t SSMUX3;
  volatile uint32_t SSCTL3;
  volatile uint32_t SSFIFO3;
  volatile uint32_t SSFSTAT3;
  volatile uint32_t SSOP3;
  volatile uint32_t SSDC3;
  volatile const uint32_t RESERVED5[786];
  volatile uint32_t DCRIC;
  volatile const uint32_t RESERVED6[63];
  volatile uint32_t DCCTL0;
  volatile uint32_t DCCTL1;
  volatile uint32_t DCCTL2;
  volatile uint32_t DCCTL3;
  volatile uint32_t DCCTL4;
  volatile uint32_t DCCTL5;
  volatile uint32_t DCCTL6;
  volatile uint32_t DCCTL7;
  volatile const uint32_t RESERVED7[8];
  volatile uint32_t DCCMP0;
  volatile uint32_t DCCMP1;
  volatile uint32_t DCCMP2;
  volatile uint32_t DCCMP3;
  volatile uint32_t DCCMP4;
  volatile uint32_t DCCMP5;
  volatile uint32_t DCCMP6;
  volatile uint32_t DCCMP7;
  volatile const uint32_t RESERVED8[88];
  volatile uint32_t PP;
  volatile uint32_t PC;
  volatile uint32_t CC;
} ADC0_Type;
# 676 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t ACMIS;
  volatile uint32_t ACRIS;
  volatile uint32_t ACINTEN;
  volatile const uint32_t RESERVED;
  volatile uint32_t ACREFCTL;
  volatile const uint32_t RESERVED1[3];
  volatile uint32_t ACSTAT0;
  volatile uint32_t ACCTL0;
  volatile const uint32_t RESERVED2[6];
  volatile uint32_t ACSTAT1;
  volatile uint32_t ACCTL1;
  volatile const uint32_t RESERVED3[990];
  volatile uint32_t PP;
} COMP_Type;
# 702 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t CTL;
  volatile uint32_t STS;
  volatile uint32_t ERR;
  volatile uint32_t BIT;
  volatile uint32_t INT;
  volatile uint32_t TST;
  volatile uint32_t BRPE;
  volatile const uint32_t RESERVED;
  volatile uint32_t IF1CRQ;

  union {
    volatile uint32_t IF1CMSK_CAN0_ALT;
    volatile uint32_t IF1CMSK;
  };
  volatile uint32_t IF1MSK1;
  volatile uint32_t IF1MSK2;
  volatile uint32_t IF1ARB1;
  volatile uint32_t IF1ARB2;
  volatile uint32_t IF1MCTL;
  volatile uint32_t IF1DA1;
  volatile uint32_t IF1DA2;
  volatile uint32_t IF1DB1;
  volatile uint32_t IF1DB2;
  volatile const uint32_t RESERVED1[13];
  volatile uint32_t IF2CRQ;

  union {
    volatile uint32_t IF2CMSK_CAN0_ALT;
    volatile uint32_t IF2CMSK;
  };
  volatile uint32_t IF2MSK1;
  volatile uint32_t IF2MSK2;
  volatile uint32_t IF2ARB1;
  volatile uint32_t IF2ARB2;
  volatile uint32_t IF2MCTL;
  volatile uint32_t IF2DA1;
  volatile uint32_t IF2DA2;
  volatile uint32_t IF2DB1;
  volatile uint32_t IF2DB2;
  volatile const uint32_t RESERVED2[21];
  volatile uint32_t TXRQ1;
  volatile uint32_t TXRQ2;
  volatile const uint32_t RESERVED3[6];
  volatile uint32_t NWDA1;
  volatile uint32_t NWDA2;
  volatile const uint32_t RESERVED4[6];
  volatile uint32_t MSG1INT;
  volatile uint32_t MSG2INT;
  volatile const uint32_t RESERVED5[6];
  volatile uint32_t MSG1VAL;
  volatile uint32_t MSG2VAL;
} CAN0_Type;
# 766 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint8_t FADDR;
  volatile uint8_t POWER;
  volatile uint16_t TXIS;
  volatile uint16_t RXIS;
  volatile uint16_t TXIE;
  volatile uint16_t RXIE;

  union {
    volatile uint8_t IS_USB0_ALT;
    volatile uint8_t IS;
  };

  union {
    volatile uint8_t IE_USB0_ALT;
    volatile uint8_t IE;
  };
  volatile uint16_t FRAME;
  volatile uint8_t EPIDX;
  volatile uint8_t TEST;
  volatile const uint32_t RESERVED[4];
  volatile uint32_t FIFO0;
  volatile uint32_t FIFO1;
  volatile uint32_t FIFO2;
  volatile uint32_t FIFO3;
  volatile uint32_t FIFO4;
  volatile uint32_t FIFO5;
  volatile uint32_t FIFO6;
  volatile uint32_t FIFO7;
  volatile const uint32_t RESERVED1[8];
  volatile uint8_t DEVCTL;
  volatile const uint8_t RESERVED2;
  volatile uint8_t TXFIFOSZ;
  volatile uint8_t RXFIFOSZ;
  volatile uint16_t TXFIFOADD;
  volatile uint16_t RXFIFOADD;
  volatile const uint16_t RESERVED3[9];
  volatile uint8_t CONTIM;
  volatile uint8_t VPLEN;
  volatile const uint8_t RESERVED4;
  volatile uint8_t FSEOF;
  volatile uint8_t LSEOF;
  volatile const uint8_t RESERVED5;
  volatile uint8_t TXFUNCADDR0;
  volatile const uint8_t RESERVED6;
  volatile uint8_t TXHUBADDR0;
  volatile uint8_t TXHUBPORT0;
  volatile const uint32_t RESERVED7;
  volatile uint8_t TXFUNCADDR1;
  volatile const uint8_t RESERVED8;
  volatile uint8_t TXHUBADDR1;
  volatile uint8_t TXHUBPORT1;
  volatile uint8_t RXFUNCADDR1;
  volatile const uint8_t RESERVED9;
  volatile uint8_t RXHUBADDR1;
  volatile uint8_t RXHUBPORT1;
  volatile uint8_t TXFUNCADDR2;
  volatile const uint8_t RESERVED10;
  volatile uint8_t TXHUBADDR2;
  volatile uint8_t TXHUBPORT2;
  volatile uint8_t RXFUNCADDR2;
  volatile const uint8_t RESERVED11;
  volatile uint8_t RXHUBADDR2;
  volatile uint8_t RXHUBPORT2;
  volatile uint8_t TXFUNCADDR3;
  volatile const uint8_t RESERVED12;
  volatile uint8_t TXHUBADDR3;
  volatile uint8_t TXHUBPORT3;
  volatile uint8_t RXFUNCADDR3;
  volatile const uint8_t RESERVED13;
  volatile uint8_t RXHUBADDR3;
  volatile uint8_t RXHUBPORT3;
  volatile uint8_t TXFUNCADDR4;
  volatile const uint8_t RESERVED14;
  volatile uint8_t TXHUBADDR4;
  volatile uint8_t TXHUBPORT4;
  volatile uint8_t RXFUNCADDR4;
  volatile const uint8_t RESERVED15;
  volatile uint8_t RXHUBADDR4;
  volatile uint8_t RXHUBPORT4;
  volatile uint8_t TXFUNCADDR5;
  volatile const uint8_t RESERVED16;
  volatile uint8_t TXHUBADDR5;
  volatile uint8_t TXHUBPORT5;
  volatile uint8_t RXFUNCADDR5;
  volatile const uint8_t RESERVED17;
  volatile uint8_t RXHUBADDR5;
  volatile uint8_t RXHUBPORT5;
  volatile uint8_t TXFUNCADDR6;
  volatile const uint8_t RESERVED18;
  volatile uint8_t TXHUBADDR6;
  volatile uint8_t TXHUBPORT6;
  volatile uint8_t RXFUNCADDR6;
  volatile const uint8_t RESERVED19;
  volatile uint8_t RXHUBADDR6;
  volatile uint8_t RXHUBPORT6;
  volatile uint8_t TXFUNCADDR7;
  volatile const uint8_t RESERVED20;
  volatile uint8_t TXHUBADDR7;
  volatile uint8_t TXHUBPORT7;
  volatile uint8_t RXFUNCADDR7;
  volatile const uint8_t RESERVED21;
  volatile uint8_t RXHUBADDR7;
  volatile uint8_t RXHUBPORT7;
  volatile const uint16_t RESERVED22[33];

  union {
    volatile uint8_t CSRL0_USB0_ALT;
    volatile uint8_t CSRL0;
  };
  volatile uint8_t CSRH0;
  volatile const uint32_t RESERVED23;
  volatile uint8_t COUNT0;
  volatile const uint8_t RESERVED24;
  volatile uint8_t TYPE0;
  volatile uint8_t NAKLMT;
  volatile const uint32_t RESERVED25;
  volatile uint16_t TXMAXP1;

  union {
    volatile uint8_t TXCSRL1_USB0_ALT;
    volatile uint8_t TXCSRL1;
  };
  volatile uint8_t TXCSRH1;
  volatile uint16_t RXMAXP1;

  union {
    volatile uint8_t RXCSRL1_USB0_ALT;
    volatile uint8_t RXCSRL1;
  };

  union {
    volatile uint8_t RXCSRH1_USB0_ALT;
    volatile uint8_t RXCSRH1;
  };
  volatile uint16_t RXCOUNT1;
  volatile uint8_t TXTYPE1;

  union {
    volatile uint8_t TXINTERVAL1_USB0_ALT;
    volatile uint8_t TXINTERVAL1;
  };
  volatile uint8_t RXTYPE1;

  union {
    volatile uint8_t RXINTERVAL1_USB0_ALT;
    volatile uint8_t RXINTERVAL1;
  };
  volatile const uint16_t RESERVED26;
  volatile uint16_t TXMAXP2;

  union {
    volatile uint8_t TXCSRL2_USB0_ALT;
    volatile uint8_t TXCSRL2;
  };
  volatile uint8_t TXCSRH2;
  volatile uint16_t RXMAXP2;

  union {
    volatile uint8_t RXCSRL2_USB0_ALT;
    volatile uint8_t RXCSRL2;
  };

  union {
    volatile uint8_t RXCSRH2_USB0_ALT;
    volatile uint8_t RXCSRH2;
  };
  volatile uint16_t RXCOUNT2;
  volatile uint8_t TXTYPE2;

  union {
    volatile uint8_t TXINTERVAL2_USB0_ALT;
    volatile uint8_t TXINTERVAL2;
  };
  volatile uint8_t RXTYPE2;

  union {
    volatile uint8_t RXINTERVAL2_USB0_ALT;
    volatile uint8_t RXINTERVAL2;
  };
  volatile const uint16_t RESERVED27;
  volatile uint16_t TXMAXP3;

  union {
    volatile uint8_t TXCSRL3_USB0_ALT;
    volatile uint8_t TXCSRL3;
  };
  volatile uint8_t TXCSRH3;
  volatile uint16_t RXMAXP3;

  union {
    volatile uint8_t RXCSRL3_USB0_ALT;
    volatile uint8_t RXCSRL3;
  };

  union {
    volatile uint8_t RXCSRH3_USB0_ALT;
    volatile uint8_t RXCSRH3;
  };
  volatile uint16_t RXCOUNT3;
  volatile uint8_t TXTYPE3;

  union {
    volatile uint8_t TXINTERVAL3_USB0_ALT;
    volatile uint8_t TXINTERVAL3;
  };
  volatile uint8_t RXTYPE3;

  union {
    volatile uint8_t RXINTERVAL3_USB0_ALT;
    volatile uint8_t RXINTERVAL3;
  };
  volatile const uint16_t RESERVED28;
  volatile uint16_t TXMAXP4;

  union {
    volatile uint8_t TXCSRL4_USB0_ALT;
    volatile uint8_t TXCSRL4;
  };
  volatile uint8_t TXCSRH4;
  volatile uint16_t RXMAXP4;

  union {
    volatile uint8_t RXCSRL4_USB0_ALT;
    volatile uint8_t RXCSRL4;
  };

  union {
    volatile uint8_t RXCSRH4_USB0_ALT;
    volatile uint8_t RXCSRH4;
  };
  volatile uint16_t RXCOUNT4;
  volatile uint8_t TXTYPE4;

  union {
    volatile uint8_t TXINTERVAL4_USB0_ALT;
    volatile uint8_t TXINTERVAL4;
  };
  volatile uint8_t RXTYPE4;

  union {
    volatile uint8_t RXINTERVAL4_USB0_ALT;
    volatile uint8_t RXINTERVAL4;
  };
  volatile const uint16_t RESERVED29;
  volatile uint16_t TXMAXP5;

  union {
    volatile uint8_t TXCSRL5_USB0_ALT;
    volatile uint8_t TXCSRL5;
  };
  volatile uint8_t TXCSRH5;
  volatile uint16_t RXMAXP5;

  union {
    volatile uint8_t RXCSRL5_USB0_ALT;
    volatile uint8_t RXCSRL5;
  };

  union {
    volatile uint8_t RXCSRH5_USB0_ALT;
    volatile uint8_t RXCSRH5;
  };
  volatile uint16_t RXCOUNT5;
  volatile uint8_t TXTYPE5;

  union {
    volatile uint8_t TXINTERVAL5_USB0_ALT;
    volatile uint8_t TXINTERVAL5;
  };
  volatile uint8_t RXTYPE5;

  union {
    volatile uint8_t RXINTERVAL5_USB0_ALT;
    volatile uint8_t RXINTERVAL5;
  };
  volatile const uint16_t RESERVED30;
  volatile uint16_t TXMAXP6;

  union {
    volatile uint8_t TXCSRL6_USB0_ALT;
    volatile uint8_t TXCSRL6;
  };
  volatile uint8_t TXCSRH6;
  volatile uint16_t RXMAXP6;

  union {
    volatile uint8_t RXCSRL6_USB0_ALT;
    volatile uint8_t RXCSRL6;
  };

  union {
    volatile uint8_t RXCSRH6_USB0_ALT;
    volatile uint8_t RXCSRH6;
  };
  volatile uint16_t RXCOUNT6;
  volatile uint8_t TXTYPE6;

  union {
    volatile uint8_t TXINTERVAL6_USB0_ALT;
    volatile uint8_t TXINTERVAL6;
  };
  volatile uint8_t RXTYPE6;

  union {
    volatile uint8_t RXINTERVAL6_USB0_ALT;
    volatile uint8_t RXINTERVAL6;
  };
  volatile const uint16_t RESERVED31;
  volatile uint16_t TXMAXP7;

  union {
    volatile uint8_t TXCSRL7_USB0_ALT;
    volatile uint8_t TXCSRL7;
  };
  volatile uint8_t TXCSRH7;
  volatile uint16_t RXMAXP7;

  union {
    volatile uint8_t RXCSRL7_USB0_ALT;
    volatile uint8_t RXCSRL7;
  };

  union {
    volatile uint8_t RXCSRH7_USB0_ALT;
    volatile uint8_t RXCSRH7;
  };
  volatile uint16_t RXCOUNT7;
  volatile uint8_t TXTYPE7;

  union {
    volatile uint8_t TXINTERVAL7_USB0_ALT;
    volatile uint8_t TXINTERVAL7;
  };
  volatile uint8_t RXTYPE7;

  union {
    volatile uint8_t RXINTERVAL7_USB0_ALT;
    volatile uint8_t RXINTERVAL7;
  };
  volatile const uint16_t RESERVED32[195];
  volatile uint16_t RQPKTCOUNT1;
  volatile const uint16_t RESERVED33;
  volatile uint16_t RQPKTCOUNT2;
  volatile const uint16_t RESERVED34;
  volatile uint16_t RQPKTCOUNT3;
  volatile const uint16_t RESERVED35;
  volatile uint16_t RQPKTCOUNT4;
  volatile const uint16_t RESERVED36;
  volatile uint16_t RQPKTCOUNT5;
  volatile const uint16_t RESERVED37;
  volatile uint16_t RQPKTCOUNT6;
  volatile const uint16_t RESERVED38;
  volatile uint16_t RQPKTCOUNT7;
  volatile const uint16_t RESERVED39[17];
  volatile uint16_t RXDPKTBUFDIS;
  volatile uint16_t TXDPKTBUFDIS;
  volatile const uint32_t RESERVED40[47];
  volatile uint32_t EPC;
  volatile uint32_t EPCRIS;
  volatile uint32_t EPCIM;
  volatile uint32_t EPCISC;
  volatile uint32_t DRRIS;
  volatile uint32_t DRIM;
  volatile uint32_t DRISC;
  volatile uint32_t GPCS;
  volatile const uint32_t RESERVED41[4];
  volatile uint32_t VDC;
  volatile uint32_t VDCRIS;
  volatile uint32_t VDCIM;
  volatile uint32_t VDCISC;
  volatile const uint32_t RESERVED42;
  volatile uint32_t IDVRIS;
  volatile uint32_t IDVIM;
  volatile uint32_t IDVISC;
  volatile uint32_t DMASEL;
  volatile const uint32_t RESERVED43[731];
  volatile uint32_t PP;
} USB0_Type;
# 1156 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t EESIZE;
  volatile uint32_t EEBLOCK;
  volatile uint32_t EEOFFSET;
  volatile const uint32_t RESERVED;
  volatile uint32_t EERDWR;
  volatile uint32_t EERDWRINC;
  volatile uint32_t EEDONE;
  volatile uint32_t EESUPP;
  volatile uint32_t EEUNLOCK;
  volatile const uint32_t RESERVED1[3];
  volatile uint32_t EEPROT;
  volatile uint32_t EEPASS0;
  volatile uint32_t EEPASS1;
  volatile uint32_t EEPASS2;
  volatile uint32_t EEINT;
  volatile const uint32_t RESERVED2[3];
  volatile uint32_t EEHIDE;
  volatile const uint32_t RESERVED3[11];
  volatile uint32_t EEDBGME;
  volatile const uint32_t RESERVED4[975];
  volatile uint32_t PP;
} EEPROM_Type;
# 1190 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t RIS;
  volatile uint32_t IM;
  volatile uint32_t MIS;
  volatile uint32_t IC;
} SYSEXC_Type;
# 1207 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t RTCC;
  volatile uint32_t RTCM0;
  volatile const uint32_t RESERVED;
  volatile uint32_t RTCLD;
  volatile uint32_t CTL;
  volatile uint32_t IM;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t IC;
  volatile uint32_t RTCT;
  volatile uint32_t RTCSS;
  volatile const uint32_t RESERVED1;
  volatile uint32_t DATA;
} HIB_Type;
# 1233 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t FMA;
  volatile uint32_t FMD;
  volatile uint32_t FMC;
  volatile uint32_t FCRIS;
  volatile uint32_t FCIM;
  volatile uint32_t FCMISC;
  volatile const uint32_t RESERVED[2];
  volatile uint32_t FMC2;
  volatile const uint32_t RESERVED1[3];
  volatile uint32_t FWBVAL;
  volatile const uint32_t RESERVED2[51];
  volatile uint32_t FWBN;
  volatile const uint32_t RESERVED3[943];
  volatile uint32_t FSIZE;
  volatile uint32_t SSIZE;
  volatile const uint32_t RESERVED4;

  union {
    volatile uint32_t ROMSWMAP_FLASH_CTRL_ALT;
    volatile uint32_t ROMSWMAP;
  };
  volatile const uint32_t RESERVED5[72];
  volatile uint32_t RMCTL;
  volatile const uint32_t RESERVED6[55];
  volatile uint32_t BOOTCFG;
  volatile const uint32_t RESERVED7[3];
  volatile uint32_t USERREG0;
  volatile uint32_t USERREG1;
  volatile uint32_t USERREG2;
  volatile uint32_t USERREG3;
  volatile const uint32_t RESERVED8[4];
  volatile uint32_t FMPRE0;
  volatile uint32_t FMPRE1;
  volatile uint32_t FMPRE2;
  volatile uint32_t FMPRE3;
  volatile const uint32_t RESERVED9[124];
  volatile uint32_t FMPPE0;
  volatile uint32_t FMPPE1;
  volatile uint32_t FMPPE2;
  volatile uint32_t FMPPE3;
} FLASH_CTRL_Type;
# 1286 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t DID0;
  volatile uint32_t DID1;
  volatile uint32_t DC0;
  volatile const uint32_t RESERVED;
  volatile uint32_t DC1;
  volatile uint32_t DC2;
  volatile uint32_t DC3;
  volatile uint32_t DC4;
  volatile uint32_t DC5;
  volatile uint32_t DC6;
  volatile uint32_t DC7;
  volatile uint32_t DC8;
  volatile uint32_t PBORCTL;
  volatile const uint32_t RESERVED1[3];
  volatile uint32_t SRCR0;
  volatile uint32_t SRCR1;
  volatile uint32_t SRCR2;
  volatile const uint32_t RESERVED2;
  volatile uint32_t RIS;
  volatile uint32_t IMC;
  volatile uint32_t MISC;
  volatile uint32_t RESC;
  volatile uint32_t RCC;
  volatile const uint32_t RESERVED3[2];
  volatile uint32_t GPIOHBCTL;
  volatile uint32_t RCC2;
  volatile const uint32_t RESERVED4[2];
  volatile uint32_t MOSCCTL;
  volatile const uint32_t RESERVED5[32];
  volatile uint32_t RCGC0;
  volatile uint32_t RCGC1;
  volatile uint32_t RCGC2;
  volatile const uint32_t RESERVED6;
  volatile uint32_t SCGC0;
  volatile uint32_t SCGC1;
  volatile uint32_t SCGC2;
  volatile const uint32_t RESERVED7;
  volatile uint32_t DCGC0;
  volatile uint32_t DCGC1;
  volatile uint32_t DCGC2;
  volatile const uint32_t RESERVED8[6];
  volatile uint32_t DSLPCLKCFG;
  volatile const uint32_t RESERVED9;
  volatile uint32_t SYSPROP;
  volatile uint32_t PIOSCCAL;
  volatile uint32_t PIOSCSTAT;
  volatile const uint32_t RESERVED10[2];
  volatile uint32_t PLLFREQ0;
  volatile uint32_t PLLFREQ1;
  volatile uint32_t PLLSTAT;
  volatile const uint32_t RESERVED11[7];
  volatile uint32_t SLPPWRCFG;
  volatile uint32_t DSLPPWRCFG;
  volatile uint32_t DC9;
  volatile const uint32_t RESERVED12[3];
  volatile uint32_t NVMSTAT;
  volatile const uint32_t RESERVED13[4];
  volatile uint32_t LDOSPCTL;
  volatile const uint32_t RESERVED14;
  volatile uint32_t LDODPCTL;
  volatile const uint32_t RESERVED15[80];
  volatile uint32_t PPWD;
  volatile uint32_t PPTIMER;
  volatile uint32_t PPGPIO;
  volatile uint32_t PPDMA;
  volatile const uint32_t RESERVED16;
  volatile uint32_t PPHIB;
  volatile uint32_t PPUART;
  volatile uint32_t PPSSI;
  volatile uint32_t PPI2C;
  volatile const uint32_t RESERVED17;
  volatile uint32_t PPUSB;
  volatile const uint32_t RESERVED18[2];
  volatile uint32_t PPCAN;
  volatile uint32_t PPADC;
  volatile uint32_t PPACMP;
  volatile uint32_t PPPWM;
  volatile uint32_t PPQEI;
  volatile const uint32_t RESERVED19[4];
  volatile uint32_t PPEEPROM;
  volatile uint32_t PPWTIMER;
  volatile const uint32_t RESERVED20[104];
  volatile uint32_t SRWD;
  volatile uint32_t SRTIMER;
  volatile uint32_t SRGPIO;
  volatile uint32_t SRDMA;
  volatile const uint32_t RESERVED21;
  volatile uint32_t SRHIB;
  volatile uint32_t SRUART;
  volatile uint32_t SRSSI;
  volatile uint32_t SRI2C;
  volatile const uint32_t RESERVED22;
  volatile uint32_t SRUSB;
  volatile const uint32_t RESERVED23[2];
  volatile uint32_t SRCAN;
  volatile uint32_t SRADC;
  volatile uint32_t SRACMP;
  volatile uint32_t SRPWM;
  volatile uint32_t SRQEI;
  volatile const uint32_t RESERVED24[4];
  volatile uint32_t SREEPROM;
  volatile uint32_t SRWTIMER;
  volatile const uint32_t RESERVED25[40];
  volatile uint32_t RCGCWD;
  volatile uint32_t RCGCTIMER;
  volatile uint32_t RCGCGPIO;
  volatile uint32_t RCGCDMA;
  volatile const uint32_t RESERVED26;
  volatile uint32_t RCGCHIB;
  volatile uint32_t RCGCUART;

  volatile uint32_t RCGCSSI;
  volatile uint32_t RCGCI2C;
  volatile const uint32_t RESERVED27;
  volatile uint32_t RCGCUSB;
  volatile const uint32_t RESERVED28[2];
  volatile uint32_t RCGCCAN;
  volatile uint32_t RCGCADC;
  volatile uint32_t RCGCACMP;
  volatile uint32_t RCGCPWM;
  volatile uint32_t RCGCQEI;
  volatile const uint32_t RESERVED29[4];
  volatile uint32_t RCGCEEPROM;
  volatile uint32_t RCGCWTIMER;
  volatile const uint32_t RESERVED30[40];
  volatile uint32_t SCGCWD;
  volatile uint32_t SCGCTIMER;
  volatile uint32_t SCGCGPIO;
  volatile uint32_t SCGCDMA;
  volatile const uint32_t RESERVED31;
  volatile uint32_t SCGCHIB;
  volatile uint32_t SCGCUART;

  volatile uint32_t SCGCSSI;
  volatile uint32_t SCGCI2C;
  volatile const uint32_t RESERVED32;
  volatile uint32_t SCGCUSB;
  volatile const uint32_t RESERVED33[2];
  volatile uint32_t SCGCCAN;
  volatile uint32_t SCGCADC;
  volatile uint32_t SCGCACMP;
  volatile uint32_t SCGCPWM;
  volatile uint32_t SCGCQEI;
  volatile const uint32_t RESERVED34[4];
  volatile uint32_t SCGCEEPROM;
  volatile uint32_t SCGCWTIMER;

  volatile const uint32_t RESERVED35[40];
  volatile uint32_t DCGCWD;
  volatile uint32_t DCGCTIMER;

  volatile uint32_t DCGCGPIO;
  volatile uint32_t DCGCDMA;
  volatile const uint32_t RESERVED36;
  volatile uint32_t DCGCHIB;
  volatile uint32_t DCGCUART;

  volatile uint32_t DCGCSSI;
  volatile uint32_t DCGCI2C;
  volatile const uint32_t RESERVED37;
  volatile uint32_t DCGCUSB;
  volatile const uint32_t RESERVED38[2];
  volatile uint32_t DCGCCAN;
  volatile uint32_t DCGCADC;
  volatile uint32_t DCGCACMP;
  volatile uint32_t DCGCPWM;
  volatile uint32_t DCGCQEI;
  volatile const uint32_t RESERVED39[4];
  volatile uint32_t DCGCEEPROM;
  volatile uint32_t DCGCWTIMER;

  volatile const uint32_t RESERVED40[104];
  volatile uint32_t PRWD;
  volatile uint32_t PRTIMER;
  volatile uint32_t PRGPIO;
  volatile uint32_t PRDMA;
  volatile const uint32_t RESERVED41;
  volatile uint32_t PRHIB;
  volatile uint32_t PRUART;
  volatile uint32_t PRSSI;
  volatile uint32_t PRI2C;
  volatile const uint32_t RESERVED42;
  volatile uint32_t PRUSB;
  volatile const uint32_t RESERVED43[2];
  volatile uint32_t PRCAN;
  volatile uint32_t PRADC;
  volatile uint32_t PRACMP;
  volatile uint32_t PRPWM;
  volatile uint32_t PRQEI;
  volatile const uint32_t RESERVED44[4];
  volatile uint32_t PREEPROM;
  volatile uint32_t PRWTIMER;
} SYSCTL_Type;
# 1491 "C:/Users/ozgur/AppData/Local/Arm/Packs/Keil/TM4C_DFP/1.1.0/Device/Include/TM4C123\\TM4C123GH6PM.h"
typedef struct {
  volatile uint32_t STAT;
  volatile uint32_t CFG;
  volatile uint32_t CTLBASE;
  volatile uint32_t ALTBASE;
  volatile uint32_t WAITSTAT;
  volatile uint32_t SWREQ;
  volatile uint32_t USEBURSTSET;
  volatile uint32_t USEBURSTCLR;
  volatile uint32_t REQMASKSET;
  volatile uint32_t REQMASKCLR;
  volatile uint32_t ENASET;
  volatile uint32_t ENACLR;
  volatile uint32_t ALTSET;
  volatile uint32_t ALTCLR;
  volatile uint32_t PRIOSET;
  volatile uint32_t PRIOCLR;
  volatile const uint32_t RESERVED[3];
  volatile uint32_t ERRCLR;
  volatile const uint32_t RESERVED1[300];
  volatile uint32_t CHASGN;
  volatile uint32_t CHIS;
  volatile const uint32_t RESERVED2[2];
  volatile uint32_t CHMAP0;
  volatile uint32_t CHMAP1;
  volatile uint32_t CHMAP2;
  volatile uint32_t CHMAP3;
} UDMA_Type;
# 25 "main.c" 2
# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 1 3
# 53 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef unsigned int size_t;
# 68 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 138 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *tmpfile(void);






extern __attribute__((__nothrow__)) char *tmpnam(char * );
# 265 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fflush(FILE * );
# 285 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((__nothrow__)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __attribute__((__nothrow__)) int snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((__nothrow__)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));

extern __attribute__((__nothrow__)) int vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) int vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (getchar)(void);
# 713 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (putchar)(int );






extern __attribute__((__nothrow__)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) void perror(const char * );
# 917 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((__nothrow__)) void __use_no_semihosting_swi(void);
extern __attribute__((__nothrow__)) void __use_no_semihosting(void);
# 26 "main.c" 2



extern void PORTA_SSI0_INIT(void) ;
extern void N5110_INIT(void) ;

extern void LOSER_ROM(void) ;
extern void SCREEN_ROM(void);
extern void AnnounceResult(void) ;

unsigned char * ahmet = (unsigned char*)0x20002020;
unsigned char * font_adress = (unsigned char*)0x2000221A;


static unsigned char NOKIA_DICK [] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0xC0, 0xC0, 0xC0, 0xE0, 0x70, 0x70, 0x30, 0x30, 0x38, 0x18, 0x18, 0x1C, 0x0C, 0x0C,
0x0E, 0x06, 0x06, 0x07, 0x03, 0x03, 0x03, 0x83, 0x83, 0x83, 0xC3, 0xC3, 0xC3, 0xE3, 0xF3, 0x77,
0x3E, 0xFC, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x80, 0xE0, 0xF0, 0x38, 0x18, 0x1C, 0x0E, 0x06, 0x07, 0x83, 0x83, 0x03, 0x03,
0x03, 0x03, 0x07, 0x0E, 0xFC, 0xF8, 0xC0, 0x00, 0x80, 0x80, 0xC0, 0xE0, 0x60, 0x70, 0x30, 0x38,
0x1C, 0x0C, 0x0C, 0x0E, 0x06, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00,
0x00, 0x00, 0x80, 0xE0, 0xFC, 0x3F, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x03, 0x01, 0x00, 0x00, 0x00, 0x60, 0x60, 0x00, 0x00,
0xC1, 0xC1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x01, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0xC0, 0xC0, 0xE0, 0x60, 0x70, 0x30,
0x38, 0x18, 0x1C, 0x0C, 0x0E, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0F, 0x1E, 0x38, 0x70, 0xE0, 0xC0,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18,
0x18, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0xF0, 0xF0, 0xB0, 0x38, 0x18, 0x18, 0x18, 0x18, 0x18,
0x18, 0x18, 0x1C, 0x0C, 0x0C, 0x0E, 0x06, 0x06, 0x06, 0x07, 0x03, 0x03, 0x03, 0x01, 0x01, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x7C, 0x70, 0x60,
0x60, 0x60, 0xE3, 0xC3, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xE0, 0xF0, 0x7F, 0x1F, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
# 83 "main.c"
const unsigned char FontWide[59][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x5f, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00},
    {0x0a, 0x1f, 0x0a, 0x1f, 0x0a, 0x00, 0x00, 0x00},
    {0x24, 0x2a, 0x2a, 0x7f, 0x2a, 0x2a, 0x12, 0x00},
    {0x00, 0x47, 0x25, 0x17, 0x08, 0x74, 0x52, 0x71},
    {0x00, 0x36, 0x49, 0x49, 0x49, 0x41, 0x41, 0x38},
    {0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x3e, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x41, 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x04, 0x15, 0x0e, 0x15, 0x04, 0x00, 0x00, 0x00},
    {0x08, 0x08, 0x3e, 0x08, 0x08, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00},
    {0x08, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00},
    {0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00},
    {0x00, 0x3e, 0x61, 0x51, 0x49, 0x45, 0x43, 0x3e},
    {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00, 0x00},
    {0x00, 0x71, 0x49, 0x49, 0x49, 0x49, 0x49, 0x46},
    {0x41, 0x49, 0x49, 0x49, 0x49, 0x49, 0x36, 0x00},
    {0x00, 0x0f, 0x10, 0x10, 0x10, 0x10, 0x10, 0x7f},
    {0x00, 0x4f, 0x49, 0x49, 0x49, 0x49, 0x49, 0x31},
    {0x00, 0x3e, 0x49, 0x49, 0x49, 0x49, 0x49, 0x30},
    {0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x7e, 0x00},
    {0x00, 0x36, 0x49, 0x49, 0x49, 0x49, 0x49, 0x36},
    {0x00, 0x06, 0x49, 0x49, 0x49, 0x49, 0x49, 0x3e},
    {0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x34, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00},
    {0x08, 0x14, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x14, 0x14, 0x14, 0x14, 0x14, 0x00, 0x00, 0x00},
    {0x22, 0x14, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x06, 0x01, 0x01, 0x59, 0x09, 0x09, 0x06},
    {0x00, 0x3e, 0x41, 0x5d, 0x55, 0x5d, 0x51, 0x5e},
    {0x00, 0x7e, 0x01, 0x09, 0x09, 0x09, 0x09, 0x7e},
    {0x00, 0x7f, 0x41, 0x49, 0x49, 0x49, 0x49, 0x36},
    {0x00, 0x3e, 0x41, 0x41, 0x41, 0x41, 0x41, 0x22},
    {0x00, 0x7f, 0x41, 0x41, 0x41, 0x41, 0x41, 0x3e},
    {0x00, 0x3e, 0x49, 0x49, 0x49, 0x49, 0x49, 0x41},
    {0x00, 0x7e, 0x09, 0x09, 0x09, 0x09, 0x09, 0x01},
    {0x00, 0x3e, 0x41, 0x49, 0x49, 0x49, 0x49, 0x79},
    {0x00, 0x7f, 0x08, 0x08, 0x08, 0x08, 0x08, 0x7f},
    {0x00, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00},
    {0x00, 0x38, 0x40, 0x40, 0x41, 0x41, 0x41, 0x3f},
    {0x00, 0x7f, 0x08, 0x08, 0x08, 0x0c, 0x0a, 0x71},
    {0x00, 0x3f, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40},
    {0x00, 0x7e, 0x01, 0x01, 0x7e, 0x01, 0x01, 0x7e},
    {0x00, 0x7e, 0x01, 0x01, 0x3e, 0x40, 0x40, 0x3f},
    {0x00, 0x3e, 0x41, 0x41, 0x41, 0x41, 0x41, 0x3e},
    {0x00, 0x7e, 0x09, 0x09, 0x09, 0x09, 0x09, 0x06},
    {0x00, 0x3e, 0x41, 0x41, 0x71, 0x51, 0x51, 0x7e},
    {0x00, 0x7e, 0x01, 0x31, 0x49, 0x49, 0x49, 0x46},
    {0x00, 0x46, 0x49, 0x49, 0x49, 0x49, 0x49, 0x31},
    {0x01, 0x01, 0x01, 0x7f, 0x01, 0x01, 0x01, 0x00},
    {0x00, 0x3f, 0x40, 0x40, 0x40, 0x40, 0x40, 0x3f},
    {0x00, 0x0f, 0x10, 0x20, 0x40, 0x20, 0x10, 0x0f},
    {0x00, 0x3f, 0x40, 0x40, 0x3f, 0x40, 0x40, 0x3f},
    {0x00, 0x63, 0x14, 0x08, 0x08, 0x08, 0x14, 0x63},
    {0x00, 0x07, 0x08, 0x08, 0x78, 0x08, 0x08, 0x07},
    {0x00, 0x71, 0x49, 0x49, 0x49, 0x49, 0x49, 0x47},
};
# 230 "main.c"
static unsigned int i = 0;
static unsigned int j = 0;

int main (void){
 PORTA_SSI0_INIT();
 N5110_INIT();



 for ( i =0; i < 504;i++ ){

 *(ahmet+i) = 0;
 }
 *(ahmet)=0;

 for ( i =0; i < 59;i++ ){
  for ( j =0; j < 8;j++ ){
  *(font_adress+i*8+j) = FontWide[i][j];
  }
 }
# 265 "main.c"
 AnnounceResult();


 while(1){
 }
}

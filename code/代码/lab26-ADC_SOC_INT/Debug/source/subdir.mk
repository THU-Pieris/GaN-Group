################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/ADC_SOC_INT.c \
../source/DSP2833x_Adc.c \
../source/DSP2833x_CpuTimers.c \
../source/DSP2833x_DefaultIsr.c \
../source/DSP2833x_GlobalVariableDefs.c \
../source/DSP2833x_Gpio.c \
../source/DSP2833x_PieCtrl.c \
../source/DSP2833x_PieVect.c \
../source/DSP2833x_SysCtrl.c \
../source/DSP2833x_Xintf.c 

ASM_SRCS += \
../source/DSP2833x_ADC_cal.asm \
../source/DSP2833x_CodeStartBranch.asm \
../source/DSP2833x_DBGIER.asm \
../source/DSP2833x_usDelay.asm 

ASM_DEPS += \
./source/DSP2833x_ADC_cal.pp \
./source/DSP2833x_CodeStartBranch.pp \
./source/DSP2833x_DBGIER.pp \
./source/DSP2833x_usDelay.pp 

OBJS += \
./ADC_SOC_INT.obj \
./DSP2833x_ADC_cal.obj \
./DSP2833x_Adc.obj \
./DSP2833x_CodeStartBranch.obj \
./DSP2833x_CpuTimers.obj \
./DSP2833x_DBGIER.obj \
./DSP2833x_DefaultIsr.obj \
./DSP2833x_GlobalVariableDefs.obj \
./DSP2833x_Gpio.obj \
./DSP2833x_PieCtrl.obj \
./DSP2833x_PieVect.obj \
./DSP2833x_SysCtrl.obj \
./DSP2833x_Xintf.obj \
./DSP2833x_usDelay.obj 

C_DEPS += \
./source/ADC_SOC_INT.pp \
./source/DSP2833x_Adc.pp \
./source/DSP2833x_CpuTimers.pp \
./source/DSP2833x_DefaultIsr.pp \
./source/DSP2833x_GlobalVariableDefs.pp \
./source/DSP2833x_Gpio.pp \
./source/DSP2833x_PieCtrl.pp \
./source/DSP2833x_PieVect.pp \
./source/DSP2833x_SysCtrl.pp \
./source/DSP2833x_Xintf.pp 

OBJS__QTD += \
".\ADC_SOC_INT.obj" \
".\DSP2833x_ADC_cal.obj" \
".\DSP2833x_Adc.obj" \
".\DSP2833x_CodeStartBranch.obj" \
".\DSP2833x_CpuTimers.obj" \
".\DSP2833x_DBGIER.obj" \
".\DSP2833x_DefaultIsr.obj" \
".\DSP2833x_GlobalVariableDefs.obj" \
".\DSP2833x_Gpio.obj" \
".\DSP2833x_PieCtrl.obj" \
".\DSP2833x_PieVect.obj" \
".\DSP2833x_SysCtrl.obj" \
".\DSP2833x_Xintf.obj" \
".\DSP2833x_usDelay.obj" 

ASM_DEPS__QTD += \
".\source\DSP2833x_ADC_cal.pp" \
".\source\DSP2833x_CodeStartBranch.pp" \
".\source\DSP2833x_DBGIER.pp" \
".\source\DSP2833x_usDelay.pp" 

C_DEPS__QTD += \
".\source\ADC_SOC_INT.pp" \
".\source\DSP2833x_Adc.pp" \
".\source\DSP2833x_CpuTimers.pp" \
".\source\DSP2833x_DefaultIsr.pp" \
".\source\DSP2833x_GlobalVariableDefs.pp" \
".\source\DSP2833x_Gpio.pp" \
".\source\DSP2833x_PieCtrl.pp" \
".\source\DSP2833x_PieVect.pp" \
".\source\DSP2833x_SysCtrl.pp" \
".\source\DSP2833x_Xintf.pp" 

C_SRCS_QUOTED += \
"../source/ADC_SOC_INT.c" \
"../source/DSP2833x_Adc.c" \
"../source/DSP2833x_CpuTimers.c" \
"../source/DSP2833x_DefaultIsr.c" \
"../source/DSP2833x_GlobalVariableDefs.c" \
"../source/DSP2833x_Gpio.c" \
"../source/DSP2833x_PieCtrl.c" \
"../source/DSP2833x_PieVect.c" \
"../source/DSP2833x_SysCtrl.c" \
"../source/DSP2833x_Xintf.c" 

ASM_SRCS_QUOTED += \
"../source/DSP2833x_ADC_cal.asm" \
"../source/DSP2833x_CodeStartBranch.asm" \
"../source/DSP2833x_DBGIER.asm" \
"../source/DSP2833x_usDelay.asm" 


# Each subdirectory must supply rules for building sources it contributes
./ADC_SOC_INT.obj: ../source/ADC_SOC_INT.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/ADC_SOC_INT.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_ADC_cal.obj: ../source/DSP2833x_ADC_cal.asm $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_ADC_cal.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_Adc.obj: ../source/DSP2833x_Adc.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_Adc.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_CodeStartBranch.obj: ../source/DSP2833x_CodeStartBranch.asm $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_CodeStartBranch.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_CpuTimers.obj: ../source/DSP2833x_CpuTimers.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_CpuTimers.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_DBGIER.obj: ../source/DSP2833x_DBGIER.asm $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_DBGIER.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_DefaultIsr.obj: ../source/DSP2833x_DefaultIsr.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_DefaultIsr.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_GlobalVariableDefs.obj: ../source/DSP2833x_GlobalVariableDefs.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_GlobalVariableDefs.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_Gpio.obj: ../source/DSP2833x_Gpio.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_Gpio.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_PieCtrl.obj: ../source/DSP2833x_PieCtrl.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_PieCtrl.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_PieVect.obj: ../source/DSP2833x_PieVect.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_PieVect.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_SysCtrl.obj: ../source/DSP2833x_SysCtrl.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_SysCtrl.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_Xintf.obj: ../source/DSP2833x_Xintf.c $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_Xintf.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

./DSP2833x_usDelay.obj: ../source/DSP2833x_usDelay.asm $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --include_path="D:/workspace1/lab26-ADC_SOC_INT/include" --include_path="C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" --include_path="C:/Program Files/Texas Instruments/xdais_6_25_01_08/packages/ti/xdais" --diag_warning=225 --large_memory_model --float_support=fpu32 --preproc_with_compile --preproc_dependency="source/DSP2833x_usDelay.pp" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '



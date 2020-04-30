################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
ADC_SOC_INT.obj: ../source/ADC_SOC_INT.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/ADC_SOC_INT.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_ADC_cal.obj: ../source/DSP2833x_ADC_cal.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_ADC_cal.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_Adc.obj: ../source/DSP2833x_Adc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_Adc.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_CodeStartBranch.obj: ../source/DSP2833x_CodeStartBranch.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_CodeStartBranch.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_CpuTimers.obj: ../source/DSP2833x_CpuTimers.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_CpuTimers.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_DBGIER.obj: ../source/DSP2833x_DBGIER.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_DBGIER.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_DefaultIsr.obj: ../source/DSP2833x_DefaultIsr.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_DefaultIsr.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_EPwm.obj: ../source/DSP2833x_EPwm.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_EPwm.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_GlobalVariableDefs.obj: ../source/DSP2833x_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_GlobalVariableDefs.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_Gpio.obj: ../source/DSP2833x_Gpio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_Gpio.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_MemCopy.obj: ../source/DSP2833x_MemCopy.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_MemCopy.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_PieCtrl.obj: ../source/DSP2833x_PieCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_PieCtrl.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_PieVect.obj: ../source/DSP2833x_PieVect.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_PieVect.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_SysCtrl.obj: ../source/DSP2833x_SysCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_SysCtrl.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_Xintf.obj: ../source/DSP2833x_Xintf.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_Xintf.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_usDelay.obj: ../source/DSP2833x_usDelay.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="G:/CCS_Code/F28335/lab26-ADC_SOC_INT/include" --include_path="G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --include_path="/packages/ti/xdais" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --preproc_with_compile --preproc_dependency="source/DSP2833x_usDelay.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '



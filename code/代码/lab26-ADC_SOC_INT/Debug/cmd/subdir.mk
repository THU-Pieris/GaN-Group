################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CMD_SRCS += \
../cmd/28335_RAM_lnk.cmd \
../cmd/DSP2833x_Headers_nonBIOS.cmd 


# Each subdirectory must supply rules for building sources it contributes
cmd/28335_RAM_lnk.out: ../cmd/28335_RAM_lnk.cmd $(OBJS)
	@echo 'Building file: $<'
	@echo 'Invoking: Linker'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --diag_warning=225 --large_memory_model --float_support=fpu32 -z -m"../cmd/Debug/ADC_SOC_INT.map" --stack_size=1000 --heap_size=1000 --warn_sections -i"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/lib" -i"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" -i"D:/workspace1/lab26-ADC_SOC_INT" --reread_libs --rom_model -o "$@" "$<" $(ORDERED_OBJS)
	@echo 'Finished building: $<'
	@echo ' '

cmd/DSP2833x_Headers_nonBIOS.out: ../cmd/DSP2833x_Headers_nonBIOS.cmd $(OBJS)
	@echo 'Building file: $<'
	@echo 'Invoking: Linker'
	"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/bin/cl2000" --silicon_version=28 -g --define="_DEBUG" --define="LARGE_MODEL" --diag_warning=225 --large_memory_model --float_support=fpu32 -z -m"../cmd/Debug/ADC_SOC_INT.map" --stack_size=1000 --heap_size=1000 --warn_sections -i"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/lib" -i"C:/Program Files/Texas Instruments/ccsv4/tools/compiler/c2000/include" -i"D:/workspace1/lab26-ADC_SOC_INT" --reread_libs --rom_model -o "$@" "$<" $(ORDERED_OBJS)
	@echo 'Finished building: $<'
	@echo ' '



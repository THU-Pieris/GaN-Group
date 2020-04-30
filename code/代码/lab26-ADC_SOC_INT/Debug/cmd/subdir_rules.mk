################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
cmd/DSP2833x_Headers_nonBIOS.exe: ../cmd/DSP2833x_Headers_nonBIOS.cmd $(GEN_CMDS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Linker'
	"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 -z -m"../cmd/Debug/ADC_SOC_INT.map" --heap_size=1000 --stack_size=1000 --warn_sections -i"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/lib" -i"G:/CCS/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" -i"G:/CCS_Code/F28335/lab26-ADC_SOC_INT" --reread_libs --xml_link_info="ADC_SOC_INT_linkInfo.xml" --rom_model -o "$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '



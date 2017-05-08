##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=systick_irq
ConfigurationName      :=Debug
WorkspacePath          :=/Users/Simon/chalmers-eda487
ProjectPath            :=/Users/Simon/chalmers-eda487/systick_irq
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Simon Hansson
Date                   :=08/05/2017
CodeLitePath           :="/Users/Simon/Library/Application Support/codelite"
LinkerName             :=/Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-g++
SharedObjectLinkerName :=/Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="systick_irq.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -nostartfiles -nostdlib -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch)/Users/Simon/chalmers-eda487/libraries 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/Applications/gcc-arm/arm-none-eabi/lib/armv6-m $(LibraryPathSwitch)/Applications/gcc-arm/lib/gcc/arm-none-eabi/5.4.1/armv6-m 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-ar rcu
CXX      := /Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-g++
CC       := /Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /Applications/gcc-arm/gcc-arm-none-eabi-5_4-2016q2/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/up_libraries_delay.c$(ObjectSuffix) $(IntermediateDirectory)/up_libraries_display.c$(ObjectSuffix) $(IntermediateDirectory)/up_libraries_keypad.c$(ObjectSuffix) $(IntermediateDirectory)/up_libraries_object.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/systick_irq.elf ./Debug/systick_irq.s19
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/systick_irq/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/up_libraries_delay.c$(ObjectSuffix): ../libraries/delay.c $(IntermediateDirectory)/up_libraries_delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/libraries/delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_libraries_delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_libraries_delay.c$(DependSuffix): ../libraries/delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_libraries_delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_libraries_delay.c$(DependSuffix) -MM ../libraries/delay.c

$(IntermediateDirectory)/up_libraries_delay.c$(PreprocessSuffix): ../libraries/delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_libraries_delay.c$(PreprocessSuffix) ../libraries/delay.c

$(IntermediateDirectory)/up_libraries_display.c$(ObjectSuffix): ../libraries/display.c $(IntermediateDirectory)/up_libraries_display.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/libraries/display.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_libraries_display.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_libraries_display.c$(DependSuffix): ../libraries/display.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_libraries_display.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_libraries_display.c$(DependSuffix) -MM ../libraries/display.c

$(IntermediateDirectory)/up_libraries_display.c$(PreprocessSuffix): ../libraries/display.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_libraries_display.c$(PreprocessSuffix) ../libraries/display.c

$(IntermediateDirectory)/up_libraries_keypad.c$(ObjectSuffix): ../libraries/keypad.c $(IntermediateDirectory)/up_libraries_keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/libraries/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_libraries_keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_libraries_keypad.c$(DependSuffix): ../libraries/keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_libraries_keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_libraries_keypad.c$(DependSuffix) -MM ../libraries/keypad.c

$(IntermediateDirectory)/up_libraries_keypad.c$(PreprocessSuffix): ../libraries/keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_libraries_keypad.c$(PreprocessSuffix) ../libraries/keypad.c

$(IntermediateDirectory)/up_libraries_object.c$(ObjectSuffix): ../libraries/object.c $(IntermediateDirectory)/up_libraries_object.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/libraries/object.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_libraries_object.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_libraries_object.c$(DependSuffix): ../libraries/object.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_libraries_object.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_libraries_object.c$(DependSuffix) -MM ../libraries/object.c

$(IntermediateDirectory)/up_libraries_object.c$(PreprocessSuffix): ../libraries/object.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_libraries_object.c$(PreprocessSuffix) ../libraries/object.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/



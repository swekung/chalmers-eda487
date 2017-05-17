##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=Final
ConfigurationName      :=Debug
WorkspacePath          :=/Users/Simon/chalmers-eda487
ProjectPath            :=/Users/Simon/chalmers-eda487/Final
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Simon Hansson
Date                   :=16/05/2017
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
ObjectsFileList        :="Final.txt"
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
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/usart.c$(ObjectSuffix) 



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
	arm-none-eabi-objcopy -S -O srec  ./Debug/Final.elf ./Debug/Final.s19
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
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/Final/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/usart.c$(ObjectSuffix): usart.c $(IntermediateDirectory)/usart.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/chalmers-eda487/Final/usart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/usart.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/usart.c$(DependSuffix): usart.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/usart.c$(ObjectSuffix) -MF$(IntermediateDirectory)/usart.c$(DependSuffix) -MM usart.c

$(IntermediateDirectory)/usart.c$(PreprocessSuffix): usart.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/usart.c$(PreprocessSuffix) usart.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/



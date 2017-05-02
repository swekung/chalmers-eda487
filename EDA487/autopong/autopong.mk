##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=autopong
ConfigurationName      :=Debug
WorkspacePath          :=/Users/Simon/Dropbox/EDA487
ProjectPath            :=/Users/Simon/Dropbox/EDA487/autopong
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Simon Hansson
Date                   :=02/05/2017
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
ObjectsFileList        :="autopong.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -nostartfiles -nostdlib -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
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
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/up_graphicdisplay_delay.c$(ObjectSuffix) $(IntermediateDirectory)/up_graphicdisplay_display.c$(ObjectSuffix) $(IntermediateDirectory)/up_graphicdisplay_object.c$(ObjectSuffix) $(IntermediateDirectory)/keypad.c$(ObjectSuffix) 



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
	arm-none-eabi-objcopy -S -O srec  ./Debug/autopong.elf ./Debug/autopong.s19
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
	$(CC) $(SourceSwitch) "/Users/Simon/Dropbox/EDA487/autopong/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/up_graphicdisplay_delay.c$(ObjectSuffix): ../graphicdisplay/delay.c $(IntermediateDirectory)/up_graphicdisplay_delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/Dropbox/EDA487/graphicdisplay/delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_graphicdisplay_delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_graphicdisplay_delay.c$(DependSuffix): ../graphicdisplay/delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_graphicdisplay_delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_graphicdisplay_delay.c$(DependSuffix) -MM ../graphicdisplay/delay.c

$(IntermediateDirectory)/up_graphicdisplay_delay.c$(PreprocessSuffix): ../graphicdisplay/delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_graphicdisplay_delay.c$(PreprocessSuffix) ../graphicdisplay/delay.c

$(IntermediateDirectory)/up_graphicdisplay_display.c$(ObjectSuffix): ../graphicdisplay/display.c $(IntermediateDirectory)/up_graphicdisplay_display.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/Dropbox/EDA487/graphicdisplay/display.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_graphicdisplay_display.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_graphicdisplay_display.c$(DependSuffix): ../graphicdisplay/display.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_graphicdisplay_display.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_graphicdisplay_display.c$(DependSuffix) -MM ../graphicdisplay/display.c

$(IntermediateDirectory)/up_graphicdisplay_display.c$(PreprocessSuffix): ../graphicdisplay/display.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_graphicdisplay_display.c$(PreprocessSuffix) ../graphicdisplay/display.c

$(IntermediateDirectory)/up_graphicdisplay_object.c$(ObjectSuffix): ../graphicdisplay/object.c $(IntermediateDirectory)/up_graphicdisplay_object.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/Dropbox/EDA487/graphicdisplay/object.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_graphicdisplay_object.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_graphicdisplay_object.c$(DependSuffix): ../graphicdisplay/object.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_graphicdisplay_object.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_graphicdisplay_object.c$(DependSuffix) -MM ../graphicdisplay/object.c

$(IntermediateDirectory)/up_graphicdisplay_object.c$(PreprocessSuffix): ../graphicdisplay/object.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_graphicdisplay_object.c$(PreprocessSuffix) ../graphicdisplay/object.c

$(IntermediateDirectory)/keypad.c$(ObjectSuffix): keypad.c $(IntermediateDirectory)/keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Simon/Dropbox/EDA487/autopong/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keypad.c$(DependSuffix): keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad.c$(DependSuffix) -MM keypad.c

$(IntermediateDirectory)/keypad.c$(PreprocessSuffix): keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keypad.c$(PreprocessSuffix) keypad.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/



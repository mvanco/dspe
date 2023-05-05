#***** Aurasium Pre-preparation Makefile Script for APK Rewritter  *****
# Editor: Matus Vanco <xvanco02@stud.fit.vutbr.cz>

# Notes: Must be placed in <ApkMonitor root>/package folder
#        Output is in "depencencies" folder in the same folder as ApkMontior root folder is
#        located



#***** < ENVIRONMENT SETTINGS > *****

# Absolue path to Java installation
# Note: If Java is in PATH variable, "java" or "java.exe" command is enough
JAVA_PATH=java

# Absolute path to Android SDK
ANDROID_SDK=c:/Users/Matus/android-sdk

# Relative path to dx.jar (from Android SDK root)
DX_JAR_RELATIVE=build-tools/23.0.2/lib/dx.jar

# Absolute Path to Baksmali installation (verified version is 1.2.8)
BAKSMALI_PATH=c:/apktool/baksmali-2.1.1.jar

#***** </ ENVIRONMENT SETTINGS > *****



#***** < ORIGINAL CODE > *****

SRC_DIR=../
dx=$(JAVA_PATH) -Xmx1024M -jar $(ANDROID_SDK)/$(DX_JAR_RELATIVE)
baksmali=$(JAVA_PATH) -Xmx1024M -jar $(BAKSMALI_PATH)

SRC_JAVA=$(shell cd $(SRC_DIR)/bin/classes/; find com/rx201/apkmon/ -name *.class )
SRC_NATIVE=$(wildcard $(SRC_DIR)/libs/armeabi/*.so)
SRC_NATIVE_v7a=$(wildcard $(SRC_DIR)/libs/armeabi-v7a/*.so)

CurDir=$(shell pwd)

.PHONY: all,clean

all: aurasium.zip

aurasium.zip: smali lib
	rm -f $@
	zip -r $@ $+
	cp $@ ../../dependencies/
clean:
	rm -rf smali
	rm -rf lib
	rm -f APIHook.dex
	rm -f aurasium.zip
	
lib: $(SRC_NATIVE) $(SRC_NATIVE_v7a)
	rm -rf $@
	mkdir -p lib/armeabi
	mkdir -p lib/armeabi-v7a
	echo $+
	#cp $(filter $(SRC_DIR)/libs/armeabi/%, $+) lib/armeabi/
	cp $(filter $(SRC_DIR)/libs/armeabi-v7a/%, $+) lib/armeabi-v7a/
	
smali: APIHook.dex
	rm -rf $@
	$(baksmali) -o smali APIHook.dex
	
APIHook.dex: $(addprefix $(SRC_DIR)/bin/classes/, $(SRC_JAVA))
	cd  $(SRC_DIR)/bin/classes/; $(dx) --dex --output="$(shell cygpath -d $(CurDir))/APIHook.dex" $(subst $$,\$$, $(SRC_JAVA))

#***** </ ORIGINAL CODE > *****
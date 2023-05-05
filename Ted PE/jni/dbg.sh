#!/bin/sh
adb shell ps | grep cz.vutbr.policyenforcement.apkmon | awk '{print $2}' | xargs adb shell kill
adb push ../libs/armeabi/libapihook.so /data/data/cz.vutbr.policyenforcement.apkmon/lib/libapihook.so
~/android-ndk-r6/ndk-gdb --start



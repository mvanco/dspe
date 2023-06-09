# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS    := -DDISABLE_LOGGING=0
LOCAL_MODULE    := apihook
LOCAL_SRC_FILES := apihook.cpp reflection_blocker.cpp hook_ioctl.cpp hook_inet.cpp hook_sys.cpp JNIHelper.cpp logfile.cpp hook_misc.cpp access.c pe/utilities.cpp pe/logging.cpp pe/hook_open.cpp pe/hook_close.cpp pe/hook_read.cpp pe/hook_write.cpp pe/taint_map.cpp pe/sha256.cpp pe/init.cpp
LOCAL_LDLIBS    := -llog

include $(BUILD_SHARED_LIBRARY)

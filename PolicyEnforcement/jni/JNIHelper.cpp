/*
 * JNIHelper.cpp
 *
 *  Created on: Sep 2, 2011
 *      Author: rubin
 */

#include "JNIHelper.h"

#include <unistd.h>
#include <android/log.h>
#define  HF_LOG_TAG    "apihook-jnihelper"
#define  LOG_TO_FILE(...)  __android_log_print(ANDROID_LOG_INFO,HF_LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,HF_LOG_TAG,__VA_ARGS__)

#define NULL 0

JNIHelper* JNIHelper::instance;

JNIHelper::JNIHelper() {
}

JNIHelper::~JNIHelper() {
	//TODO: Remove Clazz global reference
}

JNIHelper& JNIHelper::Self() {
	if (!instance)
		instance = new JNIHelper();
	return *instance;
}

JNIEnv* JNIHelper::GetEnv(){
	JNIEnv* env = NULL;
	int status = jvm->GetEnv((void **) &env, JNI_VERSION_1_4);
	if(status < 0) {
		LOGE("Failed to get JNI environment, assuming native thread");
		status = jvm->AttachCurrentThread(&env, NULL);
		if(status < 0) {
			LOGE("Failed to attach current thread");
			return NULL;
		}
	}
	return env;
}

void JNIHelper::Init(JavaVM* jvm, JNIEnv* env) {
	this->jvm = jvm;

	if (env == NULL) {
		LOGE("ERROR: env is NULL\n");
		return;
	}

	jclass JniClazz;
	jmethodID JniMethod;
	jfieldID JniField;

	/* <MV initialization of jclasses> */
	static const char* const strClassParcel = "android/os/Parcel";
	/* find the class handle */
	JniClazz = env->FindClass(strClassParcel);
	if (JniClazz == NULL) {
		LOGE("Can't find class %s\n", strClassParcel);
		return;
	}
	gParcelMetadata.Clazz = (jclass)env->NewGlobalRef(JniClazz);

	static const char* const strClassAPIHook = "cz/vutbr/policyenforcement/apkmon/APIHook";

	JniClazz = env->FindClass(strClassAPIHook);
	if (JniClazz == NULL) {
		LOGE("Can't find class %s\n", strClassAPIHook);
		return;
	}
	gApiHookMetadata.Clazz = (jclass)env->NewGlobalRef(JniClazz);
	/* </MV initialization of jclasses> */


	/* <MV Android Build Version> */
	int androidBuildVersion = -1;

	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "getAndroidBuildVersion", "()I");
	if(!JniMethod) {
		LOGE("Failed to get getAndroidBuild method");
		return;
	}
	androidBuildVersion = env->CallStaticIntMethod(gApiHookMetadata.Clazz, JniMethod);
	/* </MV Android Build Version> */


	/* android.os.Parcel.<init> */
	if (androidBuildVersion < 21) {
		JniMethod = env->GetMethodID(gParcelMetadata.Clazz, "<init>", "(I)V");
	}
	else {
		JniMethod = env->GetMethodID(gParcelMetadata.Clazz, "<init>", "(J)V");
	}
	if(!JniMethod) {
		LOGE("Failed to get constructor method");
		return;
	}
	gParcelMetadata.Constructor = JniMethod;


	/* android.os.Parcel.mObject/android.os.Parcel.mNativePtr */
	JniField = env->GetFieldID(
			gParcelMetadata.Clazz, "mObject", "I");
	if(!JniField) {
		if (env->ExceptionCheck()) {
			env->ExceptionClear();
		}

		if (androidBuildVersion < 21) {
			JniField = env->GetFieldID(gParcelMetadata.Clazz, "mNativePtr", "I");
		}
		else {
			JniField = env->GetFieldID(gParcelMetadata.Clazz, "mNativePtr", "J");
		}

		if (!JniField) {
			LOGE("Failed to get mObject/mNativePtr field");
			return;
		}
	}
	gParcelMetadata.mObject = JniField;

	/* com.rx201.apkmon.APIHook.onBcTransact */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "on_BC_TRANSACTION", "(IIILjava/lang/String;Landroid/os/Parcel;)[B");
	if(!JniMethod) {
		LOGE("Failed to get onBcTransact method");
		return;
	}
	gApiHookMetadata.onBcTransact = JniMethod;

	/* com.rx201.apkmon.APIHook.onBrTransact */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "on_BR_TRANSACTION", "(IIILjava/lang/String;Landroid/os/Parcel;)[B");
	if(!JniMethod) {
		LOGE("Failed to get onBrTransact method");
		return;
	}
	gApiHookMetadata.onBrTransact = JniMethod;

	/* com.rx201.apkmon.APIHook.onBcReply */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "on_BC_REPLY", "(IIILandroid/os/Parcel;)[B");
	if(!JniMethod) {
		LOGE("Failed to get onBcReply method");
		return;
	}
	gApiHookMetadata.onBcReply = JniMethod;

	/* com.rx201.apkmon.APIHook.onBrReply */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "on_BR_REPLY", "(IIILandroid/os/Parcel;)[B");
	if(!JniMethod) {
		LOGE("Failed to get onBrReply method");
		return;
	}
	gApiHookMetadata.onBrReply = JniMethod;

	/* com.rx201.apkmon.APIHook.onBeforeConnect */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "onBeforeConnect", "(ILjava/lang/String;I)I");
	if(!JniMethod) {
		LOGE("Failed to get onBeforeConnect method");
		return;
	}
	gApiHookMetadata.onBeforeConnect = JniMethod;


	/* com.rx201.apkmon.APIHook.onDNSResolve */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "onDNSResolve", "(Ljava/lang/String;Ljava/lang/String;)I");
	if(!JniMethod) {
		LOGE("Failed to get onDNSResolve method");
		return;
	}
	gApiHookMetadata.onDNSResolve = JniMethod;

	/* com.rx201.apkmon.APIHook.onDlOpen */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "onDlOpen", "(Ljava/lang/String;I)I");
	if(!JniMethod) {
		LOGE("Failed to get onDlOpen method");
		return;
	}
	gApiHookMetadata.onDlOpen = JniMethod;

	/* com.rx201.apkmon.APIHook.onBeforeExecve */
	JniMethod = env->GetStaticMethodID(
			gApiHookMetadata.Clazz, "onBeforeExecvp", "(Ljava/lang/String;)I");
	if(!JniMethod) {
		LOGE("Failed to get onBeforeExecvp method");
		return;
	}
	gApiHookMetadata.onBeforeExecvp = JniMethod;
}

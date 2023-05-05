Dynamic Security Policy Enforcement on Android Platform
========

This work proposes the system for dynamic enforcement of access rights on Android. Each
suspicious application can be repackaged by this system, so that the access to selected
private data is restricted for the outer world. The system intercepts the system calls using
Aurasium framework and adds an innovative approach of tracking the information flows
from the privacy-sensitive sources using tainting mechanism without need of administra-
tor rights. There has been designed file-level and data-level taint propagation and policy
enforcement based on Android binder.

### Code Structure
* PEPrivateFiles/: Android app for configuration of system for dynamic enforcement of access rights
* PolicyEnforcement/: Native C code that is being injected into hardened apps

See https://drive.google.com/file/d/0BwxvylLYD7TyZlpmVG9QdGhIa0U/view?usp=sharing

aurasium
========

Practical security policy enforcement for Android apps via bytecode rewriting and in-place reference monitor.

Aurasium's code is released under GPLv3.

### Code Structure
* ApkMonitor/: The main native and java policy logic, bundled with a demo app
* pyAPKRewriter/: The APK patching scripts
* dependencies/: pyAPKRewriter's dependencies
* SecurityManager/: ASM for Aurasium

### Dependency
* Android SDK
* `apt-get install unzip python python-pyasn1` 

### Usage
To repackage an APK file:
    pyAPKRewriter/attach.sh source.apk [desktination.apk]

To build a new version of Aurasium for repackaging:
* First build ApkMonitor/ under Eclispe. 
* Then create an updated Aurasium blob by `make` in ApkMonitor/package.
* Finally copy aurasium.zip to dependencies/

# tw_wallet_ui

A new Flutter project for tw block-chain's wallet ui.

## What devices and OS versions does Flutter run on?
Mobile operating systems: Android Jelly Bean, v16, 4.1.x or newer, and iOS 8 or newer.

Mobile hardware: iOS devices (iPhone 4S or newer) and ARM Android devices.

Flutter supports building ahead-of-time (AOT) compiled libraries for x86_64, armeabi-v7a, and arm64-v8a.

Apps built for ARMv7 or ARM64 run fine (using ARM emulation) on many x86 Android devices.

We support developing Flutter apps with Android and iOS devices, as well as with Android emulators and the iOS simulator.

We test on a variety of low-end to high-end phones and tablets, but we don’t yet have an official device compatibility guarantee.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Run

```bash
flutter run -d device
```



The device above can get from

```
flutter doctor
```



## Deploy

[Android](https://flutter.dev/docs/deployment/android)

app bundle 

```bash
flutter build appbundle
```

apk

```bash
flutter build apk --split-per-abi
```


# TWRP Device configuration for Motorola Moto G84 5G

## Device specification

Basic   | Spec Sheet
-------:|:------------------------
CHIPSET | Qualcomm SDM695 (SM6375 "Holi") Snapdragon 695
GPU     | Adreno 619
Memory  | 8GB, 12GB
Shipped Android Version | 13.0
Storage | 256GB
Battery | 5000 mAh
Dimensions | 160 x 74,4 x 7,6 mm.
Display | OLED 6,55", Full HD+, 120 Hz
Rear Camera 1 | 16 MP f/2.45
Rear Camera 2 | 8 MP f/2.2 UGA
Rear Camera 3 | 50 MP f/1.88 OIS

### Kernel Source
From user 13 T3TC33.18-12-3 6138c release-keys

### How to compile
First repo init the twrp-12.1 tree:

```
mkdir ~/android/twrp-12.1
cd ~/android/twrp-12.1
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
mkdir -p .repo/local_manifests
```

Then add to a local manifest (if you don't have .repo/local_manifest then make that directory and make a blank file and name it something like twrp.xml):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
  <project name="android_device_motorola_bangkk-twrp" path="device/motorola/bangkk" remote="TeamWin" revision="android-12.1"/>
</manifest>
```

Now you can sync your source:

```
repo sync -j$(nproc --all)
```

To automatically make the TWRP installer zip, you need to import this commit in the build/make path: https://gerrit.twrp.me/c/android_build/+/5445

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_bangkk-eng
mka bootimage -j$(nproc --all)
```

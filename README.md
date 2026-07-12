# LineageOS 21 — Samsung Galaxy A12s (a12s)

## Device specifications
| Feature | Specification |
|---------|--------------|
| SoC | Samsung Exynos 850 (s5e3830) |
| CPU | 8x Cortex-A55 @ 2.0GHz |
| GPU | Mali-G52 MP1 |
| RAM | 3-6 GB |
| Storage | 32-128 GB |
| Display | 6.5" 720x1600 PLS TFT |
| Kernel | Linux 4.19 |
| Fingerprint | Side-mounted |
| NFC | NXP PN557 |

## Build instructions

### Initialize repo
```
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0
```

### Clone device repos (or use breakfast)
```
breakfast a12s
```

### Extract proprietary blobs
```
cd vendor/samsung/a12s
./extract-files.sh
cd ../..
```

### Build
```
source build/envsetup.sh
lunch lineage_a12s-ap2a-userdebug
mka bacon
```

## Maintainer
bthavanish

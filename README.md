# Device Tree — Samsung Galaxy A12s (SM-A127F/DS)

| Field | Value |
|---|---|
| Device | Samsung Galaxy A12s (A12 Nacho) |
| Model | SM-A127F/DS |
| Codename | a12s |
| SoC | Exynos 850 (s5e3830) |
| CPU | Cortex-A55 x 8 |
| GPU | Mali-G52 MP1 |
| Screen | 720 x 1600 @ 60Hz |
| RAM | 3/4/6 GB |
| Android base | 13 (LineageOS 21) |
| Kernel | kernel/samsung/a12s |
| Branch | lineage-21 |

## Dependencies
- device/samsung/exynos850-common
- vendor/samsung/a12s
- vendor/samsung/exynos850-common
- kernel/samsung/a12s

## Build
```bash
source build/envsetup.sh
lunch lineage_a12s-ap2a-userdebug
mka bacon
```

# TWRP 设备树-作业帮学习机P50

## 设备规格

| 项目 | 信息 |
|------|------|
| 设备代号 | `tb8786p1_64_k510_wifi` |
| 平台 | 联发科 MT6768 (arm64) |
| Android版本 | 12 (SDK 31) |
| 分区方案 | AB分区 + 动态分区 |
| Boot Header | v4 |
| Recovery | 集成于 `vendor_boot` |
| 内核 | 预编译 `Image.gz-dtb` (20.1MB) |
| DTB | `mt6768.dtb` (159397 Bytes) |
| Ramdisk | 预编译 `recovery_ramdisk.gz` (23.7MB) |

---

## 设备树结构

```
device/zyb/tb8786p1_64_k510_wifi/
├── dtb/
│   └── mt6768.dtb                    # 设备树 blob
├── prebuilt/
│   ├── Image.gz-dtb                 # 预编译内核 + DTB
│   └── recovery_ramdisk.gz          # 完整 TWRP recovery ramdisk
├── sepolicy/
│   └── private/
│       ├── property.te
│       └── property_contexts
├── Android.mk                       # 构建包含文件
├── AndroidProducts.mk              # 产品配置
├── BoardConfig.mk                  # 主板配置
├── dynamic_partitions_opts.xml    # 动态分区配置
├── recovery.fstab                 # 分区挂载表
├── twrp.dependencies              # 依赖定义
├── twrp.mk                        # TWRP 特定配置
└── twrp_tb8786p1_64_k510_wifi.mk # 产品 makefile
```

---

##  编译说明

### 1. 初始化 TWRP 源码
```bash
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. 克隆设备树
```bash
git clone https://github.com/WUNELEZI1/android_device_zyb_tb8786p1_64_k510_wifi.git \
  device/zyb/tb8786p1_64_k510_wifi
```

### 3. 编译 boot.img
```bash
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
breakfast twrp_tb8786p1_64_k510_wifi-eng
mka bootimage -j$(nproc --all)
```

### 4. 手动打包 vendor_boot.img(TWRP源码发疯)
```bash
cd out/target/product/tb8786p1_64_k510_wifi/

# 复制 DTB
cp ../../../../device/zyb/tb8786p1_64_k510_wifi/dtb/mt6768.dtb dtb.img

# 使用预编译 ramdisk
cp ../../../../device/zyb/tb8786p1_64_k510_wifi/prebuilt/recovery_ramdisk.gz .
gunzip -c recovery_ramdisk.gz > ramdisk.cpio

# 打包 vendor_boot.img
mkbootimg \
  --header_version 4 \
  --pagesize 4096 \
  --dtb_offset 0x1c000000 \
  --ramdisk_offset 0x4000000 \
  --tags_offset 0x00000100 \
  --dtb dtb.img \
  --ramdisk ramdisk.cpio \
  --cmdline "bootopt=64S3,32N2,64N2 buildvariant=user" \
  --output vendor_boot.img

# 生成 recovery.cpio.gz
cp recovery_ramdisk.gz recovery.cpio.gz
```

---

## 刷机方法

### 方法一：完整刷入
```bash
# 重启到 bootloader
adb reboot bootloader

# 刷入 boot.img
fastboot flash boot boot.img

# 刷入完整 vendor_boot
fastboot flash vendor_boot vendor_boot.img

# 重启
fastboot reboot
```

### 方法二：模块化刷入（保留原厂 vendor_ramdisk）
```bash
# 重启到 bootloader
adb reboot bootloader

# 刷入 boot.img
fastboot flash boot boot.img

# 只刷入 recovery ramdisk
fastboot flash vendor_boot:recovery recovery.cpio.gz

# 重启
fastboot reboot
```

### 关闭 AVB 验证（可选）
```bash
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
```

---

## 当前状态

| 组件 | 状态 | 说明 |
|------|------|------|
| `boot.img` | 正常 | ~20MB，包含内核 |
| `vendor_boot.img` | 正常 | ~24MB，包含完整 TWRP |
| `recovery_ramdisk.gz` | 正常 | 23.7MB，预编译 |
| `recovery.cpio.gz` | 正常 | 模块化 ramdisk |
| 设备树配置 | 完美 | 经过数十轮调试 |

---

## 测试情况

等待大牛测试反馈

---

## 致谢

- TWRP官方团队
- Minimal Manifest TWRP
- 作业帮

---

## 备注

- 本设备树基于 **TWRP-12.1** 分支配置
- 使用**预编译 recovery_ramdisk.gz**，避免编译问题

---

**WUNELEZI FUCK ZYB**

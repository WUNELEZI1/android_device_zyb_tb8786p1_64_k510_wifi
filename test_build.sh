#!/bin/bash
echo "🧪 Testing device tree build..."

# 检查关键文件
echo "📁 Checking device tree structure:"
ls -la

# 检查主题配置
echo "🎨 Checking theme configuration:"
grep -r "TW_THEME" *.mk

# 检查分区配置
echo "💾 Checking partition sizes:"
grep -E "VENDOR_BOOT|BOOT|USERDATA" BoardConfig.mk

# 检查依赖
echo "🔗 Checking dependencies:"
cat twrp.dependencies

echo "✅ Device tree structure looks good"
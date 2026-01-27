#!/bin/bash
# 修复构建问题的脚本

echo "🔧 Fixing build issues..."

# 1. 修复文件权限
find . -name "*.sh" -exec chmod +x {} \;

# 2. 确保主题目录存在
mkdir -p twres

# 3. 创建必要的SELinux目录
mkdir -p sepolicy/public

# 4. 修复中文注释编码问题
if command -v iconv &> /dev/null; then
  find . -name "*.mk" -exec iconv -f GBK -t UTF-8 {} -o {}.utf8 \; -exec mv {}.utf8 {} \;
fi

echo "✅ Fixes applied"
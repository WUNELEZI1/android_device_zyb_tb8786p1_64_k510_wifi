#!/bin/bash
echo "🔧 Fixing build issues..."
find . -name "*.sh" -exec chmod +x {} \;
mkdir -p twres
mkdir -p sepolicy/public
if command -v iconv &> /dev/null; then
  find . -name "*.mk" -exec iconv -f GBK -t UTF-8 {} -o {}.utf8 \; -exec mv {}.utf8 {} \;
fi
echo "✅ Fixes applied"
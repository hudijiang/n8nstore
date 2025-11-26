#!/bin/bash

# Supabase 配置助手
# 此脚本帮助您配置 Supabase 连接

echo "🚀 Supabase 配置助手"
echo "===================="
echo ""

# 检查 .env.local 是否存在
if [ -f .env.local ]; then
    echo "⚠️  .env.local 文件已存在"
    read -p "是否覆盖? (y/n): " overwrite
    if [ "$overwrite" != "y" ]; then
        echo "❌ 已取消"
        exit 0
    fi
fi

echo ""
echo "请从 Supabase Dashboard 获取以下信息："
echo "访问: https://app.supabase.com/project/_/settings/api"
echo ""

# 获取 Project URL
read -p "📍 输入 Project URL (https://xxxxx.supabase.co): " project_url

# 获取 Anon Key
echo ""
read -p "🔑 输入 Anon Public Key: " anon_key

# 获取 Service Role Key
echo ""
read -p "🔐 输入 Service Role Key (secret): " service_key

# 创建 .env.local 文件
cat > .env.local << EOF
# Supabase Configuration
# 自动生成于 $(date)

NEXT_PUBLIC_SUPABASE_URL=$project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=$anon_key
SUPABASE_SERVICE_ROLE_KEY=$service_key
EOF

echo ""
echo "✅ .env.local 文件已创建！"
echo ""
echo "下一步："
echo "1. 运行数据库迁移（在 Supabase SQL Editor 中执行 supabase/migrations/20241126000000_workflow_system.sql）"
echo "2. 导入数据: node scripts/import-to-database.js"
echo ""

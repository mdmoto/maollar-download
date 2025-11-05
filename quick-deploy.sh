#!/bin/bash

# ============================================================
# Maollar下载页面快速部署脚本
# ============================================================

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "🚀 Maollar下载页面快速部署"
echo "============================================================"

# ============================================================
# Step 1：选择APK托管方案
# ============================================================
echo ""
echo -e "${YELLOW}Step 1: 选择APK托管方案${NC}"
echo "------------------------------------------------------------"
echo ""
echo "请选择："
echo "  1. 使用阿里云OSS托管APK（推荐）"
echo "  2. 直接上传到Cloudflare Pages"
echo ""
read -p "请输入选项 (1/2): " choice

if [ "$choice" = "1" ]; then
    echo ""
    echo -e "${YELLOW}您选择了：阿里云OSS${NC}"
    echo ""
    echo "📋 请完成以下步骤："
    echo "  1. 登录阿里云OSS: https://oss.console.aliyun.com/"
    echo "  2. 进入Bucket: your-new-maollar-oss"
    echo "  3. 创建目录: app"
    echo "  4. 上传您的APK文件"
    echo "  5. 重命名为: maollar-app.apk"
    echo "  6. 获取文件URL"
    echo ""
    read -p "请输入APK的完整OSS URL: " apk_url
    
    # 修改index.html
    sed -i.bak "s|href=\"./maollar-app.apk\"|href=\"${apk_url}\"|g" index.html
    echo -e "${GREEN}✅ 已更新下载链接${NC}"
    
elif [ "$choice" = "2" ]; then
    echo ""
    echo -e "${YELLOW}您选择了：Cloudflare Pages${NC}"
    echo ""
    echo "⚠️ 请确认APK文件大小 < 25MB"
    read -p "请输入APK文件路径: " apk_path
    
    if [ -f "$apk_path" ]; then
        cp "$apk_path" ./maollar-app.apk
        echo -e "${GREEN}✅ APK文件已复制${NC}"
    else
        echo -e "${RED}❌ 文件不存在: $apk_path${NC}"
        exit 1
    fi
else
    echo -e "${RED}❌ 无效选项${NC}"
    exit 1
fi

# ============================================================
# Step 2：优化二维码
# ============================================================
echo ""
echo -e "${YELLOW}Step 2: 配置二维码${NC}"
echo "------------------------------------------------------------"

# 使用在线API生成二维码
sed -i.bak 's|<img src="./qrcode.png"|<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200\&data=https://download.maollar.com"|g' index.html

# 删除fallback提示
sed -i.bak '/<p style="color: #999/,/p>/d' index.html

echo -e "${GREEN}✅ 二维码已配置为在线生成${NC}"

# ============================================================
# Step 3：初始化Git
# ============================================================
echo ""
echo -e "${YELLOW}Step 3: 初始化Git仓库${NC}"
echo "------------------------------------------------------------"

git init
git add .
git commit -m "feat: 初始化Maollar下载页面"

echo -e "${GREEN}✅ Git仓库已初始化${NC}"

# ============================================================
# Step 4：推送到GitHub
# ============================================================
echo ""
echo -e "${YELLOW}Step 4: 推送到GitHub${NC}"
echo "------------------------------------------------------------"

echo ""
echo "请在GitHub上创建仓库："
echo "  1. 访问 https://github.com/new"
echo "  2. 仓库名：maollar-download"
echo "  3. Public"
echo "  4. 不要勾选初始化选项"
echo "  5. Create repository"
echo ""
read -p "创建完成后，请输入仓库URL（如 https://github.com/username/maollar-download.git）: " repo_url

git remote add origin $repo_url
git branch -M main
git push -u origin main

echo -e "${GREEN}✅ 代码已推送到GitHub${NC}"

# ============================================================
# 完成
# ============================================================
echo ""
echo "============================================================"
echo -e "${GREEN}🎉 准备完成！${NC}"
echo "============================================================"
echo ""
echo "📋 下一步："
echo "  1. 登录 Cloudflare Dashboard"
echo "  2. Pages → Create a project"
echo "  3. 连接刚创建的GitHub仓库"
echo "  4. Framework: None, Build command: (留空), Output: /"
echo "  5. Deploy"
echo "  6. 配置自定义域名：download.maollar.com"
echo ""
echo "预计5分钟后可访问：https://download.maollar.com"
echo "============================================================"


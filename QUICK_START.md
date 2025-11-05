# ⚡ 快速开始 - 5步完成部署

## 🎯 目标
将APK下载页面部署到 `https://download.maollar.com`

---

## ✅ Step 1：上传APK到OSS（3分钟）

```
1. 访问 https://oss.console.aliyun.com/
2. Bucket: your-new-maollar-oss
3. 新建目录：app
4. 上传APK文件
5. 设置为"公共读"
6. 复制URL：
   https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk
```

---

## ✅ Step 2：修改下载链接（1分钟）

```bash
cd /Users/adam/0.9/maollar-download-page

# 修改index.html第55行的href为您的APK URL
# 或使用sed命令：
sed -i.bak 's|href="./maollar-app.apk"|href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk"|g' index.html

# 优化二维码为在线生成
sed -i.bak 's|src="./qrcode.png"|src="https://api.qrserver.com/v1/create-qr-code/?size=200x200\&data=https://download.maollar.com"|g' index.html
```

---

## ✅ Step 3：推送到GitHub（2分钟）

**创建GitHub仓库**：
```
https://github.com/new
仓库名：maollar-download
Public
```

**推送代码**：
```bash
cd /Users/adam/0.9/maollar-download-page

git init
git add .
git commit -m "feat: Maollar下载页面"

# 替换为您的仓库URL
git remote add origin https://github.com/YOUR_USERNAME/maollar-download.git

git branch -M main
git push -u origin main
```

---

## ✅ Step 4：部署到Cloudflare（3分钟）

**Cloudflare Dashboard**：
```
1. https://dash.cloudflare.com
2. Pages → Create a project
3. Connect to Git → 选择 maollar-download
4. 构建配置：
   - Framework: None
   - Build command: (留空)
   - Output directory: /
5. Save and Deploy
```

**等待部署**（1-2分钟）

---

## ✅ Step 5：配置域名（2分钟）

**在Pages项目中**：
```
1. Settings → Custom domains
2. Set up a custom domain
3. 输入：download.maollar.com
4. Continue
```

**Cloudflare自动添加DNS记录**（或手动添加）：
```
Type: CNAME
Name: download
Target: maollar-download.pages.dev
Proxy: Enabled
```

**等待生效**（1-5分钟）

---

## 🎉 完成！

**访问**：https://download.maollar.com

**效果**：
```
✅ 精美的下载页面
✅ 一键下载APK
✅ 二维码扫码下载
✅ 自动适配iOS/Android
```

---

## 📋 检查清单

```
□ APK已上传到OSS
□ APK URL已配置
□ 代码已推送到GitHub
□ Cloudflare Pages已部署
□ 自定义域名已配置
□ 可以访问 https://download.maollar.com
□ 点击下载按钮可下载APK
```

---

## 🚀 悬浮按钮效果

**在H5移动端**（https://m.maollar.com）：
```
1. 用户访问首页
2. 右下角看到悬浮按钮（📱 或 ⬇️）
3. 点击 → 跳转到 https://download.maollar.com
4. 一键下载APK
```

**config.js已修改**：
```javascript
downloadLink: "https://download.maollar.com" ✅
```

**Cloudflare自动部署**：
- 约2-5分钟生效
- 无需手动操作

---

*预计总时间：10-15分钟*
*难度：⭐⭐（简单）*


# 📱 Maollar APP 下载页面

## 📋 项目说明

这是Maollar喵乐商城的APP下载页面，用于提供APK文件下载。

**访问地址**：https://download.maollar.com

---

## 📂 文件结构

```
maollar-download-page/
├── index.html          - 主页面
├── maollar-app.apk     - Android APK文件（您需要上传）
├── qrcode.png          - 下载二维码（可选）
└── README.md           - 本文件
```

---

## 🚀 部署到Cloudflare Pages

### Step 1：准备APK文件

**将您的APK文件重命名为**：
```
maollar-app.apk
```

**放置位置**：
```
/Users/adam/0.9/maollar-download-page/maollar-app.apk
```

---

### Step 2：创建Git仓库

```bash
cd /Users/adam/0.9/maollar-download-page

# 初始化Git
git init

# 添加文件
git add index.html README.md

# ⚠️ 注意：APK文件可能很大，建议使用Git LFS或直接上传到Cloudflare
# 如果APK < 25MB，可以直接添加：
git add maollar-app.apk

# 提交
git commit -m "feat: 初始化Maollar下载页面"
```

---

### Step 3：推送到GitHub

**创建新仓库**：
1. 访问 https://github.com/new
2. 仓库名：`maollar-download`
3. 选择 Public
4. 不要勾选任何初始化选项
5. 创建

**推送代码**：
```bash
# 添加远程仓库
git remote add origin https://github.com/YOUR_USERNAME/maollar-download.git

# 推送
git branch -M main
git push -u origin main
```

---

### Step 4：在Cloudflare Pages部署

**登录Cloudflare**：
1. 访问 https://dash.cloudflare.com
2. Pages → Create a project
3. Connect to Git → 选择 `maollar-download` 仓库
4. 配置构建设置：
   ```
   Framework preset: None
   Build command: (留空)
   Build output directory: /
   ```
5. 点击 Save and Deploy

---

### Step 5：配置自定义域名

**在Cloudflare Pages项目中**：
1. Settings → Custom domains
2. 点击 Set up a custom domain
3. 输入：`download.maollar.com`
4. 按照提示添加DNS记录（CNAME）

**DNS配置**：
```
Type: CNAME
Name: download
Target: YOUR-PROJECT.pages.dev
Proxy: Enabled (橙色云朵)
```

---

## 📱 如果APK文件太大

### 方案A：使用Cloudflare R2（推荐）

**R2是Cloudflare的对象存储**：
```
1. Cloudflare → R2 → Create bucket
2. 上传APK到bucket
3. 获取公开URL
4. 修改index.html中的下载链接
```

**修改index.html**：
```html
<a href="https://YOUR-BUCKET.r2.dev/maollar-app.apk" class="download-btn" download>
```

---

### 方案B：使用阿里云OSS（当前方案）

**上传APK到您的OSS**：
```
Bucket: your-new-maollar-oss
路径: /app/maollar-app.apk
```

**修改index.html**：
```html
<a href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk" class="download-btn" download>
```

---

## 🔗 生成下载二维码

### 在线生成
```
1. 访问 https://www.qr-code-generator.com/
2. 输入URL: https://download.maollar.com
3. 下载二维码图片
4. 重命名为 qrcode.png
5. 放到项目根目录
```

### 使用API生成
```html
<!-- 在index.html中使用在线二维码API -->
<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://download.maollar.com" alt="下载二维码">
```

---

## ✅ 完成后

**访问**：https://download.maollar.com

**效果**：
```
✅ 精美的下载页面
✅ 一键下载APK
✅ 自动检测iOS用户
✅ 二维码扫码下载
✅ 特色功能展示
```

---

## 📞 如需帮助

**APK上传问题**：
- 使用阿里云OSS（已有）
- 或Cloudflare R2（新方案）

**域名配置问题**：
- 在Cloudflare DNS添加CNAME记录

**部署问题**：
- 查看Cloudflare Pages部署日志
- 检查文件路径是否正确


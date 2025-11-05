# 🚀 Maollar下载页面部署指南

## 📋 快速部署（10分钟）

### Step 1：准备APK文件

**方案A：使用阿里云OSS（推荐，您已有）** ⭐⭐⭐⭐⭐

```bash
# 1. 上传您的APK到OSS
# 登录阿里云OSS控制台
# Bucket: your-new-maollar-oss
# 路径: /app/maollar-app.apk

# 2. 修改index.html中的下载链接（第55行）
# 从：
<a href="./maollar-app.apk" class="download-btn" download>

# 改为：
<a href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk" class="download-btn" download>
```

**方案B：直接上传到Cloudflare Pages**

```bash
# 如果APK < 25MB，可以直接提交到Git
cp YOUR_APK_PATH /Users/adam/0.9/maollar-download-page/maollar-app.apk
```

---

### Step 2：创建GitHub仓库

**在GitHub上创建**：
```
1. 访问 https://github.com/new
2. 仓库名：maollar-download
3. 选择：Public
4. 不要勾选任何初始化选项
5. Create repository
```

**推送代码**：
```bash
cd /Users/adam/0.9/maollar-download-page

# 初始化Git
git init

# 添加文件
git add index.html README.md

# 如果APK不大，也可以添加（可选）
# git add maollar-app.apk

# 提交
git commit -m "feat: 初始化Maollar下载页面"

# 添加远程仓库（替换YOUR_USERNAME）
git remote add origin https://github.com/YOUR_USERNAME/maollar-download.git

# 推送
git branch -M main
git push -u origin main
```

---

### Step 3：部署到Cloudflare Pages

**登录Cloudflare**：
```
https://dash.cloudflare.com
```

**创建Pages项目**：
```
1. Pages → Create a project
2. Connect to Git
3. 选择仓库：maollar-download
4. 配置构建：
   - Framework preset: None
   - Build command: (留空)
   - Build output directory: /
5. Save and Deploy
```

**等待部署**（约1-2分钟）：
```
✅ 部署完成后会得到一个URL：
   https://maollar-download.pages.dev
```

---

### Step 4：配置自定义域名

**在Cloudflare Pages项目中**：
```
1. Settings → Custom domains
2. Set up a custom domain
3. 输入：download.maollar.com
4. Continue
```

**添加DNS记录**：
```
Cloudflare会自动提示您添加DNS记录
或手动添加：

Type: CNAME
Name: download
Target: maollar-download.pages.dev
Proxy: Enabled (橙色云朵)
TTL: Auto
```

**等待生效**（约1-5分钟）：
```
✅ 访问 https://download.maollar.com
```

---

## 📱 APK上传详细步骤

### 使用阿里云OSS（推荐）

**Step 1：登录OSS控制台**
```
https://oss.console.aliyun.com/
```

**Step 2：进入Bucket**
```
选择：your-new-maollar-oss
区域：香港
```

**Step 3：创建app目录并上传**
```
1. 点击"文件管理"
2. 点击"新建目录" → 输入：app
3. 进入app目录
4. 点击"上传文件"
5. 选择您的APK文件
6. 上传完成
```

**Step 4：获取文件URL**
```
点击上传的APK → 查看详情
复制"URL"：
https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk
```

**Step 5：修改index.html**
```bash
cd /Users/adam/0.9/maollar-download-page

# 修改第55行的href
vim index.html

# 改为：
<a href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk" class="download-btn" download>
```

**Step 6：提交并推送**
```bash
git add index.html
git commit -m "feat: 使用OSS托管APK文件"
git push
```

---

## 🎨 页面定制

### 修改版本号

**文件**：`index.html` 第52行
```html
<div class="version">Version 1.0.0</div>
```

改为您的实际版本号。

---

### 添加更新日志

**在index.html中添加**（在footer前）：
```html
<div class="info">
    <strong>📋 更新日志：</strong><br>
    <strong>v1.0.0</strong> (2025-11-05)<br>
    · 首次发布<br>
    · 支持8种语言<br>
    · 喵币系统上线<br>
    · 支付宝、Stripe支付<br>
</div>
```

---

### 生成二维码

**方式1：在线生成**
```
1. 访问 https://www.qr-code-generator.com/
2. URL: https://download.maollar.com
3. 下载PNG
4. 重命名为 qrcode.png
5. 上传到项目
```

**方式2：使用在线API（无需文件）**

修改index.html第67行：
```html
<!-- 从 -->
<img src="./qrcode.png" alt="下载二维码" onerror="this.style.display='none'">

<!-- 改为 -->
<img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://download.maollar.com" alt="下载二维码">
```

然后删除第68-71行的fallback提示。

---

## 🧪 测试

### 本地测试
```bash
cd /Users/adam/0.9/maollar-download-page
python3 -m http.server 8080
```

访问：http://localhost:8080

---

### 线上测试

**部署后访问**：
```
https://download.maollar.com
```

**验证**：
- ✅ 页面正常显示
- ✅ 下载按钮可点击
- ✅ APK文件可下载
- ✅ iOS用户看到提示

---

## 📊 完成后效果

### 用户体验流程

**在H5版本**：
```
1. 用户访问 https://m.maollar.com
2. 右下角看到悬浮按钮
3. 点击 → 跳转到 https://download.maollar.com
4. 点击"下载APK"按钮
5. 下载并安装APP
```

**在下载页面**：
```
✅ 精美的下载界面
✅ 品牌Logo和介绍
✅ 一键下载按钮
✅ 二维码扫码下载
✅ 特色功能展示
✅ iOS用户自动提示
```

---

## 🔄 后续更新

**当有新版本APK时**：
```
1. 上传新APK到OSS（覆盖旧文件）
2. 修改index.html的版本号
3. 添加更新日志
4. Git commit & push
5. Cloudflare自动部署
```

---

*创建时间：2025-11-05*
*预计部署时间：10分钟*


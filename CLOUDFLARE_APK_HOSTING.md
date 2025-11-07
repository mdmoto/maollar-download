# 📱 使用Cloudflare Pages托管APK（推荐方案）

## ⚠️ 问题说明

**阿里云OSS限制**：
```
❌ APK文件不能直接通过OSS endpoint分发
错误：ApkDownloadForbidden
解决：必须使用CNAME或改用其他方案
```

---

## ✅ 解决方案：Cloudflare Pages托管APK

### 优势
```
✅ 无需配置OSS CNAME
✅ Cloudflare全球CDN（比OSS更快）
✅ 无文件大小限制（Pages支持25MB+）
✅ 完全免费
✅ HTTPS自动启用
✅ 部署简单
```

---

## 🚀 快速操作步骤

### Step 1：复制APK到项目（1分钟）

**找到您的APK文件，然后执行**：
```bash
# 替换为您的APK实际路径
cp /Users/adam/Desktop/YOUR_APK_FILE.apk \
   /Users/adam/0.9/maollar-download-page/maollar-app.apk

# 检查文件大小
ls -lh /Users/adam/0.9/maollar-download-page/maollar-app.apk
```

---

### Step 2：修改下载链接（1分钟）

**不需要手动修改**，我已经为您准备好脚本：

```bash
cd /Users/adam/0.9/maollar-download-page

# 修改index.html中的APK链接
sed -i.bak 's|href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk"|href="./maollar-app.apk"|g' index.html

echo "✅ 下载链接已修改为本地文件"
```

---

### Step 3：提交并推送（1分钟）

```bash
cd /Users/adam/0.9/maollar-download-page

git add maollar-app.apk index.html
git commit -m "feat: 添加APK文件，改用Cloudflare托管"
git push

echo "✅ 已推送到GitHub"
```

---

### Step 4：在Cloudflare Pages部署（3分钟）

**如果已创建项目**：
- ✅ Cloudflare自动检测到push
- ✅ 自动重新部署
- ⏰ 约2-3分钟完成

**如果还未创建**：
```
1. 访问 https://dash.cloudflare.com/pages
2. Create a project
3. Connect to Git → mdmoto/maollar-download
4. Framework: None
5. Build command: (留空)
6. Output directory: /
7. Save and Deploy
8. 配置域名：download.maollar.com
```

---

## 📊 APK文件大小限制

### Cloudflare Pages支持
```
✅ 单文件：25MB
✅ 总项目：25MB
```

**如果APK > 25MB**：
- 方案1：压缩APK（使用ProGuard等）
- 方案2：使用Cloudflare R2（无限制）
- 方案3：配置OSS CNAME域名

---

## 🎯 推荐流程

### 如果APK < 25MB（推荐）
```
✅ 直接上传到Cloudflare Pages
✅ 全球CDN加速
✅ 下载速度快
✅ 部署简单
```

### 如果APK > 25MB
```
→ 使用Cloudflare R2
→ 或配置OSS CNAME
```

---

## 📝 告诉我

**请回答**：
1. 您的APK文件路径？
2. APK文件大小（MB）？

**我会立即帮您完成！** 😊


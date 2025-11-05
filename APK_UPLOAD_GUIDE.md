# 📱 APK上传指南

## 🎯 推荐方案：使用阿里云OSS

### 优势
```
✅ 您已有OSS账号
✅ 香港节点，速度快
✅ 无文件大小限制
✅ 稳定可靠
✅ 无需修改Cloudflare配置
```

---

## 📤 快速上传步骤（5分钟）

### Step 1：登录OSS控制台
```
https://oss.console.aliyun.com/
```

### Step 2：选择Bucket
```
Bucket名称：your-new-maollar-oss
区域：香港
```

### Step 3：创建app目录

**在文件管理中**：
```
1. 点击"新建目录"
2. 输入目录名：app
3. 确定
```

### Step 4：上传APK

**进入app目录**：
```
1. 点击进入"app"目录
2. 点击"上传文件"
3. 选择您的APK文件
4. 文件名保持或改为：maollar-app.apk
5. 上传
```

**等待上传**：
- 如果APK是30MB，约需要10-30秒
- 香港节点速度很快

### Step 5：获取APK URL

**点击上传的文件**：
```
1. 在文件列表中找到 maollar-app.apk
2. 点击文件名
3. 在"详情"中找到"URL"
4. 复制完整URL
```

**URL格式**：
```
https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk
```

### Step 6：设置为公开读

**确保文件可以公开下载**：
```
1. 选中文件
2. 点击"设置读写权限"
3. 选择"公共读"
4. 确定
```

---

## 🔧 修改下载页面

### 更新index.html

```bash
cd /Users/adam/0.9/maollar-download-page
vim index.html
```

**找到第55行**：
```html
<a href="./maollar-app.apk" class="download-btn" download>
```

**修改为**（使用您刚才复制的URL）：
```html
<a href="https://your-new-maollar-oss.oss-cn-hongkong.aliyuncs.com/app/maollar-app.apk" class="download-btn" download>
```

**保存并推送**：
```bash
git add index.html
git commit -m "feat: 配置APK下载链接（OSS）"
git push
```

---

## 🌐 部署到Cloudflare Pages

### 如果还没部署

**参考完整指南**：
```
查看 DEPLOYMENT_GUIDE.md
```

**快速步骤**：
```
1. GitHub创建仓库：maollar-download
2. 推送代码（已完成）
3. Cloudflare Pages → Create project
4. 连接GitHub仓库
5. Framework: None
6. Deploy
7. 配置域名：download.maollar.com
```

---

## ✅ 验证

### 测试下载

**访问**：
```
https://download.maollar.com
```

**验证**：
```
□ 页面正常显示
□ Logo加载正常
□ 点击下载按钮
□ APK开始下载
□ 文件大小正确
□ 可以安装
```

---

## 📊 常见问题

### Q1: APK下载很慢
**A**: 
- 检查OSS区域（香港最快）
- 或使用CDN加速
- 或启用阿里云CDN

### Q2: 下载后无法安装
**A**:
- 检查APK是否签名
- 检查Android版本兼容性
- 允许"安装未知来源应用"

### Q3: iOS用户想下载
**A**:
- 目前只有Android版本
- iOS需要上架App Store
- 或使用TestFlight分发

---

## 🎯 总结

**推荐流程**：
```
1️⃣ 上传APK到阿里云OSS（5分钟）
2️⃣ 获取APK的URL
3️⃣ 修改index.html中的链接
4️⃣ 推送到GitHub
5️⃣ Cloudflare自动部署（2分钟）
6️⃣ 访问 https://download.maollar.com
```

**总时间**：约10分钟

---

*更新时间：2025-11-05*
*推荐方案：阿里云OSS*


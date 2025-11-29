# Cloudflare Pages 部署指南

## 前置准备

1. **确保代码已推送到 GitHub**
   ```bash
   git add .
   git commit -m "Prepare for Cloudflare Pages deployment"
   git push origin main
   ```

2. **登录 Cloudflare Dashboard**
   访问: https://dash.cloudflare.com/

## 部署步骤

### 1. 创建 Pages 项目

1. 在 Cloudflare Dashboard 中，点击左侧菜单的 **Workers & Pages**
2. 点击 **Create application** 按钮
3. 选择 **Pages** 标签
4. 点击 **Connect to Git**

### 2. 连接 GitHub 仓库

1. 选择您的 GitHub 账号并授权 Cloudflare
2. 选择 `n8nstore` 仓库
3. 点击 **Begin setup**

### 3. 配置构建设置

在构建配置页面，填写以下信息：

- **Project name**: `n8n-workflow-store` (或您喜欢的名称)
- **Production branch**: `main`
- **Framework preset**: `Next.js`
- **Build command**: `npx @cloudflare/next-on-pages`
- **Build output directory**: `.vercel/output/static`
- **Root directory**: `/` (保持默认)

### 4. 设置环境变量

点击 **Environment variables** 部分，添加以下变量：

| Variable name | Value |
|--------------|-------|
| `NEXT_PUBLIC_SUPABASE_URL` | 您的 Supabase URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | 您的 Supabase Anon Key |
| `SUPABASE_SERVICE_ROLE_KEY` | 您的 Supabase Service Role Key |
| `NEXT_PUBLIC_SHOW_ADS` | `true` 或 `false` |
| `NODE_VERSION` | `20` |

> **重要**: 从您的 `.env.local` 文件中复制这些值

### 5. 开始部署

1. 点击 **Save and Deploy** 按钮
2. Cloudflare 将开始构建和部署您的应用
3. 首次部署通常需要 3-5 分钟

### 6. 访问您的网站

部署完成后，您将获得一个 Cloudflare Pages URL，格式如下：
```
https://n8n-workflow-store.pages.dev
```

## 后续部署

配置完成后，每次您推送代码到 GitHub 的 `main` 分支，Cloudflare Pages 都会自动重新部署。

## 自定义域名（可选）

1. 在 Pages 项目页面，点击 **Custom domains**
2. 点击 **Set up a custom domain**
3. 输入您的域名并按照指示配置 DNS

## 故障排查

如果部署失败，请检查：

1. **构建日志**: 在 Cloudflare Dashboard 中查看详细的构建日志
2. **环境变量**: 确保所有必需的环境变量都已正确设置
3. **Node 版本**: 确保设置了 `NODE_VERSION=20`

## 注意事项

- Cloudflare Pages 有免费配额限制
- 静态资源会自动通过 Cloudflare CDN 分发
- 支持自动 HTTPS

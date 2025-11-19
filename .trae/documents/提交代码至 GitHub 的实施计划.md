## 前提与安全
- 不提交敏感信息：确保 `.env*`（如 `.env.local`）和任何密钥不入库
- 忽略构建与依赖：忽略 `.next/`、`node_modules/`、日志与缓存
- 保留文档：保留 `.trae/documents` 内的产品与技术文档随代码一同提交

## 需新增/确认的文件
- 添加 `.gitignore`（Next.js/Node 标准忽略），内容包含：
  - `.next/`, `node_modules/`, `.env*`, `*.log`, `.DS_Store`, `.vercel`, `coverage/`
- 可选：添加 `.nvmrc` 指定 Node 版本（仅在您需要固定版本时）
- 不新增 README（除非您要求）

## Git 初始化与首个提交
- 在项目根目录执行：
  - `git init`
  - `git config user.name <YourName>` / `git config user.email <YourEmail>`（若未配置）
  - `git add .`
  - `git commit -m "chore: initialize n8n workflow store (Next.js, i18n, Tailwind)"`

## 创建 GitHub 仓库（两种方案）
- 方案 A：使用 GitHub CLI `gh`（推荐，快捷）
  - `gh repo create <owner>/<repo> --private --source . --remote origin --push`
- 方案 B：Web 上创建后手动绑定
  - 在 GitHub Web 创建仓库（建议 Private，初始化不创建 README）
  - 本地执行：
    - `git remote add origin https://github.com/<owner>/<repo>.git`
    - `git branch -M main`
    - `git push -u origin main`

## 推送后验证
- 在 GitHub 仓库页面确认：代码、提交历史、目录结构（`app/`, `components/`, `messages/`, 配置文件）可见
- 可选：开启分支保护（如 main 禁止直接推送）

## Cloudflare Pages 集成（后续）
- 在 Cloudflare Pages 连接该 GitHub 仓库，框架选择 `Next.js`
- 构建命令：`npm run build`；输出由 Pages 自动识别
- 在 Cloudflare Pages 的 Environment Variables 配置：
  - `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`（仅前端使用）
- 如需服务端安全逻辑，后续可用 Pages Functions 或 Supabase Edge Functions

## Supabase/Stripe（后续可选）
- Supabase Auth（Google 登录）与 RLS：按文档接入后新增环境变量
- Stripe 支付：通过 Webhook 校验并写入订单表（不在本次提交内）

## 您需要确认/提供
- 仓库信息：`<owner>/<repo>` 与隐私设置（建议 Private）
- 是否需要添加 `.nvmrc` 和分支保护策略
- 是否需要将文档移动到 `docs/` 或保留当前位置

## 执行输出
- 完成后提供：仓库URL、首个提交SHA、推送分支（`main`），并截图/日志验证

确认后我将按照此计划创建 `.gitignore`、初始化 Git、创建/关联 GitHub 仓库并完成首次推送。
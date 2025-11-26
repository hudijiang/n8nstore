# Supabase 数据库配置指南

## 1. 创建 Supabase 项目

如果您还没有 Supabase 项目，请按以下步骤创建：

1. 访问 [Supabase Dashboard](https://app.supabase.com)
2. 点击 "New Project"
3. 填写项目信息：
   - Name: `n8n-workflow-store`
   - Database Password: 设置一个强密码（请保存好）
   - Region: 选择离您最近的区域
4. 点击 "Create new project"
5. 等待项目创建完成（约 2 分钟）

## 2. 获取 Supabase 凭据

项目创建完成后，获取 API 凭据：

1. 在 Supabase Dashboard 中，进入您的项目
2. 点击左侧菜单的 **Settings** (齿轮图标)
3. 选择 **API** 选项卡
4. 您会看到以下信息：

### Project URL
```
https://xxxxxxxxxxxxx.supabase.co
```
复制这个 URL

### API Keys

**anon public key** (公开密钥)
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```
这个密钥可以在客户端使用

**service_role secret** (服务密钥)
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```
⚠️ 这个密钥具有完全访问权限，仅在服务端使用

## 3. 配置环境变量

在项目根目录创建 `.env.local` 文件：

```bash
# 在项目根目录执行
touch .env.local
```

然后编辑 `.env.local` 文件，添加以下内容：

```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**替换为您自己的值！**

## 4. 运行数据库迁移

### 方法 A：使用 Supabase CLI（推荐）

```bash
# 1. 安装 Supabase CLI（如果还没安装）
brew install supabase/tap/supabase

# 2. 登录 Supabase
supabase login

# 3. 链接到您的项目
supabase link --project-ref xxxxxxxxxxxxx

# 4. 运行迁移
supabase db push
```

### 方法 B：手动执行 SQL（简单方式）

1. 打开 Supabase Dashboard
2. 进入您的项目
3. 点击左侧菜单的 **SQL Editor**
4. 点击 **New query**
5. 复制 `supabase/migrations/20241126000000_workflow_system.sql` 的全部内容
6. 粘贴到 SQL 编辑器
7. 点击 **Run** 按钮执行

## 5. 导入工作流数据

配置完成后，运行导入脚本：

```bash
# 确保 .env.local 已配置
node scripts/import-to-database.js
```

您应该看到类似的输出：
```
🚀 Starting database import...
📦 Found 100 workflows to import

✅ Imported 10/100 workflows...
✅ Imported 20/100 workflows...
...
✨ Import complete!
📊 Imported: 100
⚠️  Skipped: 0
❌ Errors: 0

📈 Total workflows in database: 100
```

## 6. 验证数据

在 Supabase Dashboard 中验证数据：

1. 点击左侧菜单的 **Table Editor**
2. 选择 `workflows` 表
3. 您应该看到 100 条工作流记录
4. 检查其他表：
   - `workflow_translations` - 应该有 100+ 条翻译记录
   - `categories` - 应该有 10 个分类
   - `workflow_categories` - 工作流与分类的关联
   - `workflow_nodes` - 节点类型记录

## 7. 测试 API

启动开发服务器并测试 API：

```bash
npm run dev
```

在浏览器中访问：
- http://localhost:3001/api/workflows?locale=en
- http://localhost:3001/api/categories

您应该看到 JSON 格式的响应数据。

## 常见问题

### Q: 找不到 Supabase 项目 URL？
A: 在 Supabase Dashboard 中，Settings → API → Project URL

### Q: 导入脚本报错 "Missing Supabase credentials"？
A: 检查 `.env.local` 文件是否存在且配置正确

### Q: 数据库迁移失败？
A: 确保您有项目的管理员权限，或使用 SQL Editor 手动执行

### Q: API 返回空数据？
A: 检查数据是否已成功导入到数据库

## 下一步

配置完成后，您可以：
1. ✅ 更新首页以使用数据库数据
2. ✅ 实现搜索和筛选功能
3. ✅ 添加浏览量跟踪
4. ✅ 创建后台管理界面

## 需要帮助？

如果遇到问题，请提供：
- 错误信息
- 您执行的步骤
- Supabase 项目状态

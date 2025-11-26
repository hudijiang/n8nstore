-- 工作流数据库系统迁移
-- 创建时间: 2024-11-26
-- 描述: 创建工作流管理系统的所有表和索引

-- 启用 UUID 扩展
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- 1. 工作流主表
-- ============================================
CREATE TABLE workflows (
  id TEXT PRIMARY KEY,                    -- 工作流 ID (来自 n8n.io)
  title TEXT NOT NULL,                    -- 标题（英文原始标题）
  description TEXT,                       -- 描述（英文原始描述）
  author TEXT,                            -- 作者用户名
  thumbnail_url TEXT,                     -- 缩略图 URL
  json_url TEXT,                          -- JSON 文件 URL
  views INTEGER DEFAULT 0,                -- 浏览量
  price DECIMAL(10,2) DEFAULT 0,          -- 价格
  created_at TIMESTAMPTZ DEFAULT NOW(),   -- 创建时间
  updated_at TIMESTAMPTZ DEFAULT NOW(),   -- 更新时间
  published BOOLEAN DEFAULT true          -- 是否发布
);

-- 索引优化
CREATE INDEX idx_workflows_views ON workflows(views DESC);
CREATE INDEX idx_workflows_published ON workflows(published);
CREATE INDEX idx_workflows_created_at ON workflows(created_at DESC);

-- 添加注释
COMMENT ON TABLE workflows IS '工作流主表';
COMMENT ON COLUMN workflows.id IS '工作流唯一标识符';
COMMENT ON COLUMN workflows.views IS '浏览量计数';

-- ============================================
-- 2. 工作流翻译表（多语言支持）
-- ============================================
CREATE TABLE workflow_translations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  locale TEXT NOT NULL,                   -- 语言代码 (en, zh, ja, de, fr, es)
  title TEXT NOT NULL,                    -- 翻译后的标题
  description TEXT,                       -- 翻译后的描述
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(workflow_id, locale)
);

-- 索引优化
CREATE INDEX idx_workflow_translations_locale ON workflow_translations(locale);
CREATE INDEX idx_workflow_translations_workflow_id ON workflow_translations(workflow_id);

-- 全文搜索索引
CREATE INDEX idx_workflow_translations_search 
  ON workflow_translations 
  USING gin(to_tsvector('simple', title || ' ' || COALESCE(description, '')));

COMMENT ON TABLE workflow_translations IS '工作流多语言翻译表';
COMMENT ON COLUMN workflow_translations.locale IS '语言代码: en, zh, ja, de, fr, es';

-- ============================================
-- 3. 分类表
-- ============================================
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,              -- 分类名称 (英文)
  slug TEXT NOT NULL UNIQUE,              -- URL 友好的标识
  icon TEXT,                              -- 图标 (emoji 或图标类名)
  description TEXT,                       -- 分类描述
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 插入预设分类
INSERT INTO categories (name, slug, icon, description) VALUES
  ('AI & Machine Learning', 'ai', '🤖', 'Workflows powered by artificial intelligence and machine learning'),
  ('Automation', 'automation', '⚙️', 'Automate repetitive tasks and processes'),
  ('Integration', 'integration', '🔗', 'Connect different apps and services'),
  ('Finance', 'finance', '💰', 'Financial automation and accounting workflows'),
  ('Productivity', 'productivity', '📊', 'Boost your productivity and efficiency'),
  ('Marketing', 'marketing', '📢', 'Marketing automation and campaigns'),
  ('Engineering', 'engineering', '🔧', 'Development and engineering workflows'),
  ('Data Processing', 'data-processing', '📈', 'Process and analyze data'),
  ('Communication', 'communication', '💬', 'Communication and messaging workflows'),
  ('DevOps', 'devops', '🚀', 'DevOps and deployment automation');

COMMENT ON TABLE categories IS '工作流分类表';

-- ============================================
-- 4. 工作流-分类关联表
-- ============================================
CREATE TABLE workflow_categories (
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  PRIMARY KEY (workflow_id, category_id)
);

CREATE INDEX idx_workflow_categories_category ON workflow_categories(category_id);
CREATE INDEX idx_workflow_categories_workflow ON workflow_categories(workflow_id);

COMMENT ON TABLE workflow_categories IS '工作流与分类的多对多关联表';

-- ============================================
-- 5. 节点类型表
-- ============================================
CREATE TABLE workflow_nodes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  node_type TEXT NOT NULL,                -- 节点类型 (如 'gmail', 'slack')
  node_count INTEGER DEFAULT 1            -- 该节点在工作流中的数量
);

CREATE INDEX idx_workflow_nodes_workflow_id ON workflow_nodes(workflow_id);
CREATE INDEX idx_workflow_nodes_type ON workflow_nodes(node_type);

COMMENT ON TABLE workflow_nodes IS '工作流使用的节点类型';

-- ============================================
-- 6. 浏览记录表
-- ============================================
CREATE TABLE workflow_views (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  ip_address TEXT,                        -- 匿名用户的 IP
  user_agent TEXT,                        -- 用户代理
  viewed_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_workflow_views_workflow_id ON workflow_views(workflow_id);
CREATE INDEX idx_workflow_views_viewed_at ON workflow_views(viewed_at DESC);

COMMENT ON TABLE workflow_views IS '工作流浏览记录表';

-- ============================================
-- 7. Row Level Security (RLS) 策略
-- ============================================

-- workflows 表
ALTER TABLE workflows ENABLE ROW LEVEL SECURITY;

-- 所有人可以查看已发布的工作流
CREATE POLICY "Anyone can view published workflows"
  ON workflows FOR SELECT
  USING (published = true);

-- 管理员可以管理所有工作流
CREATE POLICY "Admins can manage workflows"
  ON workflows FOR ALL
  USING (
    auth.jwt() ->> 'role' = 'admin' OR
    auth.jwt() ->> 'email' IN (
      SELECT email FROM auth.users WHERE raw_user_meta_data->>'role' = 'admin'
    )
  );

-- workflow_translations 表
ALTER TABLE workflow_translations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view translations"
  ON workflow_translations FOR SELECT
  USING (true);

CREATE POLICY "Admins can manage translations"
  ON workflow_translations FOR ALL
  USING (
    auth.jwt() ->> 'role' = 'admin' OR
    auth.jwt() ->> 'email' IN (
      SELECT email FROM auth.users WHERE raw_user_meta_data->>'role' = 'admin'
    )
  );

-- categories 表
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view categories"
  ON categories FOR SELECT
  USING (true);

CREATE POLICY "Admins can manage categories"
  ON categories FOR ALL
  USING (
    auth.jwt() ->> 'role' = 'admin' OR
    auth.jwt() ->> 'email' IN (
      SELECT email FROM auth.users WHERE raw_user_meta_data->>'role' = 'admin'
    )
  );

-- workflow_categories 表
ALTER TABLE workflow_categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view workflow categories"
  ON workflow_categories FOR SELECT
  USING (true);

CREATE POLICY "Admins can manage workflow categories"
  ON workflow_categories FOR ALL
  USING (
    auth.jwt() ->> 'role' = 'admin' OR
    auth.jwt() ->> 'email' IN (
      SELECT email FROM auth.users WHERE raw_user_meta_data->>'role' = 'admin'
    )
  );

-- workflow_nodes 表
ALTER TABLE workflow_nodes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view workflow nodes"
  ON workflow_nodes FOR SELECT
  USING (true);

CREATE POLICY "Admins can manage workflow nodes"
  ON workflow_nodes FOR ALL
  USING (
    auth.jwt() ->> 'role' = 'admin' OR
    auth.jwt() ->> 'email' IN (
      SELECT email FROM auth.users WHERE raw_user_meta_data->>'role' = 'admin'
    )
  );

-- workflow_views 表
ALTER TABLE workflow_views ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can create view records"
  ON workflow_views FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Users can view their own records"
  ON workflow_views FOR SELECT
  USING (
    user_id = auth.uid() OR
    auth.jwt() ->> 'role' = 'admin'
  );

-- ============================================
-- 8. 触发器：自动更新 updated_at
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_workflows_updated_at
  BEFORE UPDATE ON workflows
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 9. 函数：增加浏览量
-- ============================================
CREATE OR REPLACE FUNCTION increment_workflow_views(workflow_id_param TEXT)
RETURNS void AS $$
BEGIN
  UPDATE workflows
  SET views = views + 1
  WHERE id = workflow_id_param;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- 10. 视图：工作流统计
-- ============================================
CREATE OR REPLACE VIEW workflow_stats AS
SELECT 
  w.id,
  w.title,
  w.views,
  COUNT(DISTINCT wc.category_id) as category_count,
  COUNT(DISTINCT wn.node_type) as node_type_count,
  COUNT(DISTINCT wt.locale) as translation_count
FROM workflows w
LEFT JOIN workflow_categories wc ON w.id = wc.workflow_id
LEFT JOIN workflow_nodes wn ON w.id = wn.workflow_id
LEFT JOIN workflow_translations wt ON w.id = wt.workflow_id
GROUP BY w.id, w.title, w.views;

COMMENT ON VIEW workflow_stats IS '工作流统计视图';

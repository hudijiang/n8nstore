-- 用户认证扩展
-- 创建时间: 2024-11-26
-- 描述: 添加用户配置、购买记录和收藏功能

-- ============================================
-- 1. 用户配置表
-- ============================================
CREATE TABLE IF NOT EXISTS user_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE,
  full_name TEXT,
  avatar_url TEXT,
  bio TEXT,
  website TEXT,
  location TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 索引
CREATE INDEX idx_user_profiles_username ON user_profiles(username);

-- 触发器：自动更新 updated_at
CREATE TRIGGER update_user_profiles_updated_at
  BEFORE UPDATE ON user_profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- RLS 策略
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

-- 用户可以查看所有配置
CREATE POLICY "Anyone can view user profiles"
  ON user_profiles FOR SELECT
  USING (true);

-- 用户只能更新自己的配置
CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  USING (auth.uid() = id);

-- 用户可以插入自己的配置
CREATE POLICY "Users can insert own profile"
  ON user_profiles FOR INSERT
  WITH CHECK (auth.uid() = id);

-- ============================================
-- 2. 用户购买记录表
-- ============================================
CREATE TABLE IF NOT EXISTS user_purchases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  amount DECIMAL(10,2) NOT NULL,
  currency TEXT DEFAULT 'USD',
  payment_status TEXT DEFAULT 'completed',
  purchased_at TIMESTAMPTZ DEFAULT NOW()
);

-- 索引
CREATE INDEX idx_user_purchases_user_id ON user_purchases(user_id);
CREATE INDEX idx_user_purchases_workflow_id ON user_purchases(workflow_id);
CREATE INDEX idx_user_purchases_purchased_at ON user_purchases(purchased_at DESC);

-- RLS 策略
ALTER TABLE user_purchases ENABLE ROW LEVEL SECURITY;

-- 用户只能查看自己的购买记录
CREATE POLICY "Users can view own purchases"
  ON user_purchases FOR SELECT
  USING (auth.uid() = user_id);

-- 只有系统可以插入购买记录（通过 service_role）
CREATE POLICY "Service role can insert purchases"
  ON user_purchases FOR INSERT
  WITH CHECK (auth.jwt() ->> 'role' = 'service_role');

-- ============================================
-- 3. 用户收藏表
-- ============================================
CREATE TABLE IF NOT EXISTS user_favorites (
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  workflow_id TEXT REFERENCES workflows(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, workflow_id)
);

-- 索引
CREATE INDEX idx_user_favorites_user_id ON user_favorites(user_id);
CREATE INDEX idx_user_favorites_workflow_id ON user_favorites(workflow_id);

-- RLS 策略
ALTER TABLE user_favorites ENABLE ROW LEVEL SECURITY;

-- 用户可以查看自己的收藏
CREATE POLICY "Users can view own favorites"
  ON user_favorites FOR SELECT
  USING (auth.uid() = user_id);

-- 用户可以添加收藏
CREATE POLICY "Users can insert own favorites"
  ON user_favorites FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- 用户可以删除自己的收藏
CREATE POLICY "Users can delete own favorites"
  ON user_favorites FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- 4. 函数：创建用户配置（触发器）
-- ============================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.user_profiles (id, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 触发器：新用户注册时自动创建配置
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- 5. 视图：用户统计
-- ============================================
CREATE OR REPLACE VIEW user_stats AS
SELECT 
  u.id,
  u.email,
  up.username,
  up.full_name,
  COUNT(DISTINCT pur.id) as total_purchases,
  COUNT(DISTINCT fav.workflow_id) as total_favorites,
  COALESCE(SUM(pur.amount), 0) as total_spent
FROM auth.users u
LEFT JOIN user_profiles up ON u.id = up.id
LEFT JOIN user_purchases pur ON u.id = pur.user_id
LEFT JOIN user_favorites fav ON u.id = fav.user_id
GROUP BY u.id, u.email, up.username, up.full_name;

COMMENT ON VIEW user_stats IS '用户统计信息视图';

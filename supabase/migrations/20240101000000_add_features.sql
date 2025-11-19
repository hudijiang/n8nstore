-- Add n8n_version to workflows
ALTER TABLE workflows ADD COLUMN IF NOT EXISTS n8n_version VARCHAR(50) DEFAULT '1.0+';

-- Reviews Table
CREATE TABLE IF NOT EXISTS reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workflow_id UUID REFERENCES workflows(id) NOT NULL,
  user_id UUID REFERENCES users(id) NOT NULL,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(workflow_id, user_id)
);

-- Enable RLS for reviews
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read reviews" ON reviews
  FOR SELECT USING (true);

CREATE POLICY "Authenticated users can create reviews" ON reviews
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Favorites Table
CREATE TABLE IF NOT EXISTS favorites (
  user_id UUID REFERENCES users(id) NOT NULL,
  workflow_id UUID REFERENCES workflows(id) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (user_id, workflow_id)
);

-- Enable RLS for favorites
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage their favorites" ON favorites
  FOR ALL USING (auth.uid() = user_id);

-- Workflow Versions Table
CREATE TABLE IF NOT EXISTS workflow_versions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workflow_id UUID REFERENCES workflows(id) NOT NULL,
  version_number VARCHAR(50) NOT NULL,
  workflow_json JSONB NOT NULL,
  changelog TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS for versions
ALTER TABLE workflow_versions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read versions" ON workflow_versions
  FOR SELECT USING (true);

-- Fix RLS policies to allow anonymous access
-- Run this in Supabase SQL Editor

-- Drop existing policies
DROP POLICY IF EXISTS "Admins can manage workflows" ON workflows;
DROP POLICY IF EXISTS "Admins can manage translations" ON workflow_translations;
DROP POLICY IF EXISTS "Admins can manage categories" ON categories;
DROP POLICY IF EXISTS "Admins can manage workflow categories" ON workflow_categories;
DROP POLICY IF EXISTS "Admins can manage workflow nodes" ON workflow_nodes;

-- Recreate simpler admin policies (without auth.users check)
CREATE POLICY "Admins can manage workflows"
  ON workflows FOR ALL
  USING (auth.jwt() ->> 'role' = 'service_role');

CREATE POLICY "Admins can manage translations"
  ON workflow_translations FOR ALL
  USING (auth.jwt() ->> 'role' = 'service_role');

CREATE POLICY "Admins can manage categories"
  ON categories FOR ALL
  USING (auth.jwt() ->> 'role' = 'service_role');

CREATE POLICY "Admins can manage workflow categories"
  ON workflow_categories FOR ALL
  USING (auth.jwt() ->> 'role' = 'service_role');

CREATE POLICY "Admins can manage workflow nodes"
  ON workflow_nodes FOR ALL
  USING (auth.jwt() ->> 'role' = 'service_role');

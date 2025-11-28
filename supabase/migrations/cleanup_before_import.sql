-- Clean existing workflow data to avoid duplicates
-- Run this before importing the full dataset

BEGIN;

-- Delete existing workflow-related data
DELETE FROM workflow_nodes;
DELETE FROM workflow_categories;
DELETE FROM workflow_translations;
DELETE FROM workflows;

-- Reset sequences if needed
-- ALTER SEQUENCE workflows_id_seq RESTART WITH 1;

COMMIT;

-- Verify cleanup
SELECT 
    (SELECT COUNT(*) FROM workflows) as workflows_count,
    (SELECT COUNT(*) FROM workflow_translations) as translations_count,
    (SELECT COUNT(*) FROM workflow_categories) as categories_count,
    (SELECT COUNT(*) FROM workflow_nodes) as nodes_count;

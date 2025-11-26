-- Auto-generated SQL for workflow import
-- Generated: 2025-11-26T04:09:31.733Z
-- Workflows: 100

BEGIN;

-- Workflow 1: AI Client Onboarding Agent: Auto Welcome Email Gen
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4448', 'AI Client Onboarding Agent: Auto Welcome Email Generator', 'This workflow, **AI Client Onboarding Agent: Auto Welcome Email Generator**, automates the onboarding process for new clients by generating and sending a personalized welcome email with a tailored onb', 'yaron-nofluff', '/workflows/images/4448.webp', '/workflows/json/4448.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4448', 'en', 'AI Client Onboarding Agent: Auto Welcome Email Generator', 'This workflow, **AI Client Onboarding Agent: Auto Welcome Email Generator**, automates the onboarding process for new clients by generating and sending a personalized welcome email with a tailored onb')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4448', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'start', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'errorTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', 'googleSheetsTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4448', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 2: AI Data Analyst Agent for Spreadsheets with NocoDB
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2653', 'AI Data Analyst Agent for Spreadsheets with NocoDB', 'This workflow, titled **"AI Data Analyst Agent for Spreadsheets with NocoDB,"** is designed to convert spreadsheet data into an AI-powered, interactive knowledge base. It enables users to ask natural ', 'derekcheungsa', '/workflows/images/2653.webp', '/workflows/json/2653.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2653', 'en', 'AI Data Analyst Agent for Spreadsheets with NocoDB', 'This workflow, titled **"AI Data Analyst Agent for Spreadsheets with NocoDB,"** is designed to convert spreadsheet data into an AI-powered, interactive knowledge base. It enables users to ask natural ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2653', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2653', 10)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2653', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2653', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', 'nocoDbTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2653', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 3: AI Email Support System: Gmail, Gemini, GPT-4, Sla
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('6288', 'AI Email Support System: Gmail, Gemini, GPT-4, Slack & Google Sheets Workflow', 'This workflow automates AI-powered customer support via email by integrating Gmail, Google Gemini and OpenAI GPT-4 language models, Slack, and Google Sheets. It is designed for email-based customer in', 'dae221', '/workflows/images/6288.webp', '/workflows/json/6288.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('6288', 'en', 'AI Email Support System: Gmail, Gemini, GPT-4, Slack & Google Sheets Workflow', 'This workflow automates AI-powered customer support via email by integrating Gmail, Google Gemini and OpenAI GPT-4 language models, Slack, and Google Sheets. It is designed for email-based customer in')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('6288', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', 'googleDriveTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6288', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 4: Audit student degree progress in Google Sheets usi
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8093', 'Audit student degree progress in Google Sheets using OpenAI', 'This workflow automates auditing senior students’ degree progress using data stored in Google Sheets and AI-powered analysis via OpenAI. It reads student academic records, compares completed courses a', 'rbreen', '/workflows/images/8093.webp', '/workflows/json/8093.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8093', 'en', 'Audit student degree progress in Google Sheets using OpenAI', 'This workflow automates auditing senior students’ degree progress using data stored in Google Sheets and AI-powered analysis via OpenAI. It reads student academic records, compares completed courses a')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8093', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8093', '@n8n/n8n-nodes-langchain.outputParserStructured', 1);

-- Workflow 5: Automate AI Image Generation & Telegram Delivery w
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4049', 'Automate AI Image Generation & Telegram Delivery with Google Drive and Sheets', 'This workflow automates AI-based image generation triggered by Telegram messages and delivers the generated images back to Telegram while logging metadata in Google Drive and Google Sheets. It is desi', 'dae221', '/workflows/images/4049.webp', '/workflows/json/4049.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4049', 'en', 'Automate AI Image Generation & Telegram Delivery with Google Drive and Sheets', 'This workflow automates AI-based image generation triggered by Telegram messages and delivers the generated images back to Telegram while logging metadata in Google Drive and Google Sheets. It is desi')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4049', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4049', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'convertToFile', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', 'telegramTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4049', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 6: Automate Research Paper Collection with Bright Dat
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5221', 'Automate Research Paper Collection with Bright Data & n8n', 'This workflow automates the collection of research papers from Google Scholar based on a user-defined topic, utilizing Bright Data’s proxy API to safely scrape web content, and then storing structured', 'yaron-nofluff', '/workflows/images/5221.webp', '/workflows/json/5221.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5221', 'en', 'Automate Research Paper Collection with Bright Data & n8n', 'This workflow automates the collection of research papers from Google Scholar based on a user-defined topic, utilizing Bright Data’s proxy API to safely scrape web content, and then storing structured')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5221', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'html', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5221', 'manualTrigger', 1);

-- Workflow 7: Automate Sales for Digital Products & SaaS with AI
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3342', 'Automate Sales for Digital Products & SaaS with AI (GPT-4o)', 'This workflow automates sales outreach for digital products and SaaS using AI-powered prospecting, email discovery, and personalized email generation. It targets businesses by searching Google Maps fo', 'b4dr', '/workflows/images/3342.webp', '/workflows/json/3342.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3342', 'en', 'Automate Sales for Digital Products & SaaS with AI (GPT-4o)', 'This workflow automates sales outreach for digital products and SaaS using AI-powered prospecting, email discovery, and personalized email generation. It targets businesses by searching Google Maps fo')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3342', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3342', 'httpRequest', 1);

-- Workflow 8: Automated Event Discovery with Bright Data & n8n
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5222', 'Automated Event Discovery with Bright Data & n8n', 'This workflow, titled **Automated Event Discovery with Bright Data & n8n**, is designed to automatically scrape upcoming technology-related events from Eventbrite, process the raw HTML data into struc', 'yaron-nofluff', '/workflows/images/5222.webp', '/workflows/json/5222.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5222', 'en', 'Automated Event Discovery with Bright Data & n8n', 'This workflow, titled **Automated Event Discovery with Bright Data & n8n**, is designed to automatically scrape upcoming technology-related events from Eventbrite, process the raw HTML data into struc')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5222', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'html', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5222', 'scheduleTrigger', 1);

-- Workflow 9: Automated Google Drive to Facebook Ads: One-Click 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4620', 'Automated Google Drive to Facebook Ads: One-Click Video Marketing Workflow', 'This workflow automates the process of video marketing by integrating Google Drive and Facebook Ads platforms. It is designed to fetch video files stored in Google Drive, download them, upload these v', 'yaron-nofluff', '/workflows/images/4620.webp', '/workflows/json/4620.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4620', 'en', 'Automated Google Drive to Facebook Ads: One-Click Video Marketing Workflow', 'This workflow automates the process of video marketing by integrating Google Drive and Facebook Ads platforms. It is designed to fetch video files stored in Google Drive, download them, upload these v')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4620', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4620', 'function', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4620', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4620', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4620', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4620', 'manualTrigger', 1);

-- Workflow 10: Automated Investor Intelligence: CrunchBase to Goo
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4731', 'Automated Investor Intelligence: CrunchBase to Google Sheets Data Harvester', 'This workflow, titled **Automated Investor Intelligence: CrunchBase to Google Sheets Data Harvester**, is designed to **automatically extract, process, and store investor data from Crunchbase into a G', 'yaron-nofluff', '/workflows/images/4731.webp', '/workflows/json/4731.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4731', 'en', 'Automated Investor Intelligence: CrunchBase to Google Sheets Data Harvester', 'This workflow, titled **Automated Investor Intelligence: CrunchBase to Google Sheets Data Harvester**, is designed to **automatically extract, process, and store investor data from Crunchbase into a G')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4731', 4)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4731', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4731', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4731', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4731', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4731', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4731', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4731', 'scheduleTrigger', 1);

-- Workflow 11: Build & Sell AI Automations and Agents
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3941', 'Build & Sell AI Automations and Agents', 'This workflow is designed as a comprehensive AI automation system that builds, processes, and sells AI-driven video content based on user input via Telegram. It incorporates ideation, script generatio', 'nickyai', '/workflows/images/3941.webp', '/workflows/json/3941.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3941', 'en', 'Build & Sell AI Automations and Agents', 'This workflow is designed as a comprehensive AI automation system that builds, processes, and sells AI-driven video content based on user input via Telegram. It incorporates ideation, script generatio')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3941', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3941', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'youTube', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3941', 'httpRequest', 1);

-- Workflow 12: Build an AI-Powered Tech Radar Advisor with SQL DB
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3151', 'Build an AI-Powered Tech Radar Advisor with SQL DB, RAG, and Routing Agents', 'This workflow, titled **"Build an AI-Powered Tech Radar Advisor with SQL DB, RAG, and Routing Agents"**, is designed to create an AI-driven platform that helps organizations analyze and interact with ', 'seanlon', '/workflows/images/3151.webp', '/workflows/json/3151.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3151', 'en', 'Build an AI-Powered Tech Radar Advisor with SQL DB, RAG, and Routing Agents', 'This workflow, titled **"Build an AI-Powered Tech Radar Advisor with SQL DB, RAG, and Routing Agents"**, is designed to create an AI-driven platform that helps organizations analyze and interact with ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3151', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3151', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3151', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'cron', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'mySql', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'mySqlTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'googleDocs', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3151', 'googleSheets', 1);

-- Workflow 13: Dynamically Run SuiteQL Queries in NetSuite via HT
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3002', 'Dynamically Run SuiteQL Queries in NetSuite via HTTP Webhook in n8n', 'This workflow enables dynamic execution of SuiteQL queries in NetSuite triggered via an HTTP webhook in n8n. It is designed for self-hosted n8n instances that support the NetSuite community node, leve', 'dataants', '/workflows/images/3002.webp', '/workflows/json/3002.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3002', 'en', 'Dynamically Run SuiteQL Queries in NetSuite via HTTP Webhook in n8n', 'This workflow enables dynamic execution of SuiteQL queries in NetSuite triggered via an HTTP webhook in n8n. It is designed for self-hosted n8n instances that support the NetSuite community node, leve')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3002', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3002', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3002', 'n8n-nodes-netsuite.netsuite', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3002', 'manualTrigger', 1);

-- Workflow 14: Extract Details from Receipts via Telegram with Te
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4361', 'Extract Details from Receipts via Telegram with Tesseract and Llama', 'This workflow automates the extraction of detailed expense information from receipts sent via Telegram messages, either as images or text. It leverages image processing (Tesseract OCR) and AI language', 'khmuhtadin', '/workflows/images/4361.webp', '/workflows/json/4361.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4361', 'en', 'Extract Details from Receipts via Telegram with Tesseract and Llama', 'This workflow automates the extraction of detailed expense information from receipts sent via Telegram messages, either as images or text. It leverages image processing (Tesseract OCR) and AI language')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4361', 4)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4361', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'telegramTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', 'n8n-nodes-tesseractjs.tesseractNode', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4361', '@n8n/n8n-nodes-langchain.lmChatOpenRouter', 1);

-- Workflow 15: Gmail Customer Support Auto-Responder with Ollama 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4760', 'Gmail Customer Support Auto-Responder with Ollama LLM and Pinecone RAG', 'This workflow automates customer support email responses by integrating Gmail with advanced AI capabilities. Upon receiving an email in Gmail, it classifies the content, enriches context via a retriev', 'aashitsharma', '/workflows/images/4760.webp', '/workflows/json/4760.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4760', 'en', 'Gmail Customer Support Auto-Responder with Ollama LLM and Pinecone RAG', 'This workflow automates customer support email responses by integrating Gmail with advanced AI capabilities. Upon receiving an email in Gmail, it classifies the content, enriches context via a retriev')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4760', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.lmOllama', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.lmChatOllama', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.textClassifier', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.embeddingsOllama', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4760', '@n8n/n8n-nodes-langchain.vectorStorePinecone', 1);

-- Workflow 16: Gmail MCP Server – Your All‑in‑One AI Email Toolki
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3605', 'Gmail MCP Server – Your All‑in‑One AI Email Toolkit', 'This workflow, **Gmail MCP Server – Your All‑in‑One AI Email Toolkit**, exposes the full Gmail API as a single Server-Sent Events (SSE) "tool server" endpoint designed for AI agents such as LangChain ', 'aspereo', '/workflows/images/3605.webp', '/workflows/json/3605.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3605', 'en', 'Gmail MCP Server – Your All‑in‑One AI Email Toolkit', 'This workflow, **Gmail MCP Server – Your All‑in‑One AI Email Toolkit**, exposes the full Gmail API as a single Server-Sent Events (SSE) "tool server" endpoint designed for AI agents such as LangChain ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3605', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3605', 'gmailTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3605', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3605', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 17: Smart Email Responder Workflow using AI
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4807', 'Smart Email Responder Workflow using AI', 'This workflow, titled **Smart Email Auto-Responder**, automates intelligent email replies based on the content and context of incoming Gmail messages. It is designed primarily for handling emails with', 'ankur', '/workflows/images/4807.webp', '/workflows/json/4807.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4807', 'en', 'Smart Email Responder Workflow using AI', 'This workflow, titled **Smart Email Auto-Responder**, automates intelligent email replies based on the content and context of incoming Gmail messages. It is designed primarily for handling emails with')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4807', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'emailSend', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'googleCalendar', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', '@n8n/n8n-nodes-langchain.textClassifier', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4807', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 18: Telegram AI Bot-to-Human Handoff for Sales Calls
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3350', 'Telegram AI Bot-to-Human Handoff for Sales Calls', 'This workflow implements a Telegram AI bot designed for sales call handling with a bot-to-human handoff mechanism using a human-in-the-loop approach. It manages user interactions through a finite-stat', 'jimleuk', '/workflows/images/3350.webp', '/workflows/json/3350.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3350', 'en', 'Telegram AI Bot-to-Human Handoff for Sales Calls', 'This workflow implements a Telegram AI bot designed for sales call handling with a bot-to-human handoff mechanism using a human-in-the-loop approach. It manages user interactions through a finite-stat')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3350', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'executeWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', 'telegramTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3350', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 19: Trello to Slack Notification Trigger: Task-Card Mo
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7616', 'Trello to Slack Notification Trigger: Task-Card Move Alerts', 'This workflow automates notifications in Slack when a Trello card (task) is moved from one list to another within a specified Trello board. It is designed for teams using Trello to manage tasks, enabl', 'rbreen', '/workflows/images/7616.webp', '/workflows/json/7616.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7616', 'en', 'Trello to Slack Notification Trigger: Task-Card Move Alerts', 'This workflow automates notifications in Slack when a Trello card (task) is moved from one list to another within a specified Trello board. It is designed for teams using Trello to manage tasks, enabl')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7616', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7616', 'trelloTrigger', 1);

-- Workflow 20: Validate Seatable Webhooks with HMAC SHA256 Authen
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3439', 'Validate Seatable Webhooks with HMAC SHA256 Authentication', 'This workflow is designed to **securely validate incoming Seatable webhook requests** by verifying their authenticity using HMAC SHA256 signature validation. It ensures that only legitimate requests f', 'vquie', '/workflows/images/3439.webp', '/workflows/json/3439.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3439', 'en', 'Validate Seatable Webhooks with HMAC SHA256 Authentication', 'This workflow is designed to **securely validate incoming Seatable webhook requests** by verifying their authenticity using HMAC SHA256 signature validation. It ensures that only legitimate requests f')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3439', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'crypto', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3439', 'respondToWebhook', 1);

-- Workflow 21: #️⃣Nostr #damus AI Powered Reporting + Gmail + Tel
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2946', '#️⃣Nostr #damus AI Powered Reporting + Gmail + Telegram', 'This workflow automates the collection, analysis, and reporting of Nostr social network threads tagged with the hashtag `#damus`. It leverages the n8n Community Node for Nostr to read relevant threads', 'joe', '/workflows/images/2946.webp', '/workflows/json/2946.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2946', 'en', '#️⃣Nostr #damus AI Powered Reporting + Gmail + Telegram', 'This workflow automates the collection, analysis, and reporting of Nostr social network threads tagged with the hashtag `#damus`. It leverages the n8n Community Node for Nostr to read relevant threads')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2946', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'markdown', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2946', 'n8n-nodes-nostrobots.nostrobotsread', 1);

-- Workflow 22: -Powered Knowledge Base with Google Docs, Discord 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4388', '-Powered Knowledge Base with Google Docs, Discord & GPT-4o-mini', 'This workflow implements a **Powered Knowledge Base integrating Google Docs, Discord, and GPT-4o-mini** to manage and leverage long-term memories and AI-assisted responses. It is designed for use case', 'cfomodz', '/workflows/images/4388.webp', '/workflows/json/4388.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4388', 'en', '-Powered Knowledge Base with Google Docs, Discord & GPT-4o-mini', 'This workflow implements a **Powered Knowledge Base integrating Google Docs, Discord, and GPT-4o-mini** to manage and leverage long-term memories and AI-assisted responses. It is designed for use case')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4388', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', 'googleDocs', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', 'discordTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', '@n8n/n8n-nodes-langchain.toolWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4388', 'executeWorkflowTrigger', 1);

-- Workflow 23: 10X E-commerce Sales AI Product Photography That M
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('6151', '10X E-commerce Sales AI Product Photography That Makes your product look Premium', 'This n8n workflow automates enhancing e-commerce product images by generating premium-quality, professional backgrounds using AI-powered services. The main target use case is online retailers or marke', 'arre', '/workflows/images/6151.webp', '/workflows/json/6151.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('6151', 'en', '10X E-commerce Sales AI Product Photography That Makes your product look Premium', 'This n8n workflow automates enhancing e-commerce product images by generating premium-quality, professional backgrounds using AI-powered services. The main target use case is online retailers or marke')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('6151', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6151', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6151', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6151', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6151', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6151', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 24: 2-way Sync Google Contacts and Notion
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2814', '2-way Sync Google Contacts and Notion', 'This workflow provides a **two-way synchronization** between Google Contacts and a Notion database, ensuring that contact information is consistently mirrored and updated on both platforms. It support', 'solomon', '/workflows/images/2814.webp', '/workflows/json/2814.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2814', 'en', '2-way Sync Google Contacts and Notion', 'This workflow provides a **two-way synchronization** between Google Contacts and a Notion database, ensuring that contact information is consistently mirrored and updated on both platforms. It support')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2814', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'notion', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2814', 'notionTrigger', 1);

-- Workflow 25: 3D Figurine Orthographic Views with Midjourney and
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3628', '3D Figurine Orthographic Views with Midjourney and GPT-4o-image API', 'This workflow automates the generation of orthographic views (front, side, back) of 3D figurines by leveraging AI image generation and processing APIs. It targets 3D designers, e-commerce operators, a', 'piapi', '/workflows/images/3628.webp', '/workflows/json/3628.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3628', 'en', '3D Figurine Orthographic Views with Midjourney and GPT-4o-image API', 'This workflow automates the generation of orthographic views (front, side, back) of 3D figurines by leveraging AI image generation and processing APIs. It targets 3D designers, e-commerce operators, a')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3628', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3628', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3628', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3628', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3628', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3628', 'manualTrigger', 1);

-- Workflow 26: 3D Product Video Generator from 2D Image for E-Com
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4987', '3D Product Video Generator from 2D Image for E-Commerce Stores', 'This workflow automates the generation of a 3D product video from a 2D product image submitted via a form, targeted at e-commerce store owners who want professional product videos to enhance their mar', 'infyom', '/workflows/images/4987.webp', '/workflows/json/4987.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4987', 'en', '3D Product Video Generator from 2D Image for E-Commerce Stores', 'This workflow automates the generation of a 3D product video from a 2D product image submitted via a form, targeted at e-commerce store owners who want professional product videos to enhance their mar')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4987', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4987', 'googleSheets', 1);

-- Workflow 27: 5 Ways to Process Images & PDFs with Gemini AI in 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3078', '5 Ways to Process Images & PDFs with Gemini AI in n8n', 'This workflow demonstrates **five distinct methods** to process and analyze images and PDF documents using Google Gemini AI within n8n. It targets users who want to explore different integration patte', 'jksr', '/workflows/images/3078.webp', '/workflows/json/3078.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3078', 'en', '5 Ways to Process Images & PDFs with Gemini AI in n8n', 'This workflow demonstrates **five distinct methods** to process and analyze images and PDF documents using Google Gemini AI within n8n. It targets users who want to explore different integration patte')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3078', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', 'extractFromFile', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3078', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 28: 7-Day Pinterest Content Planner with Notion Integr
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7792', '7-Day Pinterest Content Planner with Notion Integration and Email Delivery', 'This workflow, titled **"7-Day Pinterest Content Planner with Notion Integration and Email Delivery"**, automates the creation and distribution of a weekly Pinterest content plan. It targets content c', 'shecodesflo', '/workflows/images/7792.webp', '/workflows/json/7792.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7792', 'en', '7-Day Pinterest Content Planner with Notion Integration and Email Delivery', 'This workflow, titled **"7-Day Pinterest Content Planner with Notion Integration and Email Delivery"**, automates the creation and distribution of a weekly Pinterest content plan. It targets content c')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7792', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'cron', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'notion', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'function', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'emailSend', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'errorTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7792', 'manualTrigger', 1);

-- Workflow 29: :rocket: Automate LinkedIn Contact Enrichment with
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5776', ':rocket: Automate LinkedIn Contact Enrichment with Surfe, Google Sheets & HubSpot', 'This workflow automates the enrichment of LinkedIn contacts leveraging data stored in Google Sheets, Surfe’s enrichment API, and HubSpot CRM. It is designed to:', 'go-surfe', '/workflows/images/5776.webp', '/workflows/json/5776.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5776', 'en', ':rocket: Automate LinkedIn Contact Enrichment with Surfe, Google Sheets & HubSpot', 'This workflow automates the enrichment of LinkedIn contacts leveraging data stored in Google Sheets, Surfe’s enrichment API, and HubSpot CRM. It is designed to:')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5776', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'hubspot', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5776', 'googleDriveTrigger', 1);

-- Workflow 30: A Very Simple "Human in the Loop" Email Response S
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2907', 'A Very Simple "Human in the Loop" Email Response System Using AI and IMAP', 'This workflow automates the processing of incoming emails by summarizing their content, generating AI-based responses, and incorporating a human approval step before sending replies. It is designed fo', 'n3witalia', '/workflows/images/2907.webp', '/workflows/json/2907.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2907', 'en', 'A Very Simple "Human in the Loop" Email Response System Using AI and IMAP', 'This workflow automates the processing of incoming emails by summarizing their content, generating AI-based responses, and incorporating a human approval step before sending replies. It is designed fo')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2907', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'markdown', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'emailSend', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', 'emailReadImap', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2907', '@n8n/n8n-nodes-langchain.chainSummarization', 1);

-- Workflow 31: A-B Test AI Prompts with Supabase, Langchain Agent
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8790', 'A-B Test AI Prompts with Supabase, Langchain Agent & OpenAI GPT-4o', 'This workflow implements an A/B split testing mechanism for AI prompts using n8n integrations with Supabase, Langchain Agent, and OpenAI''s GPT-4o model. It is designed to allocate chat sessions random', 'vanhon', '/workflows/images/8790.webp', '/workflows/json/8790.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8790', 'en', 'A-B Test AI Prompts with Supabase, Langchain Agent & OpenAI GPT-4o', 'This workflow implements an A/B split testing mechanism for AI prompts using n8n integrations with Supabase, Langchain Agent, and OpenAI''s GPT-4o model. It is designed to allocate chat sessions random')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8790', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', 'supabase', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8790', '@n8n/n8n-nodes-langchain.memoryPostgresChat', 1);

-- Workflow 32: AAVE Portfolio Professional AI Agent | Telegram + 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4267', 'AAVE Portfolio Professional AI Agent | Telegram + Email + GPT-4o + Moralis', 'This workflow, titled **"AAVE Portfolio Professional AI Agent"**, is designed to automatically monitor multiple Ethereum wallet addresses for their Aave V3 decentralized finance (DeFi) portfolio healt', 'don-the-gem-dealer', '/workflows/images/4267.webp', '/workflows/json/4267.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4267', 'en', 'AAVE Portfolio Professional AI Agent | Telegram + Email + GPT-4o + Moralis', 'This workflow, titled **"AAVE Portfolio Professional AI Agent"**, is designed to automatically monitor multiple Ethereum wallet addresses for their Aave V3 decentralized finance (DeFi) portfolio healt')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4267', 4)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4267', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4267', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 33: AI Agent : Google calendar assistant using OpenAI
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2703', 'AI Agent : Google calendar assistant using OpenAI', 'This workflow is a beginner-friendly AI Agent designed to assist users with managing their Google Calendar through natural language chat interactions. It leverages OpenAI’s GPT-4o model to interpret u', 'dataki', '/workflows/images/2703.webp', '/workflows/json/2703.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2703', 'en', 'AI Agent : Google calendar assistant using OpenAI', 'This workflow is a beginner-friendly AI Agent designed to assist users with managing their Google Calendar through natural language chat interactions. It leverages OpenAI’s GPT-4o model to interpret u')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2703', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', 'googleCalendarTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2703', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 34: AI Agent Creates Content to Be Picked by ChatGPT, 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4652', 'AI Agent Creates Content to Be Picked by ChatGPT, Gemini, Google', 'This workflow, titled **"GEO/SEO content engine"**, is designed to automate the generation, classification, and distribution of content optimized for geographic and SEO purposes. It ingests data from ', 'kritika-dagur', '/workflows/images/4652.webp', '/workflows/json/4652.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4652', 'en', 'AI Agent Creates Content to Be Picked by ChatGPT, Gemini, Google', 'This workflow, titled **"GEO/SEO content engine"**, is designed to automate the generation, classification, and distribution of content optimized for geographic and SEO purposes. It ingests data from ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4652', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4652', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'mailgun', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'linkedIn', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'wordpress', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'removeDuplicates', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', 'googleSheetsTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', '@n8n/n8n-nodes-langchain.textClassifier', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4652', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 35: AI Agent Integration for Bubble Apps with MCP Prot
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4952', 'AI Agent Integration for Bubble Apps with MCP Protocol Data Access', 'This n8n workflow titled **"AI Agent Integration for Bubble Apps with MCP Protocol Data Access"** is designed to facilitate integration between an AI agent and a Bubble application via the MCP (Multi-', 'salama', '/workflows/images/4952.webp', '/workflows/json/4952.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4952', 'en', 'AI Agent Integration for Bubble Apps with MCP Protocol Data Access', 'This n8n workflow titled **"AI Agent Integration for Bubble Apps with MCP Protocol Data Access"** is designed to facilitate integration between an AI agent and a Bubble application via the MCP (Multi-')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4952', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4952', 'bubbleTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4952', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 36: AI Agent Integration for eBay Logistics API with M
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5574', 'AI Agent Integration for eBay Logistics API with MCP Server', 'This workflow, titled **"AI Agent Integration for eBay Logistics API with MCP Server"**, serves as an automation layer interfacing with the eBay Logistics API through an MCP (Multi-Channel Platform) s', 'cfomodz', '/workflows/images/5574.webp', '/workflows/json/5574.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5574', 'en', 'AI Agent Integration for eBay Logistics API with MCP Server', 'This workflow, titled **"AI Agent Integration for eBay Logistics API with MCP Server"**, serves as an automation layer interfacing with the eBay Logistics API through an MCP (Multi-Channel Platform) s')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5574', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5574', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5574', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5574', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5574', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 37: AI Agent Integration with eBay Buy Marketing API
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5567', 'AI Agent Integration with eBay Buy Marketing API', 'This workflow is designed to provide an AI-compatible interface to eBay’s Buy Marketing API, specifically enabling the retrieval of merchandised products based on marketing metrics such as "Best Selli', 'cfomodz', '/workflows/images/5567.webp', '/workflows/json/5567.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5567', 'en', 'AI Agent Integration with eBay Buy Marketing API', 'This workflow is designed to provide an AI-compatible interface to eBay’s Buy Marketing API, specifically enabling the retrieval of merchandised products based on marketing metrics such as "Best Selli')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5567', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5567', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5567', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5567', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5567', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 38: AI Agent Managed Tables and Views with 🛠️ Coda To
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5319', 'AI Agent Managed Tables and Views with 🛠️ Coda Tool MCP Server 💪 18 operations', 'This workflow, titled **"AI Agent Managed Tables and Views with 🛠️ Coda Tool MCP Server 💪 18 operations,"** serves as an integration hub designed to manage and manipulate Coda documents programmatic', 'cfomodz', '/workflows/images/5319.webp', '/workflows/json/5319.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5319', 'en', 'AI Agent Managed Tables and Views with 🛠️ Coda Tool MCP Server 💪 18 operations', 'This workflow, titled **"AI Agent Managed Tables and Views with 🛠️ Coda Tool MCP Server 💪 18 operations,"** serves as an integration hub designed to manage and manipulate Coda documents programmatic')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5319', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5319', 'codaTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5319', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5319', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 39: AI Agent Managed 🛠️ Google Contacts Tool MCP Serv
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5255', 'AI Agent Managed 🛠️ Google Contacts Tool MCP Server 💪 5 operations', 'This workflow, titled **Google Contacts Tool MCP Server**, is designed to manage Google Contacts via an AI-driven multi-command processing (MCP) server. It supports five core operations on Google Cont', 'cfomodz', '/workflows/images/5255.webp', '/workflows/json/5255.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5255', 'en', 'AI Agent Managed 🛠️ Google Contacts Tool MCP Server 💪 5 operations', 'This workflow, titled **Google Contacts Tool MCP Server**, is designed to manage Google Contacts via an AI-driven multi-command processing (MCP) server. It supports five core operations on Google Cont')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5255', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5255', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5255', 'googleContactsTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5255', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 40: AI Agent Powered Marketing 🛠️ Customer.io Tool MC
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5314', 'AI Agent Powered Marketing 🛠️ Customer.io Tool MCP Server 💪 all 9 operations', 'This workflow, titled **"Customer.io Tool MCP Server"**, is designed as an automation server for handling multiple Customer.io marketing platform operations via n8n. It serves as a centralized backend', 'cfomodz', '/workflows/images/5314.webp', '/workflows/json/5314.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5314', 'en', 'AI Agent Powered Marketing 🛠️ Customer.io Tool MCP Server 💪 all 9 operations', 'This workflow, titled **"Customer.io Tool MCP Server"**, is designed as an automation server for handling multiple Customer.io marketing platform operations via n8n. It serves as a centralized backend')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5314', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5314', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5314', 'customerIoTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5314', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 41: AI Agent To Chat With Files In Supabase Storage an
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4086', 'AI Agent To Chat With Files In Supabase Storage and Google Drive', 'This workflow implements an AI-powered document management and interaction system that integrates Supabase Storage, Google Drive, and an AI agent within n8n. It enables users to upload, parse, and que', 'lowcodingdev', '/workflows/images/4086.webp', '/workflows/json/4086.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4086', 'en', 'AI Agent To Chat With Files In Supabase Storage and Google Drive', 'This workflow implements an AI-powered document management and interaction system that integrates Supabase Storage, Google Drive, and an AI agent within n8n. It enables users to upload, parse, and que')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4086', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4086', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'supabase', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4086', 'googleDrive', 1);

-- Workflow 42: AI Agent To Chat With Files In Supabase Storage
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2621', 'AI Agent To Chat With Files In Supabase Storage', 'This n8n workflow, **"AI Agent To Chat With Files In Supabase Storage,"** enables users to interact conversationally with documents stored in Supabase storage by leveraging AI-powered vector search an', 'lowcodingdev', '/workflows/images/2621.webp', '/workflows/json/2621.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2621', 'en', 'AI Agent To Chat With Files In Supabase Storage', 'This n8n workflow, **"AI Agent To Chat With Files In Supabase Storage,"** enables users to interact conversationally with documents stored in Supabase storage by leveraging AI-powered vector search an')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2621', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2621', 10)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2621', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2621', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'supabase', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2621', '@n8n/n8n-nodes-langchain.agent', 1);

-- Workflow 43: AI Agent for project management and meetings with 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2683', 'AI Agent for project management and meetings with Airtable and Fireflies', 'This workflow automates project management and meeting follow-up by integrating Fireflies meeting transcripts, AI-based task extraction, Airtable task creation, client notifications via email, and sch', 'lowcodingdev', '/workflows/images/2683.webp', '/workflows/json/2683.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2683', 'en', 'AI Agent for project management and meetings with Airtable and Fireflies', 'This workflow automates project management and meeting follow-up by integrating Fireflies meeting transcripts, AI-based task extraction, Airtable task creation, client notifications via email, and sch')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2683', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2683', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'gmailTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', 'googleCalendarTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2683', '@n8n/n8n-nodes-langchain.toolWorkflow', 1);

-- Workflow 44: AI Agent for realtime insights on meetings
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2651', 'AI Agent for realtime insights on meetings', 'This workflow, titled **"AI Agent for realtime insights on meetings"**, is designed as an AI-powered assistant for capturing and analyzing virtual meeting conversations in real-time. It targets busine', 'lowcodingdev', '/workflows/images/2651.webp', '/workflows/json/2651.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2651', 'en', 'AI Agent for realtime insights on meetings', 'This workflow, titled **"AI Agent for realtime insights on meetings"**, is designed as an AI-powered assistant for capturing and analyzing virtual meeting conversations in real-time. It targets busine')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2651', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2651', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2651', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2651', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'supabase', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', 'postgresTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2651', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 45: AI Agent to chat with Airtable and analyze data
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2700', 'AI Agent to chat with Airtable and analyze data', 'This workflow implements an AI-powered conversational agent designed to interact dynamically with Airtable data. It enables users to query, analyze, and visualize data stored in Airtable bases through', 'lowcodingdev', '/workflows/images/2700.webp', '/workflows/json/2700.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2700', 'en', 'AI Agent to chat with Airtable and analyze data', 'This workflow implements an AI-powered conversational agent designed to interact dynamically with Airtable data. It enables users to query, analyze, and visualize data stored in Airtable bases through')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2700', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2700', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2700', '@n8n/n8n-nodes-langchain.toolCode', 1);

-- Workflow 46: AI Agent to chat with Supabase-PostgreSQL DB
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2612', 'AI Agent to chat with Supabase-PostgreSQL DB', 'This workflow enables conversational interaction with a Supabase-hosted PostgreSQL database using an AI agent powered by OpenAI. It allows developers, analysts, or business users to query and analyze ', 'lowcodingdev', '/workflows/images/2612.webp', '/workflows/json/2612.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2612', 'en', 'AI Agent to chat with Supabase-PostgreSQL DB', 'This workflow enables conversational interaction with a Supabase-hosted PostgreSQL database using an AI agent powered by OpenAI. It allows developers, analysts, or business users to query and analyze ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2612', 7)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2612', 10)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2612', 5)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2612', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', 'postgresTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', '@n8n/n8n-nodes-langchain.toolCode', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2612', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 47: AI Agent with Ollama for current weather and wiki
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2931', 'AI Agent with Ollama for current weather and wiki', 'This workflow implements an AI-powered conversational agent that provides users with current weather information and Wikipedia summaries by leveraging local Large Language Models (LLMs) through Ollama', 'tomkart', '/workflows/images/2931.webp', '/workflows/json/2931.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2931', 'en', 'AI Agent with Ollama for current weather and wiki', 'This workflow implements an AI-powered conversational agent that provides users with current weather information and Wikipedia summaries by leveraging local Large Language Models (LLMs) through Ollama')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2931', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.lmChatOllama', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.toolWikipedia', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.toolHttpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.manualChatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2931', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 48: AI Agent: Find the Right LinkedIn Profiles in Seco
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2898', 'AI Agent: Find the Right LinkedIn Profiles in Seconds', 'This workflow automates LinkedIn prospecting by transforming natural language queries into structured search parameters, performing targeted Google Custom Searches for LinkedIn profiles, filtering rel', 'b4dr', '/workflows/images/2898.webp', '/workflows/json/2898.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2898', 'en', 'AI Agent: Find the Right LinkedIn Profiles in Seconds', 'This workflow automates LinkedIn prospecting by transforming natural language queries into structured search parameters, performing targeted Google Custom Searches for LinkedIn profiles, filtering rel')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2898', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', '@n8n/n8n-nodes-langchain.openAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2898', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 49: AI Agent: Scrape, Summarize & Save Articles to Not
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3535', 'AI Agent: Scrape, Summarize & Save Articles to Notion (Gemini, Browserless)', 'This n8n workflow automates capturing web articles or links shared in chat conversations and saving them as structured pages in a Notion database. It leverages Google’s Gemini AI to interpret chat mes', 'mihailtd', '/workflows/images/3535.webp', '/workflows/json/3535.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3535', 'en', 'AI Agent: Scrape, Summarize & Save Articles to Notion (Gemini, Browserless)', 'This n8n workflow automates capturing web articles or links shared in chat conversations and saving them as structured pages in a Notion database. It leverages Google’s Gemini AI to interpret chat mes')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3535', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', 'notionTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', 'discordTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', '@n8n/n8n-nodes-langchain.toolHttpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3535', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 50: AI Agents can Create, Enrich leads with this Lemli
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5233', 'AI Agents can Create, Enrich leads with this Lemlist Tool MCP Server', 'This workflow, titled **"AI Agents can Create, Enrich leads with this Lemlist Tool MCP Server"**, is designed to interface with the Lemlist platform through its MCP (Multi-Channel Prospecting) Server ', 'cfomodz', '/workflows/images/5233.webp', '/workflows/json/5233.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5233', 'en', 'AI Agents can Create, Enrich leads with this Lemlist Tool MCP Server', 'This workflow, titled **"AI Agents can Create, Enrich leads with this Lemlist Tool MCP Server"**, is designed to interface with the Lemlist platform through its MCP (Multi-Channel Prospecting) Server ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5233', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5233', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5233', 'lemlistTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5233', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 51: AI Agents can retrieve assetts with 🛠️ Contentful
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5317', 'AI Agents can retrieve assetts with 🛠️ Contentful Tool MCP Server 💪', 'This workflow, titled **"Contentful Tool MCP Server"**, functions as a backend server enabling AI agents to retrieve various types of assets and content from Contentful via the MCP (Multi-Channel Plat', 'cfomodz', '/workflows/images/5317.webp', '/workflows/json/5317.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5317', 'en', 'AI Agents can retrieve assetts with 🛠️ Contentful Tool MCP Server 💪', 'This workflow, titled **"Contentful Tool MCP Server"**, functions as a backend server enabling AI agents to retrieve various types of assets and content from Contentful via the MCP (Multi-Channel Plat')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5317', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5317', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5317', 'contentfulTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5317', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 52: AI Audio Transcription & Google Docs Report Genera
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5307', 'AI Audio Transcription & Google Docs Report Generator', 'This workflow is designed to automate the transcription of audio files received via Gmail and generate professional, timestamped transcription reports in Google Docs. It targets use cases such as meet', 'shahrear', '/workflows/images/5307.webp', '/workflows/json/5307.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5307', 'en', 'AI Audio Transcription & Google Docs Report Generator', 'This workflow is designed to automate the transcription of audio files received via Gmail and generate professional, timestamped transcription reports in Google Docs. It targets use cases such as meet')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5307', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5307', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5307', 'googleDocs', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5307', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5307', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5307', '@vlm-run/n8n-nodes-vlmrun.vlmRun', 1);

-- Workflow 53: AI Auto-Save Gmail Receipts to Google Sheets + Goo
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5451', 'AI Auto-Save Gmail Receipts to Google Sheets + Google Drive', 'This workflow automates the extraction and archival of receipt data from Gmail emails into Google Sheets and Google Drive, targeting users who want to streamline tax tracking and expense management. I', 'mattxchong', '/workflows/images/5451.webp', '/workflows/json/5451.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5451', 'en', 'AI Auto-Save Gmail Receipts to Google Sheets + Google Drive', 'This workflow automates the extraction and archival of receipt data from Gmail emails into Google Sheets and Google Drive, targeting users who want to streamline tax tracking and expense management. I')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5451', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'extractFromFile', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5451', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 54: AI Automated HR Workflow for CV Analysis and Candi
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2860', 'AI Automated HR Workflow for CV Analysis and Candidate Evaluation', 'This workflow automates the end-to-end process of handling job applications by extracting, analyzing, and evaluating candidate CVs using AI-powered nodes and storing the results for HR review. It is d', 'n3witalia', '/workflows/images/2860.webp', '/workflows/json/2860.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2860', 'en', 'AI Automated HR Workflow for CV Analysis and Candidate Evaluation', 'This workflow automates the end-to-end process of handling job applications by extracting, analyzing, and evaluating candidate CVs using AI-powered nodes and storing the results for HR review. It is d')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2860', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', 'extractFromFile', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2860', '@n8n/n8n-nodes-langchain.chainSummarization', 1);

-- Workflow 55: AI Blog Generator for Shopify Product listings:  U
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4735', 'AI Blog Generator for Shopify Product listings:  Using GPT-4o and Google Sheets', 'This workflow automates the creation of SEO-friendly blog posts on Shopify for product listings by leveraging AI and Google Sheets as a tracking system. It fetches all Shopify products and their image', 'shivam840708', '/workflows/images/4735.webp', '/workflows/json/4735.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4735', 'en', 'AI Blog Generator for Shopify Product listings:  Using GPT-4o and Google Sheets', 'This workflow automates the creation of SEO-friendly blog posts on Shopify for product listings by leveraging AI and Google Sheets as a tracking system. It fetches all Shopify products and their image')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4735', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4735', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'shopify', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4735', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 56: AI Blog Generator for Shopify Products using Googl
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8575', 'AI Blog Generator for Shopify Products using Google Gemini and Google Sheets', 'This workflow automates the generation of SEO-optimized blog posts for Shopify products by leveraging Google Sheets as a data intermediary and Google Gemini AI for content creation. It targets e-comme', 'manipritraj', '/workflows/images/8575.webp', '/workflows/json/8575.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8575', 'en', 'AI Blog Generator for Shopify Products using Google Gemini and Google Sheets', 'This workflow automates the generation of SEO-optimized blog posts for Shopify products by leveraging Google Sheets as a data intermediary and Google Gemini AI for content creation. It targets e-comme')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8575', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'limit', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'shopify', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8575', '@n8n/n8n-nodes-langchain.agent', 1);

-- Workflow 57: AI Blog Post Generator with Scheduled or Prompt-ba
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('10180', 'AI Blog Post Generator with Scheduled or Prompt-based Content for WordPress', 'This workflow automates the generation and publication of SEO-optimized blog posts to a WordPress site using AI, specifically OpenAI models, and is triggered either on a schedule or by a chat prompt. ', 'eidoc', '/workflows/images/10180.webp', '/workflows/json/10180.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('10180', 'en', 'AI Blog Post Generator with Scheduled or Prompt-based Content for WordPress', 'This workflow automates the generation and publication of SEO-optimized blog posts to a WordPress site using AI, specifically OpenAI models, and is triggered either on a schedule or by a chat prompt. ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('10180', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'xml', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'wordpress', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', '@n8n/n8n-nodes-langchain.openAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10180', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

-- Workflow 58: AI Call Summary + Follow-Up Task to HubSpot
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8966', 'AI Call Summary + Follow-Up Task to HubSpot', 'This workflow automates the process of summarizing sales or discovery calls and managing follow-up tasks within HubSpot CRM. It targets sales and customer success teams who want to quickly log call in', 'miha', '/workflows/images/8966.webp', '/workflows/json/8966.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8966', 'en', 'AI Call Summary + Follow-Up Task to HubSpot', 'This workflow automates the process of summarizing sales or discovery calls and managing follow-up tasks within HubSpot CRM. It targets sales and customer success teams who want to quickly log call in')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8966', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', 'hubspot', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', 'hubspotTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8966', '@n8n/n8n-nodes-langchain.outputParserStructured', 1);

-- Workflow 59: AI Candidate Screening Pipeline: LinkedIn to Teleg
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('10045', 'AI Candidate Screening Pipeline: LinkedIn to Telegram with Gemini & Apify', 'This workflow automates the first-round candidate screening process by integrating Telegram messaging, LinkedIn profile scraping, job description (JD) matching, and AI-powered candidate evaluation. It', 'deanjp', '/workflows/images/10045.webp', '/workflows/json/10045.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('10045', 'en', 'AI Candidate Screening Pipeline: LinkedIn to Telegram with Gemini & Apify', 'This workflow automates the first-round candidate screening process by integrating Telegram messaging, LinkedIn profile scraping, job description (JD) matching, and AI-powered candidate evaluation. It')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('10045', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'summarize', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10045', 'httpRequest', 1);

-- Workflow 60: AI Chat Agent: Dumpling AI + GPT-4o to Auto-Save L
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3826', 'AI Chat Agent: Dumpling AI + GPT-4o to Auto-Save Local Business Data to Airtable', 'This workflow automates the process of discovering and enriching local business leads using AI, then saving structured data into Airtable for easy management. It is designed for digital marketers, lea', 'yang', '/workflows/images/3826.webp', '/workflows/json/3826.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3826', 'en', 'AI Chat Agent: Dumpling AI + GPT-4o to Auto-Save Local Business Data to Airtable', 'This workflow automates the process of discovering and enriching local business leads using AI, then saving structured data into Airtable for easy management. It is designed for digital marketers, lea')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3826', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3826', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', 'airtableTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', '@n8n/n8n-nodes-langchain.toolHttpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3826', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 61: AI Chatbot Agent with a Panel of Experts using Inf
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4402', 'AI Chatbot Agent with a Panel of Experts using InfraNodus GraphRAG Knowledge', 'This n8n workflow implements an AI Chatbot Agent that leverages multiple specialized knowledge experts based on InfraNodus Graph RAG (Retrieval-Augmented Generation) technology. Its main purpose is to', 'infranodus', '/workflows/images/4402.webp', '/workflows/json/4402.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4402', 'en', 'AI Chatbot Agent with a Panel of Experts using InfraNodus GraphRAG Knowledge', 'This n8n workflow implements an AI Chatbot Agent that leverages multiple specialized knowledge experts based on InfraNodus Graph RAG (Retrieval-Augmented Generation) technology. Its main purpose is to')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4402', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4402', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 62: AI Chatbot Call Center: Demo Call Back (Production
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4050', 'AI Chatbot Call Center: Demo Call Back (Production-Ready, Part 6)', 'This workflow, titled **"AI Chatbot Call Center: Demo Call Back (Production-Ready, Part 6)"**, is a **Telegram Output Workflow** designed to receive processed messages from other sub-workflows and out', 'chatpaylabs', '/workflows/images/4050.webp', '/workflows/json/4050.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4050', 'en', 'AI Chatbot Call Center: Demo Call Back (Production-Ready, Part 6)', 'This workflow, titled **"AI Chatbot Call Center: Demo Call Back (Production-Ready, Part 6)"**, is a **Telegram Output Workflow** designed to receive processed messages from other sub-workflows and out')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4050', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4050', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

-- Workflow 63: AI Chatbot Call Center: Demo Call Center (Producti
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4045', 'AI Chatbot Call Center: Demo Call Center (Production-Ready, Part 2)', 'This workflow, titled **"☎️ Demo Call Center"**, serves as the main entry point for a multi-service chatbot designed for call center operations. Its primary purpose is to receive messages from an exte', 'chatpaylabs', '/workflows/images/4045.webp', '/workflows/json/4045.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4045', 'en', 'AI Chatbot Call Center: Demo Call Center (Production-Ready, Part 2)', 'This workflow, titled **"☎️ Demo Call Center"**, serves as the main entry point for a multi-service chatbot designed for call center operations. Its primary purpose is to receive messages from an exte')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4045', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'postgresTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', 'executeWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4045', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

-- Workflow 64: AI Chatbot Call Center: General Exception Flow (Pr
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4052', 'AI Chatbot Call Center: General Exception Flow (Production-Ready, Part 8)', 'This workflow, titled **"👻 Exception Flow"**, serves as a centralized error handling mechanism within an n8n environment. Its primary purpose is to listen for errors occurring in other workflows and ', 'chatpaylabs', '/workflows/images/4052.webp', '/workflows/json/4052.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4052', 'en', 'AI Chatbot Call Center: General Exception Flow (Production-Ready, Part 8)', 'This workflow, titled **"👻 Exception Flow"**, serves as a centralized error handling mechanism within an n8n environment. Its primary purpose is to listen for errors occurring in other workflows and ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4052', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4052', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4052', 'errorTrigger', 1);

-- Workflow 65: AI Chatbot Call Center: Taxi Booking Support (Prod
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4051', 'AI Chatbot Call Center: Taxi Booking Support (Production-Ready, Part 7)', 'This workflow, named **🫶 Taxi Booking Support**, is a production-ready background process designed to automate after-sales support for a taxi booking system. Its primary purpose is to periodically ch', 'chatpaylabs', '/workflows/images/4051.webp', '/workflows/json/4051.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4051', 'en', 'AI Chatbot Call Center: Taxi Booking Support (Production-Ready, Part 7)', 'This workflow, named **🫶 Taxi Booking Support**, is a production-ready background process designed to automate after-sales support for a taxi booking system. Its primary purpose is to periodically ch')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4051', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'googleCalendar', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'executeWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4051', '@n8n/n8n-nodes-langchain.lmChatXAiGrok', 1);

-- Workflow 66: AI Chatbot Call Center: Taxi Booking Worker (Produ
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4048', 'AI Chatbot Call Center: Taxi Booking Worker (Production-Ready, Part 5)', 'This workflow, titled **"AI Chatbot Call Center: Taxi Booking Worker (Production-Ready, Part 5)"**, is designed to automate taxi booking management within a call center environment. It integrates an A', 'chatpaylabs', '/workflows/images/4048.webp', '/workflows/json/4048.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4048', 'en', 'AI Chatbot Call Center: Taxi Booking Worker (Production-Ready, Part 5)', 'This workflow, titled **"AI Chatbot Call Center: Taxi Booking Worker (Production-Ready, Part 5)"**, is designed to automate taxi booking management within a call center environment. It integrates an A')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4048', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'googleCalendar', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'executeWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4048', 'executeWorkflowTrigger', 1);

-- Workflow 67: AI Chatbot Call Center: Taxi Service (Production-R
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4046', 'AI Chatbot Call Center: Taxi Service (Production-Ready, Part 3)', 'This workflow, titled **"🛎️ Taxi Service"**, is a production-ready core component for a Taxi Service chatbot integrated with a call center. It is designed to handle incoming taxi service requests, va', 'chatpaylabs', '/workflows/images/4046.webp', '/workflows/json/4046.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4046', 'en', 'AI Chatbot Call Center: Taxi Service (Production-Ready, Part 3)', 'This workflow, titled **"🛎️ Taxi Service"**, is a production-ready core component for a Taxi Service chatbot integrated with a call center. It is designed to handle incoming taxi service requests, va')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4046', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'redisTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', 'postgresTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4046', '@n8n/n8n-nodes-langchain.agent', 1);

-- Workflow 68: AI Chatbot Call Center: Telegram Call In (Producti
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4044', 'AI Chatbot Call Center: Telegram Call In (Production-Ready, Part 1a)', 'This workflow, titled **"🤙 Telegram Call In"**, is designed as a production-ready Telegram chatbot interface for an AI-driven call center. It targets high-skill users who want to automate processing ', 'chatpaylabs', '/workflows/images/4044.webp', '/workflows/json/4044.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4044', 'en', 'AI Chatbot Call Center: Telegram Call In (Production-Ready, Part 1a)', 'This workflow, titled **"🤙 Telegram Call In"**, is designed as a production-ready Telegram chatbot interface for an AI-driven call center. It targets high-skill users who want to automate processing ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4044', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'redis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'postgres', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'executeWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4044', 'extractFromFile', 1);

-- Workflow 69: AI Chatbot that Queries Baserow Database with Open
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('6603', 'AI Chatbot that Queries Baserow Database with OpenAI GPT-4 Mini', 'This workflow implements an AI chatbot that interacts with users via a chat interface and queries a Baserow database using OpenAI''s GPT-4 Mini model. It is designed for use cases where conversational ', 'gegenfeld', '/workflows/images/6603.webp', '/workflows/json/6603.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('6603', 'en', 'AI Chatbot that Queries Baserow Database with OpenAI GPT-4 Mini', 'This workflow implements an AI chatbot that interacts with users via a chat interface and queries a Baserow database using OpenAI''s GPT-4 Mini model. It is designed for use cases where conversational ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('6603', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', 'baserowTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6603', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 70: AI Chatbot with OpenAI GPT-4.1-Mini and Supabase D
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('6604', 'AI Chatbot with OpenAI GPT-4.1-Mini and Supabase Database Knowledge Base', 'This workflow implements an AI chatbot leveraging OpenAI’s GPT-4.1-Mini model, integrated with a Supabase database as a knowledge base. It is designed to support conversational AI applications where d', 'gegenfeld', '/workflows/images/6604.webp', '/workflows/json/6604.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('6604', 'en', 'AI Chatbot with OpenAI GPT-4.1-Mini and Supabase Database Knowledge Base', 'This workflow implements an AI chatbot leveraging OpenAI’s GPT-4.1-Mini model, integrated with a Supabase database as a knowledge base. It is designed to support conversational AI applications where d')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('6604', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', 'supabaseTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6604', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 71: AI Client Onboarding Agent: Auto Welcome Email Gen
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4377', 'AI Client Onboarding Agent: Auto Welcome Email Generator', 'This workflow automates the client onboarding process by generating and sending a personalized welcome email based on new client data added to a Google Sheets document. It targets businesses that want', 'yaron-nofluff', '/workflows/images/4377.webp', '/workflows/json/4377.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4377', 'en', 'AI Client Onboarding Agent: Auto Welcome Email Generator', 'This workflow automates the client onboarding process by generating and sending a personalized welcome email based on new client data added to a Google Sheets document. It targets businesses that want')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4377', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'start', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'errorTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', '@n8n/n8n-nodes-langchain.chainLlm', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', 'googleSheetsTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4377', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 72: AI Competitor Review Analyzer with Dumpling AI + G
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4032', 'AI Competitor Review Analyzer with Dumpling AI + GPT-4o + Google Sheets', 'This workflow automates the process of collecting, analyzing, and summarizing Google reviews for competitor businesses listed in a Google Sheet. It is designed to serve marketers, SEO specialists, pro', 'yang', '/workflows/images/4032.webp', '/workflows/json/4032.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4032', 'en', 'AI Competitor Review Analyzer with Dumpling AI + GPT-4o + Google Sheets', 'This workflow automates the process of collecting, analyzing, and summarizing Google reviews for competitor businesses listed in a Google Sheet. It is designed to serve marketers, SEO specialists, pro')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4032', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', '@n8n/n8n-nodes-langchain.openAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4032', 'googleSheetsTrigger', 1);

-- Workflow 73: AI Course Scheduler from Completed Prereqs (Google
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8090', 'AI Course Scheduler from Completed Prereqs (Google Sheets + OpenAI)', 'This workflow automates the creation of personalized Fall 2025 course schedules for students based on their completed prerequisite courses. It reads student data from a Google Sheets spreadsheet, uses', 'rbreen', '/workflows/images/8090.webp', '/workflows/json/8090.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8090', 'en', 'AI Course Scheduler from Completed Prereqs (Google Sheets + OpenAI)', 'This workflow automates the creation of personalized Fall 2025 course schedules for students based on their completed prerequisite courses. It reads student data from a Google Sheets spreadsheet, uses')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8090', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8090', '@n8n/n8n-nodes-langchain.outputParserStructured', 1);

-- Workflow 74: AI Crew to Automate Fundamental Stock Analysis - Q
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2183', 'AI Crew to Automate Fundamental Stock Analysis - Q&A Workflow', 'This workflow automates fundamental stock analysis by implementing a Stock Q&A engine that answers questions using SEC 10K data. It is designed as the back-end component of a two-part system, where th', 'derekcheungsa', '/workflows/images/2183.webp', '/workflows/json/2183.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2183', 'en', 'AI Crew to Automate Fundamental Stock Analysis - Q&A Workflow', 'This workflow automates fundamental stock analysis by implementing a Stock Q&A engine that answers questions using SEC 10K data. It is designed as the back-end component of a two-part system, where th')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2183', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', 'respondToWebhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', '@n8n/n8n-nodes-langchain.chainRetrievalQa', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', '@n8n/n8n-nodes-langchain.embeddingsOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', '@n8n/n8n-nodes-langchain.manualChatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2183', '@n8n/n8n-nodes-langchain.vectorStoreQdrant', 1);

-- Workflow 75: AI Customer Support Chat for Web Hosting with Goog
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7631', 'AI Customer Support Chat for Web Hosting with Google Gemini & WHMCS', 'This workflow implements an AI-powered customer support chat system tailored for a web hosting company. It automates responses to customer inquiries about hosting plans, domain services, payment metho', 'omerfayyaz', '/workflows/images/7631.webp', '/workflows/json/7631.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7631', 'en', 'AI Customer Support Chat for Web Hosting with Google Gemini & WHMCS', 'This workflow implements an AI-powered customer support chat system tailored for a web hosting company. It automates responses to customer inquiries about hosting plans, domain services, payment metho')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7631', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', 'googleSheetsTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', 'respondToWebhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7631', '@n8n/n8n-nodes-langchain.memoryBufferWindow', 1);

-- Workflow 76: AI DJ: Text-to-Spotify Playlist Generator with Lin
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8801', 'AI DJ: Text-to-Spotify Playlist Generator with Linkup and GPT4', 'This workflow, titled **"AI DJ: Text-to-Spotify Playlist Generator with Linkup and GPT4"**, automates the creation of a Spotify playlist based on a natural language text prompt submitted via a web for', 'duv', '/workflows/images/8801.webp', '/workflows/json/8801.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8801', 'en', 'AI DJ: Text-to-Spotify Playlist Generator with Linkup and GPT4', 'This workflow, titled **"AI DJ: Text-to-Spotify Playlist Generator with Linkup and GPT4"**, automates the creation of a Spotify playlist based on a natural language text prompt submitted via a web for')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8801', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'form', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'spotify', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8801', '@n8n/n8n-nodes-langchain.outputParserStructured', 1);

-- Workflow 77: AI Data Extraction with Dynamic Prompts and Airtab
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2771', 'AI Data Extraction with Dynamic Prompts and Airtable', 'This workflow implements a dynamic AI-driven data extraction pattern integrated with Airtable, designed to extract flexible and user-defined attributes from documents (PDF resumes in this example). It', 'jimleuk', '/workflows/images/2771.webp', '/workflows/json/2771.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2771', 'en', 'AI Data Extraction with Dynamic Prompts and Airtable', 'This workflow implements a dynamic AI-driven data extraction pattern integrated with Airtable, designed to extract flexible and user-defined attributes from documents (PDF resumes in this example). It')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2771', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2771', 'manualTrigger', 1);

-- Workflow 78: AI Data Extraction with Dynamic Prompts and Basero
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2780', 'AI Data Extraction with Dynamic Prompts and Baserow', 'This workflow implements a dynamic AI-driven data extraction pattern for Baserow tables, designed to flexibly extract structured data from unstructured inputs such as PDFs. It leverages Baserow’s fiel', 'jimleuk', '/workflows/images/2780.webp', '/workflows/json/2780.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2780', 'en', 'AI Data Extraction with Dynamic Prompts and Baserow', 'This workflow implements a dynamic AI-driven data extraction pattern for Baserow tables, designed to flexibly extract structured data from unstructured inputs such as PDFs. It leverages Baserow’s fiel')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2780', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2780', 'splitInBatches', 1);

-- Workflow 79: AI Email Analyzer: Process PDFs, Images & Save to 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3169', 'AI Email Analyzer: Process PDFs, Images & Save to Google Drive + Telegram', 'This workflow automates the analysis and summarization of incoming emails and their attachments (PDFs and images) using AI models. It extracts content from emails and attachments, generates summaries,', 'n3witalia', '/workflows/images/3169.webp', '/workflows/json/3169.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3169', 'en', 'AI Email Analyzer: Process PDFs, Images & Save to Google Drive + Telegram', 'This workflow automates the analysis and summarization of incoming emails and their attachments (PDFs and images) using AI models. It extracts content from emails and attachments, generates summaries,')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3169', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'markdown', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3169', 'stickyNote', 1);

-- Workflow 80: AI Email Assistant: Prioritize Gmail with ChatGPT 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5446', 'AI Email Assistant: Prioritize Gmail with ChatGPT Summaries and Slack Digests', 'This workflow, titled **AI Email Assistant: Prioritize Gmail with ChatGPT Summaries and Slack Digests**, automates the processing of incoming Gmail messages for a busy startup founder. It uses AI (Ope', 'n8ndarsheel', '/workflows/images/5446.webp', '/workflows/json/5446.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5446', 'en', 'AI Email Assistant: Prioritize Gmail with ChatGPT Summaries and Slack Digests', 'This workflow, titled **AI Email Assistant: Prioritize Gmail with ChatGPT Summaries and Slack Digests**, automates the processing of incoming Gmail messages for a busy startup founder. It uses AI (Ope')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5446', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5446', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 81: AI Email Auto-Responder System- AI RAG Agent for E
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4748', 'AI Email Auto-Responder System- AI RAG Agent for Email Inbox', 'The **AI Email Auto-Responder System - AI RAG Agent for Email Inbox** workflow automates the process of receiving emails, analyzing their content with AI, searching relevant information in vector stor', 'lukaszb', '/workflows/images/4748.webp', '/workflows/json/4748.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4748', 'en', 'AI Email Auto-Responder System- AI RAG Agent for Email Inbox', 'The **AI Email Auto-Responder System - AI RAG Agent for Email Inbox** workflow automates the process of receiving emails, analyzing their content with AI, searching relevant information in vector stor')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4748', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'notion', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'googleDocs', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4748', '@n8n/n8n-nodes-langchain.agent', 1);

-- Workflow 82: AI Email Classifier & Auto-Delete for Gmail (SPAM-
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4507', 'AI Email Classifier & Auto-Delete for Gmail (SPAM-OFFER Cleaner)', 'This workflow named **"Auto Spam/Marketing & Offer Delete"** is designed to automatically monitor a Gmail inbox and classify incoming emails into three categories: **SPAM**, **OFFER**, and **IMPORTAND', 'lukaszb', '/workflows/images/4507.webp', '/workflows/json/4507.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4507', 'en', 'AI Email Classifier & Auto-Delete for Gmail (SPAM-OFFER Cleaner)', 'This workflow named **"Auto Spam/Marketing & Offer Delete"** is designed to automatically monitor a Gmail inbox and classify incoming emails into three categories: **SPAM**, **OFFER**, and **IMPORTAND')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4507', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4507', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 83: AI Email Reply with Full HubSpot Context + Slack A
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8967', 'AI Email Reply with Full HubSpot Context + Slack Approval', 'This workflow automates the process of replying to inbound Gmail messages with contextually rich, AI-generated email drafts that include relevant CRM data from HubSpot. It is designed for customer sup', 'miha', '/workflows/images/8967.webp', '/workflows/json/8967.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8967', 'en', 'AI Email Reply with Full HubSpot Context + Slack Approval', 'This workflow automates the process of replying to inbound Gmail messages with contextually rich, AI-generated email drafts that include relevant CRM data from HubSpot. It is designed for customer sup')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8967', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'hubspot', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', 'gmailTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8967', '@n8n/n8n-nodes-langchain.agent', 1);

-- Workflow 84: AI Email Triage & Alert System with GPT-4 and Tele
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3968', 'AI Email Triage & Alert System with GPT-4 and Telegram Notifications', 'This workflow is a comprehensive, fully automated AI Email Triage & Alert System built in n8n to streamline email inbox management using advanced AI models (GPT-4, Google Gemini) and Telegram notifica', 'pjawz', '/workflows/images/3968.webp', '/workflows/json/3968.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3968', 'en', 'AI Email Triage & Alert System with GPT-4 and Telegram Notifications', 'This workflow is a comprehensive, fully automated AI Email Triage & Alert System built in n8n to streamline email inbox management using advanced AI models (GPT-4, Google Gemini) and Telegram notifica')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3968', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3968', 'gmailTool', 1);

-- Workflow 85: AI Facebook Ad Spy Tool with Apify, OpenAI, Gemini
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5417', 'AI Facebook Ad Spy Tool with Apify, OpenAI, Gemini & Google Sheets', 'This workflow is an **AI-powered Facebook Ad Spy Tool** designed to scrape, analyze, and summarize competitor ads from Facebook’s public Ad Library. It targets marketing agencies, PPC clients, and adv', 'nicksaraev', '/workflows/images/5417.webp', '/workflows/json/5417.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5417', 'en', 'AI Facebook Ad Spy Tool with Apify, OpenAI, Gemini & Google Sheets', 'This workflow is an **AI-powered Facebook Ad Spy Tool** designed to scrape, analyze, and summarize competitor ads from Facebook’s public Ad Library. It targets marketing agencies, PPC clients, and adv')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5417', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5417', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5417', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 86: AI Fitness Coach Strava Data Analysis and Personal
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('2790', 'AI Fitness Coach Strava Data Analysis and Personalized Training Insights', 'This workflow, titled **"AI Fitness Coach Strava Data Analysis and Personalized Training Insights"**, is designed to serve as a virtual triathlon coach by integrating with Strava to analyze athlete ac', 'amjid', '/workflows/images/2790.webp', '/workflows/json/2790.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('2790', 'en', 'AI Fitness Coach Strava Data Analysis and Personalized Training Insights', 'This workflow, titled **"AI Fitness Coach Strava Data Analysis and Personalized Training Insights"**, is designed to serve as a virtual triathlon coach by integrating with Strava to analyze athlete ac')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('2790', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'whatsApp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'emailSend', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', 'stravaTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('2790', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 87: AI Guest Post Generator with OpenAI & Google Sheet
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7666', 'AI Guest Post Generator with OpenAI & Google Sheets Automation', 'This workflow automates the generation of guest posts in German using OpenAI''s language model and manages tasks via a Google Sheets planning document. It is designed for content teams or marketers who', 'juanestrella', '/workflows/images/7666.webp', '/workflows/json/7666.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7666', 'en', 'AI Guest Post Generator with OpenAI & Google Sheets Automation', 'This workflow automates the generation of guest posts in German using OpenAI''s language model and manages tasks via a Google Sheets planning document. It is designed for content teams or marketers who')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7666', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7666', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7666', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7666', 'openAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7666', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7666', 'manualTrigger', 1);

-- Workflow 88: AI Hairstyle Preview Generator with OpenAI and LIN
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7535', 'AI Hairstyle Preview Generator with OpenAI and LINE Group Sharing', 'This workflow, titled **AI Hairstyle Preview Generator with OpenAI and LINE Group Sharing**, is designed to automate the process of generating hairstyle edits on user-submitted images while preserving', 'kote2', '/workflows/images/7535.webp', '/workflows/json/7535.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7535', 'en', 'AI Hairstyle Preview Generator with OpenAI and LINE Group Sharing', 'This workflow, titled **AI Hairstyle Preview Generator with OpenAI and LINE Group Sharing**, is designed to automate the process of generating hairstyle edits on user-submitted images while preserving')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7535', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7535', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7535', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7535', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7535', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7535', 'convertToFile', 1);

-- Workflow 89: AI Icebreaker Builder: Scrape Sites with Dumpling 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('4885', 'AI Icebreaker Builder: Scrape Sites with Dumpling AI and Save to Airtable', 'This workflow automates the process of generating personalized cold outreach email content for new leads stored in an Airtable base. It targets sales or marketing teams who want to efficiently craft c', 'yang', '/workflows/images/4885.webp', '/workflows/json/4885.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('4885', 'en', 'AI Icebreaker Builder: Scrape Sites with Dumpling AI and Save to Airtable', 'This workflow automates the process of generating personalized cold outreach email content for new leads stored in an Airtable base. It targets sales or marketing teams who want to efficiently craft c')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4885', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('4885', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'wait', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', 'scheduleTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('4885', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 90: AI Image Generation & Editing with Google Gemini a
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('10466', 'AI Image Generation & Editing with Google Gemini and Telegram Bot', 'This workflow enables AI-driven image generation and editing through Telegram using Google Gemini’s generative image capabilities and Google Drive for storage. It is designed for users interacting via', 'santhejkallada', '/workflows/images/10466.webp', '/workflows/json/10466.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('10466', 'en', 'AI Image Generation & Editing with Google Gemini and Telegram Bot', 'This workflow enables AI-driven image generation and editing through Telegram using Google Gemini’s generative image capabilities and Google Drive for storage. It is designed for users interacting via')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('10466', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'airtable', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('10466', 'httpRequest', 1);

-- Workflow 91: AI Image Nudity Detection Tool with Image Moderati
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('5661', 'AI Image Nudity Detection Tool with Image Moderation API', 'This workflow, titled **AI Image Nudity Detection Tool with Image Moderation API**, is designed to provide a simple and effective interface for detecting nudity in images using the ModerateContent.com', 'cfomodz', '/workflows/images/5661.webp', '/workflows/json/5661.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('5661', 'en', 'AI Image Nudity Detection Tool with Image Moderation API', 'This workflow, titled **AI Image Nudity Detection Tool with Image Moderation API**, is designed to provide a simple and effective interface for detecting nudity in images using the ModerateContent.com')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('5661', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5661', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5661', 'httpRequestTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('5661', '@n8n/n8n-nodes-langchain.mcpTrigger', 1);

-- Workflow 92: AI Industry Trend Monitor 24-7 Across X, Gmail, an
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('9938', 'AI Industry Trend Monitor 24-7 Across X, Gmail, and Websites Using GPT-5', 'This workflow, titled **"AI Industry Trend Monitor 24/7 Across X, Gmail, and Websites Using GPT-5,"** is designed to continuously monitor and analyze industry trends related to AI by aggregating data ', 'leeweihernandez07', '/workflows/images/9938.webp', '/workflows/json/9938.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('9938', 'en', 'AI Industry Trend Monitor 24-7 Across X, Gmail, and Websites Using GPT-5', 'This workflow, titled **"AI Industry Trend Monitor 24/7 Across X, Gmail, and Websites Using GPT-5,"** is designed to continuously monitor and analyze industry trends related to AI by aggregating data ')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('9938', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('9938', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'airtop', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'aggregate', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'airtopTool', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9938', 'googleSheets', 1);

-- Workflow 93: AI Invoice Agent
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7905', 'AI Invoice Agent', 'The **AI Invoice Agent** workflow automates the generation, emailing, and tracking of client invoices for a creative agency named "Upward Engine." It is designed for use cases where invoice data is st', 'rakinjakaria', '/workflows/images/7905.webp', '/workflows/json/7905.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7905', 'en', 'AI Invoice Agent', 'The **AI Invoice Agent** workflow automates the generation, emailing, and tracking of client invoices for a creative agency named "Upward Engine." It is designed for use cases where invoice data is st')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7905', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'filter', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'manualTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'splitInBatches', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', 'n8n-nodes-craftmypdf.craftMyPdf', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7905', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 94: AI Job Relevancy Scorer: Search LinkedIn Jobs with
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('9418', 'AI Job Relevancy Scorer: Search LinkedIn Jobs with GPT-4o-mini & Google Sheets', 'This workflow, titled **AI Job Relevancy Scorer: Search LinkedIn Jobs with GPT-4o-mini & Google Sheets**, automates the search, scoring, filtering, and tracking of relevant job listings from LinkedIn,', 'deonix-ai', '/workflows/images/9418.webp', '/workflows/json/9418.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('9418', 'en', 'AI Job Relevancy Scorer: Search LinkedIn Jobs with GPT-4o-mini & Google Sheets', 'This workflow, titled **AI Job Relevancy Scorer: Search LinkedIn Jobs with GPT-4o-mini & Google Sheets**, automates the search, scoring, filtering, and tracking of relevant job listings from LinkedIn,')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('9418', 2)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'httpRequest', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('9418', '@n8n/n8n-nodes-langchain.openAi', 1);

-- Workflow 95: AI Knowledge Base Assistant with OpenAI, Supabase 
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('6538', 'AI Knowledge Base Assistant with OpenAI, Supabase & Google Drive Doc Sync', 'This workflow is designed as an **AI Knowledge Base Assistant** that integrates **OpenAI**, **Supabase Vector Database**, and **Google Drive** to create an automated, intelligent chatbot system. It su', 'abdulmir', '/workflows/images/6538.webp', '/workflows/json/6538.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('6538', 'en', 'AI Knowledge Base Assistant with OpenAI, Supabase & Google Drive Doc Sync', 'This workflow is designed as an **AI Knowledge Base Assistant** that integrates **OpenAI**, **Supabase Vector Database**, and **Google Drive** to create an automated, intelligent chatbot system. It su')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('6538', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'limit', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'supabase', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'googleDrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'extractFromFile', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('6538', 'telegramTrigger', 1);

-- Workflow 96: AI Lead Scoring & Enrichment from Mailchimp to Hub
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8909', 'AI Lead Scoring & Enrichment from Mailchimp to HubSpot and Pipedrive with GPT-4o', 'This workflow automates the lead capture, enrichment, qualification, and CRM synchronization process for new subscribers from a Mailchimp list. It targets marketing and sales teams aiming to improve l', 'itechnotion', '/workflows/images/8909.webp', '/workflows/json/8909.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8909', 'en', 'AI Lead Scoring & Enrichment from Mailchimp to HubSpot and Pipedrive with GPT-4o', 'This workflow automates the lead capture, enrichment, qualification, and CRM synchronization process for new subscribers from a Mailchimp list. It targets marketing and sales teams aiming to improve l')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8909', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'hubspot', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'pipedrive', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', 'mailchimpTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8909', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

-- Workflow 97: AI Lead Scoring & Routing with Google Gemini, Shee
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('8985', 'AI Lead Scoring & Routing with Google Gemini, Sheets and Slack Notifications', 'This workflow automates lead intake, sentiment classification, storage, and notification for lead management using AI and integration tools. It targets businesses or teams who receive leads via Typefo', 'meak', '/workflows/images/8985.webp', '/workflows/json/8985.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('8985', 'en', 'AI Lead Scoring & Routing with Google Gemini, Sheets and Slack Notifications', 'This workflow automates lead intake, sentiment classification, storage, and notification for lead management using AI and integration tools. It targets businesses or teams who receive leads via Typefo')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('8985', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'slack', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', 'googleSheets', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', '@n8n/n8n-nodes-langchain.sentimentAnalysis', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('8985', '@n8n/n8n-nodes-langchain.lmChatGoogleGemini', 1);

-- Workflow 98: AI Linux system administrator for managing Linux V
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3020', 'AI Linux system administrator for managing Linux VPS instance', 'This workflow enables AI-driven management of a Linux VPS instance through chat commands. It is designed for developers, system administrators, and IT professionals who want to interact with their Lin', 'hostinger', '/workflows/images/3020.webp', '/workflows/json/3020.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3020', 'en', 'AI Linux system administrator for managing Linux VPS instance', 'This workflow enables AI-driven management of a Linux VPS instance through chat commands. It is designed for developers, system administrators, and IT professionals who want to interact with their Lin')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3020', 10)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', '@n8n/n8n-nodes-langchain.agent', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', '@n8n/n8n-nodes-langchain.chatTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', '@n8n/n8n-nodes-langchain.lmChatOpenAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', '@n8n/n8n-nodes-langchain.toolWorkflow', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3020', '@n8n/n8n-nodes-langchain.toolHttpRequest', 1);

-- Workflow 99: AI Lyrics Study Bot for Telegram — Translation, Su
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('7195', 'AI Lyrics Study Bot for Telegram — Translation, Summary, Vocabulary', 'This workflow implements a Telegram bot specialized in analyzing song lyrics. It accepts commands with a song lyrics URL, downloads and cleans the lyrics text from the URL, then uses OpenAI’s language', 'followdrabbit', '/workflows/images/7195.webp', '/workflows/json/7195.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('7195', 'en', 'AI Lyrics Study Bot for Telegram — Translation, Summary, Vocabulary', 'This workflow implements a Telegram bot specialized in analyzing song lyrics. It accepts commands with a song lyrics URL, downloads and cleans the lyrics text from the URL, then uses OpenAI’s language')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('7195', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'noOp', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'openAi', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'switch', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'webhook', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'telegram', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('7195', 'httpRequest', 1);

-- Workflow 100: AI Marketing Agent for Lead Generation: Reddit + O
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('3935', 'AI Marketing Agent for Lead Generation: Reddit + OpenRouter + Gmail', 'This n8n workflow, titled **AI Marketing Agent for Lead Generation: Reddit + OpenRouter + Gmail**, is designed to automate lead generation by monitoring Reddit posts relevant to a user’s business or i', 'just-aristides', '/workflows/images/3935.webp', '/workflows/json/3935.json', 0, 0, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('3935', 'en', 'AI Marketing Agent for Lead Generation: Reddit + OpenRouter + Gmail', 'This n8n workflow, titled **AI Marketing Agent for Lead Generation: Reddit + OpenRouter + Gmail**, is designed to automate lead generation by monitoring Reddit posts relevant to a user’s business or i')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3935', 1)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('3935', 6)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'if', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'set', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'code', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'gmail', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'merge', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'reddit', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'splitOut', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'stickyNote', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'formTrigger', 1);

INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('3935', 'googleSheets', 1);


COMMIT;

-- Verify import
SELECT COUNT(*) as total_workflows FROM workflows;
SELECT COUNT(*) as total_translations FROM workflow_translations;
SELECT COUNT(*) as total_categories FROM workflow_categories;
SELECT COUNT(*) as total_nodes FROM workflow_nodes;

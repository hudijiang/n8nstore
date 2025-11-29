
import { createClient } from '@supabase/supabase-js';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Load env vars
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function updateDescription() {
    const id = '4448';

    const description = `此工作流旨在自动化新客户的入职流程，极大提高运营效率。

主要功能包括：
1. **自动触发**：当 Google Sheets 中新增行（通常来自 Google Form 提交）时自动启动。
2. **数据处理**：自动提取并结构化客户的关键信息（如姓名、邮箱、公司、需求）。
3. **AI 智能定制**：集成 Google Gemini AI 模型，根据客户的具体情况生成个性化的入职清单和欢迎邮件内容。
4. **邮件通知**：通过 Gmail 自动发送包含定制清单的欢迎邮件给客户。
5. **健壮性**：内置错误处理机制，确保流程稳定运行。

适用场景：
适用于需要处理大量新客户入职、希望提供个性化体验但又想节省人工成本的企业或代理商。`;

    console.log('Updating description for workflow', id);
    console.log('New Description:\n', description);

    // Update workflows table
    const { error: updateError } = await supabase
        .from('workflows')
        .update({ description: description })
        .eq('id', id);

    if (updateError) {
        console.error('Error updating workflows table:', updateError);
    } else {
        console.log('Successfully updated workflows table');
    }

    // Update translations table (for 'en' locale - treating it as default/Chinese for now based on user request for Chinese output)
    // Ideally we should have a 'zh' locale, but let's update 'en' to ensure it shows up since the UI might be defaulting to en or the user is viewing en.
    // Wait, the user asked for Chinese output. If the site is in English mode, showing Chinese might be weird, but the user specifically asked for it.
    // Let's update both if possible, or just the one that exists.

    const locales = ['en', 'zh'];

    for (const locale of locales) {
        const { data: existingTrans } = await supabase
            .from('workflow_translations')
            .select('*')
            .eq('workflow_id', id)
            .eq('locale', locale)
            .single();

        if (existingTrans) {
            const { error: transUpdateError } = await supabase
                .from('workflow_translations')
                .update({ description: description })
                .eq('workflow_id', id)
                .eq('locale', locale);

            if (transUpdateError) {
                console.error(`Error updating ${locale} translation:`, transUpdateError);
            } else {
                console.log(`Successfully updated ${locale} translation`);
            }
        } else if (locale === 'en') {
            // If en doesn't exist (unlikely), insert it
            const { error: transInsertError } = await supabase
                .from('workflow_translations')
                .insert({
                    workflow_id: id,
                    locale: 'en',
                    title: 'Client Onboarding Automation', // Keep title English or update? Let's keep title as is usually.
                    description: description
                });
            if (transInsertError) console.error('Error inserting en translation:', transInsertError);
        }
    }
}

updateDescription();

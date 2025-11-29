
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const JSON_DIR = path.join(__dirname, '../public/workflows/json');
const OUTPUT_FILE = path.join(__dirname, 'update_all_en_descriptions.sql');

console.log(`Scanning ${JSON_DIR}...`);

const files = fs.readdirSync(JSON_DIR).filter(f => f.endsWith('.json'));
console.log(`Found ${files.length} JSON files.`);

let sqlContent = '-- Batch update English descriptions\n\n';

let processed = 0;
let withDescription = 0;

for (const file of files) {
    const filePath = path.join(JSON_DIR, file);
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        const workflow = JSON.parse(content);
        const id = workflow.id; // This might be the internal ID, not the file ID. 
        // Actually, the filename seems to be the ID used in the store (e.g. 4448.json -> ID 4448).
        // But let's check if the internal ID matches or if we should use the filename.
        // The previous script used the directory name as ID. Here we have flat JSON files.
        // The filename is likely the ID we want to use for the database 'id' column if that's how they were imported.
        // Let's assume filename without extension is the ID.
        const fileId = path.basename(file, '.json');

        let description = workflow.meta?.description || '';

        if (!description) {
            // Try to find in sticky notes
            if (workflow.nodes) {
                const stickyNotes = workflow.nodes.filter(n => n.type === 'n8n-nodes-base.stickyNote');

                // Strategy 1: Look for "Description" or "Summary" in content
                let bestNote = stickyNotes.find(n =>
                    n.parameters?.content &&
                    (n.parameters.content.toLowerCase().includes('description') ||
                        n.parameters.content.toLowerCase().includes('summary'))
                );

                // Strategy 2: Longest note (likely the main description)
                if (!bestNote && stickyNotes.length > 0) {
                    bestNote = stickyNotes.reduce((prev, current) => {
                        const prevLen = prev.parameters?.content?.length || 0;
                        const currLen = current.parameters?.content?.length || 0;
                        return (currLen > prevLen) ? current : prev;
                    });
                }

                if (bestNote && bestNote.parameters?.content) {
                    description = bestNote.parameters.content;
                }
            }
        }

        if (description) {
            withDescription++;
            // Escape single quotes for SQL
            const escapedDesc = description.replace(/'/g, "''");
            const escapedTitle = (workflow.name || '').replace(/'/g, "''");

            sqlContent += `INSERT INTO workflow_translations (workflow_id, locale, title, description) VALUES ('${fileId}', 'en', '${escapedTitle}', '${escapedDesc}') ON CONFLICT (workflow_id, locale) DO UPDATE SET description = EXCLUDED.description, title = EXCLUDED.title;\n`;
        }

        processed++;
        if (processed % 500 === 0) console.log(`Processed ${processed} files...`);

    } catch (err) {
        console.error(`Error processing ${file}:`, err.message);
    }
}

fs.writeFileSync(OUTPUT_FILE, sqlContent);
console.log(`\nDone! Generated SQL for ${withDescription} workflows.`);
console.log(`Output file: ${OUTPUT_FILE}`);

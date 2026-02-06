-- Add stage_notes field to all stage tables

ALTER TABLE licenses ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS stage_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS stage_notes TEXT;

COMMENT ON COLUMN licenses.stage_notes IS 'ملاحظات عامة للمرحلة كاملة';
COMMENT ON COLUMN excavation_permits.stage_notes IS 'ملاحظات عامة للمرحلة كاملة';

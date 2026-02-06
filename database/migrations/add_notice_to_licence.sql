 ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS stage_notes TEXT;
  ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS stage_notes TEXT;
  ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS stage_notes TEXT;
  ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS stage_notes TEXT;
  ALTER TABLE road_work ADD COLUMN IF NOT EXISTS stage_notes TEXT;
  ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS stage_notes TEXT;

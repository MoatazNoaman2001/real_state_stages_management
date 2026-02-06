-- Migration: Add notes fields to all steps + new steps
-- Date: 2024
-- Description:
--   1. Add notes field to every step in all tables
--   2. Add 3 new steps to licenses
--   3. Add 1 new step to utility_meters
--   4. Add 1 new step to rooftop_additions
--   5. Add renewal alert fields to road_works

-- ============================================================
-- 1. LICENSES TABLE - Add 3 new steps + notes for all 22 steps
-- ============================================================

-- New Step 5: show_to_owner (after executive_status)
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS show_to_owner BOOLEAN DEFAULT FALSE;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS show_to_owner_date TIMESTAMP;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS show_to_owner_notes TEXT;

-- New Step 14: prepare_facade_boards (after issue_document)
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS prepare_facade_boards BOOLEAN DEFAULT FALSE;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS prepare_facade_boards_date TIMESTAMP;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS prepare_facade_boards_notes TEXT;

-- New Step 17: agency_review (after request_number)
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS agency_review BOOLEAN DEFAULT FALSE;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS agency_review_date TIMESTAMP;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS agency_review_notes TEXT;

-- Notes for existing steps
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS receive_documents_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS receive_authorization_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS site_validity_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS executive_status_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS review_with_agency_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS civil_defense_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS prepare_structural_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS prepare_structural_reports_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS submit_to_complex_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS supply_to_complex_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS do_complex_notes_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS issue_document_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS apply_online_for_license_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS request_number_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS determine_fees_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS pay_fees_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS issue_license_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS apply_for_structural_meter_notes TEXT;
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS give_board_copy_to_owner_notes TEXT;

-- ============================================================
-- 2. UTILITY_METERS TABLE - Add 1 new step + notes + fix field name
-- ============================================================

-- Rename authorizationd to authorization (fix typo)
ALTER TABLE utility_meters RENAME COLUMN authorizationd TO authorization;
ALTER TABLE utility_meters RENAME COLUMN authorizationd_date TO authorization_date;

-- New Step 5: print_letters
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS print_letters BOOLEAN DEFAULT FALSE;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS print_letters_date TIMESTAMP;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS print_letters_notes TEXT;

-- Notes for existing steps
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS receive_documents_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS authorization_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS apply_for_meter_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS inspection_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS supply_to_meter_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS contract_meter_notes TEXT;
ALTER TABLE utility_meters ADD COLUMN IF NOT EXISTS receive_meter_notes TEXT;

-- ============================================================
-- 3. EXCAVATION_PERMITS TABLE - Add notes for all 7 steps
-- ============================================================

ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS supervision_certificate_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS contract_agreement_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS approve_contract_from_union_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS supply_to_union_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS issue_excavation_permit_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS army_permit_notes TEXT;
ALTER TABLE excavation_permits ADD COLUMN IF NOT EXISTS equipment_permit_notes TEXT;

-- ============================================================
-- 4. EXECUTION_STAGES TABLE - Add notes for all 20 steps
-- ============================================================

ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS survey_1_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS excavation_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS replacement_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS survey_2_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS plain_concrete_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS reinforced_concrete_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS basement_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS basement_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS ground_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS ground_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS first_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS first_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS second_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS second_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS third_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS third_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS fourth_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS fourth_ceiling_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS fifth_columns_notes TEXT;
ALTER TABLE execution_stages ADD COLUMN IF NOT EXISTS fifth_ceiling_notes TEXT;

-- ============================================================
-- 5. ARCHITECTURAL_MODIFICATIONS TABLE - Add notes for all 10 steps
-- ============================================================

ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS draw_boards_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS field_inspection_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS draw_modifications_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS submit_request_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS request_number_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS inspection_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS inspection_from_agency_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS review_with_agency_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS approve_boards_notes TEXT;
ALTER TABLE architectural_modifications ADD COLUMN IF NOT EXISTS give_copy_to_owner_notes TEXT;

-- ============================================================
-- 6. ROAD_WORKS TABLE - Add supply step + renewal alert + notes
-- ============================================================

-- New Step 2: supply
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS supply BOOLEAN DEFAULT FALSE;
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS supply_date TIMESTAMP;
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS supply_notes TEXT;

-- Rename supply_amount if needed (keep existing)
-- ALTER TABLE road_works RENAME COLUMN supply_amount TO supply_amount;

-- Renewal alert fields
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS renewal_date TIMESTAMP;
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS renewal_alert_enabled BOOLEAN DEFAULT FALSE;

-- Notes for existing step
ALTER TABLE road_works ADD COLUMN IF NOT EXISTS submit_request_notes TEXT;

-- ============================================================
-- 7. ROOFTOP_ADDITIONS TABLE - Add 1 new step + notes for all 9 steps
-- ============================================================

-- New Step 5: print_letters (after review_with_agency)
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS print_letters BOOLEAN DEFAULT FALSE;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS print_letters_date TIMESTAMP;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS print_letters_notes TEXT;

-- Rename/Add supply step fields
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS supply BOOLEAN DEFAULT FALSE;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS supply_date TIMESTAMP;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS supply_notes TEXT;

-- Notes for existing steps
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS submit_request_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS pay_inspection_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS inspection_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS review_with_agency_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS initial_contract_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS supplementary_contract_notes TEXT;
ALTER TABLE rooftop_additions ADD COLUMN IF NOT EXISTS then_to_license_notes TEXT;

-- ============================================================
-- 8. INSPECTIONS TABLE - Add notes
-- ============================================================

ALTER TABLE inspections ADD COLUMN IF NOT EXISTS notes TEXT;

-- ============================================================
-- 9. SUPERVISION_CERTIFICATES TABLE - Add notes
-- ============================================================

ALTER TABLE supervision_certificates ADD COLUMN IF NOT EXISTS notes TEXT;

-- ============================================================
-- 10. SCHEDULED_ALERTS TABLE (NEW) - For custom scheduled alerts
-- ============================================================

CREATE TABLE IF NOT EXISTS scheduled_alerts (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    message TEXT,
    alert_date TIMESTAMP NOT NULL,
    alert_time TIME,
    repeat_type VARCHAR(50), -- 'once', 'daily', 'weekly', 'monthly'
    is_active BOOLEAN DEFAULT TRUE,
    is_triggered BOOLEAN DEFAULT FALSE,
    related_table VARCHAR(100),
    related_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_scheduled_alerts_date ON scheduled_alerts(alert_date);
CREATE INDEX IF NOT EXISTS idx_scheduled_alerts_customer ON scheduled_alerts(customer_id);
CREATE INDEX IF NOT EXISTS idx_scheduled_alerts_active ON scheduled_alerts(is_active);

-- ============================================================
-- DONE
-- ============================================================

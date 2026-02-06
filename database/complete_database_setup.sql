-- ═══════════════════════════════════════════════════════════════
-- Property Stages Management System - Complete Database Setup
-- PostgreSQL 15+
-- This file includes the base schema and all migrations
-- ═══════════════════════════════════════════════════════════════

BEGIN;

-- ═══════════════════════════════════════════════════════════════
-- DROP EXISTING TABLES (if any)
-- ═══════════════════════════════════════════════════════════════
DROP TABLE IF EXISTS scheduled_alerts CASCADE;
DROP TABLE IF EXISTS stage_history CASCADE;
DROP TABLE IF EXISTS alerts CASCADE;
DROP TABLE IF EXISTS company_projects CASCADE;
DROP TABLE IF EXISTS real_estate_projects CASCADE;
DROP TABLE IF EXISTS supervision_certificates CASCADE;
DROP TABLE IF EXISTS inspections CASCADE;
DROP TABLE IF EXISTS rooftop_additions CASCADE;
DROP TABLE IF EXISTS road_works CASCADE;
DROP TABLE IF EXISTS utility_meters CASCADE;
DROP TABLE IF EXISTS architectural_modifications CASCADE;
DROP TABLE IF EXISTS execution_stages CASCADE;
DROP TABLE IF EXISTS excavation_permits CASCADE;
DROP TABLE IF EXISTS licenses CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- ═══════════════════════════════════════════════════════════════
-- 1. CUSTOMERS TABLE (جدول العملاء)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    owner_name VARCHAR(255),
    phone VARCHAR(20),
    plot_number VARCHAR(100),
    project_number VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(255),
    current_stage VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_customers_name ON customers(customer_name);
CREATE INDEX idx_customers_plot ON customers(plot_number);

-- ═══════════════════════════════════════════════════════════════
-- 2. LICENSES TABLE (جدول التراخيص) - 22 خطوة
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE licenses (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Receive Documents
    receive_documents BOOLEAN DEFAULT FALSE,
    receive_documents_date TIMESTAMP,
    receive_documents_notes TEXT,

    -- Step 2: Receive Authorization
    receive_authorization BOOLEAN DEFAULT FALSE,
    receive_authorization_date TIMESTAMP,
    receive_authorization_notes TEXT,

    -- Step 3: Site Validity
    site_validity BOOLEAN DEFAULT FALSE,
    site_validity_date TIMESTAMP,
    site_validity_notes TEXT,

    -- Step 4: Executive Status
    executive_status BOOLEAN DEFAULT FALSE,
    executive_status_date TIMESTAMP,
    executive_status_notes TEXT,

    -- Step 5: Show to Owner (NEW)
    show_to_owner BOOLEAN DEFAULT FALSE,
    show_to_owner_date TIMESTAMP,
    show_to_owner_notes TEXT,

    -- Step 6: Review with Agency
    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,
    review_with_agency_notes TEXT,

    -- Step 7: Civil Defense
    civil_defense BOOLEAN DEFAULT FALSE,
    civil_defense_date TIMESTAMP,
    civil_defense_notes TEXT,

    -- Step 8: Prepare Structural
    prepare_structural BOOLEAN DEFAULT FALSE,
    prepare_structural_date TIMESTAMP,
    prepare_structural_notes TEXT,

    -- Step 9: Prepare Structural Reports
    prepare_structural_reports BOOLEAN DEFAULT FALSE,
    prepare_structural_reports_date TIMESTAMP,
    prepare_structural_reports_notes TEXT,

    -- Step 10: Submit to Complex
    submit_to_complex BOOLEAN DEFAULT FALSE,
    submit_to_complex_date TIMESTAMP,
    submit_to_complex_notes TEXT,

    -- Step 11: Supply to Complex
    supply_to_complex BOOLEAN DEFAULT FALSE,
    supply_to_complex_date TIMESTAMP,
    complex_supply_amount DECIMAL(10,2),
    supply_to_complex_notes TEXT,

    -- Step 12: Do Complex Notes
    do_complex_notes BOOLEAN DEFAULT FALSE,
    do_complex_notes_date TIMESTAMP,
    do_complex_notes_notes TEXT,

    -- Step 13: Issue Document
    issue_document BOOLEAN DEFAULT FALSE,
    issue_document_date TIMESTAMP,
    issue_document_notes TEXT,

    -- Step 14: Prepare Facade Boards (NEW)
    prepare_facade_boards BOOLEAN DEFAULT FALSE,
    prepare_facade_boards_date TIMESTAMP,
    prepare_facade_boards_notes TEXT,

    -- Step 15: Apply Online for License
    apply_online_for_license BOOLEAN DEFAULT FALSE,
    apply_online_for_license_date TIMESTAMP,
    apply_online_for_license_notes TEXT,

    -- Step 16: Request Number
    request_number VARCHAR(100),
    request_number_notes TEXT,

    -- Step 17: Agency Review (NEW)
    agency_review BOOLEAN DEFAULT FALSE,
    agency_review_date TIMESTAMP,
    agency_review_notes TEXT,

    -- Step 18: Determine Fees
    determine_fees BOOLEAN DEFAULT FALSE,
    determine_fees_date TIMESTAMP,
    determine_fees_notes TEXT,

    -- Step 19: Pay Fees
    pay_fees BOOLEAN DEFAULT FALSE,
    pay_fees_date TIMESTAMP,
    fees_amount DECIMAL(10,2),
    pay_fees_notes TEXT,

    -- Step 20: Issue License
    issue_license BOOLEAN DEFAULT FALSE,
    issue_license_date TIMESTAMP,
    issue_license_notes TEXT,

    -- Step 21: Apply for Structural Meter
    apply_for_structural_meter BOOLEAN DEFAULT FALSE,
    apply_for_structural_meter_date TIMESTAMP,
    apply_for_structural_meter_notes TEXT,

    -- Step 22: Give Board Copy to Owner
    give_board_copy_to_owner BOOLEAN DEFAULT FALSE,
    give_board_copy_to_owner_date TIMESTAMP,
    give_board_copy_to_owner_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_licenses_customer ON licenses(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 3. EXCAVATION PERMITS TABLE (جدول تصاريح الحفر) - 7 خطوات
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE excavation_permits (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Supervision Certificate
    supervision_certificate BOOLEAN DEFAULT FALSE,
    supervision_certificate_date TIMESTAMP,
    supervision_certificate_notes TEXT,

    -- Step 2: Contract Agreement
    contract_agreement BOOLEAN DEFAULT FALSE,
    contract_agreement_date TIMESTAMP,
    contract_agreement_notes TEXT,

    -- Step 3: Approve Contract from Union
    approve_contract_from_union BOOLEAN DEFAULT FALSE,
    approve_contract_from_union_date TIMESTAMP,
    approve_contract_from_union_notes TEXT,

    -- Step 4: Supply to Union
    supply_to_union BOOLEAN DEFAULT FALSE,
    supply_to_union_date TIMESTAMP,
    union_supply_amount DECIMAL(10,2),
    supply_to_union_notes TEXT,

    -- Step 5: Issue Excavation Permit
    issue_excavation_permit BOOLEAN DEFAULT FALSE,
    issue_excavation_permit_date TIMESTAMP,
    issue_excavation_permit_notes TEXT,

    -- Step 6: Army Permit
    army_permit BOOLEAN DEFAULT FALSE,
    army_permit_date TIMESTAMP,
    army_permit_notes TEXT,

    -- Step 7: Equipment Permit
    equipment_permit BOOLEAN DEFAULT FALSE,
    equipment_permit_date TIMESTAMP,
    equipment_permit_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_excavation_customer ON excavation_permits(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 4. EXECUTION STAGES TABLE (جدول مراحل التنفيذ) - 20 مرحلة
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE execution_stages (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Survey 1
    survey_1 BOOLEAN DEFAULT FALSE,
    survey_1_date TIMESTAMP,
    survey_1_notes TEXT,

    -- Step 2: Excavation
    excavation BOOLEAN DEFAULT FALSE,
    excavation_date TIMESTAMP,
    excavation_notes TEXT,

    -- Step 3: Replacement
    replacement BOOLEAN DEFAULT FALSE,
    replacement_date TIMESTAMP,
    replacement_notes TEXT,

    -- Step 4: Survey 2
    survey_2 BOOLEAN DEFAULT FALSE,
    survey_2_date TIMESTAMP,
    survey_2_notes TEXT,

    -- Step 5: Plain Concrete
    plain_concrete BOOLEAN DEFAULT FALSE,
    plain_concrete_date TIMESTAMP,
    plain_concrete_notes TEXT,

    -- Step 6: Reinforced Concrete
    reinforced_concrete BOOLEAN DEFAULT FALSE,
    reinforced_concrete_date TIMESTAMP,
    reinforced_concrete_notes TEXT,

    -- Step 7: Basement Columns
    basement_columns BOOLEAN DEFAULT FALSE,
    basement_columns_date TIMESTAMP,
    basement_columns_notes TEXT,

    -- Step 8: Basement Ceiling
    basement_ceiling BOOLEAN DEFAULT FALSE,
    basement_ceiling_date TIMESTAMP,
    basement_ceiling_notes TEXT,

    -- Step 9: Ground Columns
    ground_columns BOOLEAN DEFAULT FALSE,
    ground_columns_date TIMESTAMP,
    ground_columns_notes TEXT,

    -- Step 10: Ground Ceiling
    ground_ceiling BOOLEAN DEFAULT FALSE,
    ground_ceiling_date TIMESTAMP,
    ground_ceiling_notes TEXT,

    -- Step 11: First Columns
    first_columns BOOLEAN DEFAULT FALSE,
    first_columns_date TIMESTAMP,
    first_columns_notes TEXT,

    -- Step 12: First Ceiling
    first_ceiling BOOLEAN DEFAULT FALSE,
    first_ceiling_date TIMESTAMP,
    first_ceiling_notes TEXT,

    -- Step 13: Second Columns
    second_columns BOOLEAN DEFAULT FALSE,
    second_columns_date TIMESTAMP,
    second_columns_notes TEXT,

    -- Step 14: Second Ceiling
    second_ceiling BOOLEAN DEFAULT FALSE,
    second_ceiling_date TIMESTAMP,
    second_ceiling_notes TEXT,

    -- Step 15: Third Columns
    third_columns BOOLEAN DEFAULT FALSE,
    third_columns_date TIMESTAMP,
    third_columns_notes TEXT,

    -- Step 16: Third Ceiling
    third_ceiling BOOLEAN DEFAULT FALSE,
    third_ceiling_date TIMESTAMP,
    third_ceiling_notes TEXT,

    -- Step 17: Fourth Columns
    fourth_columns BOOLEAN DEFAULT FALSE,
    fourth_columns_date TIMESTAMP,
    fourth_columns_notes TEXT,

    -- Step 18: Fourth Ceiling
    fourth_ceiling BOOLEAN DEFAULT FALSE,
    fourth_ceiling_date TIMESTAMP,
    fourth_ceiling_notes TEXT,

    -- Step 19: Fifth Columns
    fifth_columns BOOLEAN DEFAULT FALSE,
    fifth_columns_date TIMESTAMP,
    fifth_columns_notes TEXT,

    -- Step 20: Fifth Ceiling
    fifth_ceiling BOOLEAN DEFAULT FALSE,
    fifth_ceiling_date TIMESTAMP,
    fifth_ceiling_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_execution_customer ON execution_stages(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 5. ARCHITECTURAL MODIFICATIONS TABLE (جدول التعديلات المعمارية) - 10 خطوات
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE architectural_modifications (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Draw Boards
    draw_boards BOOLEAN DEFAULT FALSE,
    draw_boards_date TIMESTAMP,
    draw_boards_notes TEXT,

    -- Step 2: Field Inspection
    field_inspection BOOLEAN DEFAULT FALSE,
    field_inspection_date TIMESTAMP,
    field_inspection_notes TEXT,

    -- Step 3: Draw Modifications
    draw_modifications BOOLEAN DEFAULT FALSE,
    draw_modifications_date TIMESTAMP,
    draw_modifications_notes TEXT,

    -- Step 4: Submit Request
    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,
    submit_request_notes TEXT,

    -- Step 5: Request Number
    request_number VARCHAR(100),
    request_number_notes TEXT,

    -- Step 6: Inspection Date
    inspection_date DATE,
    inspection_notes TEXT,

    -- Step 7: Inspection from Agency
    inspection_from_agency BOOLEAN DEFAULT FALSE,
    inspection_from_agency_date TIMESTAMP,
    inspection_amount DECIMAL(10,2),
    inspection_from_agency_notes TEXT,

    -- Step 8: Review with Agency
    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,
    review_with_agency_notes TEXT,

    -- Step 9: Approve Boards
    approve_boards BOOLEAN DEFAULT FALSE,
    approve_boards_date TIMESTAMP,
    approve_boards_notes TEXT,

    -- Step 10: Give Copy to Owner
    give_copy_to_owner BOOLEAN DEFAULT FALSE,
    give_copy_to_owner_date TIMESTAMP,
    give_copy_to_owner_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_architectural_customer ON architectural_modifications(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 6. UTILITY METERS TABLE (جدول توصيل العدادات) - 8 خطوات
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE utility_meters (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Receive Documents
    receive_documents BOOLEAN DEFAULT FALSE,
    receive_documents_date TIMESTAMP,
    receive_documents_notes TEXT,

    -- Step 2: Authorization (fixed typo)
    authorization_var BOOLEAN DEFAULT FALSE,
    authorization_var_date TIMESTAMP,
    authorization_notes TEXT,

    -- Step 3: Apply for Meter
    apply_for_meter BOOLEAN DEFAULT FALSE,
    apply_for_meter_date TIMESTAMP,
    apply_for_meter_notes TEXT,

    -- Step 4: Inspection
    inspection_date DATE,
    inspection_amount DECIMAL(10,2),
    inspection_notes TEXT,

    -- Step 5: Print Letters (NEW)
    print_letters BOOLEAN DEFAULT FALSE,
    print_letters_date TIMESTAMP,
    print_letters_notes TEXT,

    -- Step 6: Supply to Meter
    supply_to_meter BOOLEAN DEFAULT FALSE,
    supply_to_meter_date TIMESTAMP,
    supply_amount_1 DECIMAL(10,2),
    supply_amount_2 DECIMAL(10,2),
    supply_amount_3 DECIMAL(10,2),
    supply_amount_4 DECIMAL(10,2),
    supply_to_meter_notes TEXT,

    -- Step 7: Contract Meter
    contract_meter BOOLEAN DEFAULT FALSE,
    contract_meter_date TIMESTAMP,
    contract_meter_notes TEXT,

    -- Step 8: Receive Meter
    receive_meter BOOLEAN DEFAULT FALSE,
    receive_meter_date TIMESTAMP,
    receive_meter_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_utility_customer ON utility_meters(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 7. ROAD WORKS TABLE (جدول أشغال الطريق) - 2 خطوة + تجديد
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE road_works (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Submit Request
    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,
    submit_request_notes TEXT,

    -- Step 2: Supply (NEW)
    supply BOOLEAN DEFAULT FALSE,
    supply_date TIMESTAMP,
    supply_amount DECIMAL(10,2),
    supply_notes TEXT,

    -- Renewal Alert Fields
    renewal_date TIMESTAMP,
    renewal_alert_enabled BOOLEAN DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_roadworks_customer ON road_works(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 8. ROOFTOP ADDITIONS TABLE (جدول تعليات غرف السطح) - 9 خطوات
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE rooftop_additions (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- Step 1: Submit Request
    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,
    submit_request_notes TEXT,

    -- Step 2: Pay Inspection
    pay_inspection BOOLEAN DEFAULT FALSE,
    pay_inspection_date TIMESTAMP,
    inspection_amount DECIMAL(10,2),
    pay_inspection_notes TEXT,

    -- Step 3: Inspection Date
    inspection_date DATE,
    inspection_notes TEXT,

    -- Step 4: Review with Agency
    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,
    review_with_agency_notes TEXT,

    -- Step 5: Print Letters (NEW)
    print_letters BOOLEAN DEFAULT FALSE,
    print_letters_date TIMESTAMP,
    print_letters_notes TEXT,

    -- Step 6: Supply
    supply BOOLEAN DEFAULT FALSE,
    supply_date TIMESTAMP,
    supply_amount DECIMAL(10,2),
    supply_notes TEXT,

    -- Step 7: Initial Contract
    initial_contract BOOLEAN DEFAULT FALSE,
    initial_contract_date TIMESTAMP,
    initial_contract_notes TEXT,

    -- Step 8: Supplementary Contract
    supplementary_contract BOOLEAN DEFAULT FALSE,
    supplementary_contract_date TIMESTAMP,
    supplementary_contract_notes TEXT,

    -- Step 9: Then to License
    then_to_license BOOLEAN DEFAULT FALSE,
    then_to_license_date TIMESTAMP,
    then_to_license_notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_rooftop_customer ON rooftop_additions(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 9. INSPECTIONS TABLE (جدول المعاينات)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE inspections (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    reason TEXT,
    inspection_date DATE,
    status VARCHAR(50) DEFAULT 'pending',
    notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_inspections_customer ON inspections(customer_id);
CREATE INDEX idx_inspections_date ON inspections(inspection_date);

-- ═══════════════════════════════════════════════════════════════
-- 10. SUPERVISION CERTIFICATES TABLE (جدول شهادات الإشراف)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE supervision_certificates (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    engineer_name VARCHAR(255),
    certificate_date DATE,
    notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_certificates_customer ON supervision_certificates(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 11. REAL ESTATE PROJECTS TABLE (جدول المشاريع العقارية)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE real_estate_projects (
    id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    current_status TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ═══════════════════════════════════════════════════════════════
-- 12. COMPANY PROJECTS TABLE (جدول المشروعات)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE company_projects (
    id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    current_status TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ═══════════════════════════════════════════════════════════════
-- 13. ALERTS TABLE (جدول التنبيهات)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE alerts (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    alert_type VARCHAR(100),
    message TEXT,
    alert_date DATE,
    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_alerts_customer ON alerts(customer_id);
CREATE INDEX idx_alerts_active ON alerts(is_active);

-- ═══════════════════════════════════════════════════════════════
-- 14. STAGE HISTORY TABLE (جدول تتبع المراحل)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE stage_history (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    stage_name VARCHAR(100),
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    duration_days INTEGER,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_stage_history_customer ON stage_history(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 15. SCHEDULED ALERTS TABLE (جدول التنبيهات المجدولة) - NEW
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE scheduled_alerts (
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

CREATE INDEX idx_scheduled_alerts_date ON scheduled_alerts(alert_date);
CREATE INDEX idx_scheduled_alerts_customer ON scheduled_alerts(customer_id);
CREATE INDEX idx_scheduled_alerts_active ON scheduled_alerts(is_active);
--
---- ═══════════════════════════════════════════════════════════════
---- SAMPLE DATA (for testing - optional)
---- ═══════════════════════════════════════════════════════════════
--
--INSERT INTO customers (customer_name, owner_name, phone, plot_number, project_number, username, current_stage, notes) VALUES
--('أحمد محمد علي', 'محمد علي حسن', '01012345678', '123', 'PR001', 'ahmed123', 'التراخيص', 'عميل جديد'),
--('محمود حسن إبراهيم', 'حسن إبراهيم محمد', '01098765432', '456', 'PR002', 'mahmoud456', 'تصريح الحفر', 'تم استلام الأوراق'),
--('فاطمة أحمد', 'أحمد محمود', '01123456789', '789', 'PR003', 'fatma789', 'التنفيذ', 'جاري العمل'),
--('علي حسين', 'حسين محمد', '01234567890', '321', 'PR004', 'ali321', 'التراخيص', 'في انتظار المعاينة'),
--('سارة محمود', 'محمود أحمد', '01056789012', '654', 'PR005', 'sara654', 'التعديلات المعمارية', 'تم تقديم الطلب'),
--('خالد عبدالله', 'عبدالله خالد', '01187654321', '987', 'PR006', 'khaled987', 'توصيل العدادات', 'في المعاينة'),
--('منى سعيد', 'سعيد محمد', '01098123456', '147', 'PR007', 'mona147', 'التراخيص', 'مستندات كاملة');
--
---- Sample Licenses
--INSERT INTO licenses (customer_id, receive_documents, receive_authorization, complex_supply_amount, fees_amount) VALUES
--(1, TRUE, TRUE, 5000.00, 3000.00),
--(2, TRUE, FALSE, 4500.00, 2800.00),
--(4, TRUE, TRUE, 6000.00, 3500.00);
--
---- Sample Inspections
--INSERT INTO inspections (customer_id, reason, inspection_date, status) VALUES
--(1, 'معاينة موقع', '2026-02-15', 'completed'),
--(3, 'معاينة نهائية', '2026-02-20', 'pending'),
--(5, 'معاينة تعديلات', '2026-02-18', 'pending');

-- ═══════════════════════════════════════════════════════════════
-- TRANSACTION COMPLETE
-- ═══════════════════════════════════════════════════════════════

COMMIT;

-- ═══════════════════════════════════════════════════════════════
-- END OF SCRIPT
-- Database setup complete!
--
-- This file includes:
-- - 15 tables with complete schema
-- - All indexes for optimal performance
-- - 3 new steps in licenses table
-- - 1 new step in utility_meters table
-- - 1 new step in rooftop_additions table
-- - Notes fields for all steps in all tables
-- - Renewal alert fields in road_works table
-- - New scheduled_alerts table
-- - Sample data for testing (7 customers, 3 licenses, 3 inspections)
-- ═══════════════════════════════════════════════════════════════

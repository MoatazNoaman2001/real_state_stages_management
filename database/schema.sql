-- ═══════════════════════════════════════════════════════════════
-- Property Stages Management System - Database Schema
-- PostgreSQL 15+
-- ═══════════════════════════════════════════════════════════════

-- Drop existing tables (للتطوير فقط)
drop TABLE IF EXISTS stage_history CASCADE;
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
-- 1. جدول العملاء (Customers)
-- ═══════════════════════════════════════════════════════════════
CREATE table customers (
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
-- 2. جدول التراخيص (Licenses) - 19 خطوة
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE licenses (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    -- الخطوات (19 خطوة)
    receive_documents BOOLEAN DEFAULT FALSE,
    receive_documents_date TIMESTAMP,

    receive_authorization BOOLEAN DEFAULT FALSE,
    receive_authorization_date TIMESTAMP,

    site_validity BOOLEAN DEFAULT FALSE,
    site_validity_date TIMESTAMP,

    executive_status BOOLEAN DEFAULT FALSE,
    executive_status_date TIMESTAMP,

    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,

    civil_defense BOOLEAN DEFAULT FALSE,
    civil_defense_date TIMESTAMP,

    prepare_structural BOOLEAN DEFAULT FALSE,
    prepare_structural_date TIMESTAMP,

    prepare_structural_reports BOOLEAN DEFAULT FALSE,
    prepare_structural_reports_date TIMESTAMP,

    submit_to_complex BOOLEAN DEFAULT FALSE,
    submit_to_complex_date TIMESTAMP,

    supply_to_complex BOOLEAN DEFAULT FALSE,
    supply_to_complex_date TIMESTAMP,
    complex_supply_amount DECIMAL(10,2),

    do_complex_notes BOOLEAN DEFAULT FALSE,
    do_complex_notes_date TIMESTAMP,

    issue_document BOOLEAN DEFAULT FALSE,
    issue_document_date TIMESTAMP,

    apply_online_for_license BOOLEAN DEFAULT FALSE,
    apply_online_for_license_date TIMESTAMP,

    request_number VARCHAR(100),

    determine_fees BOOLEAN DEFAULT FALSE,
    determine_fees_date TIMESTAMP,

    pay_fees BOOLEAN DEFAULT FALSE,
    pay_fees_date TIMESTAMP,
    fees_amount DECIMAL(10,2),

    issue_license BOOLEAN DEFAULT FALSE,
    issue_license_date TIMESTAMP,

    apply_for_structural_meter BOOLEAN DEFAULT FALSE,
    apply_for_structural_meter_date TIMESTAMP,

    give_board_copy_to_owner BOOLEAN DEFAULT FALSE,
    give_board_copy_to_owner_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_licenses_customer ON licenses(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 3. جدول تصاريح الحفر (Excavation Permits) - 7 خطوات
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE excavation_permits (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    supervision_certificate BOOLEAN DEFAULT FALSE,
    supervision_certificate_date TIMESTAMP,

    contract_agreement BOOLEAN DEFAULT FALSE,
    contract_agreement_date TIMESTAMP,

    approve_contract_from_union BOOLEAN DEFAULT FALSE,
    approve_contract_from_union_date TIMESTAMP,

    supply_to_union BOOLEAN DEFAULT FALSE,
    supply_to_union_date TIMESTAMP,
    union_supply_amount DECIMAL(10,2),

    issue_excavation_permit BOOLEAN DEFAULT FALSE,
    issue_excavation_permit_date TIMESTAMP,

    army_permit BOOLEAN DEFAULT FALSE,
    army_permit_date TIMESTAMP,

    equipment_permit BOOLEAN DEFAULT FALSE,
    equipment_permit_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_excavation_customer ON excavation_permits(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 4. جدول مراحل التنفيذ (Execution Stages) - 20 مرحلة
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE execution_stages (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    survey_1 BOOLEAN DEFAULT FALSE,
    survey_1_date TIMESTAMP,

    excavation BOOLEAN DEFAULT FALSE,
    excavation_date TIMESTAMP,

    replacement BOOLEAN DEFAULT FALSE,
    replacement_date TIMESTAMP,

    survey_2 BOOLEAN DEFAULT FALSE,
    survey_2_date TIMESTAMP,

    plain_concrete BOOLEAN DEFAULT FALSE,
    plain_concrete_date TIMESTAMP,

    reinforced_concrete BOOLEAN DEFAULT FALSE,
    reinforced_concrete_date TIMESTAMP,

    basement_columns BOOLEAN DEFAULT FALSE,
    basement_columns_date TIMESTAMP,

    basement_ceiling BOOLEAN DEFAULT FALSE,
    basement_ceiling_date TIMESTAMP,

    ground_columns BOOLEAN DEFAULT FALSE,
    ground_columns_date TIMESTAMP,

    ground_ceiling BOOLEAN DEFAULT FALSE,
    ground_ceiling_date TIMESTAMP,

    first_columns BOOLEAN DEFAULT FALSE,
    first_columns_date TIMESTAMP,

    first_ceiling BOOLEAN DEFAULT FALSE,
    first_ceiling_date TIMESTAMP,

    second_columns BOOLEAN DEFAULT FALSE,
    second_columns_date TIMESTAMP,

    second_ceiling BOOLEAN DEFAULT FALSE,
    second_ceiling_date TIMESTAMP,

    third_columns BOOLEAN DEFAULT FALSE,
    third_columns_date TIMESTAMP,

    third_ceiling BOOLEAN DEFAULT FALSE,
    third_ceiling_date TIMESTAMP,

    fourth_columns BOOLEAN DEFAULT FALSE,
    fourth_columns_date TIMESTAMP,

    fourth_ceiling BOOLEAN DEFAULT FALSE,
    fourth_ceiling_date TIMESTAMP,

    fifth_columns BOOLEAN DEFAULT FALSE,
    fifth_columns_date TIMESTAMP,

    fifth_ceiling BOOLEAN DEFAULT FALSE,
    fifth_ceiling_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_execution_customer ON execution_stages(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 5. جدول التعديلات المعمارية (Architectural Modifications)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE architectural_modifications (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    draw_boards BOOLEAN DEFAULT FALSE,
    draw_boards_date TIMESTAMP,

    field_inspection BOOLEAN DEFAULT FALSE,
    field_inspection_date TIMESTAMP,

    draw_modifications BOOLEAN DEFAULT FALSE,
    draw_modifications_date TIMESTAMP,

    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,

    request_number VARCHAR(100),

    inspection_date DATE,

    inspection_from_agency BOOLEAN DEFAULT FALSE,
    inspection_from_agency_date TIMESTAMP,
    inspection_amount DECIMAL(10,2),

    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,

    approve_boards BOOLEAN DEFAULT FALSE,
    approve_boards_date TIMESTAMP,

    give_copy_to_owner BOOLEAN DEFAULT FALSE,
    give_copy_to_owner_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_architectural_customer ON architectural_modifications(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 6. جدول توصيل العدادات (Utility Meters)
-- ═══════════════════════════════════════════════════════════════
create table utility_meters (
 id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    receive_documents BOOLEAN DEFAULT FALSE,
    receive_documents_date TIMESTAMP,

    authorizationd BOOLEAN DEFAULT FALSE,
    authorizationd_date TIMESTAMP,

    apply_for_meter BOOLEAN DEFAULT FALSE,
    apply_for_meter_date TIMESTAMP,

    inspection_date DATE,
    inspection_amount DECIMAL(10,2),

    supply_to_meter BOOLEAN DEFAULT FALSE,
    supply_to_meter_date TIMESTAMP,
    supply_amount_1 DECIMAL(10,2),
    supply_amount_2 DECIMAL(10,2),
    supply_amount_3 DECIMAL(10,2),
    supply_amount_4 DECIMAL(10,2),

    contract_meter BOOLEAN DEFAULT FALSE,
    contract_meter_date TIMESTAMP,

    receive_meter BOOLEAN DEFAULT FALSE,
    receive_meter_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_utility_customer ON utility_meters(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 7. جدول أشغال الطريق (Road Works)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE road_works (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,

    supply_amount DECIMAL(10,2),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_roadworks_customer ON road_works(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 8. جدول تعليات غرف السطح (Rooftop Additions)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE rooftop_additions (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    submit_request BOOLEAN DEFAULT FALSE,
    submit_request_date TIMESTAMP,

    pay_inspection BOOLEAN DEFAULT FALSE,
    pay_inspection_date TIMESTAMP,
    inspection_amount DECIMAL(10,2),

    inspection_date DATE,

    review_with_agency BOOLEAN DEFAULT FALSE,
    review_with_agency_date TIMESTAMP,

    supply_amount DECIMAL(10,2),

    initial_contract BOOLEAN DEFAULT FALSE,
    initial_contract_date TIMESTAMP,

    supplementary_contract BOOLEAN DEFAULT FALSE,
    supplementary_contract_date TIMESTAMP,

    then_to_license BOOLEAN DEFAULT FALSE,
    then_to_license_date TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_rooftop_customer ON rooftop_additions(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 9. جدول المعاينات (Inspections)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE inspections (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    reason TEXT,
    inspection_date DATE,
    status VARCHAR(50) DEFAULT 'pending',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_inspections_customer ON inspections(customer_id);
CREATE INDEX idx_inspections_date ON inspections(inspection_date);

-- ═══════════════════════════════════════════════════════════════
-- 10. جدول شهادات الإشراف (Supervision Certificates)
-- ═══════════════════════════════════════════════════════════════
CREATE TABLE supervision_certificates (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,

    engineer_name VARCHAR(255),
    certificate_date DATE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_certificates_customer ON supervision_certificates(customer_id);

-- ═══════════════════════════════════════════════════════════════
-- 11. جدول المشاريع العقارية (Real Estate Projects)
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
-- 12. جدول المشروعات (Company Projects)
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
-- 13. جدول التنبيهات (Alerts)
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
-- 14. جدول تتبع المراحل (Stage History)
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
-- Sample Data (للتطوير والاختبار)
-- ═══════════════════════════════════════════════════════════════

INSERT INTO customers (customer_name, owner_name, phone, plot_number, project_number, username, current_stage, notes) VALUES
('أحمد محمد علي', 'محمد علي حسن', '01012345678', '123', 'PR001', 'ahmed123', 'التراخيص', 'عميل جديد'),
('محمود حسن إبراهيم', 'حسن إبراهيم محمد', '01098765432', '456', 'PR002', 'mahmoud456', 'تصريح الحفر', 'تم استلام الأوراق'),
('فاطمة أحمد', 'أحمد محمود', '01123456789', '789', 'PR003', 'fatma789', 'التنفيذ', 'جاري العمل'),
('علي حسين', 'حسين محمد', '01234567890', '321', 'PR004', 'ali321', 'التراخيص', 'في انتظار المعاينة'),
('سارة محمود', 'محمود أحمد', '01056789012', '654', 'PR005', 'sara654', 'التعديلات المعمارية', 'تم تقديم الطلب'),
('خالد عبدالله', 'عبدالله خالد', '01187654321', '987', 'PR006', 'khaled987', 'توصيل العدادات', 'في المعاينة'),
('منى سعيد', 'سعيد محمد', '01098123456', '147', 'PR007', 'mona147', 'التراخيص', 'مستندات كاملة');

-- Sample Licenses
INSERT INTO licenses (customer_id, receive_documents, receive_authorization, complex_supply_amount, fees_amount) VALUES
(1, TRUE, TRUE, 5000.00, 3000.00),
(2, TRUE, FALSE, 4500.00, 2800.00),
(4, TRUE, TRUE, 6000.00, 3500.00);

-- Sample Inspections
INSERT INTO inspections (customer_id, reason, inspection_date, status) VALUES
(1, 'معاينة موقع', '2026-02-15', 'completed'),
(3, 'معاينة نهائية', '2026-02-20', 'pending'),
(5, 'معاينة تعديلات', '2026-02-18', 'pending');

COMMIT;
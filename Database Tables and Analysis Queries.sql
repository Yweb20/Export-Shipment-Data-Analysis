-- ============================================================
-- Database 1: export_db
-- Purpose:
-- This database represents a simplified and normalized export
-- shipment system. It is designed to demonstrate relational
-- database concepts such as primary keys, foreign keys,
-- normalization, and JOIN queries for compliance analysis.
-- ============================================================

CREATE DATABASE export_db;

USE export_db;


CREATE TABLE exporters (
IEC VARCHAR(20) PRIMARY KEY, 
GST_Details VARCHAR(10)
);

CREATE TABLE shipments (
    SB_No VARCHAR(20) PRIMARY KEY,
    SB_Date DATE,
    PORT VARCHAR(50),
    Gateway VARCHAR(50),
    EGM_No VARCHAR(20),
    Status VARCHAR(30),
    IEC VARCHAR(20),
    FOREIGN KEY (IEC) REFERENCES exporters(IEC)
);

CREATE TABLE compliance (
    SB_No VARCHAR(20),
    ROSL VARCHAR(10),
    GST_Compliance_Status VARCHAR(20),
    PRIMARY KEY (SB_No),
    FOREIGN KEY (SB_No) REFERENCES shipments(SB_No)
);


INSERT INTO exporters VALUES
('IEC001','YES'),
('IEC002','NO');

INSERT INTO shipments VALUES
('SB001','2024-01-10','JNPT','Mumbai','EGM01','Completed','IEC001'),
('SB002','2024-01-15','Chennai','Chennai','EGM02','Pending','IEC002');

INSERT INTO compliance VALUES
('SB001','YES','Compliant'),
('SB002','NO','Non-Compliant');

SELECT s.SB_No, s.PORT, s.Status, e.GST_Details
FROM shipments s
JOIN exporters e ON s.IEC = e.IEC;

SELECT s.SB_No, s.PORT, c.GST_Compliance_Status
FROM shipments s
JOIN compliance c ON s.SB_No = c.SB_No
WHERE c.GST_Compliance_Status = 'Non-Compliant';

SELECT PORT, COUNT(*) AS total_shipments
FROM shipments
GROUP BY PORT
ORDER BY total_shipments DESC;


#I normalized the dataset into multiple relational tables, assigned primary and foreign keys, and wrote JOIN queries to retrieve combined operational and compliance data.

-- ============================================================
-- Database 2: shipment_db
-- Purpose:
-- This database represents the main project schema used for
-- detailed shipment, GST compliance, and EGM analysis.
-- It is structured to support reporting, dashboard creation,
-- and business insights (Power BI / analytics use case).
-- ============================================================

CREATE DATABASE shipment_db;

USE shipment_db;

CREATE TABLE Shipment_Info (
    SB_no INT PRIMARY KEY,
    SB_date DATE,
    Details VARCHAR(255),
    Shipment_Type VARCHAR(50),
    Port_Code VARCHAR(50),
    SB_Year INT,
    Status_Priority INT
);

CREATE TABLE Exporter_Compliance (
    SB_no INT PRIMARY KEY,
    GST VARCHAR(50),
    GST_Compliance_Status VARCHAR(50),
    GST_Flag VARCHAR(20),
    ROSL VARCHAR(20),
    ROSL_Flag VARCHAR(20),
    Gateway VARCHAR(50),
    FOREIGN KEY (SB_no) REFERENCES Shipment_Info(SB_no)
);

CREATE TABLE EGM_Info (
    SB_no INT PRIMARY KEY,
    EGM_no VARCHAR(50),
    EGM_Flag VARCHAR(20),
    FOREIGN KEY (SB_no) REFERENCES Shipment_Info(SB_no)
);

INSERT INTO Shipment_Info
VALUES (1001, '2024-03-15', 'Export shipment', 'Normal', 'MUM', 2024, 1);

INSERT INTO Exporter_Compliance
VALUES (1001, '27ABCDE1234F1Z5', 'Compliant', 'Compliant', 'YES', 'Available', 'ICEGATE');

INSERT INTO EGM_Info
VALUES (1001, 'EGM98765', 'Available');

INSERT INTO Shipment_Info
VALUES (1001, '2024-03-15', 'Export shipment', 'Normal', 'MUM', 2024, 1);

INSERT INTO Exporter_Compliance
VALUES (1001, '27ABCDE1234F1Z5', 'Compliant', 'Compliant', 'YES', 'Available', 'ICEGATE');

SELECT Port_Code, COUNT(*) AS Total_Shipments
FROM Shipment_Info
GROUP BY Port_Code;

SELECT GST_Flag, COUNT(*) AS Shipments
FROM Exporter_Compliance
GROUP BY GST_Flag;

SELECT S.SB_no, S.Port_Code, S.SB_Year, E.EGM_no, E.EGM_Flag
FROM Shipment_Info S
JOIN EGM_Info E ON S.SB_no = E.SB_no
WHERE E.EGM_Flag = 'Available';
-- Drop all pre-build tables

DROP TABLE Notification;
DROP TABLE CITATIONS;
DROP TABLE Violations;
DROP TABLE Vehicle_Info;
DROP TABLE Visitor_Permit;
DROP TABLE Non_Visitor_Permit;
DROP TABLE Permits;
DROP TABLE ParkingSpaces;
DROP TABLE ParkingZone;
DROP TABLE ParkingLots;
DROP TABLE NON_VISITOR;

-- Non Visitor table
CREATE TABLE NON_VISITOR(
    uid VARCHAR(10) NOT NULL,
    nv_status CHAR(1) NOT NULL,
    PRIMARY KEY(uid)
);

--ParkingLots
CREATE TABLE ParkingLots(
lot_name VARCHAR(100),
lot_addr VARCHAR(100) NOT NULL,
zone_designation VARCHAR(100),
total_num_spaces INTEGER,
PRIMARY KEY(lot_name) 
);

--ParkingZone
CREATE TABLE ParkingZone(
zone_id VARCHAR(2) ,
num_spaces_per_zone INTEGER,
lot_name VARCHAR(100) ,
PRIMARY KEY(lot_name,zone_id),
FOREIGN KEY(lot_name) REFERENCES ParkingLots(lot_name) ON DELETE CASCADE
);

--ParkingSpaces
CREATE TABLE ParkingSpaces(
space_id INTEGER ,
space_type VARCHAR(50),
lot_name VARCHAR(100),
zone_id VARCHAR(2),
availability INTEGER,
PRIMARY KEY(lot_name,zone_id,space_id),
FOREIGN KEY(lot_name,zone_id) REFERENCES ParkingZone(lot_name,zone_id) ON DELETE CASCADE
);

--Permits
CREATE TABLE Permits (
  zone_id VARCHAR(2) NOT NULL,
  permit_id VARCHAR(8),
  start_dates DATE,
  expiration_date DATE,
  start_time TIME,
  expiration_time TIME,
  duration INTEGER,
  space_id INTEGER NOT NULL,
  lot_name VARCHAR(100) NOT NULL,
  PRIMARY KEY(permit_id),
  FOREIGN KEY(lot_name,zone_id,space_id) REFERENCES ParkingSpaces(lot_name,zone_id,space_id) ON UPDATE CASCADE
  );


--Non_Visitor_Permit
CREATE TABLE Non_Visitor_Permit (
   univid VARCHAR(10) NOT NULL,
   permit_id VARCHAR(8),
   PRIMARY KEY(univid,permit_id),
   FOREIGN KEY(permit_id) REFERENCES Permits(permit_id)  ON DELETE CASCADE,
   FOREIGN KEY(univid) REFERENCES NON_VISITOR (uid) ON DELETE CASCADE
);

--Visitor_Permit
CREATE TABLE Visitor_Permit (
   phone VARCHAR(10) NOT NULL,
   permit_id VARCHAR(8),
   PRIMARY KEY(phone,permit_id),
   FOREIGN KEY(permit_id) REFERENCES Permits(permit_id) ON DELETE CASCADE
);

--Vehicle_Info
CREATE TABLE Vehicle_Info (
   car_year YEAR(4),
   univid VARCHAR(10),
   phone VARCHAR(10),
   permit_id VARCHAR(8) NOT NULL,
   license_plate VARCHAR(20),
   model VARCHAR(20),
   color CHAR(10),
   car_manufacturer CHAR(20),
   PRIMARY KEY(license_plate,permit_id),
   FOREIGN KEY(permit_id) REFERENCES Permits(permit_id) ON DELETE CASCADE,
   FOREIGN KEY(univid) REFERENCES NON_VISITOR (uid) ON DELETE CASCADE,
   FOREIGN KEY(phone) REFERENCES Visitor_Permit (phone) ON DELETE CASCADE,
   check(( CASE WHEN univid IS NULL THEN 0 ELSE 1 END
    + CASE WHEN phone IS NULL THEN 0 ELSE 1 END) = 1)
);

--Violations
CREATE TABLE Violations (
      VIOLATION VARCHAR(100),
      fee INTEGER,
      PRIMARY KEY (VIOLATION)
);

--CITATIONS
CREATE TABLE CITATIONS (
               citation_number INTEGER,
               license_plate VARCHAR(20),
               cit_date DATE,
	            cit_time TIME, 
               VIOLATION VARCHAR(100),
               lot_name VARCHAR(100),
	            ispaid VARCHAR(10) NOT NULL,
	            due_date DATE,
               PRIMARY KEY(citation_number),
               FOREIGN KEY(lot_name) REFERENCES ParkingLots(lot_name) ON UPDATE CASCADE,
               FOREIGN KEY(VIOLATION) REFERENCES Violations(VIOLATION) ON UPDATE CASCADE,
               Check (30 <= DATEDIFF(due_date,cit_date) <= 31)
);

--Notification
CREATE TABLE Notification(
	citation_number INTEGER,
	contact_info VARCHAR(10),
	FOREIGN KEY(citation_number) REFERENCES CITATIONS(citation_number)
);

-- Assertions
/*CREATE ASSERTION RESTRICT_EXPIRY_STUDENT as CHECK
(120 <= (SELECT DATEDIFF(P.expiration_date,P.start_dates)
FROM Permits P, Non_Visitor_Permit NVP, NON_VISITOR NV
WHERE P.permit_id = NVP.permit_id AND NVP.univid = NV.uid AND NV.nv_status = 'S') <= 121
);

CREATE ASSERTION RESTRICT_EXPIRY_EMPLOYEE as CHECK
((SELECT DATEDIFF(P.expiration_date,P.start_dates)
FROM Permits P, Non_Visitor_Permit NVP, NON_VISITOR NV
WHERE P.permit_id = NVP.permit_id AND NVP.univid = NV.uid AND NV.nv_status = 'E') = 365
);

CREATE ASSERTION RESTRICT_PERMITS_EMPLOYEE as CHECK(
(SELECT Count(*)
FROM Non_Visitor_Permit NVP, Permits P, NON_VISITOR NV
WHERE P.permit_id = NVP.permit_id AND NVP.univid = NV.uid AND NV.nv_status = 'E'
Group by NVP.univid) <= 2
);

CREATE ASSERTION RESTRICT_PERMITS_STUDENT as CHECK(
(SELECT Count(*)
FROM Non_Visitor_Permit NVP, Permits P, NON_VISITOR NV
WHERE P.permit_id = NVP.permit_id AND NVP.univid = NV.uid AND NV.nv_status = 'S'
Group by NVP.univid) = 1
);
*/

import mysql.connector
from mysql.connector import Error


def _drop_tables(db):
    cursor = db.cursor()
    try:
        cursor.execute('DROP TABLE Notification')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE CITATIONS')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE Violations')
    except:
        pass
    try:
        cursor.execute('DROP TABLE Vehicle_Info')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE Visitor_Permit')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE Non_Visitor_Permit')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE Permits')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE ParkingSpaces')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE ParkingZone')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE ParkingLots')
    except mysql.connector.Error:
        pass
    try:
        cursor.execute('DROP TABLE NON_VISITOR')
    except mysql.connector.Error:
        pass
    db.commit()


def _create_tables(db):
    cursor = db.cursor()

    cursor.execute("""CREATE TABLE NON_VISITOR(
    uid VARCHAR(10) NOT NULL,
    nv_status CHAR(1) NOT NULL,
    PRIMARY KEY(uid)
);""")
    db.commit()
    cursor.execute("""CREATE TABLE ParkingLots(
lot_name VARCHAR(100),
lot_addr VARCHAR(100) NOT NULL,
zone_designation VARCHAR(100),
total_num_spaces INTEGER,
PRIMARY KEY(lot_name) 
);""")
    db.commit()

    cursor.execute("""CREATE TABLE ParkingZone(
zone_id VARCHAR(2) ,
num_spaces_per_zone INTEGER,
lot_name VARCHAR(100) ,
PRIMARY KEY(lot_name,zone_id),
FOREIGN KEY(lot_name) REFERENCES ParkingLots(lot_name) ON DELETE CASCADE
);""")
    db.commit()

    cursor.execute("""CREATE TABLE ParkingSpaces(
space_id INTEGER ,
space_type VARCHAR(50),
lot_name VARCHAR(100),
zone_id VARCHAR(2),
availability INTEGER,
PRIMARY KEY(lot_name,zone_id,space_id),
FOREIGN KEY(lot_name,zone_id) REFERENCES ParkingZone(lot_name,zone_id) ON DELETE CASCADE
);""")
    db.commit()

    cursor.execute("""CREATE TABLE Permits (
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
  FOREIGN KEY(lot_name,zone_id,space_id) REFERENCES ParkingSpaces(lot_name,zone_id,space_id) ON UPDATE CASCADE)""")
    db.commit()

    cursor.execute("""
        CREATE TABLE Non_Visitor_Permit (
   univid VARCHAR(10) NOT NULL,
   permit_id VARCHAR(8),
   PRIMARY KEY(univid,permit_id),
   FOREIGN KEY(permit_id) REFERENCES Permits(permit_id)  ON DELETE CASCADE,
   FOREIGN KEY(univid) REFERENCES NON_VISITOR (uid) ON DELETE CASCADE
)""")
    db.commit()

    cursor.execute("""CREATE TABLE Visitor_Permit (
   phone VARCHAR(10) NOT NULL,
   permit_id VARCHAR(8),
   PRIMARY KEY(phone,permit_id),
   FOREIGN KEY(permit_id) REFERENCES Permits(permit_id) ON DELETE CASCADE
)""")
    db.commit()

    cursor.execute("""CREATE TABLE Vehicle_Info (
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
   check(     ( CASE WHEN univid IS NULL THEN 0 ELSE 1 END
    + CASE WHEN phone IS NULL THEN 0 ELSE 1 END
    ) = 1)
   )""")
    db.commit()

    cursor.execute("""CREATE TABLE Violations (
                VIOLATION VARCHAR(100),
                fee INTEGER,
                PRIMARY KEY (VIOLATION)
                )""")
    db.commit()

    cursor.execute("""CREATE TABLE CITATIONS (
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
                Check (30<=DATEDIFF(due_date,cit_date) <= 31))""")
    db.commit()

    cursor.execute("""CREATE TABLE Notification(
	citation_number INTEGER,
	contact_info VARCHAR(10),
	FOREIGN KEY(citation_number) REFERENCES CITATIONS(citation_number));""")

    cursor.close()
    db.commit()


def load_demo_data(db):
    _drop_tables(db)
    _create_tables(db)

    cursor = db.cursor()
    print "Loading Demo Data"

    NON_VISITOR = [
        ['1007999', 'S'],
        ['1006003', 'S'],
        ['1006020', 'E'],
        ['1006135', 'S'],
        ['1006022', 'S']
    ]
    Violations = [
        ['Expired Permit', 25],
        ['Invalid Permit', 20],
        ['No Permit', 40]
    ]
    Non_Visitor_Permit = [
        ['1007999', '20B0001B'],
        ['1006003', '20CS001C'],
        ['1006020', '20D0021D'],
        ['1006135', '20AS016S'],
        ['1006022', '20A0052A']
    ]

    Vehicle_Info = [
        ['2018', None, '7777117777', '20V0001A', 'CDF5731', 'Camry', 'Red', 'Toyota'],
        ['2019', None, '7777127777', '20V0021L', 'AKL1732', 'Model X', 'Silver', 'Tesla'],
        ['2015', None, '7777137777', '20V0015J', 'UGY9123', 'Maxima', 'Black', 'Nissan'],
        ['2017', None, '7777147777', '20V0025B', 'TRK1093', 'Rio', 'Blue', 'Kia'],
        ['2016', None, '7777157777', '20V0026P', 'UWA1118', 'Q3', 'White', 'Audi'],
        ['2014', '1006003', None, '20B0001B', 'UGB9020', 'Cruze', 'Silver', 'Chevrolet'],
        ['2018', '1007999', None, '20CS001C', 'VTZ87543', 'LEAF', 'Black', 'Nissan'],
        ['2017', '1006020', None, '20D0021D', 'TIR3487', 'X5', 'White', 'BMW'],
        ['2016', '1006020', None, '20D0021D', 'RPU1824', 'Odyssey', 'Blue', 'Honda'],
        ['2011', '1006135', None, '20AS016S', 'NEV9889', 'Elantra', 'Red', 'Hyundai'],
        ['2009', '1006022', None, '20A0052A', 'KTP2003', 'RDX', 'Black', 'Acura']
    ]

    Visitor_Permit = [
        ['7777117777', '20V0001A'],
        ['7777147777', '20V0012B'],
        ['7777137777', '20V0015J'],
        ['7777127777', '20V0021L'],
        ['7777157777', '20V0026P'],
        ['7777147777', '20V0025B']
    ]

    Permits = [
        ['V', '20V0001A', '2020-08-12', '14:00:00', '2020-08-12', '16:00:00', 2, '200', 'Premiere Lot'],
        ['V', '20V0012B', '2020-08-14', '11:00:00', '2020-08-14', '14:00:00', 3, '160', 'Justice Lot'],
        ['V', '20V0015J', '2020-08-17', '10:10:00', '2020-08-17', '12:10:00', 2, '151', 'Justice Lot'],
        ['V', '20V0021L', '2020-08-17', '11:25:00', '2020-08-17', '12:40:00', 1, '173', 'Justice Lot'],
        ['V', '20V0026P', '2020-08-19', '14:50:00', '2020-08-19', '16:50:00', 2, '153', 'Justice Lot'],
        ['V', '20V0025B', '2020-09-21', '9:30:00', '2020-09-21', '13:30:00', 4, '200', 'Premiere Lot'],
        ['B', '20B0001B', '2020-08-10', '00:00:00', '2021-08-09', '23:59:00', 0, '71', 'Freedom Lot'],
        ['CS', '20CS001C', '2020-08-15', '00:00:00', '2020-12-14', '23:59:00', 0, '160', 'Premiere Lot'],
        ['D', '20D0021D', '2020-07-10', '00:00:00', '2021-07-09', '23:59:00', 0, '130', 'Freedom Lot'],
        ['AS', '20AS016S', '2020-09-01', '00:00:00', '2020-12-31', '23:59:00', 0, '101', 'Premiere Lot'],
        ['A', '20A0052A', '2020-07-29', '00:00:00', '2021-07-28', '23:59:00', 0, '10', 'Freedom Lot']
    ]

    ParkingLots = [
        ['Freedom Lot', '2105 Daniel Allen St, NC 27505', 'A, B, C, D', '150'],
        ['Premiere Lot', '2108 McKent St, NC 27507', 'A, B, C, D, AS, BS, CS, DS, V', '200'],
        ['Justice Lot', '2704 Ben Clark St, NC 26701', 'AS, BS, CS, DS, V', '175']
    ]

    ParkingZone = [
        ['A', '40', 'Freedom Lot'],
        ['B', '40', 'Freedom Lot'],
        ['C', '40', 'Freedom Lot'],
        ['D', '30', 'Freedom Lot'],
        ['A', '25', 'Premiere Lot'],
        ['B', '25', 'Premiere Lot'],
        ['C', '25', 'Premiere Lot'],
        ['D', '25', 'Premiere Lot'],
        ['AS', '25', 'Premiere Lot'],
        ['BS', '25', 'Premiere Lot'],
        ['CS', '25', 'Premiere Lot'],
        ['DS', '24', 'Premiere Lot'],
        ['V', '1', 'Premiere Lot'],
        ['AS', '40', 'Justice Lot'],
        ['BS', '40', 'Justice Lot'],
        ['CS', '40', 'Justice Lot'],
        ['DS', '30', 'Justice Lot'],
        ['V', '25', 'Justice Lot'],
    ]

    ParkingSpaces = [
        ['1', 'Regular', 'Freedom Lot', 'A', '0'],
        ['2', 'Regular', 'Freedom Lot', 'A', '0'],
        ['3', 'Regular', 'Freedom Lot', 'A', '0'],
        ['4', 'Regular', 'Freedom Lot', 'A', '0'],
        ['5', 'Regular', 'Freedom Lot', 'A', '0'],
        ['6', 'Regular', 'Freedom Lot', 'A', '0'],
        ['7', 'Regular', 'Freedom Lot', 'A', '0'],
        ['8', 'Regular', 'Freedom Lot', 'A', '0'],
        ['9', 'Regular', 'Freedom Lot', 'A', '0'],
        ['10', 'Regular', 'Freedom Lot', 'A', '0'],
        ['11', 'Regular', 'Freedom Lot', 'A', '0'],
        ['12', 'Regular', 'Freedom Lot', 'A', '0'],
        ['13', 'Regular', 'Freedom Lot', 'A', '0'],
        ['14', 'Regular', 'Freedom Lot', 'A', '0'],
        ['15', 'Regular', 'Freedom Lot', 'A', '0'],
        ['16', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['17', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['18', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['19', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['20', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['21', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['22', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['23', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['24', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['25', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['26', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['27', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['28', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['29', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['30', 'Handicapped', 'Freedom Lot', 'A', '0'],
        ['31', 'Electric', 'Freedom Lot', 'A', '0'],
        ['32', 'Electric', 'Freedom Lot', 'A', '0'],
        ['33', 'Electric', 'Freedom Lot', 'A', '0'],
        ['34', 'Electric', 'Freedom Lot', 'A', '0'],
        ['35', 'Electric', 'Freedom Lot', 'A', '0'],
        ['36', 'Electric', 'Freedom Lot', 'A', '0'],
        ['37', 'Electric', 'Freedom Lot', 'A', '0'],
        ['38', 'Electric', 'Freedom Lot', 'A', '0'],
        ['39', 'Electric', 'Freedom Lot', 'A', '0'],
        ['40', 'Electric', 'Freedom Lot', 'A', '0'],
        ['41', 'Regular', 'Freedom Lot', 'B', '0'],
        ['42', 'Regular', 'Freedom Lot', 'B', '0'],
        ['43', 'Regular', 'Freedom Lot', 'B', '0'],
        ['44', 'Regular', 'Freedom Lot', 'B', '0'],
        ['45', 'Regular', 'Freedom Lot', 'B', '0'],
        ['46', 'Regular', 'Freedom Lot', 'B', '0'],
        ['47', 'Regular', 'Freedom Lot', 'B', '0'],
        ['48', 'Regular', 'Freedom Lot', 'B', '0'],
        ['49', 'Regular', 'Freedom Lot', 'B', '0'],
        ['50', 'Regular', 'Freedom Lot', 'B', '0'],
        ['51', 'Regular', 'Freedom Lot', 'B', '0'],
        ['52', 'Regular', 'Freedom Lot', 'B', '0'],
        ['53', 'Regular', 'Freedom Lot', 'B', '0'],
        ['54', 'Regular', 'Freedom Lot', 'B', '0'],
        ['55', 'Regular', 'Freedom Lot', 'B', '0'],
        ['56', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['57', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['58', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['59', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['60', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['61', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['62', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['63', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['64', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['65', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['66', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['67', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['68', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['69', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['70', 'Handicapped', 'Freedom Lot', 'B', '0'],
        ['71', 'Electric', 'Freedom Lot', 'B', '0'],
        ['72', 'Electric', 'Freedom Lot', 'B', '0'],
        ['73', 'Electric', 'Freedom Lot', 'B', '0'],
        ['74', 'Electric', 'Freedom Lot', 'B', '0'],
        ['75', 'Electric', 'Freedom Lot', 'B', '0'],
        ['76', 'Electric', 'Freedom Lot', 'B', '0'],
        ['77', 'Electric', 'Freedom Lot', 'B', '0'],
        ['78', 'Electric', 'Freedom Lot', 'B', '0'],
        ['79', 'Electric', 'Freedom Lot', 'B', '0'],
        ['80', 'Electric', 'Freedom Lot', 'B', '0'],
        ['81', 'Regular', 'Freedom Lot', 'C', '0'],
        ['82', 'Regular', 'Freedom Lot', 'C', '0'],
        ['83', 'Regular', 'Freedom Lot', 'C', '0'],
        ['84', 'Regular', 'Freedom Lot', 'C', '0'],
        ['85', 'Regular', 'Freedom Lot', 'C', '0'],
        ['86', 'Regular', 'Freedom Lot', 'C', '0'],
        ['87', 'Regular', 'Freedom Lot', 'C', '0'],
        ['88', 'Regular', 'Freedom Lot', 'C', '0'],
        ['89', 'Regular', 'Freedom Lot', 'C', '0'],
        ['90', 'Regular', 'Freedom Lot', 'C', '0'],
        ['91', 'Regular', 'Freedom Lot', 'C', '0'],
        ['92', 'Regular', 'Freedom Lot', 'C', '0'],
        ['93', 'Regular', 'Freedom Lot', 'C', '0'],
        ['94', 'Regular', 'Freedom Lot', 'C', '0'],
        ['95', 'Regular', 'Freedom Lot', 'C', '0'],
        ['96', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['97', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['98', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['99', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['100', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['101', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['102', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['103', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['104', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['105', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['106', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['107', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['108', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['109', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['110', 'Handicapped', 'Freedom Lot', 'C', '0'],
        ['111', 'Electric', 'Freedom Lot', 'C', '0'],
        ['112', 'Electric', 'Freedom Lot', 'C', '0'],
        ['113', 'Electric', 'Freedom Lot', 'C', '0'],
        ['114', 'Electric', 'Freedom Lot', 'C', '0'],
        ['115', 'Electric', 'Freedom Lot', 'C', '0'],
        ['116', 'Electric', 'Freedom Lot', 'C', '0'],
        ['117', 'Electric', 'Freedom Lot', 'C', '0'],
        ['118', 'Electric', 'Freedom Lot', 'C', '0'],
        ['119', 'Electric', 'Freedom Lot', 'C', '0'],
        ['120', 'Electric', 'Freedom Lot', 'C', '0'],
        ['121', 'Regular', 'Freedom Lot', 'D', '0'],
        ['122', 'Regular', 'Freedom Lot', 'D', '0'],
        ['123', 'Regular', 'Freedom Lot', 'D', '0'],
        ['124', 'Regular', 'Freedom Lot', 'D', '0'],
        ['125', 'Regular', 'Freedom Lot', 'D', '0'],
        ['126', 'Regular', 'Freedom Lot', 'D', '0'],
        ['127', 'Regular', 'Freedom Lot', 'D', '0'],
        ['128', 'Regular', 'Freedom Lot', 'D', '0'],
        ['129', 'Regular', 'Freedom Lot', 'D', '0'],
        ['130', 'Regular', 'Freedom Lot', 'D', '0'],
        ['131', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['132', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['133', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['134', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['135', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['136', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['137', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['138', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['139', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['140', 'Handicapped', 'Freedom Lot', 'D', '0'],
        ['141', 'Electric', 'Freedom Lot', 'D', '0'],
        ['142', 'Electric', 'Freedom Lot', 'D', '0'],
        ['143', 'Electric', 'Freedom Lot', 'D', '0'],
        ['144', 'Electric', 'Freedom Lot', 'D', '0'],
        ['145', 'Electric', 'Freedom Lot', 'D', '0'],
        ['146', 'Electric', 'Freedom Lot', 'D', '0'],
        ['147', 'Electric', 'Freedom Lot', 'D', '0'],
        ['148', 'Electric', 'Freedom Lot', 'D', '0'],
        ['149', 'Electric', 'Freedom Lot', 'D', '0'],
        ['150', 'Electric', 'Freedom Lot', 'D', '0'],
        ['1', 'Regular', 'Premiere Lot', 'A', '0'],
        ['2', 'Regular', 'Premiere Lot', 'A', '0'],
        ['3', 'Regular', 'Premiere Lot', 'A', '0'],
        ['4', 'Regular', 'Premiere Lot', 'A', '0'],
        ['5', 'Regular', 'Premiere Lot', 'A', '0'],
        ['6', 'Regular', 'Premiere Lot', 'A', '0'],
        ['7', 'Regular', 'Premiere Lot', 'A', '0'],
        ['8', 'Regular', 'Premiere Lot', 'A', '0'],
        ['9', 'Regular', 'Premiere Lot', 'A', '0'],
        ['10', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['11', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['12', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['13', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['14', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['15', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['16', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['17', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['18', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['19', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['20', 'Handicapped', 'Premiere Lot', 'A', '0'],
        ['21', 'Electric', 'Premiere Lot', 'A', '0'],
        ['22', 'Electric', 'Premiere Lot', 'A', '0'],
        ['23', 'Electric', 'Premiere Lot', 'A', '0'],
        ['24', 'Electric', 'Premiere Lot', 'A', '0'],
        ['25', 'Electric', 'Premiere Lot', 'A', '0'],
        ['26', 'Regular', 'Premiere Lot', 'B', '0'],
        ['27', 'Regular', 'Premiere Lot', 'B', '0'],
        ['28', 'Regular', 'Premiere Lot', 'B', '0'],
        ['29', 'Regular', 'Premiere Lot', 'B', '0'],
        ['30', 'Regular', 'Premiere Lot', 'B', '0'],
        ['31', 'Regular', 'Premiere Lot', 'B', '0'],
        ['32', 'Regular', 'Premiere Lot', 'B', '0'],
        ['33', 'Regular', 'Premiere Lot', 'B', '0'],
        ['34', 'Regular', 'Premiere Lot', 'B', '0'],
        ['35', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['36', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['37', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['38', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['39', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['40', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['41', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['42', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['43', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['44', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['45', 'Handicapped', 'Premiere Lot', 'B', '0'],
        ['46', 'Electric', 'Premiere Lot', 'B', '0'],
        ['47', 'Electric', 'Premiere Lot', 'B', '0'],
        ['48', 'Electric', 'Premiere Lot', 'B', '0'],
        ['49', 'Electric', 'Premiere Lot', 'B', '0'],
        ['50', 'Electric', 'Premiere Lot', 'B', '0'],
        ['51', 'Regular', 'Premiere Lot', 'C', '0'],
        ['52', 'Regular', 'Premiere Lot', 'C', '0'],
        ['53', 'Regular', 'Premiere Lot', 'C', '0'],
        ['54', 'Regular', 'Premiere Lot', 'C', '0'],
        ['55', 'Regular', 'Premiere Lot', 'C', '0'],
        ['56', 'Regular', 'Premiere Lot', 'C', '0'],
        ['57', 'Regular', 'Premiere Lot', 'C', '0'],
        ['58', 'Regular', 'Premiere Lot', 'C', '0'],
        ['59', 'Regular', 'Premiere Lot', 'C', '0'],
        ['60', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['61', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['62', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['63', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['64', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['65', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['66', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['67', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['68', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['69', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['70', 'Handicapped', 'Premiere Lot', 'C', '0'],
        ['71', 'Electric', 'Premiere Lot', 'C', '0'],
        ['72', 'Electric', 'Premiere Lot', 'C', '0'],
        ['73', 'Electric', 'Premiere Lot', 'C', '0'],
        ['74', 'Electric', 'Premiere Lot', 'C', '0'],
        ['75', 'Electric', 'Premiere Lot', 'C', '0'],
        ['76', 'Regular', 'Premiere Lot', 'D', '0'],
        ['77', 'Regular', 'Premiere Lot', 'D', '0'],
        ['78', 'Regular', 'Premiere Lot', 'D', '0'],
        ['79', 'Regular', 'Premiere Lot', 'D', '0'],
        ['80', 'Regular', 'Premiere Lot', 'D', '0'],
        ['81', 'Regular', 'Premiere Lot', 'D', '0'],
        ['82', 'Regular', 'Premiere Lot', 'D', '0'],
        ['83', 'Regular', 'Premiere Lot', 'D', '0'],
        ['84', 'Regular', 'Premiere Lot', 'D', '0'],
        ['85', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['86', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['87', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['88', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['89', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['90', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['91', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['92', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['93', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['94', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['95', 'Handicapped', 'Premiere Lot', 'D', '0'],
        ['96', 'Electric', 'Premiere Lot', 'D', '0'],
        ['97', 'Electric', 'Premiere Lot', 'D', '0'],
        ['98', 'Electric', 'Premiere Lot', 'D', '0'],
        ['99', 'Electric', 'Premiere Lot', 'D', '0'],
        ['100', 'Electric', 'Premiere Lot', 'D', '0'],
        ['101', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['102', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['103', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['104', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['105', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['106', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['107', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['108', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['109', 'Regular', 'Premiere Lot', 'AS', '0'],
        ['110', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['111', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['112', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['113', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['114', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['115', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['116', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['117', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['118', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['119', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['120', 'Handicapped', 'Premiere Lot', 'AS', '0'],
        ['121', 'Electric', 'Premiere Lot', 'AS', '0'],
        ['122', 'Electric', 'Premiere Lot', 'AS', '0'],
        ['123', 'Electric', 'Premiere Lot', 'AS', '0'],
        ['124', 'Electric', 'Premiere Lot', 'AS', '0'],
        ['125', 'Electric', 'Premiere Lot', 'AS', '0'],
        ['126', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['127', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['128', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['129', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['130', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['131', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['132', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['133', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['134', 'Regular', 'Premiere Lot', 'BS', '0'],
        ['135', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['136', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['137', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['138', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['139', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['140', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['141', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['142', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['143', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['144', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['145', 'Handicapped', 'Premiere Lot', 'BS', '0'],
        ['146', 'Electric', 'Premiere Lot', 'BS', '0'],
        ['147', 'Electric', 'Premiere Lot', 'BS', '0'],
        ['148', 'Electric', 'Premiere Lot', 'BS', '0'],
        ['149', 'Electric', 'Premiere Lot', 'BS', '0'],
        ['150', 'Electric', 'Premiere Lot', 'BS', '0'],
        ['151', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['152', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['153', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['154', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['155', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['156', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['157', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['158', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['159', 'Regular', 'Premiere Lot', 'CS', '0'],
        ['160', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['161', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['162', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['163', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['164', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['165', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['166', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['167', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['168', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['169', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['170', 'Handicapped', 'Premiere Lot', 'CS', '0'],
        ['171', 'Electric', 'Premiere Lot', 'CS', '0'],
        ['172', 'Electric', 'Premiere Lot', 'CS', '0'],
        ['173', 'Electric', 'Premiere Lot', 'CS', '0'],
        ['174', 'Electric', 'Premiere Lot', 'CS', '0'],
        ['175', 'Electric', 'Premiere Lot', 'CS', '0'],
        ['176', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['177', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['178', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['179', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['180', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['181', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['182', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['183', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['184', 'Regular', 'Premiere Lot', 'DS', '0'],
        ['185', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['186', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['187', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['188', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['189', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['190', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['191', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['192', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['193', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['194', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['195', 'Handicapped', 'Premiere Lot', 'DS', '0'],
        ['196', 'Electric', 'Premiere Lot', 'DS', '0'],
        ['197', 'Electric', 'Premiere Lot', 'DS', '0'],
        ['198', 'Electric', 'Premiere Lot', 'DS', '0'],
        ['199', 'Electric', 'Premiere Lot', 'DS', '0'],
        ['200', 'Electric', 'Premiere Lot', 'V', '0'],
        ['1', 'Regular', 'Justice Lot', 'AS', '0'],
        ['2', 'Regular', 'Justice Lot', 'AS', '0'],
        ['3', 'Regular', 'Justice Lot', 'AS', '0'],
        ['4', 'Regular', 'Justice Lot', 'AS', '0'],
        ['5', 'Regular', 'Justice Lot', 'AS', '0'],
        ['6', 'Regular', 'Justice Lot', 'AS', '0'],
        ['7', 'Regular', 'Justice Lot', 'AS', '0'],
        ['8', 'Regular', 'Justice Lot', 'AS', '0'],
        ['9', 'Regular', 'Justice Lot', 'AS', '0'],
        ['10', 'Regular', 'Justice Lot', 'AS', '0'],
        ['11', 'Regular', 'Justice Lot', 'AS', '0'],
        ['12', 'Regular', 'Justice Lot', 'AS', '0'],
        ['13', 'Regular', 'Justice Lot', 'AS', '0'],
        ['14', 'Regular', 'Justice Lot', 'AS', '0'],
        ['15', 'Regular', 'Justice Lot', 'AS', '0'],
        ['16', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['17', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['18', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['19', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['20', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['21', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['22', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['23', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['24', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['25', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['26', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['27', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['28', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['29', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['30', 'Handicapped', 'Justice Lot', 'AS', '0'],
        ['31', 'Electric', 'Justice Lot', 'AS', '0'],
        ['32', 'Electric', 'Justice Lot', 'AS', '0'],
        ['33', 'Electric', 'Justice Lot', 'AS', '0'],
        ['34', 'Electric', 'Justice Lot', 'AS', '0'],
        ['35', 'Electric', 'Justice Lot', 'AS', '0'],
        ['36', 'Electric', 'Justice Lot', 'AS', '0'],
        ['37', 'Electric', 'Justice Lot', 'AS', '0'],
        ['38', 'Electric', 'Justice Lot', 'AS', '0'],
        ['39', 'Electric', 'Justice Lot', 'AS', '0'],
        ['40', 'Electric', 'Justice Lot', 'AS', '0'],
        ['41', 'Regular', 'Justice Lot', 'BS', '0'],
        ['42', 'Regular', 'Justice Lot', 'BS', '0'],
        ['43', 'Regular', 'Justice Lot', 'BS', '0'],
        ['44', 'Regular', 'Justice Lot', 'BS', '0'],
        ['45', 'Regular', 'Justice Lot', 'BS', '0'],
        ['46', 'Regular', 'Justice Lot', 'BS', '0'],
        ['47', 'Regular', 'Justice Lot', 'BS', '0'],
        ['48', 'Regular', 'Justice Lot', 'BS', '0'],
        ['49', 'Regular', 'Justice Lot', 'BS', '0'],
        ['50', 'Regular', 'Justice Lot', 'BS', '0'],
        ['51', 'Regular', 'Justice Lot', 'BS', '0'],
        ['52', 'Regular', 'Justice Lot', 'BS', '0'],
        ['53', 'Regular', 'Justice Lot', 'BS', '0'],
        ['54', 'Regular', 'Justice Lot', 'BS', '0'],
        ['55', 'Regular', 'Justice Lot', 'BS', '0'],
        ['56', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['57', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['58', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['59', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['60', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['61', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['62', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['63', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['64', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['65', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['66', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['67', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['68', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['69', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['70', 'Handicapped', 'Justice Lot', 'BS', '0'],
        ['71', 'Electric', 'Justice Lot', 'BS', '0'],
        ['72', 'Electric', 'Justice Lot', 'BS', '0'],
        ['73', 'Electric', 'Justice Lot', 'BS', '0'],
        ['74', 'Electric', 'Justice Lot', 'BS', '0'],
        ['75', 'Electric', 'Justice Lot', 'BS', '0'],
        ['76', 'Electric', 'Justice Lot', 'BS', '0'],
        ['77', 'Electric', 'Justice Lot', 'BS', '0'],
        ['78', 'Electric', 'Justice Lot', 'BS', '0'],
        ['79', 'Electric', 'Justice Lot', 'BS', '0'],
        ['80', 'Electric', 'Justice Lot', 'BS', '0'],
        ['81', 'Regular', 'Justice Lot', 'CS', '0'],
        ['82', 'Regular', 'Justice Lot', 'CS', '0'],
        ['83', 'Regular', 'Justice Lot', 'CS', '0'],
        ['84', 'Regular', 'Justice Lot', 'CS', '0'],
        ['85', 'Regular', 'Justice Lot', 'CS', '0'],
        ['86', 'Regular', 'Justice Lot', 'CS', '0'],
        ['87', 'Regular', 'Justice Lot', 'CS', '0'],
        ['88', 'Regular', 'Justice Lot', 'CS', '0'],
        ['89', 'Regular', 'Justice Lot', 'CS', '0'],
        ['90', 'Regular', 'Justice Lot', 'CS', '0'],
        ['91', 'Regular', 'Justice Lot', 'CS', '0'],
        ['92', 'Regular', 'Justice Lot', 'CS', '0'],
        ['93', 'Regular', 'Justice Lot', 'CS', '0'],
        ['94', 'Regular', 'Justice Lot', 'CS', '0'],
        ['95', 'Regular', 'Justice Lot', 'CS', '0'],
        ['96', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['97', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['98', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['99', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['100', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['101', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['102', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['103', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['104', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['105', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['106', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['107', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['108', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['109', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['110', 'Handicapped', 'Justice Lot', 'CS', '0'],
        ['111', 'Electric', 'Justice Lot', 'CS', '0'],
        ['112', 'Electric', 'Justice Lot', 'CS', '0'],
        ['113', 'Electric', 'Justice Lot', 'CS', '0'],
        ['114', 'Electric', 'Justice Lot', 'CS', '0'],
        ['115', 'Electric', 'Justice Lot', 'CS', '0'],
        ['116', 'Electric', 'Justice Lot', 'CS', '0'],
        ['117', 'Electric', 'Justice Lot', 'CS', '0'],
        ['118', 'Electric', 'Justice Lot', 'CS', '0'],
        ['119', 'Electric', 'Justice Lot', 'CS', '0'],
        ['120', 'Electric', 'Justice Lot', 'CS', '0'],
        ['121', 'Regular', 'Justice Lot', 'DS', '0'],
        ['122', 'Regular', 'Justice Lot', 'DS', '0'],
        ['123', 'Regular', 'Justice Lot', 'DS', '0'],
        ['124', 'Regular', 'Justice Lot', 'DS', '0'],
        ['125', 'Regular', 'Justice Lot', 'DS', '0'],
        ['126', 'Regular', 'Justice Lot', 'DS', '0'],
        ['127', 'Regular', 'Justice Lot', 'DS', '0'],
        ['128', 'Regular', 'Justice Lot', 'DS', '0'],
        ['129', 'Regular', 'Justice Lot', 'DS', '0'],
        ['130', 'Regular', 'Justice Lot', 'DS', '0'],
        ['131', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['132', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['133', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['134', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['135', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['136', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['137', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['138', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['139', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['140', 'Handicapped', 'Justice Lot', 'DS', '0'],
        ['141', 'Electric', 'Justice Lot', 'DS', '0'],
        ['142', 'Electric', 'Justice Lot', 'DS', '0'],
        ['143', 'Electric', 'Justice Lot', 'DS', '0'],
        ['144', 'Electric', 'Justice Lot', 'DS', '0'],
        ['145', 'Electric', 'Justice Lot', 'DS', '0'],
        ['146', 'Electric', 'Justice Lot', 'DS', '0'],
        ['147', 'Electric', 'Justice Lot', 'DS', '0'],
        ['148', 'Electric', 'Justice Lot', 'DS', '0'],
        ['149', 'Electric', 'Justice Lot', 'DS', '0'],
        ['150', 'Electric', 'Justice Lot', 'DS', '0'],
        ['151', 'Handicapped', 'Justice Lot', 'V', '0'],
        ['152', 'Handicapped', 'Justice Lot', 'V', '0'],
        ['153', 'Handicapped', 'Justice Lot', 'V', '0'],
        ['154', 'Handicapped', 'Justice Lot', 'V', '0'],
        ['155', 'Handicapped', 'Justice Lot', 'V', '0'],
        ['156', 'Regular', 'Justice Lot', 'V', '0'],
        ['157', 'Regular', 'Justice Lot', 'V', '0'],
        ['158', 'Regular', 'Justice Lot', 'V', '0'],
        ['159', 'Regular', 'Justice Lot', 'V', '0'],
        ['160', 'Regular', 'Justice Lot', 'V', '0'],
        ['161', 'Regular', 'Justice Lot', 'V', '0'],
        ['162', 'Regular', 'Justice Lot', 'V', '0'],
        ['163', 'Regular', 'Justice Lot', 'V', '0'],
        ['164', 'Regular', 'Justice Lot', 'V', '0'],
        ['165', 'Regular', 'Justice Lot', 'V', '0'],
        ['166', 'Regular', 'Justice Lot', 'V', '0'],
        ['167', 'Regular', 'Justice Lot', 'V', '0'],
        ['168', 'Regular', 'Justice Lot', 'V', '0'],
        ['169', 'Regular', 'Justice Lot', 'V', '0'],
        ['170', 'Regular', 'Justice Lot', 'V', '0'],
        ['171', 'Regular', 'Justice Lot', 'V', '0'],
        ['172', 'Electric', 'Justice Lot', 'V', '0'],
        ['173', 'Electric', 'Justice Lot', 'V', '0'],
        ['174', 'Electric', 'Justice Lot', 'V', '0'],
        ['175', 'Electric', 'Justice Lot', 'V', '0']
    ]

    CITATIONS = [

        ['10001','TRK1093','2020-08-14','14:40:00','Expired Permit','Justice Lot','paid','2020-09-13'],
        ['10002','UGY9123','2020-08-17','12:55:00','Expired Permit','Justice Lot','unpaid','2020-09-16'],
        ['10003','AKL1732','2020-08-17','13:40:00','Expired Permit','Justice Lot','unpaid','2020-09-16'],
        ['10004','NEV9889','2020-09-10','15:50:00','Invalid Permit','Justice Lot','unpaid','2020-10-09'],
        ['10005','KTP2003','2020-09-14','10:05:00','No Permit','Freedom Lot','paid','2020-10-13'],
        ['10006','TRK1093','2020-09-21','14:00:00','Expired Permit','Premiere Lot','unpaid','2020-10-20']]
    


    for row in NON_VISITOR:
        cursor.execute("INSERT INTO NON_VISITOR(uid,nv_status)VALUES(%s,%s)", row)
    db.commit()

    for row in ParkingLots:
        cursor.execute(
            "INSERT INTO ParkingLots(lot_name,lot_addr,zone_designation,total_num_spaces)VALUES(%s,%s,%s,%s)", row)
    db.commit()

    for row in ParkingZone:
        cursor.execute("INSERT INTO "
                       "ParkingZone(zone_id,num_spaces_per_zone,lot_name)"
                       "VALUES(%s,%s,%s)", row)
    db.commit()

    for row in ParkingSpaces:
        cursor.execute("INSERT INTO "
                       "ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)"
                       "VALUES(%s,%s,%s,%s,%s)", row)
    db.commit()

    for row in Permits:
        cursor.execute("INSERT INTO "
                       "Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)"
                       "VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                       row)
    db.commit()

    for row in Non_Visitor_Permit:
        cursor.execute('INSERT INTO Non_Visitor_Permit(univid,permit_id)'
                       'VALUES(%s,%s)', row)
    db.commit()

    for row in Visitor_Permit:
        cursor.execute('INSERT INTO Visitor_Permit(phone,permit_id)'
                       'VALUES(%s,%s)', row)
    db.commit()

    for row in Vehicle_Info:
        cursor.execute(
            'INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)'
            'VALUES(%s,%s,%s,%s,%s,%s,%s,%s)', row)
    db.commit()

    for row in Violations:
        cursor.execute("INSERT INTO Violations(VIOLATION,fee) VALUES(%s,%s)",row)
    db.commit()
    
    for row in CITATIONS:
        cursor.execute("INSERT INTO "
                       "CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)"
                       "VALUES(%s,%s,%s,%s,%s,%s,%s,%s)", row)
    db.commit()

    cursor.close()
    db.commit()


if __name__ == '__main__':
    db = mysql.connector.connect(host='localhost',
                                 database='TEST_PROJECT',
                                 user='root',
                                 password='Rajson251710@')

    load_demo_data(db)

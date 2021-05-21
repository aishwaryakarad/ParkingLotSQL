-- Show the list of zones for each lot as tuple pairs (lot, zone).
SELECT P.lot_name, Z.zone_id
FROM ParkingLots P, ParkingZone Z
WHERE P.lot_name = Z.lot_name;

-- Get permit information for a given employee with UnivID: 1006020
SELECT *
FROM Permits P, Non_Visitor_Permit NVP
WHERE NVP.univid = '1006020' AND NVP.permit_id = P.permit_id;

-- Get vehicle information for a particular UnivID: 1006003
SELECT *
FROM Vehicle_Info V
WHERE V.univid = '1006003';

-- Find an available space# for Visitor for an electric vehicle in a specific parking lot: Justice Lot
SELECT S.space_id
FROM ParkingSpaces S
WHERE S.zone_id = 'V' AND S.lot_name = 'Justice Lot' AND S.space_type = 'Electric';

-- Find any cars that are currently in violation
SELECT *
FROM CITATIONS C, Vehicle_Info V
WHERE C.license_plate = V.license_plate AND C.ispaid = 'unpaid';

-- How many employees have permits for parking zone D.
SELECT Count(*)
FROM NON_VISITOR NV, Permits P, Non_Visitor_Permit NVP
WHERE P.permit_id = NVP.permit_id and NVP.univid = NV.uid and NV.nv_status = 'E' AND P.zone_id = 'D';

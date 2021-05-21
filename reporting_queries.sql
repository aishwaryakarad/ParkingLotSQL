--1. For each lot, generate the total number of citations given in all zones in the lot for a three
--month period (07/01/2020 - 09/30/2020).
SELECT C.lot_name, Count(*)
FROM CITATIONS C
WHERE C.cit_date between CAST('2020-07-01' AS DATE) AND CAST('2020-09-30' AS DATE)
Group by C.lot_name;

--2. For Justice Lot , generate the number of visitor permits in a date range: 08/12/2020 -
--08/20/2020 , grouped by permit type e.g. regular, electric, handicapped.
SELECT PS.space_type,Count(*)
FROM Permits P, ParkingSpaces PS
WHERE P.lot_name = PS.lot_name AND P.zone_id = PS.zone_id AND P.space_id = PS.space_id AND P.zone_id = 'V'
GROUP BY PS.space_type;

--3. For each visitor’s parking zone, show the total amount of revenue generated (including
--pending citation fines) for each day in August 2020.
SELECT C.lot_name,C.cit_date,SUM(V.fee)
from CITATIONS C, Violations V
WHERE C.lot_name in (SELECT lot_name
FROM  ParkingZone
WHERE zone_id='V') AND C.VIOLATION = V.VIOLATION
GROUP BY C.lot_name,C.cit_date
HAVING C.cit_date between CAST('2020-08-01' AS DATE) AND CAST('2020-08-31' AS DATE);


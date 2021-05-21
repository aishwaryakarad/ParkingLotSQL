import mysql.connector
from mysql.connector import Error
import datetime
from datetime import date,timedelta
import admin_actions


def ups_admin(db):
    print('ups')
    user_input = input('Please enter the number for the menu option desired\n1.ExitLot\n2.IssueCitation\n3.PayCitation\n4.AssignPermit\n5.addLot\n6.AssignZoneToLot\n7.AssignTypetoSpace\n8.CheckVValidParking\n9.CheckNVValidParking\n')
    user_input = int(user_input)
    if user_input == 1:
        permit_id = input('Enter the Permit ID: ')
        permit_id = str(permit_id)
        # print('ExitLot1(db,permit_id)')
        admin_actions.ExitLot1(db,permit_id)

    if user_input == 2:
        permit_type = input("Enter desired choice:\n1.No Permit\n2.Expired Permit\n3.Invalid Permit\n")
        permit_type = int(permit_type)
        permit_id = input('Enter the Permit ID: ')
        permit_id = str(permit_id)
        citation_time = input("Enter time of exit: ")
        citation_time = str(citation_time)
        # print('IssueCitation(db,permit_id,citation_time,permit_type)')
        admin_actions.IssueCitation(db,permit_id,citation_time,permit_type)

    if user_input == 3:
        citation_num = input("Enter the citation number: ")
        citation_num = str(citation_num)
        # print('PayCitation(db, citation_num)')
        admin_actions.PayCitation(db, citation_num)

    if user_input == 4:
        univid = input('Enter the University ID: ')
        univid = str(univid)
        lot_name = input('Enter the name of lot: ')
        lot_name = str(lot_name)
        S_E = input("Are you a student (S) or an employee (E)? ")
        S_E = str(S_E)
        R_H_E = input("Enter the desired space type: Regular, Handicapped, Electric\n")
        R_H_E = str(R_H_E)
        # print('AssignPermit(db, univid, lot_name, S_E, R_H_E)')
        admin_actions.AssignPermit(db, univid, lot_name, S_E, R_H_E)

    if user_input == 5:
        Name = input('Enter the name of lot: ')
        Name = str(Name)
        Address = input('Enter the address of lot: ')
        Address = str(Address)
        Zones = input('Enter all the zone IDs for this lot as comma separated: ')
        Zones = str(Zones)
        Total_Spaces = input('Enter the number of spaces: ')
        Total_Spaces = int(Total_Spaces)
        #print('admin_actions.addLot(db, Name, Address, Zones, Total_Spaces, Visitor_spaces)')
        admin_actions.addLot(db, Name, Address, Zones, Total_Spaces)

    if user_input == 6:
        Name = input('Enter the name of lot: ')
        Name = str(Name)
        Zone_id = input('Enter the zone ID: ')
        Zone_id = str(Zone_id)
        num_spaces_per_zone = input('Enter the number of spaces for that zone: Eg:150\n')
        num_spaces_per_zone = int(num_spaces_per_zone)
        #print('admin_actions.AssignZoneToLot(db, Name, Zones, Total_Spaces, Visitor_spaces,handicapped_range,electric_range)')
        admin_actions.AssignZoneToLot(db, Name, Zone_id, num_spaces_per_zone)

    if user_input == 7:
        Name = input('Enter the name of lot: ')
        Name = str(Name)
        zone_id = input('Enter the zone ID: ')
        zone_id = str(zone_id)
        num_spaces = input('Enter the range of spaces:\nEg: 0:150\n')
        num_spaces = str(num_spaces)
        handicapped_range = input("Enter the range for handicapped spaces separated by colon; eg: 130:140\n")
        handicapped_range = str(handicapped_range)
        electric_range = input("Enter the range for electric spaces separated by colon; eg: 141:150\n")
        electric_range = str(electric_range)
        #print('admin_actions.AssignTypetoSpace(db, Name, zone_id, num_spaces,handicapped_range,electric_range)')
        admin_actions.AssignTypetoSpace(db, Name, zone_id, num_spaces, handicapped_range, electric_range)
    
    if user_input == 8:
        lot_name = input('Enter the name of lot: ')
        lot_name = str(lot_name)
        space_id = input('Enter the space ID: ')
        space_id = int(space_id)
        zone_id = input('Enter the zone ID: ')
        zone_id = str(zone_id)
        # print('CheckVValidParking(db, lot_name, space_id, zone_id)')
        print(admin_actions.CheckVValidParking(db, lot_name, space_id, zone_id))

    if user_input == 9:
        permit_id = input('Enter the Permit ID: ')
        permit_id = str(permit_id)
        # print('CheckNVValidParking(db,permit_id)')
        print(admin_actions.CheckNVValidParking(db,permit_id))


def employee(db):
    print('employee')
    user_input = input('Please enter the number for the menu option desired\n1.ChangeVehicleList\n2.GetVisitorPermit\n')
    user_input = int(user_input)
    if user_input == 1:
        permit_id = input('Enter the Permit ID: ')
        permit_id = str(permit_id)
        univid = input('Enter the University ID: ')
        univid = str(univid)
        # print('ChangeVehicleList(db, permit_id, univid)')
        admin_actions.ChangeVehicleList(db, permit_id, univid)

    if user_input == 2:
        phone = input("Enter the visitor's phone number: ")
        phone = str(phone)
        duration = input('Enter the desired duration of parking: ')
        duration = int(duration)
        lot_name = input('Enter the name of lot: ')
        lot_name = str(lot_name)
        R_H_E = input("Enter the desired space type: Regular, Handicapped, Electric\n")
        R_H_E = str(R_H_E)
        # print('GetVisitorPermit(db, phone, duration, R_H_E, lot_name)')
        admin_actions.GetVisitorPermit(db, phone, duration, R_H_E, lot_name)

def student(db):
    print('student')
    user_input = input('Please enter the number for the menu option desired\n1.GetVisitorPermit\n')
    user_input = int(user_input)
    if user_input == 1:
        phone = input("Enter the visitor's phone number: ")
        phone = str(phone)
        duration = input('Enter the desired duration of parking: ')
        duration = int(duration)
        lot_name = input('Enter the name of lot: ')
        lot_name = str(lot_name)
        R_H_E = input("Enter the desired space type: Regular, Handicapped, Electric\n")
        R_H_E = str(R_H_E)
        # print('GetVisitorPermit(db, phone, duration, R_H_E, lot_name)')
        admin_actions.GetVisitorPermit(db, phone, duration, R_H_E, lot_name)


def sample_query(db):
    print('sample')
    user_input = input("Please enter the number for the menu option desired\n1.Show the list of zones for each lot as tuple pairs (lot, zone).\n2.Get permit information for a given employee with UnivID: 1006020\n3.Get vehicle information for a particular UnivID: 1006003\n4.Find an available space# for Visitor for an electric vehicle in a specific parking lot: Justice Lot\n5.Find any cars that are currently in violation\n6.How many employees have permits for parking zone D\n")
    user_input = int(user_input)
    cursor = db.cursor()
    if user_input == 1:
        cursor.execute("SELECT P.lot_name, Z.zone_id FROM ParkingLots P, ParkingZone Z WHERE P.lot_name = Z.lot_name")
        records = cursor.fetchall()
        for row in records:
            print("Lot Name  = ", row[0])
            print("Zone ID  = ", row[1], "\n")

    if user_input == 2:
        cursor.execute("SELECT * FROM Permits P, Non_Visitor_Permit NVP WHERE NVP.univid = '1006020' AND NVP.permit_id = P.permit_id")
        records = cursor.fetchall()
        for row in records:
            print(row, "\n")

    if user_input == 3:
        cursor.execute("SELECT * FROM Vehicle_Info V WHERE V.univid = '1006003'")
        records = cursor.fetchall()
        for row in records:
            print(row, "\n")

    if user_input == 4:
        cursor.execute("SELECT S.space_id FROM ParkingSpaces S WHERE S.zone_id = 'V' AND S.lot_name = 'Justice Lot' AND S.space_type = 'Electric'")
        records = cursor.fetchall()
        for row in records:
            print("Space ID  = ", row[0], "\n")

    if user_input == 5:
        cursor.execute("SELECT * FROM CITATIONS C, Vehicle_Info V WHERE C.license_plate = V.license_plate AND C.ispaid = 'unpaid'")
        records = cursor.fetchall()
        for row in records:
            print(row, "\n")

    if user_input == 6:
        cursor.execute("SELECT Count(*) FROM NON_VISITOR NV, Permits P, Non_Visitor_Permit NVP WHERE P.permit_id = NVP.permit_id and NVP.univid = NV.uid and NV.nv_status = 'E' AND P.zone_id = 'D'")
        records = cursor.fetchall()
        for row in records:
            print("Number of employees is: ", row[0], "\n")
    cursor.close()

def reporting_query(db):
    print('reporting')
    user_input = input("Please enter the number for the menu option desired \n 1.For each lot, generate the total number of citations given in all zones in the lot for a three month period (07/01/2020 - 09/30/2020)\n2.For Justice Lot , generate the number of visitor permits in a date range: 08/12/2020 -08/20/2020 , grouped by permit type e.g. regular, electric, handicapped.\n3.For each visitor's parking zone, show the total amount of revenue generated (including pending citation fines) for each day in August 2020\n")
    user_input = int(user_input)
    cursor = db.cursor()
    if user_input == 1:
        cursor.execute("SELECT C.lot_name, Count(*) FROM CITATIONS C WHERE C.cit_date between CAST('2020-07-01' AS DATE) AND CAST('2020-09-30' AS DATE) Group by C.lot_name")
        records = cursor.fetchall()
        for row in records:
            print("Lot Name  = ", row[0])
            print("Count  = ", row[1], "\n")

    if user_input == 2:
        cursor.execute("SELECT PS.space_type,Count(*) FROM Permits P, ParkingSpaces PS WHERE P.lot_name = PS.lot_name AND P.zone_id = PS.zone_id AND P.space_id = PS.space_id AND P.zone_id = 'V' GROUP BY PS.space_type")
        records = cursor.fetchall()
        for row in records:
            print("Space type  = ", row[0])
            print("Count  = ", row[1], "\n")

    if user_input == 3:
        cursor.execute("SELECT C.lot_name,C.cit_date,SUM(V.fee) from CITATIONS C, Violations V WHERE C.lot_name in (SELECT lot_name FROM  ParkingZone WHERE zone_id='V') AND C.VIOLATION = V.VIOLATION GROUP BY C.lot_name,C.cit_date HAVING C.cit_date between CAST('2020-08-01' AS DATE) AND CAST('2020-08-31' AS DATE)")
        records = cursor.fetchall()
        for row in records:
            print("Lot Name  = ", row[0])
            print("Citation date = ",row[1])
            print("Total fees  = ", row[2], "\n")
    cursor.close()

def indirect(db,i):
    switcher = {
    1:ups_admin,
    2:employee,
    3:student,
    4:sample_query,
    5:reporting_query
    }
    func = switcher.get(i, lambda : 'Invalid')
    return func(db)

if __name__ == '__main__':
    db = mysql.connector.connect(host='localhost', database='TEST_PROJECT', user='root', password='Rajson251710@')
    role = input("Please enter the number for the menu option desired\n1.UPS Admin Role\n2.Employee Role\n3.Student Role\n4.Run Sample Queries\n5.Run Reporting Queries\n")
    role = int(role)
    indirect(db,role)
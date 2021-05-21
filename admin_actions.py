import datetime
from datetime import date,timedelta


def add_vehicle(db, uid, cyear,phone, pid, lplate, model, color, car_man):
    cursor = db.cursor()
    val=(uid, cyear,phone, pid, lplate, model, color, car_man)
    cursor.execute("INSERT INTO Vehicle_Info(univid, car_year,phone, permit_id, license_plate, model, color, car_manufacturer)"
                    "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",val)
    cursor.close()
    db.commit()



def ExitLot1(db, permit_id):
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Permits WHERE permit_id = %s",(permit_id,))
    row = cursor.fetchall()
    if not row:
        citation_time = str(input("Enter time of exit"))
        IssueCitation(db, permit_id, citation_time,1)
        #print("Citation Created")
    else:
        lot_name = row[0][8]
        zone_id = row[0][0]
        space_id = row[0][7]
        expiration_time = row[0][5]
        val=(lot_name, zone_id, space_id)
        cursor.execute("UPDATE ParkingSpaces SET availability=0 WHERE lot_name=%s AND zone_id=%s AND space_id=%s",val)
        db.commit()
        citation_time = str(input("Enter time of exit: "))
        FMT = '%H:%M:%S'
        t=datetime.datetime.strptime(citation_time,FMT)
        time_overage = timedelta(hours=t.hour, minutes=t.minute, seconds=t.second) - expiration_time
        uid = row[0]
        phone_id = row[0]
        # For non visitors, we will keep the expiration_date attr in the table null.
        # When we run the exitlot func we will take the current timestamp and subtract start_date from it.
        if not phone_id:
            cursor.execute("SELECT nv_status FROM NON_VISITOR WHERE uid={}".format(uid))
            row = cursor.fetchall()
            nv_status = row[0]
            if nv_status == "S":
                if time_overage.days - 120 > 0:
                    print("time exceeded")
                else:
                    print("GoodBye!!")
            if nv_status == "E":
                if time_overage.days - 365 > 0:
                    print("time exceeded")
                else:
                    print("GoodBye!!")
        else:
            if time_overage.seconds > 0:
                print("time exceeded")
                IssueCitation(db,permit_id,citation_time,2)
                #print("Citation Created")
            else:
                print("GoodBye!!")
    # cursor.execute("DELETE FROM Permits WHERE permit_id={}".format(permit_id))
    # conn.commit()
# For visitors, we add the duration attr as expiration date in the table.
# Now, when we run the exit lot func we just verify that value with the current time stamp.


def ChangeVehicleList(db, permit_id, univid):
    cursor = db.cursor()
    cursor.execute("SELECT NV.nv_status FROM NON_VISITOR NV WHERE uid=%s",(univid,))
    row = cursor.fetchall()
    nv_status = row[0][0]
    if nv_status == 'E':
        task = input("ADD (A) or REMOVE (R) vehicles?")
        if task == 'A':
            cursor.execute("SELECT Count(*) FROM Vehicle_Info WHERE permit_id = %s",(permit_id,))
            row = cursor.fetchall()
            if len(row) < 2:
                uid = univid
                cyear = input("Enter car year: ")
                pid = permit_id
                lplate = input("Enter car license plate number: ")
                model = input("Enter car model: ")
                color = input("Enter car color: ")
                car_man = input("Enter car manufacturer: ")
                add_vehicle(db, uid, cyear,None, pid, lplate, model, color, car_man)
                print("Vehicle Added!!")
            else:
                print("MAX limit reached!!\n")
        if task == 'R':
            lplate = input("Give the license plate number")
            cursor.execute("DELETE FROM Vehicle_Info WHERE permit_id = %s AND license_plate = %s",(permit_id,lplate,))
            db.commit()
            print("Vehicle removed!!\n")
    elif nv_status == 'S':
        lplate = input("Give the license plate number")
        cursor.execute("DELETE FROM Vehicle_Info WHERE permit_id = %s AND license_plate = %s", (permit_id, lplate,))
        db.commit()
        print("Vehicle removed!!\n")
    else:
        print("Unauthorised Access!!\n")
    cursor.close()


def IssueCitation(db,permit_id,citation_time,permit_type):
    cursor = db.cursor()
    Cin_list = ['10007', '10008', '10009', '100010', '100011', '100012']
    cin = Cin_list[3]
    Cin_list.remove(cin)
    if permit_type == 1:
        lic = str(input("Enter the license plate of vehicle"))
        lot_name = 'Justice Lot'
        violation="No Permit"
        #fee=40
        curr_date = datetime.datetime.now()
        cit_time = curr_date.strftime('%H:%M:%S')
        due_date_str = curr_date.strftime('%y-%m-%d')
        val = (cin, lic, curr_date, cit_time, violation, lot_name, 'unpaid', due_date_str)

        cursor.execute("INSERT INTO CITATIONS (citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)"
                       "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",val)
        print("Citation Created!!")
        contact = input("Enter your univid for Non-visitor or phone for Visitor: ")
        val = (cin,contact)
        cursor.execute("INSERT INTO Notification (citation_number, contact_info)"
                       "VALUES (%s,%s)",val)
        print("\nNotified the person!!")
    else:
        cursor.execute("SELECT P.lot_name, V.license_plate, P.start_dates, P.space_id, P.zone_id,P.duration,P.start_time,P.expiration_time FROM Vehicle_Info V, Permits P where V.permit_id=P.permit_id AND P.permit_id='{}'".format(permit_id))
        row=cursor.fetchall()
        lot_name=row[0][0]
        lic=row[0][1]
        curr_date=row[0][2]
        due_date= curr_date+timedelta(days=30)
        due_date_str=due_date.strftime('%y-%m-%d')
        space_id=row[0][3]
        zone_id=row[0][4]
        duration=row[0][5]
        start_time=row[0][6]
        expiration_time=row[0][7]
        cit_time=citation_time
        FMT='%H:%M:%S'
        if permit_type == 3:
            if CheckVValidParking(db, lot_name, space_id, zone_id) == 'Invalid' and CheckNVValidParking(db, permit_id) == 'Invalid':
                violation="Invalid Permit"
                #fee=20
                val = (cin, lic, curr_date,cit_time, violation, lot_name, 'unpaid', due_date_str)
                cursor.execute("INSERT INTO CITATIONS (citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)"
                               "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",val)
                print("Citation Created!!")
                contact = input("Enter your univid for Non-visitor or phone for Visitor: ")
                val = (cin, contact)
                cursor.execute("INSERT INTO Notification (citation_number, contact_info)"
                               "VALUES (%s,%s)", val)
                print("\nNotified the person!!")
        if permit_type == 2:
            violation="Expired Permit"
            #fee=25
            val=(cin, lic, curr_date, cit_time, violation, lot_name,'unpaid',due_date_str)
            cursor.execute("INSERT INTO CITATIONS (citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)"
                           "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",val)
            print("Citation Created!!")
            contact = input("Enter your univid for Non-visitor or phone for Visitor: ")
            val = (cin,contact)
            cursor.execute("INSERT INTO Notification (citation_number, contact_info)"
                           "VALUES (%s,%s)",val)
            print("\nNotified the person!!")
        else:
            print("No issues\n")
    cursor.close()
    db.commit()


def PayCitation(db, cin):
    cursor = db.cursor()
    cursor.execute("UPDATE CITATIONS SET ispaid = 'paid' WHERE citation_number = %s",(cin,))
    cursor.close()
    db.commit()
    print("Citation Paid!!\n")


def GetVisitorPermit(db, phone, duration, R_H_E, lot_name):
    cursor = db.cursor()
    Permit_list = ['20V0001B', '20V0001C', '20V0001D', '20V0001E', '20V0001F', '20V0001G']
    permit_id = Permit_list[0]
    Permit_list.remove(permit_id)
    start_dates = date.today()
    start_time = datetime.datetime.now()
    expiration_date = start_dates
    expiration_time = start_time+datetime.timedelta(duration,0,0)
    expiration_time = expiration_time.strftime('%H:%M:%S')
    cursor.execute("SELECT s.space_id FROM ParkingSpaces s WHERE  s.zone_id = 'V' AND s.lot_name=%s AND s.space_type=%s AND s.availability=0",(lot_name, R_H_E,))
    row = cursor.fetchall()
    space_id = row[0][0]
    zone_id = 'V'
    val=(zone_id, permit_id, start_dates, start_time, expiration_date, expiration_time, duration, space_id, lot_name)
    cursor.execute("INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)"
    "VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",val)
    cursor.execute("INSERT INTO Visitor_Permit(phone,permit_id)"
    "VALUES (%s,%s)",(phone, permit_id))
    cursor.close()
    db.commit()
    print("Permit Created!!\n")


def AssignPermit(db, univid, lot_name, S_E, R_H_E):
    cursor = db.cursor()
    Permit_list = ['20V0002B', '20V0002C', '20V0002D', '20V0002E', '20V0002F', '20V0002G']
    permit_id = Permit_list[-3]
    Permit_list.remove(permit_id)
    start_dates = date.today()
    start_time = datetime.datetime.now()
    if S_E == 'S':
        expiration_date = start_dates+datetime.timedelta(days=120)
        expiration_time = '23:59:00'
        duration = 4
    if S_E == 'E':
        expiration_date = start_dates+datetime.timedelta(days=365)
        expiration_time = '23:59:00'
        duration = 12
    cursor.execute("SELECT s.space_id, s.zone_id FROM ParkingSpaces s WHERE s.lot_name='{}' AND s.space_type='{}' AND s.availability=0".format(lot_name,R_H_E,))
    row = cursor.fetchall()
    space_id = row[0][0]
    zone_id = row[0][1]
    val=(zone_id, permit_id, start_dates, start_time, expiration_date, expiration_time, duration, space_id, lot_name)
    cursor.execute("INSERT INTO Permits(zone_id,permit_id,start_dates, start_time, expiration_date,expiration_time,duration,space_id,lot_name)"
    "VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",val)
    val=(univid, permit_id)
    cursor.execute("INSERT INTO Non_Visitor_Permit(univid,permit_id)"
    "VALUES (%s,%s)",val)
    cursor.close()
    db.commit()
    print("Permit Created!!\n")


def addLot(db, Name, Address, Zones, Total_Spaces):
    cursor = db.cursor()
    # Creating a lot based upon the inputs provides and further more allocating zones referencing to this lot
    val=(Name, Address, Zones, Total_Spaces)
    cursor.execute("INSERT INTO ParkingLots(lot_name,lot_addr,zone_designation,total_num_spaces)"
    "VALUES (%s,%s,%s,%s)",val)
    cursor.close()
    db.commit()
    print("Lot added!!")



def AssignZoneToLot(db, Name, Zone_id, num_spaces_per_zone):
    cursor = db.cursor()
    val=(Zone_id, num_spaces_per_zone, Name)
    cursor.execute("INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)"
        "VALUES (%s,%s,%s)",val)
    cursor.close()
    db.commit()
    print("Zones added!!")


def AssignTypetoSpace(db, Name, zone_id, num_spaces, handicapped_range, electric_range):
    cursor = db.cursor(buffered=100)
    start_range = int(num_spaces.split(':')[0])
    end_range = int(num_spaces.split(':')[1])
    zone_spaces = end_range - start_range + 1
    start_handicap = int(handicapped_range.split(':')[0])
    end_handicap = int(handicapped_range.split(':')[1])
    handicap_spaces=end_handicap-start_handicap + 1
    start_electric = int(electric_range.split(':')[0])
    end_electric = int(electric_range.split(':')[1])
    electric_spaces = end_electric - start_electric + 1
    regular_spaces=zone_spaces-handicap_spaces-electric_spaces
    print(regular_spaces)
    for type1 in range(start_range,start_range+regular_spaces+1):
        space=type1
        val = (space, "Regular", Name, zone_id)
        cursor.execute("INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id)"
                       "VALUES (%s,%s,%s,%s)", val)
    if start_handicap == 0  and end_handicap == 0:
        pass
    else:
        for type2 in range(start_handicap,end_handicap+1):
            val = (type2, "Handicapped", Name, zone_id)
            cursor.execute("INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id)"
                       "VALUES (%s,%s,%s,%s)", val)
    if start_electric == 0  and end_electric == 0:
        pass
    else:
        for type2 in range(start_electric, end_electric + 1):
            val = (type2, "Electric", Name, zone_id)
            cursor.execute("INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id)"
                           "VALUES (%s,%s,%s,%s)", val)
    cursor.close()
    db.commit()
    print("Spaces added!!")


def CheckVValidParking(db, lot_name, space_id, zone_id):
    cursor = db.cursor()
    # Verifying if lot name and space id and zone id is valid or not ####
    #cursor.execute("UPDATE Permits set zone_id = 'E' where permit_id = '{}'".format(permit_id))
    cursor.execute("SELECT * FROM ParkingSpaces s WHERE s.lot_name=%s AND s.space_id=%s AND s.zone_id=%s",(lot_name, space_id, zone_id,))
    row = cursor.fetchall()
    cursor.close()
    if row:
        return "Valid"
    else:
        return "Invalid"


def CheckNVValidParking(db,permit_id):
    cursor = db.cursor()
    cursor.execute(
        "SELECT * FROM Permits P, ParkingSpaces S, Non_Visitor_Permit NVP,NON_VISITOR NV WHERE P.permit_id = NVP.permit_id AND NV.nv_status='S' AND P.permit_id=%s AND P.zone_id NOT LIKE '%S'",
        (permit_id,))
    row = cursor.fetchall()
    cursor.close()
    if row:
        now = datetime.datetime.now()
        if datetime.datetime.strptime(now.strftime('%H:%M:%S'),'%H:%M:%S').time() < datetime.time(17, 0):
            return "Invalid"
        else:
            return "Valid"
    else:
        return "Valid"


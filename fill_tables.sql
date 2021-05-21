--NON_VISITOR
INSERT INTO NON_VISITOR(uid,nv_status)
VALUES('1007999','S');
INSERT INTO NON_VISITOR(uid,nv_status)
VALUES('1006003','S');
INSERT INTO NON_VISITOR(uid,nv_status)
VALUES('1006020','E');
INSERT INTO NON_VISITOR(uid,nv_status)
VALUES('1006135','S');
INSERT INTO NON_VISITOR(uid,nv_status)
VALUES('1006022','S');

--ParkingLots
INSERT INTO ParkingLots(lot_name,lot_addr,zone_designation,total_num_spaces)
VALUES('Freedom Lot','2105 Daniel Allen St, NC 27505','A, B, C, D',150);
INSERT INTO ParkingLots(lot_name,lot_addr,zone_designation,total_num_spaces)
VALUES('Premiere Lot','2108 McKent St, NC 27507','A, B, C, D, AS, BS, CS, DS, V',200);
INSERT INTO ParkingLots(lot_name,lot_addr,zone_designation,total_num_spaces)
VALUES('Justice Lot','2704 Ben Clark St, NC 26701','AS, BS, CS, DS, V',175);

--ParkingZone
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('A',40,'Freedom Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('B',40,'Freedom Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('C',40,'Freedom Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('D',30,'Freedom Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('A',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('B',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('C',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('D',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('AS',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('BS',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('CS',25,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('DS',24,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('V',1,'Premiere Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('AS',40,'Justice Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('BS',40,'Justice Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('CS',40,'Justice Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('DS',30,'Justice Lot');
INSERT INTO ParkingZone(zone_id,num_spaces_per_zone,lot_name)
VALUES('V',25,'Justice Lot');

--ParkingSpaces
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(1,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(2,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(3,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(4,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(5,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(6,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(7,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(8,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(9,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(10,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(11,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(12,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(13,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(14,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(15,'Regular','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(16,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(17,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(18,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(19,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(20,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(21,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(22,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(23,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(24,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(25,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(26,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(27,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(28,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(29,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(30,'Handicapped','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(31,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(32,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(33,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(34,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(35,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(36,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(37,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(38,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(39,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(40,'Electric','Freedom Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(41,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(42,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(43,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(44,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(45,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(46,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(47,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(48,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(49,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(50,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(51,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(52,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(53,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(54,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(55,'Regular','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(56,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(57,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(58,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(59,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(60,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(61,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(62,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(63,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(64,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(65,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(66,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(67,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(68,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(69,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(70,'Handicapped','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(71,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(72,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(73,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(74,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(75,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(76,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(77,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(78,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(79,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(80,'Electric','Freedom Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(81,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(82,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(83,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(84,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(85,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(86,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(87,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(88,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(89,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(90,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(91,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(92,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(93,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(94,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(95,'Regular','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(96,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(97,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(98,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(99,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(100,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(101,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(102,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(103,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(104,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(105,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(106,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(107,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(108,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(109,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(110,'Handicapped','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(111,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(112,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(113,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(114,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(115,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(116,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(117,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(118,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(119,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(120,'Electric','Freedom Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(121,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(122,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(123,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(124,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(125,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(126,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(127,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(128,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(129,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(130,'Regular','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(131,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(132,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(133,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(134,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(135,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(136,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(137,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(138,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(139,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(140,'Handicapped','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(141,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(142,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(143,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(144,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(145,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(146,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(147,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(148,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(149,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(150,'Electric','Freedom Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(1,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(2,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(3,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(4,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(5,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(6,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(7,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(8,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(9,'Regular','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(10,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(11,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(12,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(13,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(14,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(15,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(16,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(17,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(18,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(19,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(20,'Handicapped','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(21,'Electric','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(22,'Electric','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(23,'Electric','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(24,'Electric','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(25,'Electric','Premiere Lot','A',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(26,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(27,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(28,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(29,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(30,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(31,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(32,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(33,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(34,'Regular','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(35,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(36,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(37,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(38,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(39,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(40,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(41,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(42,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(43,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(44,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(45,'Handicapped','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(46,'Electric','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(47,'Electric','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(48,'Electric','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(49,'Electric','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(50,'Electric','Premiere Lot','B',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(51,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(52,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(53,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(54,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(55,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(56,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(57,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(58,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(59,'Regular','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(60,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(61,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(62,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(63,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(64,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(65,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(66,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(67,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(68,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(69,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(70,'Handicapped','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(71,'Electric','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(72,'Electric','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(73,'Electric','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(74,'Electric','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(75,'Electric','Premiere Lot','C',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(76,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(77,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(78,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(79,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(80,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(81,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(82,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(83,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(84,'Regular','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(85,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(86,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(87,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(88,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(89,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(90,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(91,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(92,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(93,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(94,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(95,'Handicapped','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(96,'Electric','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(97,'Electric','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(98,'Electric','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(99,'Electric','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(100,'Electric','Premiere Lot','D',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(101,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(102,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(103,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(104,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(105,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(106,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(107,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(108,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(109,'Regular','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(110,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(111,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(112,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(113,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(114,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(115,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(116,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(117,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(118,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(119,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(120,'Handicapped','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(121,'Electric','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(122,'Electric','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(123,'Electric','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(124,'Electric','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(125,'Electric','Premiere Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(126,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(127,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(128,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(129,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(130,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(131,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(132,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(133,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(134,'Regular','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(135,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(136,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(137,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(138,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(139,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(140,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(141,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(142,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(143,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(144,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(145,'Handicapped','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(146,'Electric','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(147,'Electric','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(148,'Electric','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(149,'Electric','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(150,'Electric','Premiere Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(151,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(152,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(153,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(154,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(155,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(156,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(157,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(158,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(159,'Regular','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(160,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(161,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(162,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(163,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(164,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(165,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(166,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(167,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(168,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(169,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(170,'Handicapped','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(171,'Electric','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(172,'Electric','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(173,'Electric','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(174,'Electric','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(175,'Electric','Premiere Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(176,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(177,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(178,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(179,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(180,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(181,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(182,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(183,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(184,'Regular','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(185,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(186,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(187,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(188,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(189,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(190,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(191,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(192,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(193,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(194,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(195,'Handicapped','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(196,'Electric','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(197,'Electric','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(198,'Electric','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(199,'Electric','Premiere Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(200,'Electric','Premiere Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(1,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(2,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(3,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(4,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(5,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(6,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(7,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(8,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(9,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(10,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(11,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(12,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(13,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(14,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(15,'Regular','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(16,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(17,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(18,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(19,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(20,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(21,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(22,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(23,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(24,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(25,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(26,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(27,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(28,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(29,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(30,'Handicapped','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(31,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(32,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(33,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(34,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(35,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(36,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(37,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(38,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(39,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(40,'Electric','Justice Lot','AS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(41,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(42,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(43,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(44,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(45,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(46,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(47,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(48,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(49,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(50,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(51,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(52,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(53,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(54,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(55,'Regular','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(56,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(57,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(58,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(59,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(60,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(61,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(62,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(63,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(64,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(65,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(66,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(67,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(68,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(69,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(70,'Handicapped','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(71,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(72,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(73,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(74,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(75,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(76,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(77,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(78,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(79,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(80,'Electric','Justice Lot','BS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(81,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(82,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(83,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(84,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(85,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(86,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(87,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(88,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(89,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(90,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(91,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(92,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(93,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(94,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(95,'Regular','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(96,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(97,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(98,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(99,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(100,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(101,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(102,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(103,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(104,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(105,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(106,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(107,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(108,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(109,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(110,'Handicapped','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(111,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(112,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(113,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(114,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(115,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(116,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(117,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(118,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(119,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(120,'Electric','Justice Lot','CS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(121,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(122,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(123,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(124,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(125,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(126,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(127,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(128,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(129,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(130,'Regular','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(131,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(132,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(133,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(134,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(135,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(136,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(137,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(138,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(139,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(140,'Handicapped','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(141,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(142,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(143,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(144,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(145,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(146,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(147,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(148,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(149,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(150,'Electric','Justice Lot','DS',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(151,'Handicapped','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(152,'Handicapped','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(153,'Handicapped','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(154,'Handicapped','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(155,'Handicapped','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(156,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(157,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(158,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(159,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(160,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(161,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(162,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(163,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(164,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(165,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(166,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(167,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(168,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(169,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(170,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(171,'Regular','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(172,'Electric','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(173,'Electric','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(174,'Electric','Justice Lot','V',0);
INSERT INTO ParkingSpaces(space_id,space_type,lot_name,zone_id,availability)
VALUES(175,'Electric','Justice Lot','V',0);

--Permits
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0001A',2020-08-12,14:00:00,2020-08-12,16:00:00,2,200,'Premiere Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0012B',2020-08-14,11:00:00,2020-08-14,14:00:00,3,160,'Justice Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0015J',2020-08-17,10:10:00,2020-08-17,12:10:00,2,151,'Justice Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0021L',2020-08-17,11:25:00,2020-08-17,12:40:00,1,173,'Justice Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0026P',2020-08-19,14:50:00,2020-08-19,16:50:00,2,153,'Justice Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('V','20V0025B',2020-09-21,9:30:00,2020-09-21,13:30:00,4,200,'Premiere Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('B','20B0001B',2020-08-10,00:00:00,2021-08-09,23:59:00,0,71,'Freedom Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('CS','20CS001C',2020-08-15,00:00:00,2020-12-14,23:59:00,0,160,'Premiere Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('D','20D0021D',2020-07-10,00:00:00,2021-07-09,23:59:00,0,130,'Freedom Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('AS','20AS016S',2020-09-01,00:00:00,2020-12-31,23:59:00,0,101,'Premiere Lot');
INSERT INTO Permits(zone_id,permit_id,start_dates,start_time,expiration_date,expiration_time,duration,space_id,lot_name)
VALUES('A','20A0052A',2020-07-29,00:00:00,2021-07-28,23:59:00,0,10,'Freedom Lot');

--Non_Visitor_Permit
INSERT INTO Non_Visitor_Permit(univid,permit_id)
VALUES('1007999','20B0001B');
INSERT INTO Non_Visitor_Permit(univid,permit_id)
VALUES('1006003','20CS001C');
INSERT INTO Non_Visitor_Permit(univid,permit_id)
VALUES('1006020','20D0021D');
INSERT INTO Non_Visitor_Permit(univid,permit_id)
VALUES('1006135','20AS016S');
INSERT INTO Non_Visitor_Permit(univid,permit_id)
VALUES('1006022','20A0052A');

--Visitor_Permit
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777117777','20V0001A');
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777147777','20V0012B');
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777137777','20V0015J');
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777127777','20V0021L');
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777157777','20V0026P');
INSERT INTO Visitor_Permit(phone,permit_id)
VALUES('7777147777','20V0025B');

--Vehicle_Info
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2018',null,'7777117777','20V0001A','CDF5731','Camry','Red','Toyota');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2019',null,'7777127777','20V0021L','AKL1732','Model X','Silver','Tesla');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2015',null,'7777137777','20V0015J','UGY9123','Maxima','Black','Nissan');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2017',null,'7777147777','20V0025B','TRK1093','Rio','Blue','Kia');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2016',null,'7777157777','20V0026P','UWA1118','Q3','White','Audi');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2014','1006003',null,'20B0001B','UGB9020','Cruze','Silver','Chevrolet');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2018','1007999',null,'20CS001C','VTZ87543','LEAF','Black','Nissan');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2017','1006020',null,'20D0021D','TIR3487','X5','White','BMW');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2016','1006020',null,'20D0021D','RPU1824','Odyssey','Blue','Honda');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2011','1006135',null,'20AS016S','NEV9889','Elantra','Red','Hyundai');
INSERT INTO Vehicle_Info(car_year,univid,phone,permit_id,license_plate,model,color,car_manufacturer)
VALUES('2009','1006022',null,'20A0052A','KTP2003','RDX','Black','Acura');


--Violations
INSERT INTO Violations(VIOLATION,fee)
VALUES('Expired Permit',25);
INSERT INTO Violations(VIOLATION,fee)
VALUES('Invalid Permit',20);
INSERT INTO Violations(VIOLATION,fee)
VALUES('No Permit',40);

--CITATIONS
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10001,'TRK1093',2020-08-14,14:40:00,'Expired Permit','Justice Lot','paid',2020-09-13);
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10002,'UGY9123',2020-08-17,12:55:00,'Expired Permit','Justice Lot','unpaid',2020-09-16);
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10003,'AKL1732',2020-08-17,13:40:00,'Expired Permit','Justice Lot','unpaid',2020-09-16);
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10004,'NEV9889',2020-09-10,15:50:00,'Invalid Permit','Justice Lot','unpaid',2020-10-09);
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10005,'KTP2003',2020-09-14,10:05:00,'No Permit','Freedom Lot','paid',2020-10-13);
INSERT INTO CITATIONS(citation_number,license_plate,cit_date,cit_time,VIOLATION,lot_name,ispaid,due_date)
VALUES(10006,'TRK1093',2020-09-21,14:00:00,'Expired Permit','Premiere Lot','unpaid',2020-10-20);



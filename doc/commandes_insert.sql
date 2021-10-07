--
-- commandesInsert.sql
--
PRAGMA foreign_keys = OFF ;

delete from clients where 1=1;
delete from produits where 1=1;
delete from prix where 1=1;
delete from commandes where 1=1;
delete from items where 1=1;

PRAGMA foreign_keys = ON;

--
-- clients
--

insert into clients values
    (100, 'JOCKSPORTS', '345 VIEWRIDGE', 'BELMONT', 'CA', '96711', 415, 5986609, 7844, 5000);
insert into clients values
    (101, 'TKB SPORT SHOP', '490 BOLI RD.', 'REDWOOD CITY', 'CA', '94061', 415, 3681223, 7521, 10000);
insert into clients values
    (102, 'VOLLYRITE', '9722 HAMILTON', 'BURLINGAME', 'CA', '95133', 415, 6443341, 7654, 7000);
insert into clients values
    (103, 'JUST TENNIS', 'HILLVIEW MALL', 'BURLINGAME', 'CA', '97544', 415, 6779312, 7521, 3000);
insert into clients values
    (104, 'EVERY MOUNTAIN', '574 SURRY RD.', 'CUPERTINO', 'CA', '93301', 408, 9962323, 7499, 10000);
insert into clients values
    (105, 'K + T SPORTS', '3476 EL PASEO', 'SANTA CLARA', 'CA', '91003', 408, 3769966, 7844, 5000);
insert into clients values
    (106, 'SHAPE UP', '908 SEQUOIA', 'PALO ALTO', 'CA', '94301', 415, 3649777, 7521, 6000);
insert into clients values
    (107, 'WOMENS SPORTS', 'VALCO VILLAGE', 'SUNNYVALE', 'CA', '93301', 408, 9674398, 7499, 10000);
insert into clients values
    (108, 'NORTH WOODS HEALTH', '98 LONE PINE WAY', 'HIBBING', 'MN', '55649', 612, 5669123, 7844, 8000);
insert into clients values
    (201, 'STADIUM SPORTS', '47 IRVING PL.', 'NEW YORK', 'NY', '10003', 212, 5555335, 7557, 10000);
insert into clients values
    (202, 'HOOPS', '2345 ADAMS AVE.', 'LEICESTER', 'MA', '01524', 508, 5557542, 7820, 5000);
insert into clients values
    (203, 'REBOUND SPORTS', '2 E. 14TH ST.', 'NEW YORK', 'NY', '10009', 212, 5555989, 7557, 10000);
insert into clients values
    (204, 'THE POWER FORWARD', 'KNOTS LANDING', 'DALLAS', 'TX', '75248', 214, 5550505, 7560, 12000);
insert into clients values
    (205, 'POINT GUARD', '20 THURSTON ST.', 'YONKERS', 'NY', '10956', 914, 5554766, 7557, 3000);
insert into clients values
    (206, 'THE COLISEUM', '5678 WILBUR PL.', 'SCARSDALE', 'NY', '10583', 914, 5550217, 7557, 6000);
insert into clients values
    (207, 'FAST BREAK', '1000 HERBERT LN.', 'CONCORD', 'MA', '01742', 508, 5551298, 7820, 7000);
insert into clients values
    (208, 'AL AND BOB SPORTS', '260 YORKTOWN CT.', 'AUSTIN', 'TX', '78731', 512, 5557631, 7560, 4000);
insert into clients values
    (211, 'AT BAT', '234 BEACHEM ST.', 'BROOKLINE', 'MA', '02146', 617, 5557385, 7820, 8000);
insert into clients values
    (212, 'ALL SPORT', '1000 38TH ST.', 'BROOKLYN', 'NY', '11210', 718, 5551739, 7600, 6000);
insert into clients values
    (213, 'GOOD SPORT', '400 46TH ST.', 'SUNNYSIDE', 'NY', '11104', 718, 5553771, 7600, 5000);
insert into clients values
    (214, 'AL PRO SHOP', '45 SPRUCE ST.', 'SPRING', 'TX', '77388', 713, 5555172, 7564, 8000);
insert into clients values
    (215, 'BOB FAMILY SPORTS', '400 E. 23RD', 'HOUSTON', 'TX', '77026', 713, 5558015, 7654, 8000);
insert into clients values
    (216, 'THE ALL AMERICAN', '547 PRENTICE RD.', 'CHELSEA', 'MA', '02150', 617, 5553047, 7820, 5000);
insert into clients values
    (217, 'HIT, THROW, AND RUN', '333 WOOD COURT', 'GRAPEVINE', 'TX', '76051', 817, 5552352, 7564, 6000);
insert into clients values
    (218, 'THE OUTFIELD', '346 GARDEN BLVD.', 'FLUSHING', 'NY', '11355', 718, 5552131, 7820, 4000);
insert into clients values
    (221, 'WHEELS AND DEALS', '2 MEMORIAL DRIVE', 'HOUSTON', 'TX', '77007', 713, 5554139, 7789, 10000);
insert into clients values
    (222, 'JUST BIKES', '4000 PARKRIDGE BLVD.', ' DALLAS', 'TX',  '75205', 214, 5558735, 7789, 4000);
insert into clients values
    (223, 'VELO SPORTS', '23 WHITE ST.', 'MALDEN', 'MA', '02148', 617, 5554983, 7820, 5000);
insert into clients values
    (224, 'JOE BIKE SHOP', '4500 FOX COURT', 'GRAND PRARIE', 'TX', '75051', 214, 5559834, 7789, 6000);
insert into clients values
    (225, 'BOB SWIM', '300 HORSECREEK', 'IRVING', 'TX', '75039', 214, 5558388, 7789, 7000);
insert into clients values
    (226, 'CENTURY SHOP', '8 DAGMAR DR.', 'HUNTINGTON', 'NY', '11743', 516, 5553006, 7555, 4000);
insert into clients values
    (227, 'THE TOUR', '2500 GARDNER RD.', 'SOMERVILLE', 'MA', '02144', 617, 5556673, 7820, 5000);
insert into clients values
    (228, 'FITNESS FIRST', '5000 85TH ST.', 'JACKSON HEIGHTS', 'NY', '11372', 718, 5558710, 7555, 4000);
--
-- produits
--

insert into produits values (100860, 'ACE TENNIS RACKET I');
insert into produits values (100861, 'ACE TENNIS RACKET II');
insert into produits values (100870, 'ACE TENNIS BALLS-3 PACK');
insert into produits values (100871, 'ACE TENNIS BALLS-6 PACK');
insert into produits values (100890, 'ACE TENNIS NET');
insert into produits values (101860, 'SP TENNIS RACKET');
insert into produits values (101863, 'SP JUNIOR RACKET');
insert into produits values (102130, 'RH: "GUIDE TO TENNIS"');
insert into produits values (200376, 'SB ENERGY BAR-6 PACK');
insert into produits values (200380, 'SB VITA SNACK-6 PACK');
insert into produits values (103120, 'WIFF SOFTBALL BAT I');
insert into produits values (103121, 'WIFF SOFTBALL BAT II');
insert into produits values (103130, 'WIFF SOFTBALL, SMALL');
insert into produits values (103131, 'WIFF SOFTBALL, LARGE');
insert into produits values (103140, 'WIFF SOFTBALL MITT (LH)');
insert into produits values (103141, 'WIFF SOFTBALL MITT (RH)');
insert into produits values (102132, 'RH: "GUIDE TO SOFTBALL"');
insert into produits values (104350, 'DUNK BASKETBALL INDOOR');
insert into produits values (104351, 'DUNK BASKETBALL OUTDOOR');
insert into produits values (104352, 'DUNK BASKETBALL PROFESSIONAL');
insert into produits values (104360, 'DUNK HOOP');
insert into produits values (104361, 'DUNK HOOP W/FIBERGLASS BOARD');
insert into produits values (104362, 'DUNK NETS - RAINBOW');
insert into produits values (102134, 'RH: "GUIDE TO BASKETBALL"');
insert into produits values (105123, 'YELLOW JERSEY BICYCLE HELMET');
insert into produits values (105124, 'YELLOW JERSEY BICYCLE GLOVES');
insert into produits values (105125, 'YELLOW JERSEY WATER BOTTLE');
insert into produits values (105126, 'YELLOW JERSEY BOTTLE CAGE');
insert into produits values (105127, 'YELLOW JERSEY FRAME PUMP');
insert into produits values (105128, 'YELLOW JERSEY SADDLE PACK');
insert into produits values (102136, 'RH: "GUIDE TO CYCLING');
--
-- prix
--


insert into prix values (100871,4.8,3.2,'19890101','19891201');
insert into prix values (100890,58,46.4,'19890101',NULL);
insert into prix values (100890,54,40.5,'19880601','19881231');
insert into prix values (100860,35,28,'19900601',NULL);
insert into prix values (100860,32,25.6,'19900101','19900531');
insert into prix values (100860,30,24,'19890101','19891231');
insert into prix values (100861,45,36,'19900601',NULL);
insert into prix values (100861,42,33.6,'19900101','19900531');
insert into prix values (100861,39,31.2,'19890101','19891231');
insert into prix values (100870,2.8,2.4,'19900101',NULL);
insert into prix values (100870,2.4,1.9,'19890101','19891201');
insert into prix values (100871,5.6,4.8,'19900101',NULL);
insert into prix values (101860,24,18,'19890215',NULL);
insert into prix values (101863,12.5,9.4,'19890215',NULL);
insert into prix values (102130,3.4,2.8,'19890818',NULL);
insert into prix values (200376,2.4,1.75,'19901115',NULL);
insert into prix values (200380,4,3.2,'19901115',NULL);
insert into prix values (103120,23.2,18.6,'19890101','19891231');
insert into prix values (103120,24,19.2,'19900101','19900531');
insert into prix values (103120,25,20,'19900601',NULL);
insert into prix values (103121,27.8,22.3,'19890101','19891231');
insert into prix values (103121,28.8,23,'19900101','19900531');
insert into prix values (103121,30,24,'19900601',NULL);
insert into prix values (103130,4,3.5,'19890101','19891231');
insert into prix values (103130,4.2,3.6,'19900101',NULL);
insert into prix values (103131,4.2,3.6,'19890101','19891231');
insert into prix values (103131,4.5,3.9,'19900101',NULL);
insert into prix values (103140,20,15,'19890215',NULL);
insert into prix values (103141,20,15,'19890215',NULL);
insert into prix values (102132,3.4,2.8,'19890818',NULL);
insert into prix values (104350,40,32,'19890101','19891231');
insert into prix values (104350,42,33.6,'19900101','19900531');
insert into prix values (104350,44,35.3,'19900601',NULL);
insert into prix values (104351,23.6,18.9,'19890101','19891231');
insert into prix values (104351,24.8,19.8,'19900101','19900531');
insert into prix values (104351,26,20.8,'19900601',NULL);
insert into prix values (104352,50,35,'19890101','19891231');
insert into prix values (104352,54,37.8,'19900101','19900531');
insert into prix values (104352,58.3,40.8,'19900601',NULL);
insert into prix values (104360,36,29.5,'19890101','19891231');
insert into prix values (104360,39,32,'19900101',NULL);
insert into prix values (104361,47,33,'19890101','19891231');
insert into prix values (104361,50,35,'19900101',NULL);
insert into prix values (104362,5,4,'19890215',NULL);
insert into prix values (102134,3.4,2.8,'19890818',NULL);
insert into prix values (105123,36.3,29,'19890101','19891231');
insert into prix values (105123,37.7,32,'19900101','19900531');
insert into prix values (105123,40,34,'19900601',NULL);
insert into prix values (105124,10,7.6,'19890101','19891231');
insert into prix values (105124,12,9,'19900101','19900531');
insert into prix values (105124,15,10,'19900601',NULL);
insert into prix values (105125,2,1.7,'19890101','19891231');
insert into prix values (105125,3,2.6,'19900101',NULL);
insert into prix values (105126,5,4.3,'19890101','19891231');
insert into prix values (105126,6,5,'19900101',NULL);
insert into prix values (105127,6,5,'19901115',NULL);
insert into prix values (105128,10,8,'19901115',NULL);
insert into prix values (102136,3.4,2.8,'19890818',NULL);
--
-- commandes
--


insert into commandes values (610,'19910107',101,'19910108',101.4);
insert into commandes values (611,'19910111',102,'19910111',45);
insert into commandes values (612,'19910115',104,'19910120',5860);
insert into commandes values (601,'19900501',106,'19900530',60.8);
insert into commandes values (602,'19900605',102,'19900620',56);
insert into commandes values (600,'19900501',103,'19900529',42);
insert into commandes values (604,'19900615',106,'19900630',642);
insert into commandes values (605,'19900714',106,'19900730',8374);
insert into commandes values (606,'19900714',100,'19900730',3.4);
insert into commandes values (609,'19900801',100,'19900815',102.5);
insert into commandes values (607,'19900718',104,'19900718',5.6);
insert into commandes values (608,'19900725',104,'19900725',35.2);
insert into commandes values (603,'19900605',102,'19900605',224);
insert into commandes values (620,'19910312',100,'19910312',4450);
insert into commandes values (613,'19910201',108,'19910201',6400);
insert into commandes values (614,'19910201',102,'19910205',23940);
insert into commandes values (616,'19910203',103,'19910210',764);
insert into commandes values (619,'19910222',104,'19910304',1260);
insert into commandes values (617,'19910205',105,'19910303',46370);
insert into commandes values (615,'19910201',107,'19910206',710);
insert into commandes values (618,'19910215',102,'19910306',3083);
insert into commandes values (621,'19910315',100,'19910401',730);
insert into commandes values (509,'19890604',226,'19890610',1174);
insert into commandes values (523,'19900213',226,'19900213',1165);
insert into commandes values (549,'19901227',226,'19910114',1620);
insert into commandes values (507,'19890526',228,'19890527',886);
insert into commandes values (516,'19890930',228,'19891003',1815);
insert into commandes values (553,'19910202',228,'19910213',4400);
insert into commandes values (526,'19900304',221,'19900307',7700);
insert into commandes values (543,'19900904',221,'19900907',8400);
insert into commandes values (555,'19910304',221,'19910307',8540);
insert into commandes values (559,'19901116',222,'19910423',387.2);
insert into commandes values (528,'19900324',224,'19900324',3770);
insert into commandes values (531,'19900331',224,'19900402',1400);
insert into commandes values (558,'19910331',224,'19910402',1700);
insert into commandes values (525,'19900228',225,'19900303',377);
insert into commandes values (552,'19910202',223,'19910207',555.8);
insert into commandes values (556,'19910310',223,'19910312',85);
insert into commandes values (560,'19910425',223,'19910425',72);
insert into commandes values (565,'19910601',227,'19910603',4900);
insert into commandes values (574,'19911010',201,'19911012',1685);
insert into commandes values (576,'19911013',201,'19911018',2058.9);
insert into commandes values (503,'19890325',201,'19890406',1876);
insert into commandes values (518,'19891020',201,'19891105',2932.5);
insert into commandes values (517,'19891023',201,'19891107',784);
insert into commandes values (544,'19900911',202,'19900915',2358);
insert into commandes values (524,'19900222',202,'19900304',1979);
insert into commandes values (502,'19890210',202,'19890223',500);
insert into commandes values (539,'19900626',202,'19900703',1300);
insert into commandes values (511,'19890817',202,'19890821',647);
insert into commandes values (512,'19890828',203,'19890913',428);
insert into commandes values (562,'19910504',203,'19910519',2044.5);
insert into commandes values (529,'19900402',203,'19900405',1264.7);
insert into commandes values (563,'19910525',204,'19910526',889);
insert into commandes values (568,'19910713',204,'19910721',1217.4);
insert into commandes values (504,'19890411',204,'19890412',1434.7);
insert into commandes values (538,'19900623',204,'19900626',741);
insert into commandes values (535,'19900528',204,'19900609',810);
insert into commandes values (578,'19911119',204,'19911204',2275.6);
insert into commandes values (534,'19900511',206,'19900515',420);
insert into commandes values (536,'19900521',206,'19900606',2135.6);
insert into commandes values (572,'19910819',206,'19910824',1200.5);
insert into commandes values (514,'19890905',207,'19890916',1140);
insert into commandes values (521,'19891120',207,'19891123',896.9);
insert into commandes values (551,'19910122',208,'19910206',1142);
insert into commandes values (513,'19890906',208,'19890914',1497);
insert into commandes values (508,'19890526',208,'19890608',1080);
insert into commandes values (515,'19890919',208,'19890926',1428.5);
insert into commandes values (542,'19900811',208,'19900823',2409);
insert into commandes values (573,'19911010',201,'19911012',1627);
insert into commandes values (566,'19910609',201,'19910612',3389.2);
insert into commandes values (520,'19891116',201,'19891119',341.6);
insert into commandes values (519,'19891020',201,'19891105',955);
insert into commandes values (575,'19911004',201,'19911017',684);
insert into commandes values (547,'19901016',202,'19901027',984.4);
insert into commandes values (540,'19900715',202,'19900717',861.2);
insert into commandes values (567,'19910705',202,'19910707',200);
insert into commandes values (570,'19910717',202,'19910724',663.6);
insert into commandes values (571,'19910802',202,'19910812',1095.6);
insert into commandes values (541,'19900808',203,'19900818',400);
insert into commandes values (532,'19900408',203,'19900421',1295.4);
insert into commandes values (527,'19900227',204,'19900314',3054.4);
insert into commandes values (501,'19890106',204,'19890111',216);
insert into commandes values (564,'19910525',204,'19910526',898.8);
insert into commandes values (537,'19900614',204,'19900626',672.9);
insert into commandes values (522,'19900107',204,'19900110',2578.8);
insert into commandes values (554,'19910218',204,'19910222',282.8);
insert into commandes values (569,'19910716',205,'19910723',2073);
insert into commandes values (550,'19910127',205,'19910207',2356);
insert into commandes values (548,'19901126',205,'19901212',666.9);
insert into commandes values (505,'19890407',206,'19890422',650);
insert into commandes values (577,'19911006',206,'19911020',1265.75);
insert into commandes values (533,'19900428',206,'19900502',1122.1);
insert into commandes values (561,'19910420',207,'19910507',2558.3);
insert into commandes values (506,'19890427',208,'19890510',2600.4);
insert into commandes values (530,'19900403',208,'19900407',3026.5);
insert into commandes values (545,'19901006',208,'19901013',475);
insert into commandes values (557,'19910308',208,'19910312',2461.8);
insert into commandes values (546,'19901017',208,'19901023',3663);
insert into commandes values (510,'19890718',208,'19890721',1336.6);

--
-- items
--


insert into items values (600, 1, 100861,   42, 1, 42);
insert into items values (610, 3, 100890,   58, 1, 58);
insert into items values (611, 1, 100861,   45, 1, 45);
insert into items values (612, 1, 100860,   30, 100, 3000);
insert into items values (601, 1, 200376,  2.4, 12, 28.8);
insert into items values (601, 2, 100860,   32, 1, 32);
insert into items values (602, 1, 100870,  2.8, 20, 56);
insert into items values (604, 1, 100890,   58, 3, 174);
insert into items values (604, 2, 100861,   42, 2, 84);
insert into items values (604, 3, 100860,   32, 12, 384);
insert into items values (603, 1, 100860,   32, 7, 224);
insert into items values (610, 1, 100860,   35, 1, 35);
insert into items values (610, 2, 100870,  2.8, 3, 8.4);
insert into items values (613, 4, 200376,  2.2, 200, 440);
insert into items values (614, 1, 100860,   35, 444, 15540);
insert into items values (614, 2, 100870,  2.8, 1000, 2800);
insert into items values (612, 2, 100861, 40.5, 20, 810);
insert into items values (612, 3, 101863,   10, 150, 1500);
insert into items values (620, 1, 100860,   35, 10, 350);
insert into items values (620, 2, 200376,  2.4, 1000, 2400);
insert into items values (620, 3, 102130,  3.4, 500, 1700);
insert into items values (613, 1, 100871,  5.6, 100, 560);
insert into items values (613, 2, 101860,   24, 200, 4800);
insert into items values (613, 3, 200380,    4, 150, 600);
insert into items values (619, 3, 102130,  3.4, 100, 340);
insert into items values (617, 1, 100860,   35, 50, 1750);
insert into items values (617, 2, 100861,   45, 100, 4500);
insert into items values (614, 3, 100871,  5.6, 1000, 5600);
insert into items values (616, 1, 100861,   45, 10, 450);
insert into items values (616, 2, 100870,  2.8, 50, 140);
insert into items values (616, 3, 100890,   58, 2, 116);
insert into items values (616, 4, 102130,  3.4, 10, 34);
insert into items values (616, 5, 200376,  2.4, 10, 24);
insert into items values (619, 1, 200380,    4, 100, 400);
insert into items values (619, 2, 200376,  2.4, 100, 240);
insert into items values (615, 1, 100861,   45, 4, 180);
insert into items values (607, 1, 100871,  5.6, 1, 5.6);
insert into items values (615, 2, 100870,  2.8, 100, 280);
insert into items values (617, 3, 100870,  2.8, 500, 1400);
insert into items values (617, 4, 100871,  5.6, 500, 2800);
insert into items values (617, 5, 100890,   58, 500, 29000);
insert into items values (617, 6, 101860,   24, 100, 2400);
insert into items values (617, 7, 101863, 12.5, 200, 2500);
insert into items values (617, 8, 102130,  3.4, 100, 340);
insert into items values (617, 9, 200376,  2.4, 200, 480);
insert into items values (617, 10, 200380,   4, 300, 1200);
insert into items values (609, 2, 100870,  2.5, 5, 12.5);
insert into items values (609, 3, 100890,   50, 1, 50);
insert into items values (618, 1, 100860,   35, 23, 805);
insert into items values (618, 2, 100861,   45, 50, 2250);
insert into items values (618, 3, 100870,  2.8, 10, 28);
insert into items values (621, 1, 100861,   45, 10, 450);
insert into items values (621, 2, 100870,  2.8, 100, 280);
insert into items values (615, 3, 100871,    5, 50, 250);
insert into items values (608, 1, 101860,   24, 1, 24);
insert into items values (608, 2, 100871,  5.6, 2, 11.2);
insert into items values (609, 1, 100861,   40, 1, 40);
insert into items values (606, 1, 102130,  3.4, 1, 3.4);
insert into items values (605, 1, 100861,   45, 100, 4500);
insert into items values (605, 2, 100870,  2.8, 500, 1400);
insert into items values (605, 3, 100890,   58, 5, 290);
insert into items values (605, 4, 101860,   24, 50, 1200);
insert into items values (605, 5, 101863,  9.5, 100, 950);
insert into items values (605, 6, 102130,  3.4, 10, 34);
insert into items values (612, 4, 100871,  5.5, 100, 550);
insert into items values (619, 4, 100871,  5.6, 50, 280);
insert into items values (509, 1, 105123,   35, 30, 1050);
insert into items values (509, 2, 105124,    9, 10, 90);
insert into items values (509, 3, 102136,  3.4, 10, 34);
insert into items values (523, 1, 102136,  3.4, 10, 34);
insert into items values (523, 2, 105123, 37.7, 30, 1131);
insert into items values (549, 1, 105123,   38, 5, 190);
insert into items values (549, 2, 105127,    6, 30, 180);
insert into items values (549, 3, 105125,    3, 200, 600);
insert into items values (549, 4, 105124,   13, 50, 650);
insert into items values (507, 1, 105123, 35.3, 20, 706);
insert into items values (507, 2, 105124,    9, 20, 180);
insert into items values (516, 1, 105124,    9, 60, 540);
insert into items values (516, 2, 102136,  3.2, 250, 800);
insert into items values (516, 3, 105125,  1.9, 250, 475);
insert into items values (553, 1, 105127,    6, 500, 3000);
insert into items values (553, 2, 200376, 1.75, 800, 1400);
insert into items values (526, 1, 105123,   32, 100, 3200);
insert into items values (526, 2, 105124,    9, 500, 4500);
insert into items values (543, 1, 105123,   34, 100, 3400);
insert into items values (543, 2, 105124,   10, 500, 5000);
insert into items values (555, 1, 105123,   34, 100, 3400);
insert into items values (555, 2, 105124,   10, 500, 5000);
insert into items values (555, 3, 102136,  2.8, 50, 140);
insert into items values (559, 1, 105123,   40, 5, 200);
insert into items values (559, 2, 105124,   15, 5, 75);
insert into items values (559, 3, 105127,    6, 5, 30);
insert into items values (559, 4, 102136,  3.4, 3, 10.2);
insert into items values (559, 5, 200376,  2.4, 30, 72);
insert into items values (528, 1, 105123, 37.7, 100, 3770);
insert into items values (531, 1, 105124,   11, 100, 1100);
insert into items values (531, 2, 102136,    3, 100, 300);
insert into items values (558, 1, 105124,   14, 100, 1400);
insert into items values (558, 2, 102136,    3, 100, 300);
insert into items values (525, 1, 105123, 37.7, 10, 377);
insert into items values (552, 1, 105123,   40, 10, 400);
insert into items values (552, 2, 105124,   15, 10, 150);
insert into items values (552, 3, 102136,  3.4, 1, 3.4);
insert into items values (552, 4, 200376,  2.4, 1, 2.4);
insert into items values (556, 1, 102136,  3.4, 25, 85);
insert into items values (560, 1, 200376,  2.4, 30, 72);
insert into items values (565, 1, 105123,   37, 100, 3700);
insert into items values (565, 2, 105124,   12, 100, 1200);
insert into items values (574, 1, 104350, 41.8, 25, 1045);
insert into items values (574, 2, 200380,  3.2, 200, 640);
insert into items values (576, 1, 104350,   44, 10, 440);
insert into items values (576, 2, 104351,   26, 10, 260);
insert into items values (576, 3, 104362, 4.25, 170, 722.5);
insert into items values (576, 4, 200376, 2.16, 90, 194.4);
insert into items values (576, 5, 200380,  3.4, 130, 442);
insert into items values (503, 1, 104350,   38, 30, 1140);
insert into items values (503, 2, 104351, 23.6, 10, 236);
insert into items values (503, 3, 104352,   50, 10, 500);
insert into items values (518, 1, 104350,   38, 25, 950);
insert into items values (518, 2, 104351, 23.6, 20, 472);
insert into items values (518, 3, 104360,   36, 20, 720);
insert into items values (518, 4, 104362, 4.25, 170, 722.5);
insert into items values (518, 5, 102134,  3.4, 20, 68);
insert into items values (517, 1, 104352,   50, 15, 750);
insert into items values (517, 2, 102134,  3.4, 10, 34);
insert into items values (544, 1, 104350,   44, 15, 660);
insert into items values (544, 2, 104351,   26, 15, 390);
insert into items values (544, 3, 104352, 58.3, 10, 583);
insert into items values (544, 4, 104361,   50, 10, 500);
insert into items values (544, 5, 104362,  4.5, 50, 225);
insert into items values (524, 1, 104350,   42, 10, 420);
insert into items values (524, 2, 104351, 23.56, 35, 824.6);
insert into items values (524, 3, 104362, 4.25, 150, 637.5);
insert into items values (524, 4, 102134, 3.23, 30, 96.9);
insert into items values (502, 1, 104352,   50, 10, 500);
insert into items values (539, 1, 104351,   26, 20, 520);
insert into items values (539, 2, 104360,   39, 20, 780);
insert into items values (511, 1, 104351, 23.6, 15, 354);
insert into items values (511, 2, 104362,  4.5, 50, 225);
insert into items values (511, 3, 102134,  3.4, 20, 68);
insert into items values (512, 1, 104360,   36, 10, 360);
insert into items values (512, 2, 102134,  3.4, 20, 68);
insert into items values (562, 1, 104351, 24.7, 25, 617.5);
insert into items values (562, 2, 104352, 58.3, 15, 874.5);
insert into items values (562, 3, 104362, 4.25, 130, 552.5);
insert into items values (529, 1, 104350, 39.89, 30, 1196.7);
insert into items values (529, 2, 102134,  3.4, 20, 68);
insert into items values (563, 1, 104352, 58.3, 10, 583);
insert into items values (563, 2, 200376, 2.04, 150, 306);
insert into items values (568, 1, 104351, 24.7, 30, 741);
insert into items values (568, 2, 200376, 2.04, 110, 224.4);
insert into items values (568, 3, 200380,  3.6, 70, 252);
insert into items values (504, 1, 104350,   40, 10, 400);
insert into items values (504, 2, 104351, 22.42, 35, 784.7);
insert into items values (504, 3, 104352,   50, 5, 250);
insert into items values (538, 1, 104351, 24.7, 30, 741);
insert into items values (535, 1, 104352,   54, 15, 810);
insert into items values (578, 1, 104350, 41.8, 40, 1672);
insert into items values (578, 2, 200376, 2.04, 190, 387.6);
insert into items values (578, 3, 200380,  3.6, 60, 216);
insert into items values (534, 1, 104350,   42, 10, 420);
insert into items values (536, 1, 104350, 39.89, 40, 1595.6);
insert into items values (536, 2, 104352,   54, 10, 540);
insert into items values (572, 1, 104351, 24.7, 25, 617.5);
insert into items values (572, 2, 104352, 58.3, 10, 583);
insert into items values (514, 1, 104350,   38, 30, 1140);
insert into items values (521, 1, 104350,   40, 20, 800);
insert into items values (521, 2, 102134, 3.23, 30, 96.9);
insert into items values (551, 1, 104350,   44, 10, 440);
insert into items values (551, 2, 104361,   50, 5, 250);
insert into items values (551, 3, 102134,  3.4, 20, 68);
insert into items values (551, 4, 200376, 1.92, 200, 384);
insert into items values (513, 1, 104350,   40, 15, 600);
insert into items values (513, 2, 104351, 23.6, 20, 472);
insert into items values (513, 3, 104362, 4.25, 100, 425);
insert into items values (508, 1, 104360,   36, 20, 720);
insert into items values (508, 2, 104362,  4.5, 80, 360);
insert into items values (515, 1, 104350,   40, 20, 800);
insert into items values (515, 2, 104351, 22.42, 25, 560.5);
insert into items values (515, 3, 102134,  3.4, 20, 68);
insert into items values (542, 1, 104350, 41.8, 25, 1045);
insert into items values (542, 2, 104360,   39, 20, 780);
insert into items values (542, 3, 104361,   50, 11, 550);
insert into items values (542, 4, 102134,  3.4, 10, 34);
insert into items values (573, 1, 103120, 22.5, 50, 1125);
insert into items values (573, 2, 103131, 4.04, 50, 202);
insert into items values (573, 3, 103141,   20, 15, 300);
insert into items values (566, 1, 103120, 23.75, 40, 950);
insert into items values (566, 2, 103121,   27, 50, 1350);
insert into items values (566, 3, 103130, 3.77, 60, 226.2);
insert into items values (566, 4, 103131,  3.9, 170, 663);
insert into items values (566, 5, 103141,   20, 10, 200);
insert into items values (520, 1, 103130,    4, 10, 40);
insert into items values (520, 2, 103131, 3.77, 80, 301.6);
insert into items values (519, 1, 103130,  3.5, 110, 385);
insert into items values (519, 2, 103140,   19, 30, 570);
insert into items values (575, 1, 103140,   19, 30, 570);
insert into items values (575, 2, 200380,  3.8, 30, 114);
insert into items values (547, 1, 103130, 3.77, 80, 301.6);
insert into items values (547, 2, 103131, 4.04, 70, 282.8);
insert into items values (547, 3, 103140,   20, 15, 300);
insert into items values (547, 4, 103141,   20, 5, 100);
insert into items values (540, 1, 103130, 3.98, 40, 159.2);
insert into items values (540, 2, 103131,  3.9, 180, 702);
insert into items values (567, 1, 103140,   20, 10, 200);
insert into items values (570, 1, 103131, 4.04, 90, 363.6);
insert into items values (570, 2, 103140,   20, 15, 300);
insert into items values (571, 1, 103131, 4.04, 70, 282.8);
insert into items values (571, 2, 103140,   19, 25, 475);
insert into items values (571, 3, 102132,  3.4, 15, 51);
insert into items values (571, 4, 200376, 2.16, 80, 172.8);
insert into items values (571, 5, 200380,  3.8, 30, 114);
insert into items values (541, 1, 103140,   20, 10, 200);
insert into items values (541, 2, 103141,   20, 10, 200);
insert into items values (532, 1, 103120, 21.59, 60, 1295.4);
insert into items values (527, 1, 103120, 21.59, 60, 1295.4);
insert into items values (527, 2, 103121, 27.35, 40, 1094);
insert into items values (527, 3, 103140,   19, 35, 665);
insert into items values (501, 1, 103130,  3.6, 60, 216);
insert into items values (564, 1, 103130, 3.77, 80, 301.6);
insert into items values (564, 2, 103131,  3.9, 120, 468);
insert into items values (564, 3, 102132, 3.23, 40, 129.2);
insert into items values (537, 1, 103130,  3.6, 160, 576);
insert into items values (537, 2, 102132, 3.23, 30, 96.9);
insert into items values (522, 1, 103120, 21.59, 80, 1727.2);
insert into items values (522, 2, 103121, 28.8, 10, 288);
insert into items values (522, 3, 103131, 4.04, 90, 363.6);
insert into items values (522, 4, 103141,   20, 10, 200);
insert into items values (554, 1, 103131, 4.04, 70, 282.8);
insert into items values (569, 1, 103120, 22.5, 50, 1125);
insert into items values (569, 2, 103130,  3.6, 180, 648);
insert into items values (569, 3, 103141,   20, 15, 300);
insert into items values (550, 1, 103120, 22.5, 60, 1350);
insert into items values (550, 2, 103140,   19, 45, 855);
insert into items values (550, 3, 103141,   20, 5, 100);
insert into items values (550, 4, 102132,  3.4, 15, 51);
insert into items values (548, 1, 103140,   19, 30, 570);
insert into items values (548, 2, 102132, 3.23, 30, 96.9);
insert into items values (505, 1, 103130,  3.5, 100, 350);
insert into items values (505, 2, 103140,   20, 15, 300);
insert into items values (577, 1, 103121,   30, 20, 600);
insert into items values (577, 2, 103131,  3.9, 150, 585);
insert into items values (577, 3, 102132, 3.23, 25, 80.75);
insert into items values (533, 1, 103121, 27.35, 30, 820.5);
insert into items values (533, 2, 103130, 3.77, 80, 301.6);
insert into items values (561, 1, 103120, 22.5, 80, 1800);
insert into items values (561, 2, 103130, 3.77, 70, 263.9);
insert into items values (561, 3, 103141,   20, 15, 300);
insert into items values (561, 4, 200376, 2.16, 90, 194.4);
insert into items values (506, 1, 103120, 20.88, 80, 1670.4);
insert into items values (506, 2, 103130,  3.5, 180, 630);
insert into items values (506, 3, 103141,   20, 15, 300);
insert into items values (530, 1, 103121, 25.91, 50, 1295.5);
insert into items values (530, 2, 103130,  3.6, 200, 720);
insert into items values (530, 3, 103140,   19, 40, 760);
insert into items values (530, 4, 103141,   20, 10, 200);
insert into items values (530, 5, 102132,  3.4, 15, 51);
insert into items values (545, 1, 103140,   19, 25, 475);
insert into items values (557, 1, 103120, 23.75, 40, 950);
insert into items values (557, 2, 103121,   30, 10, 300);
insert into items values (557, 3, 103140,   19, 35, 665);
insert into items values (557, 4, 200376, 2.16, 80, 172.8);
insert into items values (557, 5, 200380,  3.4, 110, 374);
insert into items values (546, 1, 103120, 22.5, 50, 1125);
insert into items values (546, 2, 103121,   30, 20, 600);
insert into items values (546, 3, 103130,  3.6, 120, 432);
insert into items values (546, 4, 103131,  3.9, 140, 546);
insert into items values (546, 5, 103140,   19, 40, 760);
insert into items values (546, 6, 103141,   20, 10, 200);
insert into items values (510, 1, 103120, 20.88, 60, 1252.8);
insert into items values (510, 2, 103131, 4.19, 20, 83.8);

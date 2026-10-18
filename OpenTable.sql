DROP DATABASE IF EXISTS OpenTable;
CREATE DATABASE OpenTable;
USE OpenTable;

-- ============================================================
-- TABLE DEFINITIONS - Matching Schema Report Exactly
-- No ALTER statements used
-- ============================================================

CREATE TABLE user (
    userID          INT             NOT NULL AUTO_INCREMENT,
    firstName       VARCHAR(50)     NOT NULL,
    lastName        VARCHAR(50)     NOT NULL,
    email           VARCHAR(100)    NOT NULL,
    anniversary     DATE,
    loyaltyPoints   INT             DEFAULT 0,
    street          VARCHAR(100),
    city            VARCHAR(50),
    state           CHAR(2),
    zipCode         VARCHAR(10),
    CONSTRAINT user_pk PRIMARY KEY (userID)
) ENGINE=InnoDB;

CREATE TABLE payMethod (
    pid         INT             NOT NULL AUTO_INCREMENT,
    userID      INT             NOT NULL,
    cardNumber  VARCHAR(19)     NOT NULL,
    cvv         CHAR(4)         NOT NULL,
    expDate     DATE            NOT NULL,
    zipCode     VARCHAR(10),
    CONSTRAINT paymethod_pk         PRIMARY KEY (pid),
    CONSTRAINT paymethod_user_fk    FOREIGN KEY (userID) REFERENCES user(userID)
) ENGINE=InnoDB;

CREATE TABLE phoneNumber (
    id          INT             NOT NULL,
    phoneNumber VARCHAR(20)     NOT NULL,
    CONSTRAINT phone_pk         PRIMARY KEY (id, phoneNumber),
    CONSTRAINT phone_user_fk    FOREIGN KEY (id) REFERENCES user(userID)
) ENGINE=InnoDB;

CREATE TABLE restaurant (
    restID      INT             NOT NULL,
    name        VARCHAR(100)    NOT NULL,
    capacity    INT,
    specialFeat TEXT,
    pictures    VARCHAR(255),
    termsCond   TEXT,
    catering    VARCHAR(50),
    description TEXT,
    street      VARCHAR(100),
    city        VARCHAR(50),
    state       CHAR(2),
    zipCode     VARCHAR(10),
    CONSTRAINT restaurant_pk PRIMARY KEY (restID)
) ENGINE=InnoDB;

CREATE TABLE saved (
    userID INT NOT NULL,
    restID INT NOT NULL,
    PRIMARY KEY (userID, restID),
    FOREIGN KEY (userID) REFERENCES user(userID),
    FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE details (
    detailID        INT             NOT NULL AUTO_INCREMENT,
    restID          INT             NOT NULL,
    execChef        VARCHAR(100),
    diningStyle     ENUM('Casual Dining', 'Fine Dining', 'Fast Casual', 'Upscale Casual', 'Family Style'),
    access          ENUM('Wheelchair Accessible', 'Not Accessible', 'Partially Accessible'),
    parkDetail      ENUM('Street Parking', 'Valet', 'Parking Lot', 'Garage', 'No Parking'),
    paymentOptions  ENUM('Cash Only', 'Credit Cards', 'Digital Wallet', 'All Payment Types'),
    dressCode       ENUM('Casual', 'Business Casual', 'Smart Casual', 'Formal', 'No Dress Code'),
    transit         VARCHAR(100),
    priceRange      ENUM('$', '$$', '$$$', '$$$$'),
    neighborhood    VARCHAR(50),
    privateParty    ENUM('Available', 'Not Available', 'By Request'),
    website         VARCHAR(100),
    CONSTRAINT details_pk       PRIMARY KEY (detailID),
    CONSTRAINT details_rest_fk  FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE cuisine (
    cuisineID   INT             NOT NULL AUTO_INCREMENT,
    cuisineName VARCHAR(50)     NOT NULL,
    CONSTRAINT cuisine_pk PRIMARY KEY (cuisineID)
) ENGINE=InnoDB;

CREATE TABLE restaurantCuisine (
    restID      INT             NOT NULL,
    cuisineID   INT             NOT NULL,
    CONSTRAINT rest_cuisine_pk      PRIMARY KEY (restID, cuisineID),
    CONSTRAINT rest_cuisine_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID),
    CONSTRAINT rest_cuisine_cui_fk  FOREIGN KEY (cuisineID) REFERENCES cuisine(cuisineID)
) ENGINE=InnoDB;

CREATE TABLE awards (
    restID      INT             NOT NULL,
    awardName   VARCHAR(100)    NOT NULL,
    CONSTRAINT awards_pk        PRIMARY KEY (restID, awardName),
    CONSTRAINT awards_rest_fk   FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE featuredIn (
    restID          INT             NOT NULL,
    featuredIName   VARCHAR(100)    NOT NULL,
    CONSTRAINT feat_pk      PRIMARY KEY (restID, featuredIName),
    CONSTRAINT feat_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE faqs (
    faqID       INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    question    TEXT            NOT NULL,
    answer      TEXT,
    CONSTRAINT faqs_pk      PRIMARY KEY (faqID),
    CONSTRAINT faqs_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE popularDishes (
    dishID      INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    name        VARCHAR(100)    NOT NULL,
    price       DECIMAL(8,2),
    description TEXT,
    CONSTRAINT dish_pk      PRIMARY KEY (dishID),
    CONSTRAINT dish_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE specials (
    specID      INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    name        VARCHAR(100)    NOT NULL,
    price       DECIMAL(8,2),
    description TEXT,
    CONSTRAINT specials_pk      PRIMARY KEY (specID),
    CONSTRAINT specials_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE menu (
    menuID      INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    description TEXT,
    pdf         VARCHAR(255),
    websiteLink VARCHAR(255),
    CONSTRAINT menu_pk      PRIMARY KEY (menuID),
    CONSTRAINT menu_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE drinkType (
    restID      INT             NOT NULL,
    drinkName   VARCHAR(50)     NOT NULL,
    CONSTRAINT drink_pk         PRIMARY KEY (restID, drinkName),
    CONSTRAINT drink_rest_fk    FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE alcoholType (
    restID      INT             NOT NULL,
    alcoholName VARCHAR(50)     NOT NULL,
    CONSTRAINT alcohol_pk       PRIMARY KEY (restID, alcoholName),
    CONSTRAINT alcohol_rest_fk  FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE menuItem (
    itemID      INT             NOT NULL AUTO_INCREMENT,
    menuID      INT             NOT NULL,
    name        VARCHAR(100)    NOT NULL,
    price       DECIMAL(8,2),
    description TEXT,
    CONSTRAINT item_pk      PRIMARY KEY (itemID),
    CONSTRAINT item_menu_fk FOREIGN KEY (menuID) REFERENCES menu(menuID)
) ENGINE=InnoDB;

CREATE TABLE servicePeriod (
    spID        INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    periodName  VARCHAR(50),
    dayOfWeek   ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    serviceType ENUM('Breakfast', 'Brunch', 'Lunch', 'Dinner', 'Late Night'),
    startTime   TIME,
    endTime     TIME,
    CONSTRAINT sp_pk        PRIMARY KEY (spID),
    CONSTRAINT sp_rest_fk   FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE experience (
    expID               INT             NOT NULL AUTO_INCREMENT,
    restID              INT             NOT NULL,
    name                VARCHAR(100),
    partySize           INT,
    description         TEXT,
    price               DECIMAL(8,2),
    prePaymentRequired  BOOLEAN         DEFAULT FALSE,
    CONSTRAINT exp_pk       PRIMARY KEY (expID),
    CONSTRAINT exp_rest_fk  FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE expDates (
    expID       INT             NOT NULL,
    dateName    DATE            NOT NULL,
    CONSTRAINT expdate_pk       PRIMARY KEY (expID, dateName),
    CONSTRAINT expdate_exp_fk   FOREIGN KEY (expID) REFERENCES experience(expID)
) ENGINE=InnoDB;

CREATE TABLE reservation (
    reservationID   INT             NOT NULL AUTO_INCREMENT,
    restID          INT             NOT NULL,
    userID          INT             NOT NULL,
    resDate         DATE,
    specialReq      TEXT,
    occasion        VARCHAR(50),
    partySize       INT,
    resTime         TIME,
    status          ENUM('Confirmed', 'Pending', 'Cancelled', 'Completed', 'No-Show') DEFAULT 'Confirmed',
    attendees       TEXT,
    bookPolicy      TEXT,
    CONSTRAINT reservation_pk           PRIMARY KEY (reservationID),
    CONSTRAINT reservation_rest_fk      FOREIGN KEY (restID)    REFERENCES restaurant(restID),
    CONSTRAINT reservation_user_fk      FOREIGN KEY (userID)    REFERENCES user(userID)
) ENGINE=InnoDB;

CREATE TABLE timeslot (
    slotID          INT             NOT NULL AUTO_INCREMENT,
    reservationID   INT,
    spID            INT             NOT NULL,
    expID           INT,
    points          INT             DEFAULT 100,
    slotDate        DATE,
    slotTime        TIME,
    CONSTRAINT slot_pk      PRIMARY KEY (slotID),
    CONSTRAINT slot_res_fk  FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
    CONSTRAINT slot_sp_fk   FOREIGN KEY (spID)   REFERENCES servicePeriod(spID),
    CONSTRAINT slot_exp_fk  FOREIGN KEY (expID)  REFERENCES experience(expID)
) ENGINE=InnoDB;

CREATE TABLE offers (
    offID       INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    slotID      INT,
    name        VARCHAR(100),
    offerType   VARCHAR(50),
    startTime   DATETIME,
    endTime     DATETIME,
    validDates  VARCHAR(100),
    price       DECIMAL(8,2),
    discountAmt DECIMAL(8,2),
    description TEXT,
    CONSTRAINT offers_pk        PRIMARY KEY (offID),
    CONSTRAINT offers_rest_fk   FOREIGN KEY (restID)  REFERENCES restaurant(restID),
    CONSTRAINT offers_slot_fk   FOREIGN KEY (slotID)  REFERENCES timeslot(slotID)
) ENGINE=InnoDB;

CREATE TABLE restaurantTable (
    tableID         INT             NOT NULL AUTO_INCREMENT,
    restID          INT             NOT NULL,
    estimateTime    INT,
    availableStatus ENUM('Available', 'Reserved', 'Occupied', 'Unavailable'),
    tableType       VARCHAR(50),
    seatCapacity    INT,
    room            VARCHAR(50),
    CONSTRAINT table_pk         PRIMARY KEY (tableID),
    CONSTRAINT table_rest_fk    FOREIGN KEY (restID) REFERENCES restaurant(restID)
) ENGINE=InnoDB;

CREATE TABLE privateDining (
    roomID      INT             NOT NULL AUTO_INCREMENT,
    restID      INT             NOT NULL,
    tableID     INT,
    roomName    VARCHAR(100),
    capacity    INT,
    seating     VARCHAR(50),
    CONSTRAINT room_pk          PRIMARY KEY (roomID),
    CONSTRAINT room_rest_fk     FOREIGN KEY (restID)    REFERENCES restaurant(restID),
    CONSTRAINT room_table_fk    FOREIGN KEY (tableID)   REFERENCES restaurantTable(tableID)
) ENGINE=InnoDB;

CREATE TABLE isAvailable (
    reservationID INT NOT NULL,
    tableID INT NOT NULL,
    PRIMARY KEY (reservationID, tableID),
    FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
    FOREIGN KEY (tableID) REFERENCES restaurantTable(tableID)
) ENGINE=InnoDB;

CREATE TABLE review (
    reviewID        INT             NOT NULL AUTO_INCREMENT,
    restID          INT             NOT NULL,
    userID          INT             NOT NULL,
    diningDate      DATE,
    foodRating      INT,
    numOfStars      INT,
    overallRating   DECIMAL(2,1),
    ambRating       INT,
    text_content    TEXT,
    serviceRating   INT,
    CONSTRAINT review_pk        PRIMARY KEY (reviewID),
    CONSTRAINT review_rest_fk   FOREIGN KEY (restID)        REFERENCES restaurant(restID),
    CONSTRAINT review_user_fk   FOREIGN KEY (userID)        REFERENCES user(userID)
) ENGINE=InnoDB;

CREATE TABLE tag (
    tagID       INT             NOT NULL AUTO_INCREMENT,
    tagName     VARCHAR(50)     NOT NULL,
    CONSTRAINT tag_pk           PRIMARY KEY (tagID)
) ENGINE=InnoDB;

CREATE TABLE RestHasTag (
    restID      INT             NOT NULL,
    tagID       INT             NOT NULL,
    CONSTRAINT rest_tag_pk      PRIMARY KEY (restID, tagID),
    CONSTRAINT rest_tag_rest_fk FOREIGN KEY (restID) REFERENCES restaurant(restID),
    CONSTRAINT rest_tag_tag_fk  FOREIGN KEY (tagID)  REFERENCES tag(tagID)
) ENGINE=InnoDB;

CREATE TABLE ReviewHasTag (
    reviewID    INT             NOT NULL,
    tagID       INT             NOT NULL,
    CONSTRAINT review_tag_pk        PRIMARY KEY (reviewID, tagID),
    CONSTRAINT review_tag_review_fk FOREIGN KEY (reviewID) REFERENCES review(reviewID),
    CONSTRAINT review_tag_tag_fk    FOREIGN KEY (tagID)    REFERENCES tag(tagID)
) ENGINE=InnoDB;

CREATE TABLE response (
    respID      INT             NOT NULL AUTO_INCREMENT,
    reviewID    INT             NOT NULL,
    text_body   TEXT,
    CONSTRAINT response_pk          PRIMARY KEY (respID),
    CONSTRAINT response_review_fk   FOREIGN KEY (reviewID) REFERENCES review(reviewID)
) ENGINE=InnoDB;

CREATE TABLE Preferences (
    preferenceID    INT             NOT NULL AUTO_INCREMENT,
    preferenceName  VARCHAR(50)     NOT NULL,
    CONSTRAINT pref_pk          PRIMARY KEY (preferenceID)
) ENGINE=InnoDB;

CREATE TABLE userPreference (
    userID          INT             NOT NULL,
    preferenceID    INT             NOT NULL,
    CONSTRAINT user_pref_pk         PRIMARY KEY (userID, preferenceID),
    CONSTRAINT user_pref_user_fk    FOREIGN KEY (userID) REFERENCES user(userID),
    CONSTRAINT user_pref_pref_fk    FOREIGN KEY (preferenceID) REFERENCES Preferences(preferenceID)
) ENGINE=InnoDB;


USE OpenTable;

-- 1. user (removed preference column - now in separate table)
INSERT INTO user (userID, firstName, lastName, email, anniversary, loyaltyPoints, street, city, state, zipCode) VALUES
(1,'Ava','Johnson','ava1@gmail.com','2022-01-10',120,'12 Lake St','Chicago','IL','60601'),
(2,'Liam','Smith','liam2@gmail.com','2021-05-22',340,'88 Market St','San Francisco','CA','94105'),
(3,'Noah','Brown','noah3@gmail.com','2020-09-14',210,'77 Ocean Dr','Miami','FL','33139'),
(4,'Emma','Davis','emma4@gmail.com','2023-03-11',90,'55 Broadway','New York','NY','10001'),
(5,'Olivia','Wilson','olivia5@gmail.com','2022-07-19',410,'33 Congress Ave','Austin','TX','73301'),
(6,'Elijah','Taylor','eli6@gmail.com','2021-11-02',150,'12 State St','Chicago','IL','60602'),
(7,'Sophia','Anderson','sophia7@gmail.com','2020-06-30',275,'9 Castro St','San Francisco','CA','94114'),
(8,'James','Thomas','james8@gmail.com','2023-02-18',60,'101 Collins Ave','Miami','FL','33133'),
(9,'Isabella','Moore','isa9@gmail.com','2022-08-25',330,'44 Wall St','New York','NY','10005'),
(10,'Lucas','Martin','lucas10@gmail.com','2021-12-01',200,'19 6th St','Austin','TX','73344'),
(11,'Mia','Lee','mia11@gmail.com','2023-01-05',110,'77 Wacker Dr','Chicago','IL','60603'),
(12,'Ethan','Perez','ethan12@gmail.com','2020-10-10',390,'66 Mission St','San Francisco','CA','94103'),
(13,'Amelia','White','amelia13@gmail.com','2022-04-12',220,'10 Brickell Ave','Miami','FL','33130'),
(14,'Harper','Harris','harper14@gmail.com','2021-03-08',180,'99 5th Ave','New York','NY','10011'),
(15,'Benjamin','Clark','ben15@gmail.com','2023-06-20',95,'11 South Congress','Austin','TX','73301'),
(16,'Charlotte','Lewis','char16@gmail.com','2022-02-14',260,'8 Michigan Ave','Chicago','IL','60604'),
(17,'Henry','Walker','henry17@gmail.com','2021-07-09',300,'21 Market St','San Francisco','CA','94111'),
(18,'Evelyn','Young','eve18@gmail.com','2020-12-19',140,'34 Miami Beach','Miami','FL','33141'),
(19,'Alexander','Allen','alex19@gmail.com','2023-09-01',70,'18 Madison Ave','New York','NY','10010'),
(20,'Abigail','King','abi20@gmail.com','2022-10-10',450,'5 Austin St','Austin','TX','73344'),
(21,'Daniel','Scott','dan21@gmail.com','2021-01-15',210,'12 Lake Shore','Chicago','IL','60605'),
(22,'Emily','Green','em22@gmail.com','2020-05-05',320,'77 Castro','San Francisco','CA','94110'),
(23,'Matthew','Baker','mat23@gmail.com','2023-03-03',130,'88 Ocean Blvd','Miami','FL','33137'),
(24,'Ella','Adams','ella24@gmail.com','2022-06-16',175,'66 Park Ave','New York','NY','10016'),
(25,'David','Nelson','dav25@gmail.com','2021-08-28',280,'9 Congress','Austin','TX','73301'),
(26,'Grace','Carter','gra26@gmail.com','2020-11-11',90,'55 State St','Chicago','IL','60606'),
(27,'Logan','Mitchell','log27@gmail.com','2023-04-04',410,'22 Market','San Francisco','CA','94102'),
(28,'Chloe','Perez','chlo28@gmail.com','2022-09-09',150,'11 Miami Ave','Miami','FL','33132'),
(29,'Sebastian','Roberts','seb29@gmail.com','2021-02-02',360,'19 Wall St','New York','NY','10007'),
(30,'Victoria','Turner','vic30@gmail.com','2020-07-07',240,'88 Austin Blvd','Austin','TX','73301'),
(31,'Jack','Phillips','jack31@gmail.com','2022-01-21',110,'13 Lake St','Chicago','IL','60607'),
(32,'Lily','Campbell','lily32@gmail.com','2021-05-15',300,'44 Mission','San Francisco','CA','94109'),
(33,'Owen','Parker','owen33@gmail.com','2020-03-03',200,'77 Brickell','Miami','FL','33131'),
(34,'Hannah','Evans','hannah34@gmail.com','2023-08-08',95,'55 6th Ave','New York','NY','10012'),
(35,'Wyatt','Edwards','wy35@gmail.com','2022-11-11',260,'12 Congress','Austin','TX','73344'),
(36,'Zoey','Collins','zo36@gmail.com','2021-12-12',180,'9 Lake Shore','Chicago','IL','60608'),
(37,'Caleb','Stewart','cal37@gmail.com','2020-10-10',410,'88 Market','San Francisco','CA','94108'),
(38,'Nora','Sanchez','nor38@gmail.com','2023-05-05',120,'66 Ocean Dr','Miami','FL','33136'),
(39,'Ryan','Morris','ry39@gmail.com','2022-02-02',330,'11 Wall St','New York','NY','10009'),
(40,'Layla','Rogers','la40@gmail.com','2021-09-09',210,'33 Austin St','Austin','TX','73301'),
(41,'Nathan','Reed','na41@gmail.com','2020-06-06',150,'21 Lake St','Chicago','IL','60609'),
(42,'Aubrey','Cook','au42@gmail.com','2023-03-13',280,'19 Castro','San Francisco','CA','94107'),
(43,'Isaac','Morgan','is43@gmail.com','2022-07-07',390,'77 Miami Blvd','Miami','FL','33134'),
(44,'Scarlett','Bell','sc44@gmail.com','2021-04-04',90,'55 Park Ave','New York','NY','10013'),
(45,'Dylan','Murphy','dy45@gmail.com','2020-01-01',450,'88 Congress','Austin','TX','73301'),
(46,'Aria','Bailey','ar46@gmail.com','2022-08-18',160,'12 Lake Shore','Chicago','IL','60610'),
(47,'Luke','Rivera','lu47@gmail.com','2021-11-11',300,'44 Market','San Francisco','CA','94106'),
(48,'Sofia','Cooper','so48@gmail.com','2020-09-09',220,'66 Ocean Dr','Miami','FL','33138'),
(49,'Andrew','Richardson','an49@gmail.com','2023-06-06',130,'11 Wall St','New York','NY','10014'),
(50,'Riley','Howard','ri50@gmail.com','2022-12-12',370,'99 Austin Blvd','Austin','TX','73344');

-- 2. paymethod
INSERT INTO payMethod (userID, cardNumber, cvv, expDate, zipCode) VALUES
(1,'4111111111111111','123','2029-01-01','60601'),
(2,'4111111111111112','234','2028-06-01','94105'),
(3,'4111111111111113','345','2027-09-01','33139'),
(4,'4111111111111114','456','2030-03-01','10001'),
(5,'4111111111111115','567','2028-11-01','73301'),
(6,'4111111111111116','678','2029-07-01','60602'),
(7,'4111111111111117','789','2028-05-01','94114'),
(8,'4111111111111118','890','2027-12-01','33133'),
(9,'4111111111111119','901','2030-01-01','10005'),
(10,'4111111111111120','111','2029-02-01','73344'),
(11,'4111111111111121','222','2028-03-01','60603'),
(12,'4111111111111122','333','2027-04-01','94103'),
(13,'4111111111111123','444','2029-05-01','33130'),
(14,'4111111111111124','555','2028-06-01','10011'),
(15,'4111111111111125','666','2027-07-01','73301'),
(16,'4111111111111126','777','2029-08-01','60604'),
(17,'4111111111111127','888','2028-09-01','94111'),
(18,'4111111111111128','999','2027-10-01','33141'),
(19,'4111111111111129','101','2029-11-01','10010'),
(20,'4111111111111130','202','2028-12-01','73344'),
(21,'4111111111111131','303','2027-01-01','60605'),
(22,'4111111111111132','404','2029-02-01','94110'),
(23,'4111111111111133','505','2028-03-01','33137'),
(24,'4111111111111134','606','2027-04-01','10016'),
(25,'4111111111111135','707','2029-05-01','73301'),
(26,'4111111111111136','808','2028-06-01','60606'),
(27,'4111111111111137','909','2027-07-01','94102'),
(28,'4111111111111138','111','2029-08-01','33132'),
(29,'4111111111111139','222','2028-09-01','10007'),
(30,'4111111111111140','333','2027-10-01','73301'),
(31,'4111111111111141','444','2029-11-01','60607'),
(32,'4111111111111142','555','2028-12-01','94109'),
(33,'4111111111111143','666','2027-01-01','33131'),
(34,'4111111111111144','777','2029-02-01','10012'),
(35,'4111111111111145','888','2028-03-01','73344'),
(36,'4111111111111146','999','2027-04-01','60608'),
(37,'4111111111111147','101','2029-05-01','94108'),
(38,'4111111111111148','202','2028-06-01','33136'),
(39,'4111111111111149','303','2027-07-01','10009'),
(40,'4111111111111150','404','2029-08-01','73301');

-- 3. phonenumber
INSERT INTO phoneNumber (id, phoneNumber) VALUES
(1,'312-111-0001'),(1,'312-111-0002'),
(2,'415-222-0001'),
(3,'305-333-0001'),(3,'305-333-0002'),
(4,'212-444-0001'),
(5,'512-555-0001'),(5,'512-555-0002'),
(6,'312-666-0001'),
(7,'415-777-0001'),(7,'415-777-0002'),
(8,'305-888-0001'),
(9,'212-999-0001'),(9,'212-999-0002'),
(10,'512-101-0001'),
(11,'312-111-1001'),
(12,'415-222-2001'),(12,'415-222-2002'),
(13,'305-333-3001'),
(14,'212-444-4001'),(14,'212-444-4002'),
(15,'512-555-5001'),
(16,'312-666-6001'),(16,'312-666-6002'),
(17,'415-777-7001'),
(18,'305-888-8001'),(18,'305-888-8002'),
(19,'212-999-9001'),
(20,'512-101-0101'),(20,'512-101-0102'),
(21,'312-111-1101'),
(22,'415-222-2201'),(22,'415-222-2202'),
(23,'305-333-3301'),
(24,'212-444-4401'),(24,'212-444-4402'),
(25,'512-555-5501'),
(26,'312-666-6601'),(26,'312-666-6602'),
(27,'415-777-7701'),
(28,'305-888-8801'),(28,'305-888-8802'),
(29,'212-999-9901'),
(30,'512-101-0201'),(30,'512-101-0202'),
(31,'312-111-1201'),
(32,'415-222-2301'),(32,'415-222-2302'),
(33,'305-333-3401'),
(34,'212-444-4501'),(34,'212-444-4502'),
(35,'512-555-5601'),
(36,'312-666-6701'),(36,'312-666-6702'),
(37,'415-777-7801'),
(38,'305-888-8901'),(38,'305-888-8902'),
(39,'212-999-9101'),
(40,'512-101-0301'),(40,'512-101-0302'),
(41,'312-111-1301'),
(42,'415-222-2401'),(42,'415-222-2402'),
(43,'305-333-3501'),
(44,'212-444-4601'),(44,'212-444-4602'),
(45,'512-555-5701'),
(46,'312-666-6801'),(46,'312-666-6802'),
(47,'415-777-7901'),
(48,'305-888-9001'),(48,'305-888-9002'),
(49,'212-999-9201'),
(50,'512-101-0401'),(50,'512-101-0402');

-- 4. restaurant
INSERT INTO restaurant (restID, name, capacity, specialFeat, pictures, termsCond, catering, description, street, city, state, zipCode) VALUES
(1,'Aurora Grill',80,'Outdoor Patio,Live Music,Rooftop,Chef Tasting Menu','r1.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),
(2,'Blue Harbor',120,'Waterfront View,Wine Cellar,Private Rooms,Michelin Rated','r2.jpg','Standard','Available','Fine Dining',NULL,'San Francisco','CA',NULL),
(3,'Sunset Steakhouse',60,'Live Music,Chef Tasting Menu,Historic Venue,Private Rooms','r3.jpg','Standard','Not Available','Fine Dining',NULL,'Miami','FL',NULL),
(4,'Urban Table',45,'Open Kitchen,Rooftop,Outdoor Patio,Michelin Rated','r4.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),
(5,'Lone Star Eatery',100,'Chef Tasting Menu,Live Music,Outdoor Patio,Wine Cellar','r5.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(6,'Lakefront Bistro',70,'Waterfront View,Private Rooms,Rooftop,Live Music','r6.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),
(7,'Golden Gate Dining',90,'Michelin Rated,Open Kitchen,Wine Cellar,Chef Tasting Menu','r7.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(8,'Ocean Breeze',110,'Waterfront View,Outdoor Patio,Live Music,Private Rooms','r8.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(9,'Manhattan Eats',50,'Historic Venue,Rooftop,Michelin Rated,Open Kitchen','r9.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),
(10,'Austin Smoke',130,'Live Music,Outdoor Patio,Chef Tasting Menu,Wine Cellar','r10.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(11,'Windy City Deli',40,'Open Kitchen,Private Rooms,Rooftop,Michelin Rated','r11.jpg','Standard','Not Available','Fast Casual',NULL,'Chicago','IL',NULL),
(12,'Bay Fusion',95,'Waterfront View,Live Music,Chef Tasting Menu,Outdoor Patio','r12.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(13,'Coral Reef',75,'Private Rooms,Wine Cellar,Historic Venue,Michelin Rated','r13.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(14,'Empire Dining',65,'Rooftop,Open Kitchen,Live Music,Chef Tasting Menu','r14.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),
(15,'Hill Country BBQ',140,'Outdoor Patio,Live Music,Wine Cellar,Private Rooms','r15.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(16,'Chicago Prime',85,'Michelin Rated,Rooftop,Chef Tasting Menu,Open Kitchen','r16.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),
(17,'Pacific Table',110,'Waterfront View,Live Music,Outdoor Patio,Private Rooms','r17.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(18,'Miami Spice',60,'Chef Tasting Menu,Wine Cellar,Historic Venue,Rooftop','r18.jpg','Standard','Available','Casual Dining',NULL,'Miami','FL',NULL),
(19,'Central Park Eats',55,'Open Kitchen,Michelin Rated,Live Music,Outdoor Patio','r19.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),
(20,'Austin Urban BBQ',120,'Live Music,Outdoor Patio,Wine Cellar,Chef Tasting Menu','r20.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(21,'Northside Grill',80,'Private Rooms,Rooftop,Open Kitchen,Michelin Rated','r21.jpg','Standard','Not Available','Casual Dining',NULL,'Chicago','IL',NULL),
(22,'SF Coastal',100,'Waterfront View,Chef Tasting Menu,Live Music,Wine Cellar','r22.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(23,'Miami Nights',70,'Outdoor Patio,Historic Venue,Private Rooms,Live Music','r23.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(24,'NY Classic',90,'Michelin Rated,Rooftop,Open Kitchen,Wine Cellar','r24.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),
(25,'Austin Flame',130,'Live Music,Outdoor Patio,Chef Tasting Menu,Private Rooms','r25.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(26,'Chicago Harbor',75,'Waterfront View,Live Music,Rooftop,Michelin Rated','r26.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),
(27,'Golden Spoon SF',95,'Open Kitchen,Chef Tasting Menu,Wine Cellar,Private Rooms','r27.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(28,'South Beach Grill',60,'Outdoor Patio,Live Music,Historic Venue,Michelin Rated','r28.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(29,'Brooklyn Eats',50,'Rooftop,Open Kitchen,Chef Tasting Menu,Wine Cellar','r29.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),
(30,'Texas Flame House',140,'Live Music,Outdoor Patio,Private Rooms,Wine Cellar','r30.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(31,'Lake Michigan Bistro',85,'Waterfront View,Michelin Rated,Open Kitchen,Chef Tasting Menu','r31.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),
(32,'SF Skyline',110,'Rooftop,Live Music,Outdoor Patio,Private Rooms','r32.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(33,'Miami Luxe',80,'Historic Venue,Wine Cellar,Michelin Rated,Chef Tasting Menu','r33.jpg','Standard','Available','Fine Dining',NULL,'Miami','FL',NULL),
(34,'NY Midtown Grill',65,'Open Kitchen,Rooftop,Live Music,Outdoor Patio','r34.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),
(35,'Austin Prime Smoke',120,'BBQ,Live Music,Wine Cellar,Private Rooms','r35.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(36,'Chicago Bistro 77',90,'Michelin Rated,Chef Tasting Menu,Outdoor Patio,Waterfront View','r36.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),
(37,'SF Harbor Eats',100,'Waterfront View,Live Music,Open Kitchen,Private Rooms','r37.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(38,'Miami Sunset Kitchen',70,'Outdoor Patio,Live Music,Rooftop,Wine Cellar','r38.jpg','Standard','Available','Casual Dining',NULL,'Miami','FL',NULL),
(39,'NY Eastside Table',55,'Michelin Rated,Chef Tasting Menu,Historic Venue,Open Kitchen','r39.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),
(40,'Austin South Grill',130,'BBQ,Outdoor Patio,Live Music,Private Rooms','r40.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(41,'Chicago River Dining',85,'Waterfront View,Rooftop,Michelin Rated,Wine Cellar','r41.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),
(42,'SF Market Table',95,'Open Kitchen,Chef Tasting Menu,Live Music,Outdoor Patio','r42.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(43,'Miami Ocean Prime',80,'Waterfront View,Private Rooms,Live Music,Michelin Rated','r43.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(44,'NY Uptown Grill',60,'Rooftop,Open Kitchen,Wine Cellar,Chef Tasting Menu','r44.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),
(45,'Austin River Smoke',140,'BBQ,Live Music,Outdoor Patio,Historic Venue','r45.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),
(46,'Chicago Gold Fork',75,'Michelin Rated,Chef Tasting Menu,Private Rooms,Open Kitchen','r46.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),
(47,'SF Bay View Grill',110,'Waterfront View,Rooftop,Live Music,Outdoor Patio','r47.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),
(48,'Miami Beach House',70,'Outdoor Patio,Live Music,Wine Cellar,Private Rooms','r48.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),
(49,'NY Grand Table',90,'Michelin Rated,Historic Venue,Chef Tasting Menu,Rooftop','r49.jpg','Standard','Available','Fine Dining',NULL,'New York','NY',NULL),
(50,'Austin Legacy BBQ',130,'BBQ,Live Music,Outdoor Patio,Wine Cellar','r50.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL);


-- 5. details
INSERT INTO details (restID, execChef, diningStyle, access, parkDetail, paymentOptions, dressCode, transit, priceRange, neighborhood, privateParty, website) VALUES
(1,'Marco Ruiz','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','CTA Nearby','$','Lincoln Park','Available','auroragrill.com'),
(2,'Lena Park','Fine Dining','Wheelchair Accessible','Valet','All Payment Types','Formal','BART Nearby','$$$$','Fisherman Wharf','Available','blueharbor.com'),
(3,'David Cole','Fine Dining','Wheelchair Accessible','Street Parking','All Payment Types','Business Casual','Metro Bus','$$$','South Beach','Not Available','sunsetsteak.com'),
(4,'Emma Stone','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','Subway','$','Midtown','Available','urbantable.com'),
(5,'Carlos Vega','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus Line','$','Downtown','Available','lonestareatery.com'),
(6,'Hiro Tanaka','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$','River North','Available','lakefrontbistro.com'),
(7,'Sofia Lin','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','BART','$$$$','SoMa','Available','goldengate.com'),
(8,'Mateo Cruz','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Casual','Metro','$','Miami Beach','Available','oceanbreeze.com'),
(9,'James Lee','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Manhattan','Available','manhattaneats.com'),
(10,'Riley Adams','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinsmoke.com'),
(11,'Anna Kim','Fast Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','CTA','$','Loop','Not Available','windycitydeli.com'),
(12,'Marco Silva','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','BART','$$$','Mission','Available','bayfusion.com'),
(13,'Isabella Rossi','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','Metro','$$$$','Brickell','Available','coralreef.com'),
(14,'Ethan Brooks','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Business Casual','Subway','$$','Upper East','Available','empiredining.com'),
(15,'Noah Miller','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','South Congress','Available','hillcountrybbq.com'),
(16,'Olivia Chen','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Magnificent Mile','Available','chicagoprime.com'),
(17,'Daniel Kim','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','Embarcadero','Available','pacifictable.com'),
(18,'Sophia Nguyen','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','South Beach','Available','miamispice.com'),
(19,'William Scott','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Business Casual','Subway','$$','Central Park','Available','centralparkeats.com'),
(20,'Lucas White','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinurbanbbq.com'),
(21,'Mia Johnson','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','CTA','$','North Side','Not Available','northsidegrill.com'),
(22,'Ethan Green','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','BART','$$$$','Bay Area','Available','sfcoastal.com'),
(23,'Ava Davis','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','mianinights.com'),
(24,'Noah Brown','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Midtown','Available','nyclassic.com'),
(25,'Emma Wilson','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinflame.com'),
(26,'Liam Thomas','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','CTA','$$$$','River North','Available','chicagoharbor.com'),
(27,'Olivia Martinez','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Business Casual','BART','$$$','SoMa','Available','goldenspoon.com'),
(28,'James Anderson','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','South Beach','Available','southbeachgrill.com'),
(29,'Sophia Taylor','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','Subway','$$','Brooklyn','Available','brooklyneats.com'),
(30,'Ethan Clark','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','texasflamehouse.com'),
(31,'Isabella Lewis','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Lakefront','Available','lakemichbistro.com'),
(32,'Lucas Walker','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','SF Heights','Available','sfskyline.com'),
(33,'Mia Hall','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Metro','$$$$','Miami Beach','Available','miamiluxe.com'),
(34,'Daniel Allen','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Subway','$','Midtown','Available','nymidtown.com'),
(35,'Ava Young','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinprime.com'),
(36,'Noah King','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Business Casual','CTA','$$$','River North','Available','bistro77.com'),
(37,'Emma Scott','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$$','SF Bay','Available','harboreats.com'),
(38,'Liam Green','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','sunsetkitchen.com'),
(39,'Olivia Baker','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Upper East','Available','eastsidetable.com'),
(40,'James Nelson','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','southgrill.com'),
(41,'Sophia Carter','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','CTA','$$$$','Riverfront','Available','riverdining.com'),
(42,'Ethan Mitchell','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','BART','$$$','SF Market','Available','markettable.com'),
(43,'Mia Perez','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','Metro','$$$$','Miami Beach','Available','oceanprime.com'),
(44,'Lucas Rogers','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Subway','$','Midtown','Available','uptowngrill.com'),
(45,'Emma Reed','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','riversmoke.com'),
(46,'Noah Cook','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Gold Coast','Available','goldfork.com'),
(47,'Ava Morgan','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','Bay Area','Available','bayviewgrill.com'),
(48,'Liam Bell','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','beachhouse.com'),
(49,'Olivia Murphy','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$$','Manhattan','Available','grandtable.com'),
(50,'James Bailey','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','legacybbq.com');

-- 6. awards
INSERT INTO awards (restID, awardName) VALUES
(2,'Michelin Star'),
(7,'Top 50 US Restaurants'),
(9,'Best NYC Dining'),
(13,'Best Seafood Award'),
(16,'Michelin Star'),
(17,'Best Bay Area Dining'),
(22,'Top Coastal Restaurant'),
(27,'Chef Excellence Award'),
(33,'Luxury Dining Award'),
(46,'Michelin Star');

-- 7. featured_in
INSERT INTO featuredIn (restID, featuredIName) VALUES
(2,'NY Times Top Picks'),
(7,'Food & Wine Best'),
(9,'Forbes Dining List'),
(13,'Travel + Leisure'),
(16,'Michelin Guide'),
(17,'Eater SF Top 10'),
(22,'Gourmet Weekly'),
(27,'Top Chef Feature'),
(33,'Luxury Magazine'),
(46,'Michelin Guide');

-- 8. faqs
INSERT INTO faqs (restID, question, answer) VALUES
(1,'Do you take reservations?','Yes, online only'),
(1,'Parking available?','Street parking available'),
(2,'Do you offer tasting menu?','Yes seasonal tasting menu'),
(2,'Is seafood fresh?','Daily sourced'),
(3,'Do you have valet?','Yes'),
(3,'Dress code?','Business casual recommended'),
(4,'Outdoor seating?','Yes rooftop available'),
(4,'Vegetarian options?','Limited but available'),
(5,'Do you offer catering?','Yes full service'),
(6,'Is it kid friendly?','Yes'),
(7,'Wine selection?','Extensive cellar'),
(8,'Ocean view seating?','Yes'),
(9,'Private dining?','Available'),
(10,'Live music nights?','Weekends'),
(11,'Takeout available?','Yes'),
(12,'Is sushi available?','Yes fusion sushi'),
(13,'Dress code?','Formal'),
(14,'Parking?','Garage available'),
(15,'BBQ smoked in-house?','Yes'),
(16,'Michelin rating?','One star'),
(17,'Seafood fresh?','Daily'),
(18,'Outdoor seating?','Yes'),
(19,'Reservations needed?','Recommended'),
(20,'Spicy food level?','Customizable'),
(21,'Do you accept walk-ins?','Yes limited seating'),
(22,'Is this restaurant waterfront?','Yes bay view dining'),
(23,'Do you have vegan options?','Yes small selection'),
(24,'Do you offer private rooms?','Yes'),
(25,'Is BBQ smoked onsite?','Yes traditional smoking'),
(26,'Do you offer reservations?','Yes required on weekends'),
(27,'Do you have tasting menu?','Yes seasonal chef menu'),
(28,'Is outdoor seating available?','Yes patio seating'),
(29,'Do you accept credit cards?','Yes all major cards'),
(30,'Is parking available?','Street parking only'),
(31,'Do you offer seafood specials?','Yes daily specials'),
(32,'Is rooftop seating available?','Yes city views'),
(33,'Do you have dress code?','Formal required'),
(34,'Do you serve lunch?','Yes weekdays only'),
(35,'Is BBQ spicy?','Custom spice levels available'),
(36,'Do you offer catering?','Yes large events'),
(37,'Is seafood fresh daily?','Yes locally sourced'),
(38,'Do you have live music?','Weekend nights'),
(39,'Do you offer private dining?','Yes limited rooms'),
(40,'Is this restaurant family friendly?','Yes all ages welcome'),
(41,'Do you have valet parking?','Yes available'),
(42,'Is sushi on the menu?','Yes fusion sushi dishes'),
(43,'Do you require reservations?','Recommended'),
(44,'Do you have vegan options?','Yes curated menu'),
(45,'Is BBQ wood smoked?','Yes traditional pits'),
(46,'Do you have Michelin recognition?','Yes awarded'),
(47,'Is waterfront seating available?','Yes full view'),
(48,'Do you accept walk-ins?','Yes but limited'),
(49,'Do you offer wine pairing?','Yes curated list'),
(50,'Do you offer catering?','Yes full BBQ catering');

-- 9. popular_dishes
INSERT INTO popularDishes (restID, name, price, description) VALUES
(1,'Grilled Salmon',28,'Herb butter salmon'),
(2,'Lobster Bisque',32,'Creamy lobster soup'),
(3,'Ribeye Steak',45,'Dry aged'),
(4,'Truffle Pasta',30,'Cream sauce'),
(5,'Tacos Al Pastor',18,'Spicy pork'),
(6,'Duck Confit',35,'French classic'),
(7,'Sushi Platter',40,'Chef selection'),
(8,'Grilled Shrimp',26,'Garlic butter'),
(9,'Burger Deluxe',22,'Wagyu blend'),
(10,'Brisket Plate',25,'Smoked 12h');

-- 10. specials
INSERT INTO specials (restID, name, price, description) VALUES
(1,'Chef Tasting Menu',75,'5 course meal'),
(2,'Seafood Feast',120,'Luxury platter'),
(3,'Steak Night',60,'Special cut selection'),
(4,'Wine Pairing Menu',90,'Curated wines'),
(5,'BBQ Platter',55,'Family style'),
(6,'French Degustation',110,'Chef curated'),
(7,'Sushi Omakase',130,'Chef choice'),
(8,'Ocean Special',95,'Mixed seafood'),
(9,'NY Signature Menu',85,'Exclusive dishes'),
(10,'Texas Smoke Feast',70,'BBQ sampler');

-- 11. menu
INSERT INTO menu (restID, description, pdf, websiteLink) VALUES
(1,'Modern American Menu','r1.pdf','auroragrill/menu'),
(2,'Seafood Fine Dining Menu','r2.pdf','blueharbor/menu'),
(3,'Steakhouse Menu','r3.pdf','sunsetsteak/menu'),
(4,'Contemporary Menu','r4.pdf','urbantable/menu'),
(5,'Tex-Mex Menu','r5.pdf','lonestar/menu'),
(6,'French Menu','r6.pdf','lakefront/menu'),
(7,'Californian Menu','r7.pdf','goldengate/menu'),
(8,'Seafood Menu','r8.pdf','oceanbreeze/menu'),
(9,'American Menu','r9.pdf','manhattan/menu'),
(10,'BBQ Menu','r10.pdf','austin/menu'),
(11,'Deli Menu','r11.pdf','windy/menu'),
(12,'Asian Fusion Menu','r12.pdf','bayfusion/menu'),
(13,'Seafood Menu','r13.pdf','coral/menu'),
(14,'Italian Menu','r14.pdf','empire/menu'),
(15,'BBQ Menu','r15.pdf','hillcountry/menu'),
(16,'Steak Menu','r16.pdf','chicago/menu'),
(17,'Seafood Menu','r17.pdf','pacific/menu'),
(18,'Latin Menu','r18.pdf','miami/menu'),
(19,'American Menu','r19.pdf','central/menu'),
(20,'BBQ Menu','r20.pdf','austinbbq/menu'),
(21,'American Menu','r21.pdf','north/menu'),
(22,'Seafood Menu','r22.pdf','sfcoastal/menu'),
(23,'Fusion Menu','r23.pdf','miami/menu'),
(24,'Italian Menu','r24.pdf','ny/menu'),
(25,'BBQ Menu','r25.pdf','austin/menu'),
(26,'Seafood Menu','r26.pdf','chicago/menu'),
(27,'Contemporary Menu','r27.pdf','sf/menu'),
(28,'Seafood Menu','r28.pdf','miami/menu'),
(29,'American Menu','r29.pdf','brooklyn/menu'),
(30,'BBQ Menu','r30.pdf','texas/menu'),
(31,'French Menu','r31.pdf','lake/menu'),
(32,'Fusion Menu','r32.pdf','sf/menu'),
(33,'Fine Dining Menu','r33.pdf','miami/menu'),
(34,'American Menu','r34.pdf','ny/menu'),
(35,'BBQ Menu','r35.pdf','austin/menu'),
(36,'Modern Menu','r36.pdf','chicago/menu'),
(37,'Seafood Menu','r37.pdf','sf/menu'),
(38,'Latin Menu','r38.pdf','miami/menu'),
(39,'Italian Menu','r39.pdf','ny/menu'),
(40,'BBQ Menu','r40.pdf','austin/menu'),
(41,'Seafood Menu','r41.pdf','chicago/menu'),
(42,'Fusion Menu','r42.pdf','sf/menu'),
(43,'Seafood Menu','r43.pdf','miami/menu'),
(44,'American Menu','r44.pdf','ny/menu'),
(45,'BBQ Menu','r45.pdf','austin/menu'),
(46,'Fine Dining Menu','r46.pdf','chicago/menu'),
(47,'Seafood Menu','r47.pdf','sf/menu'),
(48,'Seafood Menu','r48.pdf','miami/menu'),
(49,'French Menu','r49.pdf','ny/menu'),
(50,'BBQ Menu','r50.pdf','austin/menu');

INSERT INTO drinkType (restID, drinkName) VALUES
(1,'Coke'),(1,'Lemonade'),
(2,'Iced Tea'),(2,'Sparkling Water'),
(3,'Club Soda'),(3,'Ginger Ale'),
(4,'Cold Brew'),(4,'Espresso'),
(5,'Horchata'),(5,'Jarritos'),
(6,'Tea'),(6,'Mint Tea'),
(7,'Matcha'),(7,'Green Tea'),
(8,'Coconut Water'),(8,'Lime Soda'),
(9,'Cola'),(9,'Root Beer'),
(10,'Sweet Tea'),(10,'Arnold Palmer');

INSERT INTO alcoholType (restID, alcoholName) VALUES
(1,'Beer'),(1,'Wine'),
(2,'Champagne'),(2,'White Wine'),
(3,'Red Wine'),(3,'Whiskey'),
(4,'Vodka'),(4,'Gin'),
(5,'Tequila'),(5,'Mezcal'),
(6,'Cognac'),(6,'Red Wine'),
(7,'Sake'),(7,'Soju'),
(8,'Rum'),(8,'Prosecco'),
(9,'Bourbon'),(9,'Beer'),
(10,'Margarita Base'),(10,'Tequila Shot');

INSERT INTO menuItem (menuID, name, price, description) VALUES

-- =========================
-- 1–10 (American / Seafood / Steak / Tex-Mex / BBQ)
-- =========================
(1,'Herb Grilled Chicken',14.99,'Classic American entrée'),
(1,'Truffle Fries',9.99,'Crispy fries with truffle oil'),
(1,'Caesar Salad',11.99,'Romaine, parmesan, dressing'),

(2,'Lobster Roll',24.99,'Butter toasted lobster roll'),
(2,'Clam Chowder',12.99,'Creamy New England style'),
(2,'Grilled Oysters',18.99,'Garlic butter oysters'),

(3,'Dry Aged Ribeye',45.99,'Premium steak cut'),
(3,'Garlic Mashed Potatoes',8.99,'Creamy side dish'),
(3,'Grilled Asparagus',9.99,'Lightly seasoned'),

(4,'Truffle Fettuccine',22.99,'Creamy truffle pasta'),
(4,'Bruschetta Trio',10.99,'Tomato basil crostini'),
(4,'Wild Mushroom Soup',9.99,'Earthy mushroom blend'),

(5,'Carne Asada Tacos',13.99,'Grilled beef tacos'),
(5,'Chicken Quesadilla',12.99,'Cheesy grilled tortilla'),
(5,'Fresh Guacamole',8.99,'Avocado dip'),

(6,'Duck Confit',28.99,'Slow cooked duck leg'),
(6,'French Onion Soup',11.99,'Caramelized onion broth'),
(6,'Baguette & Butter',6.99,'Fresh baked bread'),

(7,'Chef Sushi Platter',32.99,'Assorted premium sushi'),
(7,'Miso Soup',5.99,'Traditional broth'),
(7,'Edamame Sea Salt',6.99,'Steamed soybeans'),

(8,'Garlic Shrimp',19.99,'Pan seared shrimp'),
(8,'Coconut Rice',7.99,'Fragrant rice side'),
(8,'Seafood Salad',14.99,'Fresh greens & seafood'),

(9,'Wagyu Burger',21.99,'Premium beef burger'),
(9,'Sweet Potato Fries',8.99,'Crispy sweet fries'),
(9,'Vanilla Milkshake',6.99,'Classic shake'),

(10,'Smoked Brisket',24.99,'12-hour smoked beef'),
(10,'BBQ Ribs',26.99,'House glazed ribs'),
(10,'Coleslaw',5.99,'Creamy cabbage slaw'),

-- =========================
-- 11–20 (Deli / Fusion / Seafood / Italian / BBQ)
-- =========================
(11,'Turkey Club Sandwich',12.99,'Classic deli sandwich'),
(11,'Potato Salad',6.99,'Creamy potato mix'),
(11,'Chicken Noodle Soup',8.99,'Homestyle soup'),

(12,'Miso Glazed Salmon',23.99,'Asian fusion salmon'),
(12,'Pork Dumplings',10.99,'Steamed dumplings'),
(12,'Spicy Tuna Roll',14.99,'Fresh sushi roll'),

(13,'Grilled Lobster Tail',34.99,'Butter brushed lobster'),
(13,'Seafood Risotto',25.99,'Creamy rice dish'),
(13,'Crab Cakes',18.99,'Pan seared cakes'),

(14,'Spaghetti Carbonara',19.99,'Creamy pancetta pasta'),
(14,'Margherita Pizza',15.99,'Classic Italian pizza'),
(14,'Tiramisu',9.99,'Coffee dessert'),

(15,'Texas Brisket Plate',22.99,'Smoked beef brisket'),
(15,'Mac & Cheese',8.99,'Creamy baked pasta'),
(15,'Cornbread',6.99,'Honey glazed'),

(16,'Filet Mignon',48.99,'Premium steak cut'),
(16,'Loaded Baked Potato',9.99,'Cheese & bacon'),
(16,'Creamed Spinach',7.99,'Steakhouse classic'),

(17,'Seared Tuna Steak',26.99,'Sesame crusted tuna'),
(17,'Seafood Paella',28.99,'Spanish seafood rice'),
(17,'Clam Chowder',12.99,'Creamy soup'),

(18,'Tacos Al Pastor',14.99,'Spiced pork tacos'),
(18,'Ceviche',13.99,'Citrus seafood'),
(18,'Churros',7.99,'Cinnamon dessert'),

(19,'NY Strip Steak',39.99,'Classic steak cut'),
(19,'Burger Deluxe',18.99,'House burger'),
(19,'Onion Rings',7.99,'Crispy fried rings'),

(20,'Smoked Pork Ribs',25.99,'BBQ glazed ribs'),
(20,'Pulled Pork Sandwich',14.99,'Slow cooked pork'),
(20,'BBQ Beans',6.99,'Sweet smoky beans'),

-- =========================
-- 21–30 (American / Seafood / Fusion / BBQ)
-- =========================
(21,'Grilled Chicken Plate',16.99,'Simple grilled entrée'),
(21,'House Salad',9.99,'Fresh greens'),
(21,'Corn Chowder',8.99,'Creamy corn soup'),

(22,'Oyster Sampler',22.99,'Fresh oysters'),
(22,'Sea Bass Fillet',29.99,'Pan seared fish'),
(22,'Lobster Pasta',34.99,'Cream lobster sauce'),

(23,'Fusion Sushi Roll',15.99,'Chef special roll'),
(23,'Teriyaki Chicken',18.99,'Sweet soy glaze'),
(23,'Seaweed Salad',7.99,'Light appetizer'),

(24,'Truffle Ravioli',24.99,'Stuffed pasta'),
(24,'Osso Buco',32.99,'Braised veal'),
(24,'Panna Cotta',8.99,'Cream dessert'),

(25,'BBQ Chicken Wings',12.99,'Smoked wings'),
(25,'Beef Brisket',23.99,'Slow smoked'),
(25,'Corn on the Cob',5.99,'Butter grilled'),

(26,'Grilled Salmon',21.99,'Atlantic salmon'),
(26,'Lobster Bisque',13.99,'Cream lobster soup'),
(26,'Shrimp Cocktail',14.99,'Chilled shrimp'),

(27,'Chef Tasting Plate',35.99,'Multi-course sampler'),
(27,'Seared Scallops',26.99,'Pan seared'),
(27,'Chocolate Lava Cake',9.99,'Dessert'),

(28,'Fish Tacos',13.99,'Crispy fish'),
(28,'Coconut Shrimp',16.99,'Sweet fried shrimp'),
(28,'Mango Salsa',6.99,'Fresh topping'),

(29,'Classic Cheeseburger',15.99,'Beef burger'),
(29,'Fries Basket',6.99,'Crispy fries'),
(29,'Chocolate Shake',7.99,'Thick shake'),

(30,'Texas BBQ Platter',29.99,'Mixed meats'),
(30,'Smoked Sausage',14.99,'Spiced sausage'),
(30,'Baked Beans',5.99,'BBQ beans'),

-- =========================
-- 31–40 (French / Fusion / Seafood / BBQ)
-- =========================
(31,'Coq au Vin',27.99,'Wine braised chicken'),
(31,'French Bread Basket',6.99,'Fresh bread'),
(31,'Crème Brûlée',9.99,'Caramel dessert'),

(32,'Fusion Steak Bowl',24.99,'Rice steak bowl'),
(32,'Wasabi Tuna',18.99,'Spicy tuna'),
(32,'Ginger Salad',7.99,'Light salad'),

(33,'Wagyu Tartare',32.99,'Raw beef dish'),
(33,'Foie Gras',28.99,'Luxury appetizer'),
(33,'Chocolate Soufflé',11.99,'Warm dessert'),

(34,'Burger Classic',15.99,'Beef burger'),
(34,'Chicken Wings',12.99,'Buffalo style'),
(34,'Mac & Cheese',8.99,'Creamy pasta'),

(35,'Smoked Brisket Plate',24.99,'Texas style brisket'),
(35,'BBQ Chicken',16.99,'Grilled chicken'),
(35,'Coleslaw',5.99,'Creamy slaw'),

(36,'Grilled Sea Bass',26.99,'Fresh fish'),
(36,'Risotto Primavera',19.99,'Vegetable risotto'),
(36,'Tiramisu',9.99,'Coffee dessert'),

(37,'Lobster Roll Deluxe',25.99,'Butter lobster roll'),
(37,'Clam Chowder',12.99,'Cream soup'),
(37,'Crab Legs',34.99,'Steamed crab'),

(38,'Cuban Sandwich',14.99,'Pressed sandwich'),
(38,'Plantain Chips',6.99,'Fried banana chips'),
(38,'Flan Dessert',7.99,'Caramel custard'),

(39,'Duck Breast',29.99,'Pan seared duck'),
(39,'Ravioli Stuffed',18.99,'Cheese ravioli'),
(39,'Espresso Cake',8.99,'Coffee dessert'),

(40,'BBQ Platter',28.99,'Mixed meats'),
(40,'Grilled Corn',5.99,'Butter corn'),
(40,'Pulled Pork Slider',10.99,'Mini sandwich'),

-- =========================
-- 41–50 (Seafood / BBQ / Fine Dining / American)
-- =========================
(41,'Seared Halibut',28.99,'Fresh fish'),
(41,'Lobster Mac',22.99,'Cream lobster pasta'),
(41,'Clam Chowder',12.99,'Cream soup'),

(42,'Fusion Sushi Set',26.99,'Chef selection'),
(42,'Teriyaki Beef',19.99,'Sweet beef glaze'),
(42,'Seaweed Salad',7.99,'Light salad'),

(43,'Grilled Octopus',24.99,'Mediterranean style'),
(43,'Seafood Tower',39.99,'Luxury seafood platter'),
(43,'Key Lime Pie',8.99,'Citrus dessert'),

(44,'Classic Burger',14.99,'Beef burger'),
(44,'Onion Rings',7.99,'Fried rings'),
(44,'Chicken Sandwich',13.99,'Grilled chicken'),

(45,'BBQ Ribs Full Rack',32.99,'Smoked ribs'),
(45,'Beef Brisket',26.99,'Slow smoked'),
(45,'Cornbread Muffin',4.99,'Sweet bread'),

(46,'Filet Mignon',49.99,'Premium steak'),
(46,'Truffle Mash',12.99,'Mashed potatoes'),
(46,'Chocolate Tart',10.99,'Dessert'),

(47,'Grilled Lobster',34.99,'Butter lobster'),
(47,'Seafood Pasta',27.99,'Cream seafood sauce'),
(47,'Garlic Shrimp',19.99,'Pan seared'),

(48,'Jerk Chicken',18.99,'Spicy grilled chicken'),
(48,'Coconut Rice',7.99,'Fragrant rice'),
(48,'Plantains',6.99,'Fried sweet banana'),

(49,'Duck Confit',30.99,'Slow cooked duck'),
(49,'French Onion Soup',11.99,'Classic soup'),
(49,'Crème Brûlée',9.99,'Caramel dessert'),

(50,'Texas BBQ Feast',35.99,'Mixed BBQ platter'),
(50,'Smoked Sausage',14.99,'Spiced sausage'),
(50,'BBQ Beans',6.99,'Slow cooked beans');

-- 15. service_period
INSERT INTO servicePeriod (restID, periodName, dayOfWeek, serviceType, startTime, endTime) VALUES
(1,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(1,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(1,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(2,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(2,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(3,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(4,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(4,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(5,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(5,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(6,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(6,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(7,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(8,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(8,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(9,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(10,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(10,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(10,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(11,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(11,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(12,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(13,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(13,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(14,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(14,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(15,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(15,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(16,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(17,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(17,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(18,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(19,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(19,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(20,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(20,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(21,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(21,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(22,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(23,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(23,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(24,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(25,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(25,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(25,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(26,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(27,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(27,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(28,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(29,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(29,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(30,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(31,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(31,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(32,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(33,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(33,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(34,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(35,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(35,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(36,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(36,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(37,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(38,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(38,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(39,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(40,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(40,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(41,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(42,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(42,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(43,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(44,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(44,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(45,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(46,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(46,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(47,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(48,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(48,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(49,'Dinner','Monday','Dinner','17:00:00','22:00:00'),

(50,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),
(50,'Lunch','Monday','Lunch','12:00:00','15:00:00'),
(50,'Dinner','Monday','Dinner','17:00:00','22:00:00');

-- 16. experience
INSERT INTO experience (restID, name, partySize, description, price, prePaymentRequired) VALUES
(2,'Ocean Tasting Experience',4,'Chef curated seafood journey',120,TRUE),
(4,'Rooftop Chef Table',2,'Exclusive skyline dining',150,TRUE),
(7,'Sushi Omakase',2,'Chef selection tasting',180,TRUE),
(9,'NYC Signature Experience',4,'Multi-course luxury menu',140,TRUE),
(13,'Coral Reef Feast',6,'Seafood banquet experience',160,TRUE),
(16,'Steak Masterclass Dinner',2,'Premium cuts tasting',170,TRUE),
(17,'Bay Sunset Experience',4,'Waterfront dining package',155,TRUE),
(22,'Pacific Tasting Menu',2,'High-end seafood course',190,TRUE),
(27,'Golden Spoon Chef Experience',4,'Modern tasting menu',175,TRUE),
(33,'Luxury Dining Event',2,'Fine dining curated menu',200,TRUE),
(41,'Riverfront Chef Table',4,'Exclusive river dining',165,TRUE),
(46,'Michelin Tasting Experience',2,'Award-winning chef menu',220,TRUE);

-- 17. exp_dates
INSERT INTO expDates (expID, dateName) VALUES
(1,'2026-02-01'),(1,'2026-02-02'),
(2,'2026-02-10'),(2,'2026-02-11'),
(3,'2026-03-01'),(3,'2026-03-02'),
(4,'2026-03-15'),(4,'2026-03-16'),
(5,'2026-04-01'),(5,'2026-04-02'),
(6,'2026-04-10'),(6,'2026-04-11'),
(7,'2026-05-01'),(7,'2026-05-02'),
(8,'2026-05-10'),(8,'2026-05-11'),
(9,'2026-06-01'),(9,'2026-06-02'),
(10,'2026-06-10'),(10,'2026-06-11'),
(11,'2026-07-01'),(11,'2026-07-02'),
(12,'2026-07-10'),(12,'2026-07-11');

-- 18. timeslot
INSERT INTO timeslot (reservationID, spID, expID, slotDate, slotTime, points) VALUES
(NULL, 1, 1, '2026-01-15', '17:00:00', 100),
(NULL, 2, 1, '2026-02-01', '18:00:00', 100),
(NULL, 3, 2, '2026-02-10', '18:30:00', 150),
(NULL, 4, 2, '2026-03-01', '19:00:00', 150),
(NULL, 5, 3, '2026-03-15', '17:30:00', 100),
(NULL, 6, 3, '2026-04-01', '18:00:00', 100),
(NULL, 7, 4, '2026-04-10', '19:00:00', 200),
(NULL, 8, 4, '2026-05-01', '18:30:00', 200),
(NULL, 9, 5, '2026-05-15', '17:00:00', 100),
(NULL, 10, 5, '2026-06-01', '18:00:00', 100),
(NULL, 11, 6, '2026-06-10', '19:00:00', 150),
(NULL, 12, 6, '2026-07-01', '18:30:00', 150),
(NULL, 13, 7, '2026-07-15', '17:30:00', 100),
(NULL, 14, 7, '2026-08-01', '18:00:00', 100),
(NULL, 15, 8, '2026-08-10', '19:00:00', 200),
(NULL, 16, 8, '2026-09-01', '18:30:00', 200),
(NULL, 17, 9, '2026-09-15', '17:00:00', 100),
(NULL, 18, 9, '2026-10-01', '18:00:00', 100),
(NULL, 19, 11, '2026-10-10', '19:00:00', 150),
(NULL, 20, 12, '2026-11-01', '18:30:00', 150);

-- 19. offers
INSERT INTO offers (restID, slotID, name, offerType, startTime, endTime, validDates, price, discountAmt, description) VALUES
(1,1,'Early Bird','Discount','2026-01-01 17:00:00','2026-01-01 18:30:00','Jan',25,5,'Early dining discount'),
(2,5,'Seafood Night','Promo','2026-02-01 18:00:00','2026-02-01 21:00:00','Feb',120,20,'Seafood special'),
(3,10,'Steak Deal','Discount','2026-01-01 18:00:00','2026-01-01 22:00:00','Jan',50,10,'Steak discount'),
(4,15,'Rooftop Special','Promo','2026-03-01 18:00:00','2026-03-01 22:00:00','Mar',80,15,'Skyline dining'),
(5,20,'Tex-Mex Fiesta','Promo','2026-04-01 18:00:00','2026-04-01 22:00:00','Apr',30,5,'Party menu');

-- 20. restaurant_table
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES

-- =========================================================
-- 1 Aurora Grill (capacity 80)
-- =========================================================
(1, 90, 'Available', '2-Top', 2, 'A1'),
(1, 90, 'Occupied', '2-Top', 2, 'A2'),
(1, 90, 'Available', '2-Top', 2, 'A3'),
(1, 90, 'Available', '4-Top', 4, 'B1'),
(1, 90, 'Occupied', '4-Top', 4, 'B2'),
(1, 90, 'Available', '4-Top', 4, 'B3'),
(1, 120, 'Reserved', '6-Top', 6, 'C1'),
(1, 120, 'Available', '6-Top', 6, 'C2'),
(1, 120, 'Occupied', '8-Top', 8, 'D1'),
(1, 120, 'Available', '8-Top', 8, 'D2'),
(1, 120, 'Available', '10-Top', 10, 'PR1'),
(1, 120, 'Reserved', '10-Top', 10, 'PR2'),
(1, 120, 'Available', '6-Top', 6, 'E1'),
(1, 120, 'Available', '6-Top', 6, 'E2'),

-- =========================================================
-- 2 Blue Harbor (capacity 120)
-- =========================================================
(2, 120, 'Available', '2-Top', 2, 'BH1'),
(2, 120, 'Occupied', '2-Top', 2, 'BH2'),
(2, 120, 'Available', '2-Top', 2, 'BH3'),
(2, 120, 'Available', '2-Top', 2, 'BH4'),
(2, 120, 'Available', '2-Top', 2, 'BH5'),
(2, 120, 'Reserved', '2-Top', 2, 'BH6'),

(2, 120, 'Available', '4-Top', 4, 'BH7'),
(2, 120, 'Occupied', '4-Top', 4, 'BH8'),
(2, 120, 'Available', '4-Top', 4, 'BH9'),
(2, 120, 'Available', '4-Top', 4, 'BH10'),
(2, 120, 'Reserved', '4-Top', 4, 'BH11'),
(2, 120, 'Available', '4-Top', 4, 'BH12'),
(2, 120, 'Available', '4-Top', 4, 'BH13'),
(2, 120, 'Occupied', '4-Top', 4, 'BH14'),
(2, 120, 'Available', '4-Top', 4, 'BH15'),
(2, 120, 'Available', '4-Top', 4, 'BH16'),

(2, 120, 'Available', '6-Top', 6, 'BH17'),
(2, 120, 'Occupied', '6-Top', 6, 'BH18'),
(2, 120, 'Available', '6-Top', 6, 'BH19'),
(2, 120, 'Reserved', '6-Top', 6, 'BH20'),
(2, 120, 'Available', '6-Top', 6, 'BH21'),
(2, 120, 'Available', '6-Top', 6, 'BH22'),

(2, 120, 'Available', '8-Top', 8, 'BH23'),
(2, 120, 'Occupied', '8-Top', 8, 'BH24'),
(2, 120, 'Available', '8-Top', 8, 'BH25'),
(2, 120, 'Reserved', '8-Top', 8, 'BH26'),

-- =========================================================
-- 3 Sunset Steakhouse (capacity 60)
-- =========================================================
(3, 90, 'Available', '2-Top', 2, 'SS1'),
(3, 90, 'Occupied', '2-Top', 2, 'SS2'),
(3, 90, 'Available', '2-Top', 2, 'SS3'),
(3, 90, 'Available', '2-Top', 2, 'SS4'),
(3, 90, 'Reserved', '2-Top', 2, 'SS5'),
(3, 90, 'Available', '2-Top', 2, 'SS6'),

(3, 90, 'Available', '4-Top', 4, 'SS7'),
(3, 90, 'Occupied', '4-Top', 4, 'SS8'),
(3, 90, 'Available', '4-Top', 4, 'SS9'),
(3, 90, 'Available', '4-Top', 4, 'SS10'),
(3, 90, 'Reserved', '4-Top', 4, 'SS11'),
(3, 90, 'Available', '4-Top', 4, 'SS12'),

(3, 120, 'Available', '6-Top', 6, 'SS13'),
(3, 120, 'Occupied', '6-Top', 6, 'SS14'),
(3, 120, 'Available', '6-Top', 6, 'SS15'),
(3, 120, 'Reserved', '6-Top', 6, 'SS16'),

-- =========================================================
-- 4 Urban Table (capacity 45)
-- =========================================================
(4, 90, 'Available', '2-Top', 2, 'UT1'),
(4, 90, 'Occupied', '2-Top', 2, 'UT2'),
(4, 90, 'Available', '2-Top', 2, 'UT3'),
(4, 90, 'Available', '2-Top', 2, 'UT4'),
(4, 90, 'Reserved', '2-Top', 2, 'UT5'),
(4, 90, 'Available', '2-Top', 2, 'UT6'),

(4, 90, 'Available', '4-Top', 4, 'UT7'),
(4, 90, 'Occupied', '4-Top', 4, 'UT8'),
(4, 90, 'Available', '4-Top', 4, 'UT9'),
(4, 90, 'Available', '4-Top', 4, 'UT10'),
(4, 90, 'Reserved', '4-Top', 4, 'UT11'),
(4, 90, 'Available', '4-Top', 4, 'UT12'),

(4, 90, 'Available', '6-Top', 6, 'UT13'),

(4, 90, 'Available', '3-Top', 3, 'UT14'),

-- =========================================================
-- 5 Lone Star Eatery (capacity 100)
-- =========================================================
(5, 120, 'Available', '8-Top', 8, 'LS1'),
(5, 120, 'Occupied', '8-Top', 8, 'LS2'),
(5, 120, 'Available', '8-Top', 8, 'LS3'),
(5, 120, 'Reserved', '8-Top', 8, 'LS4'),
(5, 120, 'Available', '8-Top', 8, 'LS5'),
(5, 120, 'Available', '8-Top', 8, 'LS6'),

(5, 120, 'Available', '6-Top', 6, 'LS7'),
(5, 120, 'Occupied', '6-Top', 6, 'LS8'),
(5, 120, 'Available', '6-Top', 6, 'LS9'),
(5, 120, 'Reserved', '6-Top', 6, 'LS10'),

(5, 120, 'Available', '4-Top', 4, 'LS11'),
(5, 120, 'Occupied', '4-Top', 4, 'LS12'),
(5, 120, 'Available', '4-Top', 4, 'LS13'),
(5, 120, 'Available', '4-Top', 4, 'LS14'),
(5, 120, 'Reserved', '4-Top', 4, 'LS15'),

(5, 120, 'Available', '2-Top', 2, 'LS16'),
(5, 120, 'Available', '2-Top', 2, 'LS17'),
(5, 120, 'Occupied', '2-Top', 2, 'LS18'),
(5, 120, 'Reserved', '2-Top', 2, 'LS19'),

-- =========================================================
-- 6 Lakefront Bistro (capacity 70)
-- =========================================================
(6, 90, 'Available', '2-Top', 2, 'LB1'),
(6, 90, 'Occupied', '2-Top', 2, 'LB2'),
(6, 90, 'Available', '2-Top', 2, 'LB3'),
(6, 90, 'Reserved', '2-Top', 2, 'LB4'),
(6, 90, 'Available', '2-Top', 2, 'LB5'),

(6, 90, 'Available', '4-Top', 4, 'LB6'),
(6, 90, 'Occupied', '4-Top', 4, 'LB7'),
(6, 90, 'Available', '4-Top', 4, 'LB8'),
(6, 90, 'Reserved', '4-Top', 4, 'LB9'),
(6, 90, 'Available', '4-Top', 4, 'LB10'),
(6, 90, 'Available', '4-Top', 4, 'LB11'),
(6, 90, 'Occupied', '4-Top', 4, 'LB12'),

(6, 120, 'Available', '6-Top', 6, 'LB13'),
(6, 120, 'Reserved', '6-Top', 6, 'LB14'),
(6, 120, 'Available', '6-Top', 6, 'LB15'),
(6, 120, 'Occupied', '6-Top', 6, 'LB16'),

(6, 120, 'Available', '5-Top', 5, 'LB17'),
(6, 120, 'Reserved', '5-Top', 5, 'LB18'),

-- =========================================================
-- 7 Golden Gate Dining (capacity 90)
-- =========================================================
(7, 120, 'Available', '2-Top', 2, 'GG1'),
(7, 120, 'Occupied', '2-Top', 2, 'GG2'),
(7, 120, 'Available', '2-Top', 2, 'GG3'),
(7, 120, 'Reserved', '2-Top', 2, 'GG4'),
(7, 120, 'Available', '2-Top', 2, 'GG5'),
(7, 120, 'Available', '2-Top', 2, 'GG6'),

(7, 120, 'Available', '4-Top', 4, 'GG7'),
(7, 120, 'Occupied', '4-Top', 4, 'GG8'),
(7, 120, 'Available', '4-Top', 4, 'GG9'),
(7, 120, 'Reserved', '4-Top', 4, 'GG10'),
(7, 120, 'Available', '4-Top', 4, 'GG11'),
(7, 120, 'Available', '4-Top', 4, 'GG12'),
(7, 120, 'Occupied', '4-Top', 4, 'GG13'),
(7, 120, 'Available', '4-Top', 4, 'GG14'),

(7, 120, 'Available', '6-Top', 6, 'GG15'),
(7, 120, 'Reserved', '6-Top', 6, 'GG16'),
(7, 120, 'Available', '6-Top', 6, 'GG17'),
(7, 120, 'Occupied', '6-Top', 6, 'GG18'),
(7, 120, 'Available', '6-Top', 6, 'GG19'),

(7, 120, 'Available', '8-Top', 8, 'GG20'),
(7, 120, 'Reserved', '8-Top', 8, 'GG21'),

-- =========================================================
-- 8 Ocean Breeze (capacity 110)
-- =========================================================
(8, 120, 'Available', '2-Top', 2, 'OB1'),
(8, 120, 'Occupied', '2-Top', 2, 'OB2'),
(8, 120, 'Available', '2-Top', 2, 'OB3'),
(8, 120, 'Reserved', '2-Top', 2, 'OB4'),
(8, 120, 'Available', '2-Top', 2, 'OB5'),
(8, 120, 'Available', '2-Top', 2, 'OB6'),

(8, 120, 'Available', '4-Top', 4, 'OB7'),
(8, 120, 'Occupied', '4-Top', 4, 'OB8'),
(8, 120, 'Available', '4-Top', 4, 'OB9'),
(8, 120, 'Reserved', '4-Top', 4, 'OB10'),
(8, 120, 'Available', '4-Top', 4, 'OB11'),
(8, 120, 'Available', '4-Top', 4, 'OB12'),
(8, 120, 'Occupied', '4-Top', 4, 'OB13'),
(8, 120, 'Available', '4-Top', 4, 'OB14'),
(8, 120, 'Reserved', '4-Top', 4, 'OB15'),
(8, 120, 'Available', '4-Top', 4, 'OB16'),

(8, 120, 'Available', '6-Top', 6, 'OB17'),
(8, 120, 'Occupied', '6-Top', 6, 'OB18'),
(8, 120, 'Available', '6-Top', 6, 'OB19'),
(8, 120, 'Reserved', '6-Top', 6, 'OB20'),
(8, 120, 'Available', '6-Top', 6, 'OB21'),
(8, 120, 'Available', '6-Top', 6, 'OB22'),

(8, 120, 'Available', '8-Top', 8, 'OB23'),
(8, 120, 'Occupied', '8-Top', 8, 'OB24'),

(8, 120, 'Available', '3-Top', 3, 'OB25'),
(8, 120, 'Reserved', '3-Top', 3, 'OB26'),

-- =========================================================
-- 9 Manhattan Eats (capacity 50)
-- =========================================================
(9, 90, 'Available', '2-Top', 2, 'ME1'),
(9, 90, 'Occupied', '2-Top', 2, 'ME2'),
(9, 90, 'Available', '2-Top', 2, 'ME3'),
(9, 90, 'Reserved', '2-Top', 2, 'ME4'),
(9, 90, 'Available', '2-Top', 2, 'ME5'),
(9, 90, 'Available', '2-Top', 2, 'ME6'),

(9, 90, 'Available', '4-Top', 4, 'ME7'),
(9, 90, 'Occupied', '4-Top', 4, 'ME8'),
(9, 90, 'Available', '4-Top', 4, 'ME9'),
(9, 90, 'Reserved', '4-Top', 4, 'ME10'),
(9, 90, 'Available', '4-Top', 4, 'ME11'),
(9, 90, 'Available', '4-Top', 4, 'ME12'),

(9, 90, 'Available', '6-Top', 6, 'ME13'),
(9, 90, 'Occupied', '6-Top', 6, 'ME14'),
(9, 90, 'Available', '6-Top', 6, 'ME15'),
(9, 90, 'Reserved', '6-Top', 6, 'ME16'),

(9, 90, 'Available', '2-Top', 2, 'ME17'),

-- =========================================================
-- 10 Austin Smoke (capacity 130)
-- =========================================================
(10, 120, 'Available', '8-Top', 8, 'AS1'),
(10, 120, 'Occupied', '8-Top', 8, 'AS2'),
(10, 120, 'Available', '8-Top', 8, 'AS3'),
(10, 120, 'Reserved', '8-Top', 8, 'AS4'),
(10, 120, 'Available', '8-Top', 8, 'AS5'),
(10, 120, 'Available', '8-Top', 8, 'AS6'),
(10, 120, 'Occupied', '8-Top', 8, 'AS7'),
(10, 120, 'Available', '8-Top', 8, 'AS8'),

(10, 120, 'Available', '6-Top', 6, 'AS9'),
(10, 120, 'Occupied', '6-Top', 6, 'AS10'),
(10, 120, 'Available', '6-Top', 6, 'AS11'),
(10, 120, 'Reserved', '6-Top', 6, 'AS12'),
(10, 120, 'Available', '6-Top', 6, 'AS13'),
(10, 120, 'Available', '6-Top', 6, 'AS14'),

(10, 120, 'Available', '4-Top', 4, 'AS15'),
(10, 120, 'Occupied', '4-Top', 4, 'AS16'),
(10, 120, 'Available', '4-Top', 4, 'AS17'),
(10, 120, 'Reserved', '4-Top', 4, 'AS18'),
(10, 120, 'Available', '4-Top', 4, 'AS19'),
(10, 120, 'Available', '4-Top', 4, 'AS20'),

(10, 120, 'Available', '2-Top', 2, 'AS21'),
(10, 120, 'Occupied', '2-Top', 2, 'AS22'),
(10, 120, 'Available', '2-Top', 2, 'AS23');

-- ============================================================
-- RESTAURANT_TABLE (11–20)
-- Capacity-aware seating allocation (exact match per restaurant)
-- ============================================================

-- -------------------------
-- 11. Windy City Deli (40)
-- 4 tables × 4 seats + 4 tables × 6 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(11, 60, 'Available', '2-top', 4, 'Main'),
(11, 60, 'Available', '2-top', 4, 'Main'),
(11, 60, 'Available', '2-top', 4, 'Main'),
(11, 60, 'Available', '2-top', 4, 'Main'),
(11, 60, 'Available', 'Booth', 6, 'Dining'),
(11, 60, 'Available', 'Booth', 6, 'Dining'),
(11, 60, 'Available', 'Booth', 6, 'Dining'),
(11, 60, 'Available', 'Booth', 6, 'Dining');

-- -------------------------
-- 12. Bay Fusion (95)
-- 5 tables × 10 seats + 5 tables × 9 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(12, 75, 'Available', 'Large', 10, 'Main'),
(12, 75, 'Available', 'Large', 10, 'Main'),
(12, 75, 'Available', 'Large', 10, 'Main'),
(12, 75, 'Available', 'Large', 10, 'Main'),
(12, 75, 'Available', 'Large', 10, 'Main'),
(12, 75, 'Available', 'Standard', 9, 'Dining'),
(12, 75, 'Available', 'Standard', 9, 'Dining'),
(12, 75, 'Available', 'Standard', 9, 'Dining'),
(12, 75, 'Available', 'Standard', 9, 'Dining'),
(12, 75, 'Available', 'Standard', 9, 'Dining');

-- -------------------------
-- 13. Coral Reef (75)
-- 3 tables × 10 + 5 tables × 9
-- expID = 5 (Coral Reef Feast)
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(13, 80, 'Available', 'Large', 10, 'Main'),
(13, 80, 'Available', 'Large', 10, 'Main'),
(13, 80, 'Available', 'Large', 10, 'Main'),
(13, 80, 'Available', 'Booth', 9, 'Dining'),
(13, 80, 'Available', 'Booth', 9, 'Dining'),
(13, 80, 'Available', 'Booth', 9, 'Dining'),
(13, 80, 'Available', 'Booth', 9, 'Dining'),
(13, 80, 'Available', 'Booth', 9, 'Dining');

-- -------------------------
-- 14. Empire Dining (65)
-- 5 tables × 10 + 3 tables × 5
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(14, 70, 'Available', 'Large', 10, 'Main'),
(14, 70, 'Available', 'Large', 10, 'Main'),
(14, 70, 'Available', 'Large', 10, 'Main'),
(14, 70, 'Available', 'Large', 10, 'Main'),
(14, 70, 'Available', 'Large', 10, 'Main'),
(14, 70, 'Available', 'Small', 5, 'Dining'),
(14, 70, 'Available', 'Small', 5, 'Dining'),
(14, 70, 'Available', 'Small', 5, 'Dining');

-- -------------------------
-- 15. Hill Country BBQ (140)
-- 10 tables × 14 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main'),
(15, 90, 'Available', 'Family', 14, 'Main');

-- -------------------------
-- 16. Chicago Prime (85)
-- 5 tables × 10 + 7 tables × 5
-- expID = 6 (Steak Masterclass Dinner)
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(16, 85, 'Available', 'Large', 10, 'Main'),
(16, 85, 'Available', 'Large', 10, 'Main'),
(16, 85, 'Available', 'Large', 10, 'Main'),
(16, 85, 'Available', 'Large', 10, 'Main'),
(16, 85, 'Available', 'Large', 10, 'Main'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining'),
(16, 85, 'Available', 'Small', 5, 'Dining');

-- -------------------------
-- 17. Pacific Table (110)
-- 10 tables × 11 seats
-- expID = 7 (Bay Sunset Experience)
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main'),
(17, 95, 'Available', 'Standard', 11, 'Main');

-- -------------------------
-- 18. Miami Spice (60)
-- 6 tables × 10 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(18, 65, 'Available', 'Booth', 10, 'Main'),
(18, 65, 'Available', 'Booth', 10, 'Main'),
(18, 65, 'Available', 'Booth', 10, 'Main'),
(18, 65, 'Available', 'Booth', 10, 'Main'),
(18, 65, 'Available', 'Booth', 10, 'Main'),
(18, 65, 'Available', 'Booth', 10, 'Main');

-- -------------------------
-- 19. Central Park Eats (55)
-- 5 tables × 11 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(19, 70, 'Available', 'Standard', 11, 'Main'),
(19, 70, 'Available', 'Standard', 11, 'Main'),
(19, 70, 'Available', 'Standard', 11, 'Main'),
(19, 70, 'Available', 'Standard', 11, 'Main'),
(19, 70, 'Available', 'Standard', 11, 'Main');

-- -------------------------
-- 20. Austin Smoke (130)
-- 10 tables × 13 seats
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main'),
(20, 90, 'Available', 'BBQ Large', 13, 'Main');

-- ============================================================
-- RESTAURANT_TABLE (21–30)
-- Capacity-aware allocation (exact match per restaurant)
-- ============================================================

-- -------------------------
-- 21. Northside Grill (80)
-- 8 tables × 10 seats
-- expID = 8 (not strictly required, optional casual dining)
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(21, 70, 'Available', 'Standard', 10, 'Main'),
(21, 70, 'Available', 'Standard', 10, 'Main'),
(21, 70, 'Available', 'Standard', 10, 'Main'),
(21, 70, 'Available', 'Standard', 10, 'Main'),
(21, 70, 'Available', 'Booth', 10, 'Dining'),
(21, 70, 'Available', 'Booth', 10, 'Dining'),
(21, 70, 'Available', 'Booth', 10, 'Dining'),
(21, 70, 'Available', 'Booth', 10, 'Dining');

-- -------------------------
-- 22. SF Coastal (100)
-- 10 tables × 10 seats
-- expID = 9 (Pacific Tasting Menu)
-- -------------------------
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(22, 85, 'Available', 'Ocean View', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(23, 60, 'Available', 'Standard', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),
(24, 80, 'Available', 'Fine Dining', 10, 'Main'),

(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main'),
(25, 95, 'Available', 'BBQ Large', 13, 'Main');


INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(26, 75, 'Available', 'Harbor View', 15, 'Main'),
(26, 75, 'Available', 'Harbor View', 15, 'Main'),
(26, 75, 'Available', 'Harbor View', 15, 'Main'),
(26, 75, 'Available', 'Harbor View', 15, 'Main'),
(26, 75, 'Available', 'Harbor View', 15, 'Main');

INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Chef Table', 10, 'Main'),
(27, 85, 'Available', 'Private', 5, 'VIP');

INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(28, 65, 'Available', 'Beach', 10, 'Main'),
(28, 65, 'Available', 'Beach', 10, 'Main'),
(28, 65, 'Available', 'Beach', 10, 'Main'),
(28, 65, 'Available', 'Beach', 10, 'Main'),
(28, 65, 'Available', 'Beach', 10, 'Main'),
(28, 65, 'Available', 'Beach', 10, 'Main');

INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(29, 60, 'Available', 'Urban', 10, 'Main'),
(29, 60, 'Available', 'Urban', 10, 'Main'),
(29, 60, 'Available', 'Urban', 10, 'Main'),
(29, 60, 'Available', 'Urban', 10, 'Main'),
(29, 60, 'Available', 'Urban', 10, 'Main');

INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main'),
(30, 100, 'Available', 'BBQ Pit', 14, 'Main');

-- ============================================================
-- RESTAURANT 31 — Lake Michigan Bistro (capacity 85)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(31, 90, 'Available', '2-Top', 20, 'Window Side'),
(31, 90, 'Available', '4-Top', 20, 'Main Floor'),
(31, 90, 'Available', 'Booth', 15, 'Lake View'),
(31, 90, 'Available', '6-Top', 15, 'Private Corner'),
(31, 90, 'Available', 'Communal', 15, 'Center Hall');

-- ============================================================
-- RESTAURANT 32 — SF Skyline (capacity 110)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(32, 90, 'Available', '2-Top', 20, 'Rooftop Edge'),
(32, 90, 'Available', '4-Top', 20, 'Glass Wall'),
(32, 90, 'Available', '4-Top', 20, 'City View'),
(32, 90, 'Available', '6-Top', 25, 'VIP Section'),
(32, 90, 'Available', 'Large Table', 25, 'Sky Lounge');

-- ============================================================
-- RESTAURANT 33 — Miami Luxe (capacity 80)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(33, 90, 'Available', '2-Top', 15, 'Luxury Wing'),
(33, 90, 'Available', '4-Top', 20, 'Crystal Hall'),
(33, 90, 'Available', 'Booth', 15, 'VIP Booths'),
(33, 90, 'Available', '6-Top', 15, 'Dining Room'),
(33, 90, 'Available', 'Private Table', 15, 'Wine Room');

-- ============================================================
-- RESTAURANT 34 — NY Midtown Grill (capacity 65)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(34, 90, 'Available', '2-Top', 15, 'Street View'),
(34, 90, 'Available', '4-Top', 15, 'Main Hall'),
(34, 90, 'Available', 'Booth', 15, 'Corner Booths'),
(34, 90, 'Available', '6-Top', 20, 'Private Section');

-- ============================================================
-- RESTAURANT 35 — Austin Prime Smoke (capacity 120)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(35, 120, 'Available', '2-Top', 20, 'Front Patio'),
(35, 120, 'Available', '4-Top', 25, 'Main Hall'),
(35, 120, 'Available', '6-Top', 25, 'Smokehouse Room'),
(35, 120, 'Available', '8-Top', 30, 'BBQ Hall'),
(35, 120, 'Available', 'Communal', 20, 'Festival Table');

-- ============================================================
-- RESTAURANT 36 — Chicago Bistro 77 (capacity 90)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(36, 90, 'Available', '2-Top', 15, 'River View'),
(36, 90, 'Available', '4-Top', 20, 'Dining Hall'),
(36, 90, 'Available', 'Booth', 15, 'Wine Booths'),
(36, 90, 'Available', '6-Top', 20, 'Chef Room'),
(36, 90, 'Available', 'Private Table', 20, 'VIP Lounge');

-- ============================================================
-- RESTAURANT 37 — SF Harbor Eats (capacity 100)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(37, 100, 'Available', '2-Top', 20, 'Harbor View'),
(37, 100, 'Available', '4-Top', 20, 'Main Deck'),
(37, 100, 'Available', '6-Top', 20, 'Sea Lounge'),
(37, 100, 'Available', '8-Top', 20, 'VIP Dock'),
(37, 100, 'Available', 'Communal', 20, 'Center Hall');

-- ============================================================
-- RESTAURANT 38 — Miami Sunset Kitchen (capacity 70)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(38, 90, 'Available', '2-Top', 15, 'Sunset Deck'),
(38, 90, 'Available', '4-Top', 15, 'Main Room'),
(38, 90, 'Available', 'Booth', 15, 'Lounge'),
(38, 90, 'Available', '6-Top', 25, 'VIP Corner');

-- ============================================================
-- RESTAURANT 39 — NY Eastside Table (capacity 55)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(39, 90, 'Available', '2-Top', 15, 'Street View'),
(39, 90, 'Available', '4-Top', 20, 'Main Floor'),
(39, 90, 'Available', 'Booth', 20, 'Corner Booth');

-- ============================================================
-- RESTAURANT 40 — Austin South Grill (capacity 130)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(40, 120, 'Available', '2-Top', 20, 'Front Patio'),
(40, 120, 'Available', '4-Top', 25, 'Main Hall'),
(40, 120, 'Available', '6-Top', 25, 'Smoke Room'),
(40, 120, 'Available', '8-Top', 30, 'BBQ Hall'),
(40, 120, 'Available', 'Large Table', 30, 'Private Pit Room');

-- ============================================================
-- RESTAURANT 41 — Chicago River Dining (capacity 85)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(41, 90, 'Available', '2-Top', 15, 'River View'),
(41, 90, 'Available', '4-Top', 20, 'Main Hall'),
(41, 90, 'Available', 'Booth', 15, 'Window Booths'),
(41, 90, 'Available', '6-Top', 20, 'Chef Section'),
(41, 90, 'Available', 'Private Table', 15, 'VIP Room');

-- ============================================================
-- RESTAURANT 42 — SF Market Table (capacity 95)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(42, 90, 'Available', '2-Top', 20, 'Market View'),
(42, 90, 'Available', '4-Top', 20, 'Open Kitchen'),
(42, 90, 'Available', '4-Top', 20, 'Chef Counter'),
(42, 90, 'Available', '6-Top', 20, 'Dining Hall'),
(42, 90, 'Available', 'Communal', 15, 'Center Table');

-- ============================================================
-- RESTAURANT 43 — Miami Ocean Prime (capacity 80)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(43, 90, 'Available', '2-Top', 15, 'Ocean View'),
(43, 90, 'Available', '4-Top', 20, 'Main Dining'),
(43, 90, 'Available', 'Booth', 15, 'Luxury Booths'),
(43, 90, 'Available', '6-Top', 15, 'Private Wing'),
(43, 90, 'Available', 'VIP Table', 15, 'Chef Room');

-- ============================================================
-- RESTAURANT 44 — NY Uptown Grill (capacity 60)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(44, 90, 'Available', '2-Top', 15, 'Street View'),
(44, 90, 'Available', '4-Top', 15, 'Main Floor'),
(44, 90, 'Available', 'Booth', 15, 'Corner Booth'),
(44, 90, 'Available', '6-Top', 15, 'Private Room');

-- ============================================================
-- RESTAURANT 45 — Austin River Smoke (capacity 140)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(45, 120, 'Available', '2-Top', 25, 'River Patio'),
(45, 120, 'Available', '4-Top', 30, 'Main Hall'),
(45, 120, 'Available', '6-Top', 30, 'Smoke Room'),
(45, 120, 'Available', '8-Top', 30, 'BBQ Hall'),
(45, 120, 'Available', 'Communal', 25, 'Festival Table');

-- ============================================================
-- RESTAURANT 46 — Chicago Gold Fork (capacity 75)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(46, 90, 'Available', '2-Top', 15, 'Gold Room'),
(46, 90, 'Available', '4-Top', 20, 'Dining Hall'),
(46, 90, 'Available', 'Booth', 15, 'Chef Booths'),
(46, 90, 'Available', '6-Top', 10, 'VIP Lounge'),
(46, 90, 'Available', 'Private Table', 15, 'Tasting Room');

-- ============================================================
-- RESTAURANT 47 — SF Bay View Grill (capacity 110)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(47, 100, 'Available', '2-Top', 20, 'Bay View'),
(47, 100, 'Available', '4-Top', 25, 'Main Deck'),
(47, 100, 'Available', '6-Top', 25, 'Sea Lounge'),
(47, 100, 'Available', '8-Top', 20, 'VIP Dock'),
(47, 100, 'Available', 'Communal', 20, 'Center Hall');

-- ============================================================
-- RESTAURANT 48 — Miami Beach House (capacity 70)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(48, 90, 'Available', '2-Top', 15, 'Beachfront'),
(48, 90, 'Available', '4-Top', 15, 'Main Room'),
(48, 90, 'Available', 'Booth', 15, 'Lounge'),
(48, 90, 'Available', '6-Top', 25, 'Private Deck');

-- ============================================================
-- RESTAURANT 49 — NY Grand Table (capacity 90)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(49, 90, 'Available', '2-Top', 20, 'Grand Hall'),
(49, 90, 'Available', '4-Top', 20, 'Dining Room'),
(49, 90, 'Available', 'Booth', 20, 'Corner Booths'),
(49, 90, 'Available', '6-Top', 15, 'VIP Room'),
(49, 90, 'Available', 'Private Table', 15, 'Chef Table');

-- ============================================================
-- RESTAURANT 50 — Austin Legacy BBQ (capacity 130)
-- ============================================================
INSERT INTO restaurantTable (restID, estimateTime, availableStatus, tableType, seatCapacity, room) VALUES
(50, 120, 'Available', '2-Top', 25, 'Front Patio'),
(50, 120, 'Available', '4-Top', 30, 'Main Hall'),
(50, 120, 'Available', '6-Top', 25, 'Smoke Pit Room'),
(50, 120, 'Available', '8-Top', 30, 'BBQ Hall'),
(50, 120, 'Available', 'Communal', 20, 'Festival Table');

-- 21. private_dining
INSERT INTO privateDining (restID, tableID, roomName, capacity, seating) VALUES

-- ============================================================
-- 1. Aurora Grill (Chicago)
-- ============================================================
(1, NULL, 'Chef’s Private Loft', 12, 'Banquet Style'),

-- ============================================================
-- 2. Blue Harbor (SF - Luxury Seafood)
-- ============================================================
(2, NULL, 'Harbor Glass Suite', 20, 'Ocean View Banquet'),

-- ============================================================
-- 4. Urban Table (NY Contemporary)
-- ============================================================
(4, NULL, 'Skyline Studio Room', 10, 'Chef Table Seating'),

-- ============================================================
-- 7. Golden Gate Dining (SF Michelin)
-- ============================================================
(7, NULL, 'Golden Chef Chamber', 16, 'Tasting Table'),

-- ============================================================
-- 9. Manhattan Eats (NY Classic)
-- ============================================================
(9, NULL, 'Manhattan Heritage Room', 14, 'Formal Dining'),

-- ============================================================
-- 12. Bay Fusion (SF Asian Fusion)
-- ============================================================
(12, NULL, 'Zen Fusion Suite', 18, 'Low Table + Booth Mix'),

-- ============================================================
-- 13. Coral Reef (Miami Seafood)
-- ============================================================
(13, NULL, 'Coral Private Reef Room', 22, 'Banquet Seafood Setup'),

-- ============================================================
-- 16. Chicago Prime (Steakhouse)
-- ============================================================
(16, NULL, 'Prime Cut Executive Room', 15, 'Steak Tasting Table'),

-- ============================================================
-- 17. Pacific Table (SF Waterfront)
-- ============================================================
(17, NULL, 'Pacific Horizon Room', 24, 'Waterfront Banquet'),

-- ============================================================
-- 22. SF Coastal (Seafood Fine Dining)
-- ============================================================
(22, NULL, 'Coastal Reserve Suite', 20, 'Chef Tasting Layout'),

-- ============================================================
-- 27. Golden Spoon SF (Contemporary)
-- ============================================================
(27, NULL, 'Golden Spoon Atelier', 16, 'Modern Shared Table'),

-- ============================================================
-- 33. Miami Luxe (Luxury Dining)
-- ============================================================
(33, NULL, 'Luxe Crystal Chamber', 18, 'Ultra Formal Banquet'),

-- ============================================================
-- 36. Chicago Bistro 77 (Modern Fine Dining)
-- ============================================================
(36, NULL, 'Bistro Chef Studio', 14, 'Interactive Chef Table'),

-- ============================================================
-- 41. Chicago River Dining (Waterfront)
-- ============================================================
(41, NULL, 'Riverglass Private Room', 20, 'River View Dining'),

-- ============================================================
-- 49. NY Grand Table (French Fine Dining)
-- ============================================================
(49, NULL, 'Grand Heritage Salon', 25, 'Classic French Banquet');

-- 22. reservation
INSERT INTO reservation (userID, restID, resDate, specialReq, occasion, partySize, resTime, status) VALUES
(1, 1, '2026-04-01', NULL, NULL, 2, '18:00:00', 'Confirmed'),
(2, 1, '2026-04-12', NULL, NULL, 4, '19:00:00', 'Confirmed'),
(3, 1, '2026-04-23', NULL, NULL, 2, '18:30:00', 'Confirmed'),
(4, 2, '2026-04-11', NULL, NULL, 2, '19:00:00', 'Confirmed'),
(5, 2, '2026-04-22', NULL, NULL, 4, '18:00:00', 'Confirmed'),
(6, 3, '2026-04-15', NULL, NULL, 2, '19:30:00', 'Confirmed'),
(7, 4, '2026-04-21', NULL, NULL, 4, '18:00:00', 'Confirmed'),
(8, 4, '2026-05-12', NULL, NULL, 2, '19:00:00', 'Confirmed'),
(9, 4, '2026-05-13', NULL, NULL, 6, '18:30:00', 'Confirmed'),
(10, 5, '2026-05-11', NULL, NULL, 4, '19:00:00', 'Confirmed'),
(11, 5, '2026-05-02', NULL, NULL, 2, '18:00:00', 'Confirmed'),
(12, 6, '2026-04-17', NULL, NULL, 2, '19:30:00', 'Confirmed'),
(13, 7, '2026-05-03', NULL, NULL, 4, '18:00:00', 'Confirmed'),
(14, 8, '2026-05-01', NULL, NULL, 2, '19:00:00', 'Confirmed'),
(15, 8, '2026-05-05', NULL, NULL, 4, '18:30:00', 'Confirmed'),
(16, 9, '2026-05-01', NULL, NULL, 2, '19:00:00', 'Confirmed'),
(17, 10, '2026-05-06', NULL, NULL, 4, '18:00:00', 'Confirmed'),
(18, 10, '2026-03-02', NULL, NULL, 2, '19:30:00', 'Confirmed'),
(19, 11, '2026-03-11', NULL, NULL, 2, '18:00:00', 'Confirmed'),
(20, 12, '2026-03-21', NULL, NULL, 4, '19:00:00', 'Confirmed');


-- 23. review
INSERT INTO review (userID, restID, diningDate, foodRating, numOfStars, overallRating, ambRating, text_content, serviceRating) VALUES

-- =========================
-- Restaurant 1 (3 reviews)
-- =========================
(1, 1, '2026-04-01', 5, 5, 5.0, 5, 'Excellent modern dining experience with great service.', 5),
(2, 1, '2026-04-12', 4, 4, 4.3, 4, 'Great food but slightly slow service.', 4),
(3, 1, '2026-04-23', 5, 5, 4.8, 5, 'Amazing rooftop atmosphere and quality dishes.', 5),

-- =========================
-- Restaurant 2 (2 reviews)
-- =========================
(4, 2, '2026-04-11', 5, 5, 5.0, 5, 'World-class seafood and stunning waterfront view.', 5),
(5, 2, '2026-04-22', 4, 4, 4.5, 4, 'Very fresh seafood, slightly expensive.', 4),

-- =========================
-- Restaurant 3 (1 review)
-- =========================
(6, 3, '2026-04-15', 5, 5, 4.9, 5, 'Perfect steak, cooked exactly right.', 5),

-- =========================
-- Restaurant 4 (3 reviews)
-- =========================
(7, 4, '2026-04-21', 4, 4, 4.2, 4, 'Nice ambiance but limited menu.', 4),
(8, 4, '2026-05-12', 5, 5, 4.7, 5, 'Rooftop dining was incredible.', 5),
(9, 4, '2026-05-13', 3, 3, 3.8, 3, 'Good but overpriced for portion size.', 3),

-- =========================
-- Restaurant 5 (2 reviews)
-- =========================
(10, 5, '2026-05-11', 5, 5, 4.9, 5, 'Best Tex-Mex in the city.', 5),
(11, 5, '2026-05-02', 4, 4, 4.4, 4, 'Fun vibe and solid food.', 4),

-- =========================
-- Restaurant 6 (1 review)
-- =========================
(12, 6, '2026-04-17', 5, 5, 4.8, 5, 'Elegant French dining experience.', 5),

-- =========================
-- Restaurant 7 (3 reviews)
-- =========================
(13, 7, '2026-05-01', 5, 5, 5.0, 5, 'Michelin-level experience, outstanding.', 5),
(14, 7, '2026-05-02', 4, 4, 4.6, 4, 'Very refined but small portions.', 4),
(15, 7, '2026-05-05', 5, 5, 4.9, 5, 'Incredible tasting menu experience.', 5),

-- =========================
-- Restaurant 8 (2 reviews)
-- =========================
(16, 8, '2026-05-01', 4, 4, 4.3, 4, 'Fresh seafood with good presentation.', 4),
(17, 8, '2026-05-06', 5, 5, 4.7, 5, 'Beautiful ocean view and great service.', 5),

-- =========================
-- Restaurant 9 (1 review)
-- =========================
(18, 9, '2026-05-01', 5, 5, 4.9, 5, 'Classic NYC dining done right.', 5),

-- =========================
-- Restaurant 10 (2 reviews)
-- =========================
(19, 10, '2026-05-11', 5, 5, 5.0, 5, 'Best BBQ in Austin, hands down.', 5),
(20, 10, '2026-05-21', 4, 4, 4.5, 4, 'Great smoky flavor and atmosphere.', 4);

-- 25. response
INSERT INTO response (reviewID, text_body) VALUES

(1, 'Thank you for your kind words! We’re glad you enjoyed your experience.'),
(2, 'We appreciate your feedback and will work on improving service speed.'),
(3, 'Happy you loved the rooftop experience! Hope to see you again soon.'),

(4, 'Thank you for dining with us! Fresh seafood is always our priority.'),
(5, 'We appreciate your honesty and are glad you enjoyed the meal.'),

(6, 'We’re honored you enjoyed our steak preparation. Thank you!'),

(7, 'Thank you for your feedback — we’re improving menu variety.'),
(8, 'So glad you enjoyed the rooftop view and dining experience!'),
(9, 'We appreciate your note and will review portion pricing.'),

(10, 'We’re thrilled you enjoyed our Tex-Mex specialties!'),
(11, 'Thank you for your feedback — glad you enjoyed the atmosphere.'),

(12, 'We’re happy you enjoyed our French-inspired cuisine.'),

(13, 'Thank you — we strive for Michelin-level excellence every day.'),
(14, 'We appreciate your feedback on portion sizes and will consider it.'),
(15, 'Glad you enjoyed the tasting menu experience!'),

(16, 'Thank you for your review of our seafood dishes!'),
(17, 'We’re happy you enjoyed the ocean view and service.'),

(18, 'We appreciate your kind words about our NYC dining experience.'),

(19, 'Thank you! We’re proud to be part of Austin’s BBQ culture.'),
(20, 'Glad you enjoyed the smoky flavors — we’ll keep refining them.');


-- 26. isAvailable
INSERT INTO isAvailable (reservationID, tableID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- 27. saved

-- 24. tag - Simple tag definitions
INSERT INTO tag (tagName) VALUES
('Excellent Food'),
('Great Service'),
('Slow Service'),
('Good Food'),
('Rooftop Experience'),
('High Quality'),
('Fresh Seafood'),
('Waterfront View'),
('Expensive'),
('Perfectly Cooked'),
('Steakhouse'),
('Limited Menu'),
('Average Value'),
('Rooftop Dining'),
('Great Experience'),
('Overpriced'),
('Decent Food'),
('Best Tex-Mex'),
('Great Value'),
('Fun Atmosphere'),
('Elegant Dining'),
('French Cuisine'),
('Michelin Quality'),
('Exceptional Food'),
('Small Portions'),
('Refined Dining'),
('Tasting Menu'),
('High End Cuisine'),
('Good Presentation'),
('Ocean View'),
('Classic NYC Dining'),
('Premium Quality'),
('Best BBQ'),
('Smoked Perfection'),
('Great Atmosphere'),
('Kid Friendly'),
('Romantic'),
('Vegetarian Options'),
('Live Music'),
('Outdoor Seating');

-- 25. restaurant_tag - Tags for restaurants
INSERT INTO RestHasTag (restID, tagID) VALUES
(1, 1),(1, 2),(1, 5),(1, 36),(1, 40),
(2, 7),(2, 8),(2, 23),(2, 24),(2, 37),
(3, 10),(3, 11),(3, 1),(3, 37),
(4, 5),(4, 14),(4, 6),(4, 38),(4, 40),
(5, 18),(5, 19),(5, 20),(5, 39),(5, 40),
(6, 21),(6, 22),(6, 8),(6, 37),
(7, 23),(7, 24),(7, 27),(7, 28),(7, 37),
(8, 7),(8, 30),(8, 2),(8, 8),(8, 36),
(9, 31),(9, 32),(9, 1),(9, 37),
(10, 33),(10, 34),(10, 35),(10, 19),(10, 39);

-- 26. review_tag - Tags from reviews
INSERT INTO ReviewHasTag (reviewID, tagID) VALUES
(1, 1),(1, 2),(1, 5),
(2, 3),(2, 4),
(3, 5),(3, 6),
(4, 7),(4, 8),
(5, 9),(5, 6),
(6, 10),(6, 11),
(7, 12),(7, 13),
(8, 14),(8, 15),
(9, 16),(9, 17),
(10, 18),(10, 19),
(11, 20),(11, 4),
(12, 21),(12, 22),
(13, 23),(13, 24),
(14, 25),(14, 26),
(15, 27),(15, 28),
(16, 7),(16, 29),
(17, 30),(17, 2),
(18, 31),(18, 32),
(19, 33),(19, 34),
(20, 35),(20, 19);

-- 28. cuisine
INSERT INTO cuisine (cuisineName) VALUES
('American'),
('Seafood'),
('Steakhouse'),
('Contemporary'),
('Tex-Mex'),
('French'),
('Californian'),
('Latin'),
('Italian'),
('BBQ'),
('Deli'),
('Asian Fusion'),
('Mexican'),
('Fusion'),
('Modern'),
('Fine Dining');

-- 29. restaurant_cuisine
INSERT INTO restaurantCuisine (restID, cuisineID) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),
(6, 6),(7, 7),(8, 2),(9, 1),(10, 10),
(11, 11),(12, 12),(13, 2),(14, 9),(15, 10),
(16, 3),(17, 2),(18, 8),(19, 1),(20, 10),
(21, 1),(22, 2),(23, 14),(24, 9),(25, 10),
(26, 2),(27, 4),(28, 2),(29, 1),(30, 10),
(31, 6),(32, 14),(33, 16),(34, 1),(35, 10),
(36, 15),(37, 2),(38, 8),(39, 9),(40, 10),
(41, 2),(42, 14),(43, 2),(44, 1),(45, 10),
(46, 16),(47, 2),(48, 2),(49, 6),(50, 10);

-- 30. preference
INSERT INTO Preferences (preferenceName) VALUES
('Vegan'),
('Seafood'),
('Steak'),
('Vegetarian'),
('Spicy'),
('Italian'),
('Desserts'),
('BBQ'),
('Healthy'),
('Fusion'),
('Sushi'),
('Mexican');

-- 31. user_preference
INSERT INTO userPreference (userID, preferenceID) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),
(6, 6),(7, 7),(8, 8),(9, 9),(10, 10),
(11, 11),(12, 12),(13, 6),(14, 1),(15, 8),
(16, 2),(17, 3),(18, 7),(19, 9),(20, 10),
(21, 11),(22, 12),(23, 6),(24, 4),(25, 8),
(26, 2),(27, 3),(28, 7),(29, 9),(30, 10),
(31, 11),(32, 12),(33, 6),(34, 4),(35, 8),
(36, 2),(37, 3),(38, 7),(39, 9),(40, 10),
(41, 11),(42, 12),(43, 6),(44, 4),(45, 8),
(46, 2),(47, 3),(48, 7),(49, 9),(50, 10);
INSERT INTO saved (userID, restID) VALUES
(1,2),(1,5),(1,10),
(2,1),(2,3),(2,7),
(3,4),(3,6),(3,8),
(4,2),(4,9),(4,11),
(5,10),(5,12),(5,15),
(6,1),(6,13),(6,16),
(7,2),(7,14),(7,17),
(8,3),(8,18),(8,20),
(9,4),(9,19),(9,21),
(10,5),(10,22),(10,23),
(11,6),(11,24),(11,25),
(12,7),(12,26),(12,27),
(13,8),(13,28),(13,29),
(14,9),(14,30),(14,31),
(15,10),(15,32),(15,33),
(16,11),(16,34),(16,35),
(17,12),(17,36),(17,37),
(18,13),(18,38),(18,39),
(19,14),(19,40),(19,41),
(20,15),(20,42),(20,43);



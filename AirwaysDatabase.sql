-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `flight attendant`
-- ----------------------------
DROP TABLE IF EXISTS `flight attendant`;
CREATE TABLE `flight attendant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `zip code` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of flight attendant
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `flight`
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `flight_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(15) NOT NULL,
  `to` varchar(15) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `flight_distance` int(30) NOT NULL,
  `trip_type` varchar(15) NOT NULL,
  `pilot_id` int(10) unsigned NOT NULL,
  `plane_id` int(10) unsigned NOT NULL,
  `FA_id` int(10) unsigned NOT NULL,
  `ticket_number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `fk_ticketflight` (`ticket_number`),
  KEY `fk_planeflight` (`plane_id`),
  KEY `fk_pilotflight` (`pilot_id`),
  KEY `fk_FAflight` (`FA_id`),
  CONSTRAINT `fk_FAflight` FOREIGN KEY (`FA_id`) REFERENCES `flight attendant` (`id`),
  CONSTRAINT `fk_pilotflight` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`),
  CONSTRAINT `fk_planeflight` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`id`),
  CONSTRAINT `fk_ticketflight` FOREIGN KEY (`ticket_number`) REFERENCES `ticket` (`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of flight
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `passenger`
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(3) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `zip code` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of passenger
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pilot`
-- ----------------------------
DROP TABLE IF EXISTS `pilot`;
CREATE TABLE `pilot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `assistant_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compilot` (`company_id`),
  CONSTRAINT `fk_compilot` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pilot
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `plane`
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_class_seats` smallint(5) NOT NULL,
  `crew_seats` smallint(5) NOT NULL,
  `description` varchar(40) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_complane` (`company_id`),
  CONSTRAINT `fk_complane` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of plane
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_number` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `airport_city` varchar(15) NOT NULL,
  `pass_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `class_type` varchar(10) NOT NULL,
  PRIMARY KEY (`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ticket
-- ----------------------------

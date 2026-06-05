IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 350
BEGIN
	UPDATE BaseClasses SET lowAge=NULL WHERE lowAge=-1
##GO##
	UPDATE BaseClasses SET highAge=NULL WHERE highAge=-1
##GO##
	UPDATE BaseClasses SET numberInTeam=NULL WHERE numberInTeam=-1
##GO##
	UPDATE BaseClasses SET maxNumberInClass=NULL WHERE maxNumberInClass=-1
##GO##
	UPDATE BaseClasses SET substituteClassId=NULL WHERE substituteClassId=-1
##GO##
	UPDATE BaseClasses SET notQualifiedSubstitutionClassId=NULL WHERE notQualifiedSubstitutionClassId=-1
##GO##
	ALTER TABLE ControlAreas DROP FOREIGN KEY ControlAreas_FK00
##GO##
	ALTER TABLE Controls DROP FOREIGN KEY Controls_FK00
##GO##
	DROP TABLE ControlAreas
##GO##
	UPDATE Version SET versionNumber = 350 WHERE moduleId=1
##GO##
	UPDATE Version SET Comment = 'OLA Databas 3.50' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 351
BEGIN

CREATE INDEX SplitTimesModifyDate] ON SplitTimes (modifyDate)
##GO##
CREATE INDEX SplitTimesSplitTimeControlId ON SplitTimes (splitTimeControlId)
##GO##
CREATE INDEX SplitTimesResultRaceIndividualNumber SplitTimes (resultRaceIndividualNumber)
##GO##
CREATE INDEX SplitTimeControlsTimingControl ON SplitTimeControls (timingControl)
##GO##
	UPDATE Version SET versionNumber = 351 WHERE moduleId=1
##GO##
	UPDATE Version SET Comment = 'OLA Databas 3.51' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 352
BEGIN

INSERT INTO `BaseClasses`(`classId`, `name`, `shortName`, `lowAge`, `highAge`, `sex`, `numberInTeam`, `teamEntry`, `maxNumberInClass`, `actualForRanking`, `noTimePresentation`, `fee`, `substituteClassId`, `notQualifiedSubstitutionClassId`, `classType`, `normalizedClass`, `modifyDate`)
VALUES (30685, "H17-20", "H17-20", NULL, NULL, "M", NULL, 0, NULL, 0, 0, "", NULL, NULL, "H", 1, "2005-12-15 11:39:48"),
  (30686, "D17-20", "D17-20", NULL, NULL, "F", NULL, 0, NULL, 0, 0, "", NULL, NULL, "H", 1, "2005-12-15 11:39:48");
##GO##

INSERT INTO `BaseClassesEventForms`(`eventForm`, `classId`, `modifyDate`)
VALUES ("IndSingleDay", 30685, "2005-12-15 11:39:48"),
  ("IndMultiDay", 30685, "2005-12-15 11:39:48"),
  ("IndSingleDay", 30686, "2005-12-15 11:39:48"),
  ("IndMultiDay", 30686, "2005-12-15 11:39:48");
##GO##

INSERT INTO `BaseClassEntryFees`(`baseClassId`, `ordered`, `type`, `entryFeeId`, `modifyDate`)
VALUES (30686, 1, "late", 4, "2005-12-15 11:39:49"),
  (30686, 1, "normal", 2, "2005-12-15 11:39:49"),
  (30685, 1, "late", 4, "2005-12-15 11:39:49"),
  (30685, 1, "normal", 2, "2005-12-15 11:39:49");
##GO##

UPDATE `EntryFees` SET amount=50 WHERE amount=35 AND name='Ungdom'

	UPDATE Version SET versionNumber = 352 WHERE moduleId=1
##GO##
	UPDATE Version SET Comment = 'OLA Databas 3.52' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 353
BEGIN
  ALTER TABLE BadgeGroups DROP COLUMN stamp
  ##GO##
  ALTER TABLE EventClassificationTypes DROP COLUMN stamp
  ##GO##
  ALTER TABLE Events DROP COLUMN stamp
  ##GO##
  ALTER TABLE EventRaces DROP COLUMN stamp
  ##GO##
  ALTER TABLE Accounts DROP COLUMN stamp
  ##GO##
  ALTER TABLE ClassCollection DROP COLUMN stamp
  ##GO##
  ALTER TABLE OrganisationTypes DROP COLUMN stamp
  ##GO##
  ALTER TABLE Organisations DROP COLUMN stamp
  ##GO##
  ALTER TABLE Courses DROP COLUMN stamp
  ##GO##
  ALTER TABLE EntryFees DROP COLUMN stamp
  ##GO##
  ALTER TABLE EventClasses DROP COLUMN stamp
  ##GO##
  ALTER TABLE PunchingUnits DROP COLUMN stamp
  ##GO##
  ALTER TABLE Controls DROP COLUMN stamp
  ##GO##
  ALTER TABLE AllocationGroups DROP COLUMN stamp
  ##GO##
  ALTER TABLE Clubs DROP COLUMN stamp
  ##GO##
  ALTER TABLE VIPTypes DROP COLUMN stamp
  ##GO##
  ALTER TABLE Persons DROP COLUMN stamp
  ##GO##
  ALTER TABLE Entries DROP COLUMN stamp
  ##GO##
  ALTER TABLE ElectronicPunchingCards DROP COLUMN stamp
  ##GO##
  ALTER TABLE EventOfficials DROP COLUMN stamp
  ##GO##
  ALTER TABLE Press DROP COLUMN stamp
  ##GO##
  ALTER TABLE PressList DROP COLUMN stamp
  ##GO##
  ALTER TABLE RaceClasses DROP COLUMN stamp
  ##GO##
  ALTER TABLE RawDataFromElectronicPunchingCards DROP COLUMN stamp
  ##GO##
  ALTER TABLE Results DROP COLUMN stamp
  ##GO##
  ALTER TABLE Services DROP COLUMN stamp
  ##GO##
  ALTER TABLE ServiceRequests DROP COLUMN stamp
  ##GO##
  ALTER TABLE SplitTimeControls DROP COLUMN stamp
  ##GO##
  ALTER TABLE Transactions DROP COLUMN stamp
  ##GO##
  ALTER TABLE Users DROP COLUMN stamp
  ##GO##

  ALTER TABLE EventClasses ADD minAverageAge SMALLINT NULL
  ##GO##
  ALTER TABLE EventClasses ADD maxAverageAge SMALLINT NULL
  ##GO##
  ALTER TABLE EventClasses ADD numberOfLegs SMALLINT NULL
  ##GO##
  ALTER TABLE RaceClasses ADD relayLeg SMALLINT NULL
	##GO##
	ALTER TABLE RaceClasses ADD minRunners SMALLINT NULL
	##GO##
  ALTER TABLE RaceClasses ADD maxRunners SMALLINT NULL
	##GO##
  ALTER TABLE RaceClasses ADD restartStopTime DATETIME NULL
	##GO##
  ALTER TABLE RaceClasses ADD restartTime DATETIME NULL
	##GO##
  ALTER TABLE RaceClasses ADD restartedTeamsAfter TINYINT NULL
  ##GO##
  ALTER TABLE RaceClasses ADD prizeGivingDone TINYINT NULL
  ##GO##  

  CREATE TABLE `RelayEntriesClubs` (
  `relayEntryClubId` INT NOT NULL AUTO_INCREMENT,
  `entryId` INT NOT NULL,
  `clubId` INT NOT NULL,
  `ordered` INT,
  `modifyDate` DATETIME NULL,
  PRIMARY KEY (relayEntryClubId),
  CONSTRAINT `RelayEntriesClubs_FK01` FOREIGN KEY `RelayEntriesClubs_FK01` (`entryId`)
    REFERENCES `Entries` (`entryId`),
  CONSTRAINT `RelayEntriesClubs_FK00` FOREIGN KEY `RelayEntriesClubs_FK00` (`clubId`)
    REFERENCES `Clubs` (`clubId`)
)
ENGINE = INNODB;
##GO##
    
ALTER TABLE Results ADD `relayPersonId` INT
##GO##
ALTER TABLE Results ADD `relayPersonOrder` SMALLINT
##GO##
ALTER TABLE Results ADD   CONSTRAINT `Results_FK04` FOREIGN KEY `Results_FK04` (`relayPersonId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ServiceRequests ADD `relayResultId` INT
##GO##

ALTER TABLE ServiceRequests ADD CONSTRAINT `ServiceRequests_FK02` FOREIGN KEY `ServiceRequests_FK02` (`relayResultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##
   

INSERT INTO `ClassTypes`(`shortName`, `name`, `modifyDate`)
VALUES ('S', 'Stafett', '2006-11-22 14:00:48');
##GO##

 DROP TABLE FinancialSummary
  ##GO##

DROP TABLE Invoice
  ##GO##

  
ALTER TABLE Entries MODIFY `teamName` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
  
ALTER TABLE `Accounts` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `AllocationGroups` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `AllocationGroupsStartTimes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `BadgeGroups` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `BadgeLimits` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `BaseClassEntryFees` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `BaseClasses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `BaseClassesEventForms` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClassCollection` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClassCollectionClasses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClassTypes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClassTypesEntryFees` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Clubs` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClubsAddresses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClubsAllocationGroups` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ClubsTelecoms` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Controls` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ControlsPunchingUnits` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Countries` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Courses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ElectronicPunchingCards` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Entries` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `RelayEntriesClubs` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EntriesEntryFees` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EntryFees` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EventClassEntryFees` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EventClasses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EventClassificationTypes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `EventRaces` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Events` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `MembersOfOrganisation` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Organisations` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `OrganisationsAddresses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `OrganisationsTelecoms` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `OrganisationTypes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `OrganisersOfEvents` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Persons` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PersonsAddresses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PersonsTelecoms` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Press` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PressAddresses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PressList` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PressTelecoms` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PunchingEntries` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `PunchingUnits` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `RaceClasses` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `RankingLists` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Rankings` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `RawDataFromElectronicPunchingCards` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Results` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `ServiceRequests` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Services` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `SplitTimeControls` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `SplitTimes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Transactions` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `Users` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE `VIPTypes` MODIFY modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##


 
	UPDATE Version SET versionNumber = 353 WHERE moduleId=1
  ##GO##
	UPDATE Version SET Comment = 'OLA Databas 3.53' WHERE moduleId=1
  ##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 400
BEGIN
	
CREATE TABLE `PreDirectEntry` (
	`preDirectEntryId` INT NOT NULL AUTO_INCREMENT,
	`cardNumber` INT NULL ,
	`clubId` INT NULL ,
	`familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
	`firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
	`sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`streetAddress` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`country` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homeMobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homeMailAddress` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  	`eventClassId` INT NULL,
  	`modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`PreDirectEntryId`),
  CONSTRAINT `PreDirectEntry_FK01` FOREIGN KEY `PreDirectEntry_FK01` (`eventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE Entries ADD noTotalResult TINYINT NOT NULL
##GO##

UPDATE Version SET versionNumber = 400 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.00' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 401
BEGIN

ALTER TABLE PunchingEntries ADD adjustedTime INT NOT NULL DEFAULT 0
##GO##
ALTER TABLE Controls ADD maxFreeTime INT NOT NULL DEFAULT 0
##GO##
ALTER TABLE Controls ADD controlAsFinish TINYINT NOT NULL
##GO##

UPDATE Version SET versionNumber = 401 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.01' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 402
BEGIN
CREATE TABLE `Bonuses` (
	`bonusId` INT NOT NULL AUTO_INCREMENT,
	`eventRaceId` INT NOT NULL,
	`bonusPoint` VARCHAR(255) NULL,
	`position` INT NOT NULL,
	`bonus` INT NOT NULL,
  PRIMARY KEY (`bonusId`),
  CONSTRAINT `Bonuses_FK01` FOREIGN KEY `Bonuses_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `ResultBonuses` (
	`resultId` INT NOT NULL,
	`bonusId` INT NOT NULL, 
PRIMARY KEY (`resultId`, `bonusId`),
  CONSTRAINT `ResultBonuses_FK01` FOREIGN KEY `ResultBonuses_FK01` (`bonusId`)
    REFERENCES `Bonuses` (`bonusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultBonuses_FK02` FOREIGN KEY `ResultBonuses_FK02` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE Bonuses ADD CONSTRAINT `Bonuses_FK02` FOREIGN KEY `Bonuses_FK01` (`bonusId`)
    REFERENCES `ResultBonuses` (`bonusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 402 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.02' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 403
BEGIN	
ALTER TABLE PreDirectEntry ADD birthYear VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
ALTER TABLE EntryFees ADD fromDateOfBirth DATETIME NULL
##GO##
ALTER TABLE EntryFees ADD toDateOfBirth DATETIME NULL
##GO##
UPDATE Version SET versionNumber = 403 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.03' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 404
BEGIN
UPDATE Version SET versionNumber = 404 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.04' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 405
BEGIN

ALTER TABLE Bonuses DROP FOREIGN KEY Bonuses_FK02
##GO##

DROP TABLE IF EXISTS ResultBonuses, Bonuses;
##GO##

CREATE TABLE `Bonuses` (
	`bonusId` INT NOT NULL AUTO_INCREMENT,
	`eventRaceId` INT NOT NULL,
	`bonusPoint` VARCHAR(255) NULL,
	`position` INT NOT NULL,
	`bonus` INT NOT NULL,
  PRIMARY KEY (`bonusId`),
  CONSTRAINT `Bonuses_FK01` FOREIGN KEY `Bonuses_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `ResultBonuses` (
	`resultId` INT NOT NULL,
	`bonusId` INT NOT NULL, 
PRIMARY KEY (`resultId`, `bonusId`),
  CONSTRAINT `ResultBonuses_FK01` FOREIGN KEY `ResultBonuses_FK01` (`bonusId`)
    REFERENCES `Bonuses` (`bonusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultBonuses_FK02` FOREIGN KEY `ResultBonuses_FK02` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE CoursesWayPointControls ADD distanceFrom INT NOT NULL DEFAULT 0
##GO##

ALTER TABLE Controls ADD xPos FLOAT(53) NULL
##GO##

ALTER TABLE Controls ADD yPos FLOAT(53) NULL
##GO##

ALTER TABLE RaceClasses ADD viewWhichOrganisation VARCHAR(20) NOT NULL DEFAULT 'club'
##GO##

UPDATE RaceClasses SET viewWhichOrganisation = 'club'
##GO##

UPDATE EntryFees SET fromDateOfBirth = '1900-01-01 00:00:00', toDateOfBirth = '1992-12-31 23:59:59' WHERE entryFeeId=2
##GO##

UPDATE EntryFees SET fromDateOfBirth = '1993-01-01 00:00:00', toDateOfBirth = '2009-12-31 23:59:59' WHERE entryFeeId=3
##GO##

UPDATE Version SET versionNumber = 405 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.05' WHERE moduleId=1
##GO##	
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 406
BEGIN

ALTER TABLE RawDataFromElectronicPunchingCards MODIFY mtrNumber INT NULL
##GO##

UPDATE Version SET versionNumber = 406 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.06' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 407
BEGIN

INSERT INTO `Organisations`(`organisationId`, `ID`, `name`, `account`, `organisationTypeId`, `superOrganisationId`, `country`, `modifyDate`)
VALUES (25, 650, "Internationella OF", "", 1, 0, "other", "2005-12-15 11:39:48")
##GO##

UPDATE EntryFees SET fromDateOfBirth = '1900-01-01 00:00:00', toDateOfBirth = '1993-12-31 23:59:59' WHERE entryFeeId=2
##GO##

UPDATE EntryFees SET fromDateOfBirth = '1994-01-01 00:00:00', toDateOfBirth = '2010-12-31 23:59:59' WHERE entryFeeId=3
##GO##

UPDATE Version SET versionNumber = 407 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.07' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 408
BEGIN
	
CREATE TABLE `BibNumberSeries` (
  `bibNumberSerieId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NOT NULL,
  `startNumberPrefix` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `firstStartNumber` INT NOT NULL,
  `nextStartNumber` INT NULL,
  `lastStartNumber` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`bibNumberSerieId`),
  CONSTRAINT `BibNumberSeries_FK00` FOREIGN KEY `BibNumberSeries_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

UPDATE Version SET versionNumber = 408 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 4.08' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 501
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Accounts ADD modifiedBy INT NULL, 
 ADD CONSTRAINT `Accounts_FK00` FOREIGN KEY `Accounts_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE AllocationGroups ADD modifiedBy INT NULL, 
 ADD CONSTRAINT `AllocationGroups_FK01` FOREIGN KEY `AllocationGroups_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE AllocationGroupsStartTimes ADD modifiedBy INT NULL, 
 ADD CONSTRAINT `AllocationGroupsStartTimes_FK02` FOREIGN KEY `AllocationGroupsStartTimes_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BadgeGroups ADD modifiedBy INT NULL, 
 ADD CONSTRAINT `BadgeGroups_FK00` FOREIGN KEY `BadgeGroups_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BadgeLimits ADD modifiedBy INT NULL, 
 ADD CONSTRAINT `BadgeLimits_FK00` FOREIGN KEY `BadgeLimits_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BaseClassEntryFees ADD modifiedBy INT NULL
##GO##

ALTER TABLE BaseClassEntryFees ADD CONSTRAINT `BaseClassEntryFees_FK02` FOREIGN KEY `BaseClassEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BaseClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE BaseClasses ADD CONSTRAINT `BaseClasses_FK01` FOREIGN KEY `BaseClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BaseClassesEventForms ADD modifiedBy INT NULL
##GO##

ALTER TABLE BaseClassesEventForms ADD CONSTRAINT `BaseClassesEventForms_FK01` FOREIGN KEY `BaseClassesEventForms_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassCollection ADD modifiedBy INT NULL
##GO##

ALTER TABLE ClassCollection ADD CONSTRAINT `ClassCollection_FK00` FOREIGN KEY `ClassCollection_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassCollectionClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE ClassCollectionClasses ADD CONSTRAINT `ClassCollectionClasses_FK02` FOREIGN KEY `ClassCollectionClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassTypes ADD modifiedBy INT NULL
##GO##

ALTER TABLE ClassTypes ADD CONSTRAINT `ClassTypes_FK00` FOREIGN KEY `ClassTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassTypesEntryFees ADD modifiedBy INT NULL
##GO##

ALTER TABLE ClassTypesEntryFees ADD CONSTRAINT `ClassTypesEntryFees_FK00` FOREIGN KEY `ClassTypesEntryFees_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitorsDefaultClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE CompetitorsDefaultClasses ADD CONSTRAINT `CompetitorsDefaultClasses_FK02` FOREIGN KEY `CompetitorsDefaultClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Controls ADD modifiedBy INT NULL
##GO##

ALTER TABLE Controls ADD CONSTRAINT `Controls_FK02` FOREIGN KEY `Controls_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ControlsPunchingUnits ADD modifiedBy INT NULL
##GO##

ALTER TABLE ControlsPunchingUnits ADD CONSTRAINT `ControlsPunchingUnits_FK02` FOREIGN KEY `ControlsPunchingUnits_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Countries ADD modifiedBy INT NULL
##GO##

ALTER TABLE Countries ADD CONSTRAINT `Countries_FK00` FOREIGN KEY `Countries_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Courses ADD modifiedBy INT NULL
##GO##

ALTER TABLE Courses ADD CONSTRAINT `Courses_FK01` FOREIGN KEY `Courses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CoursesWayPointControls ADD modifiedBy INT NULL
##GO##

ALTER TABLE CoursesWayPointControls ADD CONSTRAINT `CoursesWayPointControls_FK02` FOREIGN KEY `CoursesWayPointControls_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ElectronicPunchingCards ADD modifiedBy INT NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT `ElectronicPunchingCards_FK02` FOREIGN KEY `ElectronicPunchingCards_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Entries ADD entryOrganisationId INT NULL,
	ADD modifiedBy INT NULL
##GO##

ALTER TABLE Entries ADD CONSTRAINT `Entries_FK04` FOREIGN KEY `Entries_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Entries DROP FOREIGN KEY Entries_FK00
##GO##

ALTER TABLE Entries DROP KEY Entries_FK00
##GO##

ALTER TABLE Entries ADD CONSTRAINT `Entries_FK00` FOREIGN KEY `Entries_FK00` (`entryOrganisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntriesEntryFees ADD modifiedBy INT NULL
##GO##

ALTER TABLE EntriesEntryFees ADD CONSTRAINT `EntriesEntryFees_FK02` FOREIGN KEY `EntriesEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntryFees ADD modifiedBy INT NULL
##GO##

ALTER TABLE EntryFees ADD CONSTRAINT `EntryFees_FK00` FOREIGN KEY `EntryFees_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntrysClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE EntrysClasses ADD CONSTRAINT `EntrysClasses_FK01` FOREIGN KEY `EntrysClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClassEntryFees ADD modifiedBy INT NULL
##GO##

ALTER TABLE EventClassEntryFees ADD CONSTRAINT `EventClassEntryFees_FK02` FOREIGN KEY `EventClassEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE EventClasses ADD CONSTRAINT `EventClasses_FK02` FOREIGN KEY `EventClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClassificationTypes ADD modifiedBy INT NULL
##GO##

ALTER TABLE EventClassificationTypes ADD CONSTRAINT `EventClassificationTypes_FK00` FOREIGN KEY `EventClassificationTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `EventStatuses` (
  `eventStatusId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventStatusId`),
  CONSTRAINT `EventStatuses_FK00` FOREIGN KEY `EventStatuses_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

ALTER TABLE EventOfficials ADD `eventId` INT NULL,
  ADD `roleTypeId` INT NOT NULL,
  ADD `entityType` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE EventOfficials ADD CONSTRAINT `EventOfficials_FK03` FOREIGN KEY `EventOfficials_FK03` (`roleTypeId`)
    REFERENCES `RoleTypes` (`roleTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `EventOfficials_FK04` FOREIGN KEY `EventOfficials_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
##GO##

CREATE TABLE `RoleTypes` (
  `roleTypeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `entityType` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`roleTypeId`),
  CONSTRAINT `RoleTypes_FK00` FOREIGN KEY `RoleTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE EventRaces ADD `raceLightCondition` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `raceDistance` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `xPos` FLOAT(53) NULL,
  ADD `yPos` FLOAT(53) NULL,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE EventRaces ADD CONSTRAINT `EventRaces_FK01` FOREIGN KEY `EventRaces_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Events ADD `eventStatusId` INT NOT NULL,
  ADD `comment` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE Events ADD CONSTRAINT `Events_FK02` FOREIGN KEY `Events_FK02` (`eventStatusId`)
    REFERENCES `EventStatuses` (`eventStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `Events_FK03` FOREIGN KEY `Events_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `EventClassTypes` (
  `eventId` INT NOT NULL,
  `classTypeId` INT NOT NULL,
  PRIMARY KEY (`eventId`,`classTypeId`),
  CONSTRAINT `EventClassTypes_FK00` FOREIGN KEY `EventClassTypes_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `EventAlternativeDates` (
  `eventId` INT NOT NULL,
  `sequence` INT NOT NULL,
  `startDate` DATETIME NULL,
  `finishDate` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`,`sequence`),
  CONSTRAINT `EventAlternativeDates_FK00` FOREIGN KEY `EventAlternativeDates_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##



ALTER TABLE MembersOfOrganisation ADD `roleTypeId` INT NOT NULL,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE MembersOfOrganisation ADD CONSTRAINT `MembersOfOrganisation_FK02` FOREIGN KEY `MembersOfOrganisation_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `MembersOfOrganisation_FK03` FOREIGN KEY `MembersOfOrganisation_FK03` (`roleTypeId`)
    REFERENCES `RoleTypes` (`roleTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE NumberedServices ADD modifiedBy INT NULL
##GO##

ALTER TABLE NumberedServices ADD CONSTRAINT `NumberedServices_FK01` FOREIGN KEY `NumberedServices_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Organisations ADD `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE Organisations ADD CONSTRAINT `Organisations_FK02` FOREIGN KEY `Organisations_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `OrganisationsAllocationGroups` (
  `organisationId` INT NOT NULL,
  `allocationGroupId` INT NOT NULL,
  `eventId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`allocationGroupId`, `organisationId`),
  CONSTRAINT `OrganisationsAllocationGroups_FK00` FOREIGN KEY `OrganisationsAllocationGroups_FK00` (`allocationGroupId`)
    REFERENCES `AllocationGroups` (`allocationGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsAllocationGroups_FK01` FOREIGN KEY `OrganisationsAllocationGroups_FK01` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationAllocationGroups_FK02` FOREIGN KEY `OrganisationsAllocationGroups_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `OrganisationIds` (
  `organisationId` INT NOT NULL,
  `organisationIdsTypeId` INT NOT NULL,
  `externalId` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`,`organisationIdsTypeId`),
  CONSTRAINT `OrganisationIds_FK00` FOREIGN KEY `OrganisationIds_FK00` (`organisationIdsTypeId`)
    REFERENCES `OrganisationIdTypes` (`organisationIdsTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationIds_FK01` FOREIGN KEY `OrganisationIds_FK01` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationIds_FK02` FOREIGN KEY `OrganisationIds_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `OrganisationIdTypes` (
  `organisationIdsTypeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationIdsTypeId`),
  CONSTRAINT `OrganisationIdTypes_FK00` FOREIGN KEY `OrganisationIdTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE `OrganisationTypes` ADD `parentOrganisationTypeId` INT NULL,
  ADD `modifiedBy` INT NULL,
  ADD CONSTRAINT `OrganisationTypes_FK00` FOREIGN KEY `OrganisationTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE OrganisationsAddresses DROP PRIMARY KEY
##GO##

ALTER TABLE OrganisationsAddresses ADD `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `modifiedBy` INT NULL,
   PRIMARY KEY (`organisationId`,`type`)
##GO##

ALTER TABLE OrganisationsAddresses ADD CONSTRAINT `OrganisationsAddresses_FK01` FOREIGN KEY `OrganisationsAddresses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE OrganisationsTelecoms ADD `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
   ADD `modifiedBy` INT NULL,
   PRIMARY KEY (`organisationId`,`type`)
##GO##

ALTER TABLE OrganisationsTelecoms MODIFY mailAddress VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE OrganisationsTelecoms ADD CONSTRAINT `OrganisationsTelecoms_FK01` FOREIGN KEY `OrganisationsTelecoms_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE OrganisersOfEvents ADD `organisationId` INT NOT NULL,
  ADD `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`, `organisationId`)
##GO##

ALTER TABLE OrganisersOfEvents DROP CONSTRAINT OrganisersOfEvents_FK00
##GO##

ALTER TABLE OrganisersOfEvents ADD CONSTRAINT `OrganisersOfEvents_FK00` FOREIGN KEY `OrganisersOfEvents_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `OrganisersOfEvents_FK02` FOREIGN KEY `OrganisersOfEvents_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Persons ADD modifiedBy INT NULL
##GO##

ALTER TABLE Persons DROP CONSTRAINT Persons_FK00
##GO##

ALTER TABLE Persons ADD CONSTRAINT `Persons_FK00` FOREIGN KEY `Persons_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
##GO##

CREATE TABLE `PersonIds` (
  `personId` INT NOT NULL,
  `personIdsTypeId` INT NOT NULL,
  `externalId` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`personIdsTypeId`),
  CONSTRAINT `PersonIds_FK00` FOREIGN KEY `PersonIds_FK00` (`personIdsTypeId`)
    REFERENCES `PersonIdTypes` (`personIdsTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonIds_FK01` FOREIGN KEY `PersonIds_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonIds_FK02` FOREIGN KEY `PersonIds_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `PersonIdTypes` (
  `personIdsTypeId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personIdsTypeId`),
  CONSTRAINT `PersonIdTypes_FK00` FOREIGN KEY `PersonIdTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

ALTER TABLE PersonsAddresses `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`type`)
##GO##

ALTER TABLE PersonsAddresses ADD CONSTRAINT `PersonsAddresses_FK02` FOREIGN KEY `PersonsAddresses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PersonsTelecoms `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  ADD `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`type`)
##GO##

ALTER TABLE PersonsTelecoms ADD CONSTRAINT `PersonsTelecoms_FK02` FOREIGN KEY `PersonsTelecoms_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PressList ADD modifiedBy INT NULL
##GO##

ALTER TABLE PressList ADD CONSTRAINT `PressList_FK01` FOREIGN KEY `PressList_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PressListClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE PressListClasses ADD CONSTRAINT `PressListClasses_FK01` FOREIGN KEY `PressListClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PressListOrganisations ADD modifiedBy INT NULL
##GO##

ALTER TABLE PressListOrganisations ADD CONSTRAINT `PressListOrganisations_FK00` FOREIGN KEY `PressListOrganisations_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PressPersons ADD modifiedBy INT NULL
##GO##

ALTER TABLE PressPersons ADD CONSTRAINT `PressPersons_FK02` FOREIGN KEY `PressPersons_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PunchingEntries ADD modifiedBy INT NULL
##GO##

ALTER TABLE PunchingEntries ADD CONSTRAINT `PunchingEntries_FK01` FOREIGN KEY `PunchingEntries_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PunchingUnits ADD modifiedBy INT NULL
##GO##

ALTER TABLE PunchingUnits ADD CONSTRAINT `PunchingUnits_FK02` FOREIGN KEY `PunchingUnits_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClassCourses ADD modifiedBy INT NULL
##GO##

ALTER TABLE RaceClassCourses ADD CONSTRAINT `RaceClassCourses_FK02` FOREIGN KEY `RaceClassCourses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClasses ADD modifiedBy INT NULL
##GO##

ALTER TABLE RaceClasses ADD CONSTRAINT `RaceClasses_FK03` FOREIGN KEY `RaceClasses_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClassSplitTimeControl ADD modifiedBy INT NULL
##GO##

ALTER TABLE RaceClassSplitTimeControl ADD CONSTRAINT `RaceClassSplitTimeControl_FK02` FOREIGN KEY `RaceClassSplitTimeControl_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RankingLists ADD modifiedBy INT NULL
##GO##

ALTER TABLE RankingLists ADD CONSTRAINT `RankingLists_FK00` FOREIGN KEY `RankingLists_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Rankings ADD modifiedBy INT NULL
##GO##

ALTER TABLE Rankings ADD CONSTRAINT `Rankings_FK02` FOREIGN KEY `Rankings_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RawDataFromElectronicPunc ADD modifiedBy INT NULL
##GO##

ALTER TABLE RawDataFromElectronicPunc ADD CONSTRAINT `RawDataFromElectronicPunc_FK01` FOREIGN KEY `RawDataFromElectronicPunc_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RawPunches ADD modifiedBy INT NULL
##GO##

ALTER TABLE RawPunches ADD CONSTRAINT `RawPunches_FK01` FOREIGN KEY `RawPunches_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `RelayEntriesOrganisations` (
  `relayEntryOrganisationId` INT NOT NULL AUTO_INCREMENT,
  `entryId` INT NOT NULL,
  `organisationId` INT NOT NULL,
  `ordered` INT,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (relayEntryOrganisationId),
  CONSTRAINT `RelayEntriesOrganisations_FK01` FOREIGN KEY `RelayEntriesOrganisations_FK01` (`entryId`)
    REFERENCES `Entries` (`entryId`),
  CONSTRAINT `RelayEntriesOrganisations_FK00` FOREIGN KEY `RelayEntriesOrganisations_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`),
  CONSTRAINT `RelayEntriesOrganisations_FK02` FOREIGN KEY `RelayEntriesOrganisations_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

ALTER TABLE Results ADD modifiedBy INT NULL
##GO##

ALTER TABLE Results ADD CONSTRAINT `Results_FK05` FOREIGN KEY `Results_FK05` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ServiceRequests ADD modifiedBy INT NULL,
  ADD `organisationId` INT NULL
##GO##

ALTER TABLE ServiceRequests ADD CONSTRAINT `ServiceRequests_FK03` FOREIGN KEY `ServiceRequests_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Services ADD modifiedBy INT NULL
##GO##

ALTER TABLE Services ADD CONSTRAINT `Services_FK01` FOREIGN KEY `Services_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE SplitTimeControls ADD modifiedBy INT NULL
##GO##

ALTER TABLE SplitTimeControls ADD CONSTRAINT `SplitTimeControls_FK02` FOREIGN KEY `SplitTimeControls_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE SplitTimes ADD modifiedBy INT NULL
##GO##

ALTER TABLE SplitTimes ADD CONSTRAINT `SplitTimes_FK02` FOREIGN KEY `SplitTimes_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE TeamEntrysCompetitors ADD modifiedBy INT NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD CONSTRAINT `TeamEntrysCompetitors_FK03` FOREIGN KEY `TeamEntrysCompetitors_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Transactions ADD modifiedBy INT NULL,
  ADD `organisationId` INT NULL
##GO##

ALTER TABLE Transactions ADD CONSTRAINT `Transactions_FK02` FOREIGN KEY `Transactions_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE UserRights ADD modifiedBy INT NULL
##GO##

ALTER TABLE UserRights ADD CONSTRAINT `UserRights_FK01` FOREIGN KEY `UserRights_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Users ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE Users ADD CONSTRAINT `Users_FK01` FOREIGN KEY `Users_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Version ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE Version ADD CONSTRAINT `Version_FK00` FOREIGN KEY `Version_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE VIPTypes ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE VIPTypes ADD CONSTRAINT `VIPTypes_FK00` FOREIGN KEY `VIPTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PreDirectEntry ADD `organisationId` INT NULL ,
  ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE PreDirectEntry ADD CONSTRAINT `PreDirectEntry_FK02` FOREIGN KEY `PreDirectEntry_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PreDirectEntry MODIFY homeMailAddress VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE Bonuses ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE Bonuses ADD CONSTRAINT `Bonuses_FK02` FOREIGN KEY `Bonuses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ResultBonuses ADD `modifiedBy` INT NULL
##GO##

ALTER TABLE ResultBonuses ADD CONSTRAINT `ResultBonuses_FK03` FOREIGN KEY `ResultBonuses_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

// Flytta alla klubbar till Organisations tabellen
INSERT INTO Organisations (name,shortName,account,organisationTypeId,superOrganisationId,countryId,modifyDate) 
 SELECT C.name,C.shortName,C.account,3,C.organisation,
// Flytta alla klubbadresser till OrganisationAddress tabellen

// Flytta alla ClubsAllocationGroups till OrganisationAllocationGroups

// Flytta alla klubbtele till OrganisationTele

// Migrera role till roleTypeId

// Flytta �ver alla kopplingar till PressListOrganisations fr�n PressListClubs


// Flytta data fr�n RelayEntriesClubs till RelayEntriesOrganisations
INSERT INTO RelayEntriesOrganisations (entryId,organisationId,ordered,modifyDate)
  SELECT RelayEntriesClubs.fld_order_id
  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;


ALTER TABLE MembersOfOrganisation DROP PRIMARY KEY
##GO##  PRIMARY KEY (`organisationId`, `personId`, `roleTypeId`)

DROP TABLE RelayEntriesClubs
##GO##

// Kopiera v�rden fr�n entryClubId till entryOrganisationId
UPDATE Entries, Organisations SET Entries.entryOrganisationId=Organisations.organisationId WHERE Entries.entryClubId=Organisations.clubId

ALTER TABLE Entries DROP CONSTRAINT Entries_FK00, 
 DROP FOREIGN KEY `Entries_FK00`
##GO##
  
ALTER TABLE Entries DROP COLUMN entryClubId
##GO##
    
// Ta bort constraint till Club

DROP TABLE Clubs
##GO##

DROP TABLE ClubsAddresses
##GO##

DROP TABLE ClubsTelecoms
##GO##

DROP TABLE ClubsAllocationGroups
##GO##

DROP TABLE RelayEntriesClubs
##GO##

SET FOREIGN_KEY_CHECKS = 0
##GO##

UPDATE Version SET versionNumber = 501 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.01' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 502
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE ClassTypes ADD classTypeId INT NOT NULL
##GO##

UPDATE ClassTypes SET classTypeId = (SELECT @rownum:=@rownum+1 FROM (SELECT @rownum:=0) r)
##GO##

ALTER TABLE BaseClasses ADD classTypeId INT NOT NULL
##GO##

ALTER TABLE ClassTypesEntryFees	ADD classTypeId INT NOT NULL
##GO##

ALTER TABLE EventClasses ADD classTypeId INT NOT NULL
##GO##

ALTER TABLE EventClassTypes ADD `classTypeId` INT NOT NULL
##GO##

ALTER TABLE BadgeLimits ADD classTypeId INT NOT NULL
##GO##

UPDATE BaseClasses, ClassTypes SET BaseClasses.classTypeId=ClassTypes.classTypeId WHERE BaseClasses.classType=ClassTypes.shortName
##GO##

UPDATE BadgeLimits, ClassTypes SET BadgeLimits.classTypeId=ClassTypes.classTypeId WHERE BaadgeLimits.classType=ClassTypes.shortName
##GO##

UPDATE EventClassTypes, ClassTypes SET EventClassTypes.classTypeId=ClassTypes.classTypeId WHERE EventClassTypes.classType=ClassTypes.shortName
##GO##

UPDATE EventClasses, ClassTypes SET EventClasses.classTypeId=ClassTypes.classTypeId WHERE EventClasses.classType=ClassTypes.shortName
##GO##

UPDATE ClassTypesEntryFees, ClassTypes SET ClassTypesEntryFees.classTypeId=ClassTypes.classTypeId WHERE ClassTypesEntryFees.classType=ClassTypes.shortName
##GO##

ALTER TABLE BaseClasses DROP FOREIGN KEY BaseClasses_FK00, DROP INDEX BaseClasses_FK00
##GO##

ALTER TABLE EventClasses DROP FOREIGN KEY EventClasses_FK00, DROP INDEX EventClasses_FK00
##GO##

ALTER TABLE EventClassTypes ADD CONSTRAINT `EventClassTypes_FK01` FOREIGN KEY `EventClassTypes_FK01` (`classTypeId`)
    REFERENCES `ClassTypes` (`classTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassTypes DROP PRIMARY KEY, MODIFY classTypeId INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (classTypeId)
##GO##

ALTER TABLE BaseClasses ADD CONSTRAINT BaseClasses_FK00 FOREIGN KEY BaseClasses_FK00 (classTypeId)
    	REFERENCES ClassTypes (classTypeId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE ClassTypesEntryFees DROP PRIMARY KEY,
	ADD PRIMARY KEY (classTypeId, ordered, type)
##GO##

ALTER TABLE EventClasses ADD CONSTRAINT `EventClasses_FK00` FOREIGN KEY `EventClasses_FK00` (`classTypeId`)
    	REFERENCES `ClassTypes` (`classTypeId`)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClassTypes ADD CONSTRAINT EventClassTypes_FK01 FOREIGN KEY EventClassTypes_FK01 (classTypeId)
    	REFERENCES ClassTypes (classTypeId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##
    	
ALTER TABLE EventClassTypes DROP PRIMARY KEY,
	ADD PRIMARY KEY (`eventId`,`classTypeId`)
##GO##

ALTER TABLE BaseClasses DROP classType
##GO##

ALTER TABLE BadgeLimits DROP classType
##GO##

ALTER TABLE EventClassTypes DROP classType
##GO##

ALTER TABLE EventClasses DROP classType
##GO##

ALTER TABLE ClassTypesEntryFees DROP classType
##GO##

ALTER TABLE Users ADD personId INT NULL,
  ADD noOfAttempt INT NOT NULL DEFAULT 0
##GO##

ALTER TABLE Users ADD CONSTRAINT `Users_FK01` FOREIGN KEY `Users_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
##GO##

CREATE TABLE `EventAttributes` (
  `eventAttributeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `parentOrganisationId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventAttributeId`),
  CONSTRAINT `EventAttributes_FK00` FOREIGN KEY `EventAttributes_FK00` (`parentOrganisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventAttributes_FK01` FOREIGN KEY `EventAttributes_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `Seasons` (
  `seasonId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `startDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `finishDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`seasonId`),
  CONSTRAINT `Seasons_FK00` FOREIGN KEY `Seasons_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##


CREATE TABLE `ApplianceBreaks` (
  `applianceBreakId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `applianceDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `seasonId` INT NOT NULL,
  `eventAttributeId` INT NULL,
  `eventClassificationTypeId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`applianceBreakId`),
  CONSTRAINT `ApplianceBreaks_FK00` FOREIGN KEY `ApplianceBreaks_FK00` (`seasonId`)
    REFERENCES `Seasons` (`seasonId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ApplianceBreaks_FK01` FOREIGN KEY `ApplianceBreaks_FK01` (`eventAttributeId`)
    REFERENCES `EventAttributes` (`eventAttributeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ApplianceBreaks_FK02` FOREIGN KEY `ApplianceBreaks_FK02` (`eventClassificationTypeId`)
    REFERENCES `EventClassificationTypes` (`eventClassificationTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ApplianceBreaks_FK03` FOREIGN KEY `ApplianceBreaks_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 502 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 5.02' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 503
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `Disciplines` (
  `disciplinesId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`disciplinesId`),
  CONSTRAINT `Disciplines_FK00` FOREIGN KEY `Disciplines_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

INSERT INTO `Disciplines`(`disciplinesId`, `name`, `modifyDate`)
VALUES (1, "Foot", "2009-10-26 11:39:48"),
(2, "Mountain bike", "2009-10-26 11:39:48"),
(3, "Ski", "2009-10-26 11:39:48"),
(4, "Trail", "2009-10-26 11:39:48");
##GO##

CREATE TABLE `EventsDisciplines` (
  `disciplinesId` INT NOT NULL,
  `eventId` INT NOT NULL,
  PRIMARY KEY (`disciplinesId`,`eventId`),
  CONSTRAINT `EventsDisciplines_FK00` FOREIGN KEY `EventsDisciplines_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsDisciplines_FK01` FOREIGN KEY `EventsDisciplines_FK01` (`disciplinesId`)
    REFERENCES `Disciplines` (`disciplinesId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `EventsEventAttributes` (
  `eventAttributeId` INT NOT NULL,
  `eventId` INT NOT NULL,
  PRIMARY KEY (`eventAttributeId`,`eventId`),
  CONSTRAINT `EventsEventAttributes_FK00` FOREIGN KEY `EventsEventAttributes_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsEventAttributes_FK01` FOREIGN KEY `EventsEventAttributes_FK01` (`eventAttributeId`)
    REFERENCES `EventAttributes` (`eventAttributeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

ALTER TABLE Countries ADD countryId INT NOT NULL,
 ADD alpha2 VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
 ADD alpha3 VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 MODIFY name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
##GO##

ALTER TABLE Organisations ADD countryId INT NOT NULL,
 DROP FOREIGN KEY Organisations_FK00, DROP INDEX Organisations_FK00
##GO##

ALTER TABLE OrganisationsAddresses ADD countryId INT NULL
##GO##

ALTER TABLE Persons ADD nationalityId INT NOT NULL,
 DROP FOREIGN KEY Persons_FK00, DROP INDEX Persons_FK00
##GO##

ALTER TABLE PersonsAddresses ADD countryId INT NOT NULL,
 DROP FOREIGN KEY PersonsAddresses_FK00, DROP INDEX PersonsAddresses_FK00
##GO##

DELETE FROM Countries
##GO##

INSERT INTO Countries (countryId,alpha2,shortName,name,modifyDate)
 VALUES (20,"AD","AND","Andorra","2009-10-27 21:55:12"),
(784,"AE","ARE","F�renade Arabemiraten","2009-10-27 21:55:12"),
(4,"AF","AFG","Afghanistan","2009-10-27 21:55:12"),
(28,"AG","ATG","Antigua och Barbuda","2009-10-27 21:55:12"),
(660,"AI","AIA","Anguilla","2009-10-27 21:55:12"),
(8,"AL","ALB","Albanien","2009-10-27 21:55:12"),
(51,"AM","ARM","Armenien","2009-10-27 21:55:12"),
(530,"AN","ANT","Nederl�ndska Antillerna","2009-10-27 21:55:12"),
(24,"AO","A##GO##","Angola","2009-10-27 21:55:12"),
(10,"AQ","ATA","Antarktis","2009-10-27 21:55:12"),
(32,"AR","ARG","Argentina","2009-10-27 21:55:12"),
(16,"AS","ASM","Amerikanska Samoa","2009-10-27 21:55:12"),
(40,"AT","AUT","�sterrike","2009-10-27 21:55:12"),
(36,"AU","AUS","Australien","2009-10-27 21:55:12"),
(533,"AW","ABW","Aruba","2009-10-27 21:55:12"),
(31,"AZ","AZE","Azerbajdzjan","2009-10-27 21:55:12"),
(70,"BA","BIH","Bosnien och Hercegovina","2009-10-27 21:55:12"),
(52,"BB","BRB","Barbados","2009-10-27 21:55:12"),
(50,"BD","BGD","Bangladesh","2009-10-27 21:55:12"),
(56,"BE","BEL","Belgien","2009-10-27 21:55:12"),
(854,"BF","BFA","Burkina Faso","2009-10-27 21:55:12"),
(100,"BG","BGR","Bulgarien","2009-10-27 21:55:12"),
(48,"BH","BHR","Bahrain","2009-10-27 21:55:12"),
(108,"BI","BDI","Burundi","2009-10-27 21:55:12"),
(204,"BJ","BEN","Benin","2009-10-27 21:55:12"),
(60,"BM","BMU","Bermuda","2009-10-27 21:55:12"),
(96,"BN","BRN","Brunei","2009-10-27 21:55:12"),
(68,"BO","BOL","Bolivia","2009-10-27 21:55:12"),
(76,"BR","BRA","Brasilien","2009-10-27 21:55:12"),
(44,"BS","BHS","Bahamas","2009-10-27 21:55:12"),
(64,"BT","BTN","Bhutan","2009-10-27 21:55:12"),
(74,"BV","BVT","Bouvet�n","2009-10-27 21:55:12"),
(72,"BW","BWA","Botswana","2009-10-27 21:55:12"),
(112,"BY","BLR","Vitryssland","2009-10-27 21:55:12"),
(84,"BZ","BLZ","Belize","2009-10-27 21:55:12"),
(124,"CA","CAN","Kanada","2009-10-27 21:55:12"),
(166,"CC","CCK","Kokos�arna","2009-10-27 21:55:12"),
(140,"CF","CAF","Centralafrikanska republiken","2009-10-27 21:55:12"),
(178,"CG","COG","Kongo-Brazzaville","2009-10-27 21:55:12"),
(756,"CH","CHE","Schweiz","2009-10-27 21:55:12"),
(384,"CI","CIV","Elfenbenskusten","2009-10-27 21:55:12"),
(184,"CK","COK","Cook�arna","2009-10-27 21:55:12"),
(152,"CL","CHL","Chile","2009-10-27 21:55:12"),
(120,"CM","CMR","Kamerun","2009-10-27 21:55:12"),
(156,"CN","CHN","Kina","2009-10-27 21:55:12"),
(170,"CO","COL","Colombia","2009-10-27 21:55:12"),
(188,"CR","CRI","Costa Rica","2009-10-27 21:55:12"),
(192,"CU","CUB","Kuba","2009-10-27 21:55:12"),
(132,"CV","CPV","Kap Verde","2009-10-27 21:55:12"),
(162,"CX","CXR","Jul�n","2009-10-27 21:55:12"),
(196,"CY","CYP","Cypern","2009-10-27 21:55:12"),
(203,"CZ","CZE","Tjeckien","2009-10-27 21:55:12"),
(276,"DE","DEU","Tyskland","2009-10-27 21:55:12"),
(262,"DJ","DJI","Djibouti","2009-10-27 21:55:12"),
(208,"DK","DNK","Danmark","2009-10-27 21:55:12"),
(212,"DM","DMA","Dominica","2009-10-27 21:55:12"),
(214,"DO","DOM","Dominikanska republiken","2009-10-27 21:55:12"),
(12,"DZ","DZA","Algeriet","2009-10-27 21:55:12"),
(218,"EC","ECU","Ecuador","2009-10-27 21:55:12"),
(233,"EE","EST","Estland","2009-10-27 21:55:12"),
(818,"EG","EGY","Egypten","2009-10-27 21:55:12"),
(732,"EH","ESH","V�stsahara","2009-10-27 21:55:12"),
(232,"ER","ERI","Eritrea","2009-10-27 21:55:12"),
(724,"ES","ESP","Spanien","2009-10-27 21:55:12"),
(210,"ET","ETH","Etiopien","2009-10-27 21:55:12"),
(246,"FI","FIN","Finland","2009-10-27 21:55:12"),
(242,"FJ","FJI","Fiji","2009-10-27 21:55:12"),
(238,"FK","FLK","Falklands�arna","2009-10-27 21:55:12"),
(583,"FM","FSM","Mikronesiska federationen","2009-10-27 21:55:12"),
(234,"FO","FRO","F�r�arna","2009-10-27 21:55:12"),
(250,"FR","FRA","Frankrike","2009-10-27 21:55:12"),
(266,"GA","GAB","Gabon","2009-10-27 21:55:12"),
(826,"GB","GBR","Storbritannien","2009-10-27 21:55:12"),
(308,"GD","GRD","Grenada","2009-10-27 21:55:12"),
(268,"GE","GEO","Georgien","2009-10-27 21:55:12"),
(254,"GF","GUF","Franska Guyana","2009-10-27 21:55:12"),
(288,"GH","GHA","Ghana","2009-10-27 21:55:12"),
(292,"GI","GIB","Gibraltar","2009-10-27 21:55:12"),
(304,"GL","GRL","Gr�nland","2009-10-27 21:55:12"),
(270,"GM","GMB","Gambia","2009-10-27 21:55:12"),
(324,"GN","GIN","Guinea","2009-10-27 21:55:12"),
(312,"GP","GLP","Guadeloupe","2009-10-27 21:55:12"),
(226,"GQ","GNQ","Ekvatorialguinea","2009-10-27 21:55:12"),
(300,"GR","GRC","Grekland","2009-10-27 21:55:12"),
(320,"GT","GTM","Guatemala","2009-10-27 21:55:12"),
(316,"GU","GUM","Guam","2009-10-27 21:55:12"),
(624,"GW","GNB","Guinea Bissau","2009-10-27 21:55:12"),
(328,"GY","GUY","Guyana","2009-10-27 21:55:12"),
(344,"HK","HKG","Hongkong","2009-10-27 21:55:12"),
(334,"HM","HMD","Heard- och McDonalds�arna","2009-10-27 21:55:12"),
(340,"HN","HND","Honduras","2009-10-27 21:55:12"),
(191,"HR","HRV","Kroatien","2009-10-27 21:55:12"),
(332,"HT","HTI","Haiti","2009-10-27 21:55:12"),
(348,"HU","HUN","Ungern","2009-10-27 21:55:12"),
(360,"ID","IDN","Indonesien","2009-10-27 21:55:12"),
(372,"IE","IRL","Irland","2009-10-27 21:55:12"),
(376,"IL","ISR","Israel","2009-10-27 21:55:12"),
(356,"IN","IND","Indien","2009-10-27 21:55:12"),
(86,"IO","IOT","Brittiska territoriet i Indiska Oceanen","2009-10-27 21:55:12"),
(368,"IQ","IRQ","Irak","2009-10-27 21:55:12"),
(364,"IR","IRN","Iran","2009-10-27 21:55:12"),
(352,"IS","ISL","Island","2009-10-27 21:55:12"),
(380,"IT","ITA","Italien","2009-10-27 21:55:12"),
(388,"JM","JAM","Jamaica","2009-10-27 21:55:12"),
(400,"JO","JOR","Jordanien","2009-10-27 21:55:12"),
(392,"JP","JPN","Japan","2009-10-27 21:55:12"),
(404,"KE","KEN","Kenya","2009-10-27 21:55:12"),
(417,"KG","KGZ","Kirgizistan","2009-10-27 21:55:12"),
(116,"KH","KHM","Kambodja","2009-10-27 21:55:12"),
(296,"KI","KIR","Kiribati","2009-10-27 21:55:12"),
(174,"KM","COM","Komorerna","2009-10-27 21:55:12"),
(659,"KN","KNA","Saint Kitts och Nevis","2009-10-27 21:55:12"),
(408,"KP","PRK","Nordkorea","2009-10-27 21:55:12"),
(410,"KR","KOR","Sydkorea","2009-10-27 21:55:12"),
(414,"KW","KWT","Kuwait","2009-10-27 21:55:12"),
(136,"KY","KYM","Cayman�arna","2009-10-27 21:55:12"),
(398,"KZ","KAZ","Kazakstan","2009-10-27 21:55:12"),
(418,"LA","LAO","Laos","2009-10-27 21:55:12"),
(422,"LB","LBN","Libanon","2009-10-27 21:55:12"),
(662,"LC","LCA","Saint Lucia","2009-10-27 21:55:12"),
(438,"LI","LIE","Liechtenstein","2009-10-27 21:55:12"),
(144,"LK","LKA","Sri Lanka","2009-10-27 21:55:12"),
(430,"LR","LBR","Liberia","2009-10-27 21:55:12"),
(426,"LS","LSO","Lesotho","2009-10-27 21:55:12"),
(440,"LT","LTU","Litauen","2009-10-27 21:55:12"),
(442,"LU","LUX","Luxemburg","2009-10-27 21:55:12"),
(428,"LV","LVA","Lettland","2009-10-27 21:55:12"),
(434,"LY","LBY","Libyen","2009-10-27 21:55:12"),
(504,"MA","MAR","Marocko","2009-10-27 21:55:12"),
(492,"MC","MCO","Monaco","2009-10-27 21:55:12"),
(498,"MD","MDA","Moldavien","2009-10-27 21:55:12"),
(499,"ME","MNE","Montenegro","2009-10-27 21:55:12"),
(450,"MG","MDG","Madagaskar","2009-10-27 21:55:12"),
(584,"MH","MHL","Marshall�arna","2009-10-27 21:55:12"),
(807,"MK","MKD","Makedonien","2009-10-27 21:55:12"),
(466,"ML","MLI","Mali","2009-10-27 21:55:12"),
(104,"MM","MMR","Burma","2009-10-27 21:55:12"),
(496,"MN","MNG","Mongoliet","2009-10-27 21:55:12"),
(446,"MO","MAC","Macau","2009-10-27 21:55:12"),
(580,"MP","MNP","Nordmarianerna","2009-10-27 21:55:12"),
(474,"MQ","MTQ","Martinique","2009-10-27 21:55:12"),
(478,"MR","MRT","Mauretanien","2009-10-27 21:55:12"),
(500,"MS","MSR","Montserrat","2009-10-27 21:55:12"),
(470,"MT","MLT","Malta","2009-10-27 21:55:12"),
(480,"MU","MUS","Mauritius","2009-10-27 21:55:12"),
(462,"MV","MDV","Maldiverna","2009-10-27 21:55:12"),
(454,"MW","MWI","Malawi","2009-10-27 21:55:12"),
(484,"MX","MEX","Mexiko","2009-10-27 21:55:12"),
(458,"MY","MYS","Malaysia","2009-10-27 21:55:12"),
(508,"MZ","MOZ","Mo�ambique","2009-10-27 21:55:12"),
(516,"NA","NAM","Namibia","2009-10-27 21:55:12"),
(540,"NC","NCL","Nya Kaledonien","2009-10-27 21:55:12"),
(562,"NE","NER","Niger","2009-10-27 21:55:12"),
(574,"NF","NFK","Norfolk�n","2009-10-27 21:55:12"),
(566,"NG","NGA","Nigeria","2009-10-27 21:55:12"),
(558,"NI","NIC","Nicaragua","2009-10-27 21:55:12"),
(528,"NL","NLD","Nederl�nderna","2009-10-27 21:55:12"),
(578,"NO","NOR","Norge","2009-10-27 21:55:12"),
(524,"NP","NPL","Nepal","2009-10-27 21:55:12"),
(520,"NR","NRU","Nauru","2009-10-27 21:55:12"),
(570,"NU","NIU","Niue","2009-10-27 21:55:12"),
(554,"NZ","NZL","Nya Zeeland","2009-10-27 21:55:12"),
(512,"OM","OMN","Oman","2009-10-27 21:55:12"),
(591,"PA","PAN","Panama","2009-10-27 21:55:12"),
(604,"PE","PER","Peru","2009-10-27 21:55:12"),
(258,"PF","PYF","Franska Polynesien","2009-10-27 21:55:12"),
(598,"PG","PNG","Papua Nya Guinea","2009-10-27 21:55:12"),
(608,"PH","PHL","Filippinerna","2009-10-27 21:55:12"),
(586,"PK","PAK","Pakistan","2009-10-27 21:55:12"),
(616,"PL","POL","Polen","2009-10-27 21:55:12"),
(666,"PM","SPM","Saint-Pierre och Miquelon","2009-10-27 21:55:12"),
(612,"PN","PCN","Pitcairn�arna","2009-10-27 21:55:12"),
(630,"PR","PRI","Puerto Rico","2009-10-27 21:55:12"),
(620,"PT","PRT","Portugal","2009-10-27 21:55:12"),
(585,"PW","PLW","Palau","2009-10-27 21:55:12"),
(600,"PY","PRY","Paraguay","2009-10-27 21:55:12"),
(634,"QA","QAT","Qatar","2009-10-27 21:55:12"),
(638,"RE","REU","R�union","2009-10-27 21:55:12"),
(642,"RO","ROM","Rum�nien","2009-10-27 21:55:12"),
(688,"RS","SRB","Serbien","2009-10-27 21:55:12"),
(643,"RU","RUS","Ryssland","2009-10-27 21:55:12"),
(646,"RW","RWA","Rwanda","2009-10-27 21:55:12"),
(682,"SA","SAU","Saudiarabien","2009-10-27 21:55:12"),
(90,"SB","SLB","Salomon�arna","2009-10-27 21:55:12"),
(690,"SC","SYC","Seychellerna","2009-10-27 21:55:12"),
(736,"SD","SDN","Sudan","2009-10-27 21:55:12"),
(752,"SE","SWE","Sverige","2009-10-27 21:55:12"),
(702,"SG","SGP","Singapore","2009-10-27 21:55:12"),
(654,"SH","SHN","Sankta Helena","2009-10-27 21:55:12"),
(705,"SI","SVN","Slovenien","2009-10-27 21:55:12"),
(744,"SJ","SJM","Svalbard och Jan Mayen","2009-10-27 21:55:12"),
(703,"SK","SVK","Slovakien","2009-10-27 21:55:12"),
(694,"SL","SLE","Sierra Leone","2009-10-27 21:55:12"),
(674,"SM","SMR","San Marino","2009-10-27 21:55:12"),
(686,"SN","SEN","Senegal","2009-10-27 21:55:12"),
(706,"SO","SOM","Somalia","2009-10-27 21:55:12"),
(740,"SR","SUR","Surinam","2009-10-27 21:55:12"),
(678,"ST","STP","S�o Tom� och Pr�ncipe","2009-10-27 21:55:12"),
(222,"SV","SLV","El Salvador","2009-10-27 21:55:12"),
(760,"SY","SYR","Syrien","2009-10-27 21:55:12"),
(748,"SZ","SWZ","Swaziland","2009-10-27 21:55:12"),
(796,"TC","TCA","Turks- och Caicos�arna","2009-10-27 21:55:12"),
(148,"TD","TCD","Tchad","2009-10-27 21:55:12"),
(260,"TF","ATF","Franska s�dra territorierna","2009-10-27 21:55:12"),
(768,"TG","T##GO##","Togo","2009-10-27 21:55:12"),
(764,"TH","THA","Thailand","2009-10-27 21:55:12"),
(762,"TJ","TJK","Tadzjikistan","2009-10-27 21:55:12"),
(772,"TK","TKL","Tokelau�arna","2009-10-27 21:55:12"),
(795,"TM","TKM","Turkmenistan","2009-10-27 21:55:12"),
(788,"TN","TUN","Tunisien","2009-10-27 21:55:12"),
(776,"TO","TON","Tonga","2009-10-27 21:55:12"),
(626,"TP","TMP","�sttimor","2009-10-27 21:55:12"),
(792,"TR","TUR","Turkiet","2009-10-27 21:55:12"),
(780,"TT","TTO","Trinidad och Tobago","2009-10-27 21:55:12"),
(798,"TV","TUV","Tuvalu","2009-10-27 21:55:12"),
(158,"TW","TWN","Taiwan","2009-10-27 21:55:12"),
(834,"TZ","TZA","Tanzania","2009-10-27 21:55:12"),
(804,"UA","UKR","Ukraina","2009-10-27 21:55:12"),
(800,"UG","UGA","Uganda","2009-10-27 21:55:12"),
(581,"UM","UMI","USA:s yttre �ar","2009-10-27 21:55:12"),
(840,"US","USA","USA","2009-10-27 21:55:12"),
(858,"UY","URY","Uruguay","2009-10-27 21:55:12"),
(860,"UZ","UZB","Uzbekistan","2009-10-27 21:55:12"),
(336,"VA","VAT","Vatikanstaten","2009-10-27 21:55:12"),
(670,"VC","VCT","Saint Vincent och Grenadinerna","2009-10-27 21:55:12"),
(862,"VE","VEN","Venezuela","2009-10-27 21:55:12"),
(92,"VG","VGB","Brittiska Jungfru�arna","2009-10-27 21:55:12"),
(850,"VI","VIR","Amerikanska Jungfru�arna","2009-10-27 21:55:12"),
(704,"VN","VNM","Vietnam","2009-10-27 21:55:12"),
(548,"VU","VUT","Vanuatu","2009-10-27 21:55:12"),
(876,"WF","WLF","Wallis- och Futuna�arna","2009-10-27 21:55:12"),
(882,"WS","WSM","Samoa","2009-10-27 21:55:12"),
(887,"YE","YEM","Jemen","2009-10-27 21:55:12"),
(175,"YT","MYT","Mayotte","2009-10-27 21:55:12"),
(710,"ZA","ZAF","Sydafrika","2009-10-27 21:55:12"),
(894,"ZM","ZMB","Zambia","2009-10-27 21:55:12"),
(716,"ZW","ZWE","Zimbabwe","2009-10-27 21:55:12");
##GO##

UPDATE Organisations, Countries SET Organisations.countryId=Countries.countryId WHERE Organisations.country=Countries.shortName
##GO##

UPDATE OrganisationsAddresses, Countries SET OrganisationsAddresses.countryId=Countries.countryId WHERE OrganisationsAddresses.country=Countries.shortName
##GO##

UPDATE Persons, Countries SET Persons.nationalityId=Countries.countryId WHERE Persons.nationality=Countries.shortName
##GO##

UPDATE PersonsAddresses, Countries SET PersonsAddresses.countryId=Countries.countryId WHERE PersonsAddresses.country=Countries.shortName
##GO##

UPDATE Countries SET alpha3=shortName
##GO##

ALTER TABLE Countries DROP PRIMARY KEY, 
 MODIFY alpha3 VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
 ADD PRIMARY KEY (countryId),
 DROP shortName
##GO##

ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK00 FOREIGN KEY Organisations_FK00 (countryId)
    	REFERENCES Countries (countryId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE OrganisationsAddresses ADD CONSTRAINT OrganisationsAddresses_FK02 FOREIGN KEY OrganisationsAddresses_FK02 (countryId)
    	REFERENCES Countries (countryId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE Persons ADD CONSTRAINT Persons_FK00 FOREIGN KEY Persons_FK00 (nationalityId)
    	REFERENCES Countries (countryId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE PersonsAddresses ADD CONSTRAINT PersonsAddresses_FK00 FOREIGN KEY PersonsAddresses_FK00 (countryId)
    	REFERENCES Countries (countryId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE Organisations DROP country
##GO##

ALTER TABLE OrganisationsAddresses DROP country
##GO##

ALTER TABLE Persons DROP nationality
##GO##

ALTER TABLE PersonsAddresses DROP country
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 503 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 5.03' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 504
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE BaseClasses ADD minAverageAge SMALLINT NULL,
 ADD maxAverageAge SMALLINT NULL,
 ADD owningOrganisationId INT NOT NULL DEFAULT 1, 
 DROP fee, ADD CONSTRAINT BaseClasses_FK02 FOREIGN KEY BaseClasses_FK02 (owningOrganisationId)
    	REFERENCES Organisations (organisationId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClasses DROP fee,
 CHANGE classId externalId INT NULL,
 ADD baseClassId INT NULL,
 ADD CONSTRAINT `EventClasses_FK03` FOREIGN KEY `EventClasses_FK03` (`baseClassId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `BaseClassGroups` (
  `baseClassGroupId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `owningOrganisationId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`baseClassGroupId`),
  CONSTRAINT `BaseClassGroups_FK00` FOREIGN KEY `BaseClassGroups_FK00` (`owningOrganisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassGroups_FK01` FOREIGN KEY `BaseClassGroups_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `BaseClassBaseClassGroups` (
  `baseClassId` INT NOT NULL,
  `baseClassGroupId` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`baseClassId`, `baseClassGroupId`),
  CONSTRAINT `BaseClassBaseClassGroups_FK00` FOREIGN KEY `BaseClassBaseClassGroups_FK00` (`baseClassId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassBaseClassGroups_FK01` FOREIGN KEY `BaseClassBaseClassGroups_FK01` (`baseClassGroupId`)
    REFERENCES `BaseClassGroups` (`baseClassGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassBaseClassGroups_FK02` FOREIGN KEY `BaseClassBaseClassGroups_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
)
ENGINE = INNODB;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 504 WHERE moduleId=1
##GO##
UPDATE Version SET Comment = 'OLA Databas 5.04' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 505
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE BaseClasses ADD sequence INT NULL
##GO##

ALTER TABLE EventClasses ADD sequence INT NULL
##GO##

ALTER TABLE EntryFees ADD seasonId INT NULL,
  ADD CONSTRAINT `EntryFees_FK01` FOREIGN KEY `EntryFees_FK01` (`seasonId`)
    REFERENCES `Seasons` (`seasonId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 505 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.05' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 506
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Persons ADD `dead` TINYINT NOT NULL DEFAULT 0,
 ADD `ssn` VARCHAR(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE PersonIds ADD INDEX PersonIds_id (personIdsTypeId,externalId)
##GO##

ALTER TABLE OrganisationIds ADD INDEX OrganisationIds_id (organisationIdsTypeId,externalId)
##GO##

CREATE TABLE `Competitors` (
  `competitorId` INT NOT NULL,
  `organisationId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitorId`,`organisationId`),
  CONSTRAINT `Competitors_FK00` FOREIGN KEY `Competitors_FK00` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Competitors_FK01` FOREIGN KEY `Competitors_FK01` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Competitors_FK02` FOREIGN KEY `Competitors_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

DELETE FROM CompetitorsDefaultClasses
##GO##

ALTER TABLE CompetitorsDefaultClasses
 ADD organisationId INT NOT NULL,
 ADD modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY (`competitorId`,`organisationId`,`baseClassId`),
 ADD CONSTRAINT `CompetitorsDefaultClasses_FK03` FOREIGN KEY `CompetitorsDefaultClasses_FK03` (`organisationId`)
 REFERENCES `Organisations` (`organisationId`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
##GO##

ALTER TABLE ElectronicPunchingCards
 DROP INDEX `ElectronicPunchingCardsCompetitor`,
 DROP FOREIGN KEY ElectronicPunchingCards_FK00,
 DROP INDEX ElectronicPunchingCards_FK00,
 DROP FOREIGN KEY ElectronicPunchingCards_FK01,
 CHANGE COLUMN competitor competitorId INT DEFAULT NULL,
 CHANGE COLUMN organisation organisationId INT DEFAULT NULL
##GO## 

ALTER TABLE ElectronicPunchingCards
  ADD INDEX `ElectronicPunchingCardsCompetitor` (`competitorId`),
  ADD CONSTRAINT `ElectronicPunchingCards_FK00` FOREIGN KEY `ElectronicPunchingCards_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `ElectronicPunchingCards_FK01` FOREIGN KEY `ElectronicPunchingCards_FK01` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
##GO##

ALTER TABLE Users ADD CONSTRAINT Users_username UNIQUE (name)
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 506 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.06' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 507
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Persons ADD `defaultOrganisationId` INT NULL;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 507 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.07' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 508
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `ResultCompetitors` (
  `resultId` INT NOT NULL,
  `competitorId` INT NULL,
  `familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationId` INT NULL,
  `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`resultId`),
  CONSTRAINT `ResultCompetitors_FK00` FOREIGN KEY `ResultCompetitors_FK00` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultCompetitors_FK01` FOREIGN KEY `ResultCompetitors_FK01` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultCompetitors_FK02` FOREIGN KEY `ResultCompetitors_FK02` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `DocumentInfos` (
  `documentInfoId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `type` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `eventId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`documentInfoId`),
  CONSTRAINT `DocumentInfo_FK00` FOREIGN KEY `DocumentInfo_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DocumentInfo_FK01` FOREIGN KEY `DocumentInfo_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `EventsTelecoms` (
  `eventId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `phoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `faxNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mailAddress` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`,`type`),
  CONSTRAINT `EventsTelecoms_FK00` FOREIGN KEY `EventsTelecoms_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsTelecoms_FK01` FOREIGN KEY `EventsTelecoms_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

CREATE TABLE `EventsAddresses` (
  `eventId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `streetAddress` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `countryId` INT NULL,
  `webURL` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`,`type`),
  CONSTRAINT `EventsAddresses_FK00` FOREIGN KEY `EventsAddresses_FK00` (`eventId`)
    REFERENCES `Events` (`eventid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsAddresses_FK01` FOREIGN KEY `EventsAddresses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsAddresses_FK02` FOREIGN KEY `EventsAddresses_FK02` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

UPDATE RaceClasses SET raceClassStatus='notUsed' WHERE raceClassStatus='raceClassNotUsed'
##GO##

UPDATE RaceClasses SET raceClassStatus='finished' WHERE raceClassStatus='normal'
##GO##

UPDATE RaceClasses SET startMethod='allocatTime' WHERE startMethod='allocatedStart'
##GO##

UPDATE RaceClasses SET startMethod='limitedPunching' WHERE startMethod='limitedPunchingStart'
##GO##

UPDATE RaceClasses SET startMethod='punching' WHERE startMethod='punchingStart'
##GO##

UPDATE EventClasses SET sex='B' WHERE sex='O'
##GO##

UPDATE BaseClasses SET sex='B' WHERE sex='O'
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 508 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.08' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 509
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

UPDATE RaceClasses SET startMethod='allocatTime' WHERE startMethod='allocatedStart'
##GO##

UPDATE RaceClasses SET startMethod='limitedPunching' WHERE startMethod='limitedPunchingStart'
##GO##

UPDATE RaceClasses SET startMethod='punching' WHERE startMethod='punchingStart'
##GO##

ALTER TABLE Events ADD classTypeComment VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 509 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.09' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 510
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Competitors DROP PRIMARY KEY,
 MODIFY COLUMN `organisationId` INT NULL,
 ADD PRIMARY KEY(`competitorId`)
##GO##

ALTER TABLE CompetitorsDefaultClasses DROP PRIMARY KEY,
 MODIFY COLUMN `organisationId` INT NULL,
 ADD PRIMARY KEY(`competitorId`,`baseClassId`)
##GO##

ALTER TABLE ClassTypes MODIFY classTypeId INT NOT NULL AUTO_INCREMENT
##GO##

CREATE TABLE `PersonsProperties` (
  `personId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`name`),
  CONSTRAINT `PersonsProperties_FK00` FOREIGN KEY `PersonsProperties_FK00` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsProperties_FK01` FOREIGN KEY `PersonsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `OrganisationsProperties` (
  `organisationId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`,`name`),
  CONSTRAINT `OrganisationsProperties_FK00` FOREIGN KEY `OrganisationsProperties_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsProperties_FK01` FOREIGN KEY `OrganisationsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `EventsProperties` (
  `eventId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`,`name`),
  CONSTRAINT `EventsProperties_FK00` FOREIGN KEY `EventsProperties_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsProperties_FK01` FOREIGN KEY `EventsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

ALTER TABLE BaseClassEntryFees DROP PRIMARY KEY,
 MODIFY COLUMN `type` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 ADD PRIMARY KEY (`baseClassId`, `ordered`)
##GO##

ALTER TABLE EventClassEntryFees DROP PRIMARY KEY,
 MODIFY COLUMN `type` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 ADD PRIMARY KEY (`eventClassId`, `ordered`)
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 510 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.10' WHERE moduleId=1
##GO##
END
 
IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 511
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `Notifications` (
  `notificationId` INT NOT NULL AUTO_INCREMENT,
  `fromPersonId` INT NULL,
  `toPersonId` INT NULL,
  `toOrganisationId` INT NULL,
  `toOrganisationTypeId` INT NULL,
  `toRoleTypeId` INT NULL,
  `messageType` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `messageData` VARCHAR(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`notificationId`),
  CONSTRAINT `Notifications_FK00` FOREIGN KEY `Notifications_FK00` (`fromPersonId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notifications_FK01` FOREIGN KEY `Notifications_FK01` (`toPersonId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notifications_FK02` FOREIGN KEY `Notifications_FK02` (`toOrganisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notifications_FK03` FOREIGN KEY `Notifications_FK03` (`toOrganisationTypeId`)
    REFERENCES `OrganisationTypes` (`organisationTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notifications_FK04` FOREIGN KEY `Notifications_FK04` (`toRoleTypeId`)
    REFERENCES `RoleTypes` (`roleTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notifications_FK05` FOREIGN KEY `Notifications_FK05` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 511 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.11' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 512
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE EventClasses ADD allowEntryInAdvance TINYINT NOT NULL DEFAULT 0
##GO##

ALTER TABLE Users ADD userType VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL, 
DROP INDEX Users_username, 
ADD CONSTRAINT Users_username UNIQUE (name,userType)
##GO##


SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 512 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.12' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 513
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Services ADD allowWebOrder TINYINT NOT NULL DEFAULT 0
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 513 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.13' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 514
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE RaceClasses ADD raceClassName VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE ResultCompetitors ADD dateOfBirth DATETIME NULL
##GO##

DROP TABLE TeamEntrysCompetitors
##GO##

CREATE TABLE `TeamEntrysCompetitors` (
  `teamEntryId` INT NOT NULL,
  `competitorId` INT NOT NULL,
  `organisationId` INT NULL,
  `relayLeg` SMALLINT NULL,
  `relayPersonOrder` SMALLINT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`teamEntryId`, `competitorId`),
  CONSTRAINT `TeamEntrysCompetitors_FK00` FOREIGN KEY `TeamEntrysCompetitors_FK00` (`teamEntryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitors_FK02` FOREIGN KEY `TeamEntrysCompetitors_FK02` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitors_FK03` FOREIGN KEY `TeamEntrysCompetitors_FK03` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitors_FK04` FOREIGN KEY `TeamEntrysCompetitors_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 514 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.14' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 515
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `CountriesNames` (
  `id` INT NOT NULL,
  `languageId` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `languageId`),
  CONSTRAINT `CountriesNames_FK00` FOREIGN KEY `CountriesNames_FK00` (`id`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 515 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.15' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 516
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `ServicesNames` (
  `id` INT NOT NULL,
  `languageId` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `languageId`),
  CONSTRAINT `ServicesNames_FK00` FOREIGN KEY `ServicesNames_FK00` (`id`)
    REFERENCES `Services` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;
##GO##

ALTER TABLE `TeamEntrysCompetitors` ADD `sportIdentCCardNumber` INT NULL,
  ADD `emitCCardNumber` INT NULL
##GO##
  
SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 516 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.16' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 517
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Services MODIFY COLUMN maxNumber INT NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 517 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.17' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 518
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE TeamEntrysCompetitors DROP PRIMARY KEY, ADD COLUMN teamEntryCompetitorId INT NOT NULL AUTO_INCREMENT, MODIFY COLUMN competitorId INT NULL, ADD PRIMARY KEY (teamEntryCompetitorId)
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 518 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.18' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 519
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE RaceClasses ADD raceClassLength VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE ResultCompetitors
 DROP FOREIGN KEY ResultCompetitors_FK00
##GO##

ALTER TABLE ResultCompetitors ADD CONSTRAINT ResultCompetitors_FK00 FOREIGN KEY ResultCompetitors_FK00 (resultId)
    REFERENCES Results (resultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 519 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.19' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 520
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE PunchingEntries
 DROP FOREIGN KEY PunchingEntries_FK00;

ALTER TABLE PunchingEntries ADD CONSTRAINT PunchingEntries_FK00 FOREIGN KEY PunchingEntries_FK00 (result)
    REFERENCES Results (resultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
##GO##

ALTER TABLE EventClasses ADD noOfStarts INT NULL
##GO##
    
SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 520 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.20' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 521
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE ResultCompetitors ADD `countryId` INT NULL, 
 ADD CONSTRAINT `ResultCompetitors_FK03` FOREIGN KEY `ResultCompetitors_FK03` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 521 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.21' WHERE moduleId=1
##GO##

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 522
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE BaseClasses MODIFY minAverageAge DECIMAL(5,2) NULL,
 MODIFY maxAverageAge DECIMAL(5,2) NULL
##GO##

ALTER TABLE EventClasses MODIFY minAverageAge DECIMAL(5,2) NULL,
 MODIFY maxAverageAge DECIMAL(5,2) NULL
##GO##
 
SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 522 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.22' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 523
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Entries MODIFY allocationControl VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 ADD allocationOrganisationId INT NULL, ADD allocationPersonId INT NULL
##GO##

ALTER TABLE PressPersons DROP FOREIGN KEY PressPersons_FK01, DROP INDEX PressPersons_FK01
##GO##

ALTER TABLE PressPersons ADD CONSTRAINT `PressPersons_FK01` FOREIGN KEY `PressPersons_FK01` (`pressId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE `ServiceTypes` (
  `serviceTypeId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`serviceTypeId`)
)
ENGINE = INNODB;
##GO##

ALTER TABLE Services ADD serviceTypeId INT NULL,
  ADD fromDate DATETIME NULL,
  ADD toDate DATETIME NULL,
  ADD fromDateOfBirth DATETIME NULL,
  ADD toDateOfBirth DATETIME NULL,
  ADD CONSTRAINT `Services_FK02` FOREIGN KEY `Services_FK02` (`serviceTypeId`)
    REFERENCES `ServiceTypes` (`serviceTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BadgeLimits CHANGE badgeGroup badgeGroupId INT NULL,
 ADD CONSTRAINT BadgeLimits_FK02 FOREIGN KEY BadgeLimits_FK02 (badgeGroupId)
    REFERENCES BadgeGroups (badgeGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Transactions ADD currency VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
 MODIFY accountId INT NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 523 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.23' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 524
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Events MODIFY name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 524 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.24' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 525
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Services MODIFY name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL, 
MODIFY comment VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE ServicesNames ADD shortName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL, 
ADD comment VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 525 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.25' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 526
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE ServiceRequests ADD orderedById INT NULL, 
ADD orderedDate DATETIME NULL
##GO##

CREATE TABLE `ServiceTypesNames` (
  `id` INT NOT NULL,
  `languageId` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `languageId`),
  CONSTRAINT `ServiceTypesNames_FK00` FOREIGN KEY `ServiceTypesNames_FK00` (`id`)
    REFERENCES `ServiceTypes` (`serviceTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `ServiceFees` (
  `serviceFeeId` INT NOT NULL AUTO_INCREMENT,
  `serviceId` INT NOT NULL,
  `price` FLOAT(53) NOT NULL,
  `fromDate` DATETIME NULL,
  `toDate` DATETIME NULL,
  `fromDateOfBirth` DATETIME NULL,
  `toDateOfBirth` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`serviceFeeId`),
  CONSTRAINT `ServiceFees_FK00` FOREIGN KEY `ServiceFees_FK00` (`serviceId`)
    REFERENCES `Services` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ServiceFees_FK01` FOREIGN KEY `ServiceFees_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

ALTER TABLE `ServiceTypes` ADD `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  ADD `modifiedBy` INT NULL
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 526 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.26' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 527
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE EntryFees ADD teamFee TINYINT NULL 
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 527 WHERE moduleId=1
##GO##

ALTER TABLE ServiceRequests ADD `data` TEXT(65535) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.27' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 528
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

CREATE TABLE `BaseClassesProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `BaseClassesProperties_FK00` FOREIGN KEY `BaseClassesProperties_FK00` (`id`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassesProperties_FK01` FOREIGN KEY `BaseClassesProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `EventClassesProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `EventClassesProperties_FK00` FOREIGN KEY `EventClassesProperties_FK00` (`id`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClassesProperties_FK01` FOREIGN KEY `EventClassesProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

CREATE TABLE `RaceClassesProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `RaceClassesProperties_FK00` FOREIGN KEY `RaceClassesProperties_FK00` (`id`)
    REFERENCES `RaceClasses` (`raceClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassesProperties_FK01` FOREIGN KEY `RaceClassesProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;
##GO##

ALTER TABLE EventsProperties DROP FOREIGN KEY `EventsProperties_FK00`
##GO##

ALTER TABLE EventsProperties CHANGE COLUMN `eventId` `id` INT NOT NULL,
  ADD CONSTRAINT `EventsProperties_FK00` FOREIGN KEY (`id`) 
  REFERENCES `Events` (`eventId` ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION, 
  DROP PRIMARY KEY, 
  ADD PRIMARY KEY (`id`, `name`);
##GO##

ALTER TABLE OrganisationsProperties DROP FOREIGN KEY `OrganisationsProperties_FK00`
##GO##

ALTER TABLE OrganisationsProperties CHANGE COLUMN `organisationId` `id` INT NOT NULL,
  ADD CONSTRAINT `OrganisationsProperties_FK00` FOREIGN KEY (`id`) 
  REFERENCES `Organisations` (`organisationId` ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION, 
  DROP PRIMARY KEY, 
  ADD PRIMARY KEY (`id`, `name`);
##GO##

ALTER TABLE PersonsProperties DROP FOREIGN KEY `PersonsProperties_FK00`
##GO##

ALTER TABLE PersonsProperties CHANGE COLUMN `personId` `id` INT NOT NULL,
  ADD CONSTRAINT `PersonsProperties_FK00` FOREIGN KEY (`id`) 
  REFERENCES `Persons` (`personId` ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION, 
  DROP PRIMARY KEY, 
  ADD PRIMARY KEY (`id`, `name`);
##GO##

ALTER TABLE PunchingEntries ADD COLUMN `totalTime` INT NULL
##GO##

ALTER TABLE Results ADD COLUMN `timeAfter` INT NULL
##GO##

ALTER TABLE RaceClasses ADD COLUMN `noOfEntries` INT NULL, 
  ADD COLUMN `noOfStarts` INT NULL
##GO##

UPDATE PunchingEntries PE, Results R set PE.totalTime=TIME_TO_SEC(TIMEDIFF(PE.punchingTime,R.allocatedStartTime))*100 
WHERE PE.result=R.resultId AND TIMESTAMPDIFF(MINUTE,PE.punchingTime,R.finishTime) >= 0
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 528 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.28' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 529
BEGIN

SET FOREIGN_KEY_CHECKS = 0
##GO##

ALTER TABLE Results ADD COLUMN `overallTotalTime` INT NULL,
  ADD COLUMN `overallTimeAfter` INT NULL,
  ADD COLUMN `overallPosition` SMALLINT NULL,
  ADD COLUMN `overallRunnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EventClasses ADD COLUMN `noOfEntries` INT NULL
##GO##

UPDATE BaseClasses set sex='B' where sex='O'
##GO##

UPDATE EventClasses set sex='B' where sex='O'
##GO##

SET FOREIGN_KEY_CHECKS = 1
##GO##

UPDATE Version SET versionNumber = 529 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.29' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 530
BEGIN

ALTER TABLE BadgeLimits ADD COLUMN lowAge SMALLINT NULL
##GO##

ALTER TABLE BadgeLimits ADD COLUMN highAge SMALLINT NULL
##GO##

ALTER TABLE Entries MODIFY teamLeader VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 530 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.30' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 531
BEGIN

ALTER TABLE Results ADD takenCareOf TINYINT NULL
##GO##

ALTER TABLE Results ADD comment VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 531 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.31' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 532
BEGIN

ALTER TABLE ResultCompetitors ADD cardNumber INT NULL
##GO##

UPDATE Version SET versionNumber = 532 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.32' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 533
BEGIN

ALTER TABLE RaceClassCourses ADD restartCourseId INT NULL
##GO##

ALTER TABLE RaceClassCourses ADD CONSTRAINT RaceClassCourses_FK03 FOREIGN KEY (restartCourseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 533 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.33' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 534
BEGIN

CREATE TABLE CoursesClassShortNames (
  courseId INT NOT NULL,
  classShortName VARCHAR(50) NOT NULL,
  PRIMARY KEY (courseId,classShortName)
)
##GO##

ALTER TABLE CoursesClassShortNames ADD CONSTRAINT CoursesClassShortNames_FK01 FOREIGN KEY CoursesClassShortNames_FK01 (courseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 534 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.34' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 535
BEGIN

ALTER TABLE RawDataFromElectronicPunchingCards ADD takenCareOf TINYINT NULL
##GO##

ALTER TABLE RawDataFromElectronicPunchingCards ADD comment VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE ResultCompetitors ADD sex VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 535 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.35' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 536
BEGIN

ALTER TABLE PunchingEntries MODIFY COLUMN punchingCode INT NOT NULL
##GO##

ALTER TABLE EventsProperties MODIFY COLUMN value TEXT NULL 
##GO##

UPDATE Version SET versionNumber = 536 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.36' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 537
BEGIN

ALTER TABLE EntriesEntryFees ADD COLUMN eventRaceId INT NULL 
##GO##

UPDATE Version SET versionNumber = 537 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.37' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 538
BEGIN

ALTER TABLE RaceClasses ADD startsPerInterval INT NULL 
##GO##

UPDATE Version SET versionNumber = 538 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.38' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 539
BEGIN

ALTER TABLE TeamEntrysCompetitors ADD familyName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD firstName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD orgName VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD orgShortName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 539 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.39' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 540
BEGIN

ALTER TABLE ResultCompetitors ADD nationality VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 540 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.40' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 541
BEGIN

ALTER TABLE OrganisationsTelecoms ADD webURL VARCHAR(255) NULL
##GO##

ALTER TABLE PersonsTelecoms ADD webURL VARCHAR(255) NULL
##GO##

ALTER TABLE EventsTelecoms ADD webURL VARCHAR(255) NULL
##GO##

UPDATE OrganisationsTelecoms OT, OrganisationsAddresses OA SET OT.webURL=OA.webURL WHERE OT.organisationId=OA.organisationId
##GO##

ALTER TABLE OrganisationsAddresses DROP COLUMN webURL
##GO##

ALTER TABLE PersonsAddresses DROP COLUMN webURL
##GO##

ALTER TABLE EventsAddresses DROP COLUMN webURL
##GO##

UPDATE Version SET versionNumber = 541 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.41' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 542
BEGIN

ALTER TABLE EntryFees ADD vatPercentage FLOAT(53) NULL
##GO##

ALTER TABLE NumberedServices ADD vatPercentage FLOAT(53) NULL
##GO##

ALTER TABLE Services ADD vatPercentage FLOAT(53) NULL
##GO##

ALTER TABLE ServiceFees ADD vatPercentage FLOAT(53) NULL
##GO##

ALTER TABLE Transactions ADD vatAmount FLOAT(53) NULL
##GO##

UPDATE Version SET versionNumber = 542 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.42' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 543
BEGIN

ALTER TABLE RaceClasses ADD maxNumberInRaceClass SMALLINT NULL
##GO##

ALTER TABLE EventClasses ADD allowEventRaceEntry TINYINT NULL
##GO##

UPDATE Version SET versionNumber = 543 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.43' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 544
BEGIN

ALTER TABLE Transactions ADD entryId INT NULL
##GO##

UPDATE Version SET versionNumber = 544 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.44' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 545
BEGIN

ALTER TABLE ElectronicPunchingCards 
	ADD entryId INT NULL,
	ADD teamEntryCompetitorId INT NULL,
	ADD CONSTRAINT ElectronicPunchingCards_FK03 FOREIGN KEY (entryId)
    	REFERENCES Entries (entryId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION,
    ADD CONSTRAINT ElectronicPunchingCards_FK04 FOREIGN KEY (teamEntryCompetitorId)
    	REFERENCES TeamEntrysCompetitors (teamEntryCompetitorId)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 545 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.45' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 546
BEGIN

ALTER TABLE ResultCompetitors MODIFY cardNumber VARCHAR(50) NULL
##GO##

CREATE TABLE TeamEntrysCompetitorsEntryFees (
  teamEntryCompetitorId INT NOT NULL,
  entryId INT NOT NULL,
  ordered INT NOT NULL,
  entryFeeId INT NOT NULL,
  eventRaceId INT NULL,
  modifyDate VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  modifiedBy INT NULL,
  PRIMARY KEY (teamEntryCompetitorId, entryId, ordered),
  CONSTRAINT TeamEntrysCompetitorsEntryFees_FK00 FOREIGN KEY TeamEntrysCompetitorsEntryFees_FK00 (teamEntryCompetitorId)
    REFERENCES TeamEntrysCompetitors (teamEntryCompetitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT TeamEntrysCompetitorsEntryFees_FK01 FOREIGN KEY TeamEntrysCompetitorsEntryFees_FK01 (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT TeamEntrysCompetitorsEntryFees_FK02 FOREIGN KEY TeamEntrysCompetitorsEntryFees_FK02 (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT TeamEntrysCompetitorsEntryFees_FK03 FOREIGN KEY TeamEntrysCompetitorsEntryFees_FK03 (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT TeamEntrysCompetitorsEntryFees_FK04 FOREIGN KEY TeamEntrysCompetitorsEntryFees_FK04 (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

UPDATE Version SET versionNumber = 546 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.46' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 547
BEGIN

UPDATE EntryFees SET externalId='' WHERE entryFeeId<5;
##GO##

ALTER TABLE EventsAddresses MODIFY COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE OrganisationsAddresses MODIFY COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE PersonsAddresses MODIFY COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE Organisations MODIFY COLUMN name VARCHAR(100) NULL
##GO##

ALTER TABLE Organisations MODIFY COLUMN shortName VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 547 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.47' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 548
BEGIN

ALTER TABLE EventClasses ADD allowCardReusage TINYINT NULL
##GO##

ALTER TABLE Results ADD forkedCourseId INT NULL
##GO##

UPDATE Results SET forkedCourseId=individualCourseId
##GO##

UPDATE Version SET versionNumber = 548 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.48' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 549
BEGIN

ALTER TABLE Results ADD forkedCourseOrder SMALLINT NULL
##GO##

UPDATE Results SET forkedCourseOrder=relayPersonOrder
##GO##

UPDATE Version SET versionNumber = 549 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.49' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 550
BEGIN

CREATE TABLE `CompetitionUploadEntries` (
  `competitionUploadEntryId` VARCHAR(36) NOT NULL,
  `entryId` INT NULL,
  `eventId` INT NOT NULL,
  `eventClassId` INT NULL,
  `allocationControl` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `allocationEntryId` VARCHAR(100) NULL,
  `teamName` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `teamLeader` VARCHAR(100) NULL,
  `bibNumber` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `createDate` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitionUploadEntryId`),
  INDEX `EntriesEventClassId` (`eventClassId`),
  CONSTRAINT `CompetitionEntries_FK01` FOREIGN KEY `CompetitionEntries_FK01` (`eventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionEntries_FK02` FOREIGN KEY `CompetitionEntries_FK02` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionEntries_FK03` FOREIGN KEY `CompetitionEntries_FK03` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionEntries_FK04` FOREIGN KEY `CompetitionEntries_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `CompetitionUploadResults` (
  `competitionUploadResultId` VARCHAR(36) NOT NULL,
  `competitionUploadEntryId` VARCHAR(36) NOT NULL,  
  `eventRaceId` INT NULL,
  `raceClassId` INT NULL,
  `competitorId` INT NULL,
  `familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `dateOfBirth` DATETIME NULL,
  `nationality` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationId` INT NULL,
  `organisationName` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationShortName` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `countryId` INT NULL,
  `bibNumber` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `legNumber` INT NULL,
  `legOrder` INT NULL,
  `startTime` DATETIME NULL,
  `finishTime` DATETIME NULL,
  `totalTime` INT NULL,
  `timeAfterClass` INT NULL,
  `timeAfterCourse` INT NULL,
  `positionClass` SMALLINT NULL,
  `positionCourse` SMALLINT NULL,
  `runnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `overallTotalTime` INT NULL,
  `overallTimeAfterClass` INT NULL,
  `overallPositionClass` SMALLINT NULL,
  `overallRunnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `cardNumber` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `createDate` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitionUploadResultId`),
  CONSTRAINT `CompetitionUploadResults_FK00` FOREIGN KEY `CompetitionUploadResults_FK00` (`competitionUploadEntryId`)
    REFERENCES `CompetitionUploadEntries` (`competitionUploadEntryId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK01` FOREIGN KEY `CompetitionUploadResults_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK02` FOREIGN KEY `CompetitionUploadResults_FK02` (`raceClassId`)
    REFERENCES `RaceClasses` (`raceClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK03` FOREIGN KEY `CompetitionUploadResults_FK03` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK04` FOREIGN KEY `CompetitionUploadResults_FK04` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK05` FOREIGN KEY `CompetitionUploadResults_FK05` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadResults_FK06` FOREIGN KEY `CompetitionUploadResults_FK06` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `CompetitionUploadPunching` (
  `competitionUploadResultId` VARCHAR(36) NOT NULL,
  `ordered` INT NOT NULL,
  `punchingCode` INT NULL,
  `punchingTime` DATETIME NULL,
  `totalTime` INT NULL,
  `status` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`competitionUploadResultId`,`ordered`),
  CONSTRAINT `CompetitionUploadPunching_FK00` FOREIGN KEY `CompetitionUploadPunching_FK00` (`competitionUploadResultId`)
    REFERENCES `CompetitionUploadResults` (`competitionUploadResultId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `CompetitionUploadEntryFees` (
  `competitionUploadEntryFeeId` VARCHAR(36) NOT NULL,
  `competitionUploadEntryId` VARCHAR(36) NULL,  
  `competitionUploadResultId` VARCHAR(36) NULL,  
  `ordered` INT NOT NULL,
  `entryFeeId` INT NULL,
  `entryFeeName` VARCHAR(100) NULL,
  `amount` FLOAT(53) NULL,
  `externalFee` FLOAT(53) NULL,
  `valueOperator` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `includedInTax` TINYINT NULL,
  `paidAmount` FLOAT(53) NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitionUploadEntryFeeId`),
  CONSTRAINT `CompetitionUploadEntryFees_FK00` FOREIGN KEY `CompetitionUploadEntryFees_FK00` (`competitionUploadEntryId`)
    REFERENCES `CompetitionUploadEntries` (`competitionUploadEntryId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadEntryFees_FK01` FOREIGN KEY `CompetitionUploadEntryFees_FK01` (`competitionUploadResultId`)
    REFERENCES `CompetitionUploadResults` (`competitionUploadResultId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadEntryFees_FK02` FOREIGN KEY `CompetitionUploadEntryFees_FK02` (`entryFeeId`)
    REFERENCES `EntryFees` (`entryFeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadEntryFees_FK03` FOREIGN KEY `CompetitionUploadEntryFees_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

CREATE TABLE `CompetitionUploadEntriesOrganisations` (
  `competitionUploadEntryOrganisationId` VARCHAR(36) NOT NULL,
  `competitionUploadEntryId` VARCHAR(36) NULL,
  `organisationId` INT NULL,
  `organisationName` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationShortName` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitionUploadEntryOrganisationId`),
  CONSTRAINT `CompetitionUploadEntriesOrganisations_FK00` FOREIGN KEY `CompetitionUploadEntriesOrganisations_FK00` (`competitionUploadEntryId`)
    REFERENCES `CompetitionUploadEntries` (`competitionUploadEntryId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitionUploadEntriesOrganisations_FK01` FOREIGN KEY `CompetitionUploadEntriesOrganisations_FK01` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

UPDATE Version SET versionNumber = 550 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.50' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 551
BEGIN

ALTER TABLE Competitors DROP FOREIGN KEY Competitors_FK00
##GO##

ALTER TABLE Competitors DROP FOREIGN KEY Competitors_FK03
##GO##

ALTER TABLE Competitors ADD COLUMN personId INT NOT NULL, 
ADD COLUMN disciplineId INT NULL
##GO##

UPDATE Competitors SET disciplineId=1
##GO##

ALTER TABLE Competitors MODIFY competitorId INT NOT NULL AUTO_INCREMENT
##GO##

INSERT INTO Competitors (organisationId,personId) SELECT organisationId,competitorId FROM CompetitorsDefaultClasses GROUP BY competitorId
##GO##

ALTER TABLE Competitors 
ADD CONSTRAINT `Competitors_FK00` FOREIGN KEY `Competitors_FK00` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitorsDefaultClasses DROP FOREIGN KEY CompetitorsDefaultClasses_FK01
##GO##

ALTER TABLE CompetitorsDefaultClasses DROP FOREIGN KEY CompetitorsDefaultClasses_FK03
##GO##

ALTER TABLE CompetitorsDefaultClasses DROP COLUMN organisationId
##GO##

UPDATE CompetitorsDefaultClasses CDC SET CDC.competitorId= (SELECT C.competitorId FROM Competitors C WHERE C.personId=CDC.competitorId)
##GO##

DELETE CDC.* FROM CompetitorsDefaultClasses CDC WHERE CDC.competitorId NOT IN (select competitorId FROM Competitors)
##GO##

ALTER TABLE CompetitorsDefaultClasses 
ADD CONSTRAINT `CompetitorsDefaultClasses_FK01` FOREIGN KEY `CompetitorsDefaultClasses_FK01` (`competitorId`)
    REFERENCES `Competitors` (`competitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##
    
ALTER TABLE Competitors DROP FOREIGN KEY Competitors_FK03
##GO##

ALTER TABLE Disciplines CHANGE disciplinesId disciplineId INT NOT NULL AUTO_INCREMENT
##GO##

ALTER TABLE Competitors ADD CONSTRAINT `Competitors_FK03` FOREIGN KEY `Competitors_FK03` (`disciplineId`)
    REFERENCES `Disciplines` (`disciplineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ElectronicPunchingCards DROP FOREIGN KEY ElectronicPunchingCards_FK01
##GO##

ALTER TABLE ElectronicPunchingCards CHANGE competitorId personId INT NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD COLUMN competitorId INT NULL
##GO##

ALTER TABLE ElectronicPunchingCards 
ADD CONSTRAINT `ElectronicPunchingCards_FK01` FOREIGN KEY `ElectronicPunchingCards_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `ElectronicPunchingCards_FK05` FOREIGN KEY `ElectronicPunchingCards_FK05` (`competitorId`)
    REFERENCES `Competitors` (`competitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntryFees ADD currency VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EventsDisciplines CHANGE disciplinesId disciplineId INT NOT NULL
##GO##

ALTER TABLE Events ADD parentEventId INT NULL
##GO##

CREATE TABLE `OrganisationStatuses` (
  `organisationStatusId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationStatusId`),
  CONSTRAINT `OrganisationStatuses_FK00` FOREIGN KEY `OrganisationStatuses_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

ALTER TABLE Organisations ADD organisationStatusId INT NULL, 
  ADD `createDate` DATETIME NULL,
  ADD `memberToDate` DATETIME NULL,
  ADD CONSTRAINT `Organisations_FK03` FOREIGN KEY `Organisations_FK03` (`organisationStatusId`)
    REFERENCES `OrganisationStatuses` (`organisationStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Services ADD validRoles VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
    
ALTER TABLE ServiceFees ADD currency VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE Results MODIFY startTime DATETIME(3) NULL
##GO##

ALTER TABLE Results MODIFY finishTime DATETIME(3) NULL
##GO##
  
UPDATE Version SET versionNumber = 551 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.51' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 552
BEGIN

ALTER TABLE OrganisationsAddresses MODIFY COLUMN name VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 552 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.52' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 553
BEGIN

ALTER TABLE EventClassEntryFees 
  ADD COLUMN `eventRaceId` INT NULL DEFAULT NULL AFTER `modifiedBy`,
  ADD COLUMN `isWholeEventFee` TINYINT NOT NULL DEFAULT 0 AFTER `eventRaceId`,
  ADD INDEX `EventClassEntryFees_FK03` (`eventRaceId` ASC)
##GO##

ALTER TABLE EventClassEntryFees 
  ADD CONSTRAINT `EventClassEntryFees_FK03`
    FOREIGN KEY (`eventRaceId`)
    REFERENCES EventRaces (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntriesEntryFees 
  ADD COLUMN `isWholeEventFee` TINYINT NOT NULL DEFAULT 0 AFTER `eventRaceId`
##GO##

ALTER TABLE Entries ADD COLUMN `data` TEXT(65535) CHARACTER SET utf8mb4 NULL
##GO##

CREATE TABLE `PreDirectEntryResults` (
	`preDirectEntryId` INT NOT NULL,
	`eventRaceId` INT NOT NULL ,
  	`runnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`preDirectEntryId`,`eventRaceId`),
  CONSTRAINT `PreDirectEntryResults_FK01` FOREIGN KEY `PreDirectEntryResults_FK01` (`preDirectEntryId`)
    REFERENCES `PreDirectEntry` (`preDirectEntryId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `PreDirectEntryResults_FK02` FOREIGN KEY `PreDirectEntryResults_FK02` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

UPDATE Version SET versionNumber = 553 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.53' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 554
BEGIN

ALTER TABLE Organisations ADD COLUMN `mediaName` VARCHAR(50) CHARACTER SET utf8mb4 NULL AFTER `shortName`
##GO##

UPDATE Version SET versionNumber = 554 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.54' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 555
BEGIN

ALTER TABLE `Entries` 
ADD COLUMN `createdBy` INT NULL AFTER `noTotalResult`,
ADD INDEX `Entries_FK05` (`createdBy` ASC),
ADD CONSTRAINT `Entries_FK05`
  FOREIGN KEY (`createdBy`)
  REFERENCES `Persons` (`personId`)
  ON DELETE SET NULL
  ON UPDATE CASCADE
##GO##

ALTER TABLE `ServiceRequests` 
ADD COLUMN `createdBy` INT NULL AFTER `modifiedBy`,
ADD INDEX `ServiceRequests_FK04` (`createdBy` ASC),
ADD CONSTRAINT `ServiceRequests_FK04`
  FOREIGN KEY (`createdBy`)
  REFERENCES `Persons` (`personId`)
  ON DELETE SET NULL
  ON UPDATE CASCADE
##GO##

UPDATE Version SET versionNumber = 555 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.55' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 556
BEGIN

ALTER TABLE Entries DROP COLUMN `data`
##GO##

ALTER TABLE Entries ADD COLUMN `resultTag` VARCHAR(255) NULL DEFAULT NULL AFTER `modifiedBy`;
##GO##

UPDATE Version SET versionNumber = 556 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.56' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 557
BEGIN

ALTER TABLE Transactions MODIFY accountId INT NULL;
##GO##

UPDATE Version SET versionNumber = 557 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.57' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 558
BEGIN

ALTER TABLE Courses MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE Entries MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EntryFees MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EventClasses MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EventClassificationTypes MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE EventRaces MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE OrganisationIds MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE PersonIds MODIFY externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE Services MODIFY  externalId VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

UPDATE Version SET versionNumber = 558 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.58' WHERE moduleId=1
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 559
BEGIN

ALTER TABLE ServiceRequests ADD COLUMN resultId INT
##GO##

ALTER TABLE ServiceRequests ADD COLUMN payedAmount FLOAT(53) NULL DEFAULT 0
##GO##

ALTER TABLE ServiceRequests DROP FOREIGN KEY `ServiceRequests_FK02`
##GO##

ALTER TABLE ServiceRequests DROP INDEX `ServiceRequests_FK02`
##GO##

ALTER TABLE ServiceRequests DROP COLUMN relayResultId
##GO##

ALTER TABLE ServiceRequests ADD CONSTRAINT `ServiceRequests_FK02` FOREIGN KEY `ServiceRequests_FK02` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntriesEntryFees ADD COLUMN payedAmount FLOAT(53) NULL DEFAULT 0
##GO##

UPDATE Version SET versionNumber = 559 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.59' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 560
BEGIN

UPDATE Version SET versionNumber = 560 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.60' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 561
BEGIN

ALTER TABLE Entries ADD COLUMN bookingNumber VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE Entries ADD COLUMN bibPrinted VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##
	
UPDATE Version SET versionNumber = 561 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.61' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 562
BEGIN

ALTER TABLE Entries ADD COLUMN noTimePresentation TINYINT NOT NULL DEFAULT 0
##GO##

ALTER TABLE BaseClasses ADD COLUMN allowNoTimePresentationEntries TINYINT NOT NULL DEFAULT 0
##GO##

ALTER TABLE EventClasses ADD COLUMN allowNoTimePresentationEntries TINYINT NOT NULL DEFAULT 0
##GO##

UPDATE Version SET versionNumber = 562 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.62' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 563
BEGIN

ALTER TABLE Entries ADD COLUMN allocationGroupId INT NULL
##GO##

UPDATE Version SET versionNumber = 563 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.63' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 564
BEGIN

CREATE TABLE `BibTemplates` (
  `eventId` INT NOT NULL,
  `startName` VARCHAR(50) NOT NULL,
  `chaseStart` TINYINT NULL,
  `templateName` VARCHAR(255) NOT NULL,
  `template` LONGTEXT,
  `modifyDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
)
ENGINE = INNODB
##GO##

ALTER TABLE Results MODIFY createDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE Results MODIFY modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE SplitTimes MODIFY modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE SplitTimes ADD timingControl INT NOT NULL
##GO##

SET SQL_SAFE_UPDATES = 0
##GO##

UPDATE SplitTimes JOIN SplitTimeControls USING (splitTimeControlId) 
SET SplitTimes.timingControl=SplitTimeControls.timingControl
##GO##

ALTER TABLE SplitTimes DROP FOREIGN KEY SplitTimes_FK01
##GO##

ALTER TABLE SplitTimes DROP COLUMN splitTimeControlId, DROP PRIMARY KEY,
ADD PRIMARY KEY (`resultRaceIndividualNumber`, `passedCount`, `timingControl`),
DROP INDEX SplitTimesSplitTimeControlId
##GO##

ALTER TABLE SplitTimes 
ADD INDEX `SplitTimes_FK01_idx` (`timingControl` ASC) VISIBLE
##GO##

ALTER TABLE SplitTimes 
ADD CONSTRAINT `SplitTimes_FK01`
  FOREIGN KEY (`timingControl`)
  REFERENCES Controls (`controlId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClassSplitTimeControls DROP FOREIGN KEY `RaceClassSplitTimeControl_FK01`
##GO##

DROP TABLE SplitTimeControls
##GO##

ALTER TABLE RaceClassSplitTimeControls ADD COLUMN `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL
##GO##

ALTER TABLE RaceClassSplitTimeControls 
ADD CONSTRAINT `RaceClassSplitTimeControl_FK01`
  FOREIGN KEY (`splitTimeControlId`)
  REFERENCES Controls (`controlId`)
##GO##

ALTER TABLE RaceClassSplitTimeControls 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`raceClassId`, `splitTimeControlId`, `ordered`)
##GO##

UPDATE Version SET versionNumber = 564 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.64' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 565
BEGIN

ALTER TABLE RaceClassSplitTimeControls ADD COLUMN `noSplitTimes` TINYINT NULL
##GO##

UPDATE Version SET versionNumber = 565 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.65' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 566
BEGIN

ALTER TABLE RaceClasses ADD COLUMN `mustHaveFinishPunch` TINYINT NULL
##GO##

ALTER TABLE RaceClasses ADD COLUMN `defaultFinishDelaySeconds` INT NULL
##GO##

UPDATE Version SET versionNumber = 566 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.66' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 567
BEGIN

CREATE TABLE `Logotypes` (
  `eventId` INT NOT NULL,
  `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `logotype` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  `verticalPosition` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `horizontalPosition` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `height` INT NOT NULL,
  `space` INT NOT NULL,
  `classStartlist` TINYINT NOT NULL,
  `clubStartlist` TINYINT NOT NULL,
  `classResultlist` TINYINT NOT NULL,
  `clubResultlist` TINYINT NOT NULL,
  `classSplittimes` TINYINT NOT NULL,
  `individualSplittimes` TINYINT NOT NULL,
  `modifyDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  CONSTRAINT `Logotypes_FK00` FOREIGN KEY `Logotypes_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
##GO##

UPDATE Version SET versionNumber = 567 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.67' WHERE moduleId=1
##GO##
END

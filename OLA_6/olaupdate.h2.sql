IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 525
BEGIN

SET REFERENTIAL_INTEGRITY FALSE;
##GO##

ALTER TABLE Services ALTER name VARCHAR(100) NOT NULL;
##GO##

ALTER TABLE Services ALTER comment VARCHAR(500) NULL;
##GO##

ALTER TABLE ServicesNames ADD shortName VARCHAR(50) NULL;
##GO##

ALTER TABLE ServicesNames ADD comment VARCHAR(500) NULL;
##GO##

SET REFERENTIAL_INTEGRITY TRUE;
##GO##

UPDATE Version SET versionNumber = 525 WHERE moduleId=1;
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.25' WHERE moduleId=1;
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 526
BEGIN

ALTER TABLE ServiceRequests ADD orderedById INT(10) NULL;
##GO##

ALTER TABLE ServiceRequests ADD orderedDate DATETIME NULL;
##GO##

CREATE TABLE ServiceTypesNames (
  id INT(10) NOT NULL,
  languageId VARCHAR(5) NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id, languageId)
)
##GO##

ALTER TABLE ServiceTypesNames ADD CONSTRAINT ServiceTypesNames_FK00 FOREIGN KEY (id)
    REFERENCES ServiceTypes (serviceTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE ServiceFees (
  serviceFeeId INT(10) NOT NULL AUTO_INCREMENT,
  serviceId INT(10) NOT NULL,
  price FLOAT(53) NOT NULL,
  fromDate DATETIME NULL,
  toDate DATETIME NULL,
  fromDateOfBirth DATETIME NULL,
  toDateOfBirth DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (serviceFeeId)
)
##GO##

ALTER TABLE ServiceFees ADD CONSTRAINT ServiceFees_FK00 FOREIGN KEY (serviceId)
    REFERENCES Services (serviceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ServiceTypes ADD modifyDate VARCHAR(23) NULL;
##GO##

ALTER TABLE ServiceTypes ADD modifiedBy INT(10) NULL;
##GO##

UPDATE Version SET versionNumber = 526 WHERE moduleId=1;
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.26' WHERE moduleId=1;
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 527
BEGIN

ALTER TABLE EntryFees ADD teamFee TINYINT(1) NULL
##GO##

UPDATE Version SET versionNumber = 527 WHERE moduleId=1;
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.27' WHERE moduleId=1;
##GO##
END


IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 528
BEGIN

SET REFERENTIAL_INTEGRITY FALSE;
##GO##

CREATE TABLE BaseClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
##GO##

ALTER TABLE BaseClassesProperties ADD CONSTRAINT BaseClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE BaseClassesProperties ADD CONSTRAINT BaseClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE EventClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
##GO##

ALTER TABLE EventClassesProperties ADD CONSTRAINT EventClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EventClassesProperties ADD CONSTRAINT EventClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE RaceClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
##GO##

ALTER TABLE RaceClassesProperties ADD CONSTRAINT RaceClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClassesProperties ADD CONSTRAINT RaceClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EventsProperties DROP CONSTRAINT EventsProperties_FK00
##GO##

ALTER TABLE EventsProperties ALTER COLUMN eventId RENAME TO id
##GO##

ALTER TABLE EventsProperties DROP PRIMARY KEY
##GO##

ALTER TABLE EventsProperties ADD PRIMARY KEY (id, name)
##GO##

ALTER TABLE EventsProperties ADD CONSTRAINT EventsProperties_FK00 FOREIGN KEY (id) 
  REFERENCES Events (eventId ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
##GO##

ALTER TABLE OrganisationsProperties DROP CONSTRAINT OrganisationsProperties_FK00
##GO##

ALTER TABLE OrganisationsProperties ALTER COLUMN organisationId RENAME TO id
##GO##
 
ALTER TABLE OrganisationsProperties DROP PRIMARY KEY
##GO##

ALTER TABLE OrganisationsProperties ADD PRIMARY KEY (id, name)
##GO##

ALTER TABLE OrganisationsProperties ADD CONSTRAINT OrganisationsProperties_FK00 FOREIGN KEY (id) 
  REFERENCES Organisations (organisationId ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
##GO##

ALTER TABLE PersonsProperties DROP CONSTRAINT PersonsProperties_FK00
##GO##

ALTER TABLE PersonsProperties ALTER COLUMN personId RENAME TO id
##GO##
 
ALTER TABLE PersonsProperties DROP PRIMARY KEY
##GO##

ALTER TABLE PersonsProperties ADD PRIMARY KEY (id, name)
##GO##

ALTER TABLE PersonsProperties ADD CONSTRAINT PersonsProperties_FK00 FOREIGN KEY (id) 
  REFERENCES Persons (personId ) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
##GO##

ALTER TABLE Results ADD COLUMN timeAfter INT(10) NULL
##GO##

ALTER TABLE RaceClasses ADD COLUMN noOfEntries INT(10) NULL
##GO##

ALTER TABLE RaceClasses ADD COLUMN noOfStarts INT(10) NULL
##GO##

SET REFERENTIAL_INTEGRITY TRUE;
##GO##

UPDATE Version SET versionNumber = 528 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.28' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 529
BEGIN

SET REFERENTIAL_INTEGRITY FALSE;
##GO##

ALTER TABLE Results ADD COLUMN overallTotalTime INT(10) NULL
##GO##

ALTER TABLE Results ADD COLUMN overallTimeAfter INT(10) NULL
##GO##

ALTER TABLE Results ADD COLUMN overallPosition SMALLINT(5) NULL
##GO##

ALTER TABLE Results ADD COLUMN overallRunnerStatus VARCHAR(50) NULL
##GO##

ALTER TABLE EventClasses ADD COLUMN noOfEntries INT(10) NULL
##GO##

UPDATE BaseClasses set sex='B' where sex='O'
##GO##

UPDATE EventClasses set sex='B' where sex='O'
##GO##

SET REFERENTIAL_INTEGRITY FALSE;
##GO##

UPDATE Version SET versionNumber = 529 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.29' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 530
BEGIN

ALTER TABLE BadgeLimits ADD COLUMN lowAge SMALLINT(5) NULL
##GO##

ALTER TABLE BadgeLimits ADD COLUMN highAge SMALLINT(5) NULL
##GO##

ALTER TABLE Entries ALTER COLUMN teamLeader VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 530 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.30' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 531
BEGIN

ALTER TABLE Results ADD takenCareOf TINYINT(1) NULL
##GO##

ALTER TABLE Results ADD comment VARCHAR(255) NULL
##GO##

UPDATE Version SET versionNumber = 531 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.31' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 532
BEGIN

ALTER TABLE ResultCompetitors ADD cardNumber INT(10) NULL
##GO##

UPDATE Version SET versionNumber = 532 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.32' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 533
BEGIN

ALTER TABLE RaceClassCourses ADD restartCourseId INT(10) NULL
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
  courseId INT(10) NOT NULL,
  classShortName VARCHAR(50) NOT NULL,
  PRIMARY KEY (courseId,classShortName)
)
##GO##

ALTER TABLE CoursesClassShortNames ADD CONSTRAINT CoursesClassShortNames_FK00 FOREIGN KEY (courseId)
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

ALTER TABLE RawDataFromElectronicPunchingCards ADD takenCareOf TINYINT(1) NULL
##GO##

ALTER TABLE RawDataFromElectronicPunchingCards ADD comment VARCHAR(255) NULL
##GO##

ALTER TABLE ResultCompetitors ADD sex VARCHAR(1) NULL
##GO##

UPDATE Version SET versionNumber = 535 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.35' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 536
BEGIN

ALTER TABLE PunchingEntries ALTER COLUMN punchingCode INT(10) NOT NULL
##GO##

ALTER TABLE EventsProperties ALTER COLUMN value TEXT NULL 
##GO##

UPDATE Version SET versionNumber = 536 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.36' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 537
BEGIN

ALTER TABLE EntriesEntryFees ADD eventRaceId INT(10) NULL 
##GO##

UPDATE Version SET versionNumber = 537 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.37' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 538
BEGIN

ALTER TABLE RaceClasses ADD startsPerInterval INT(10) NULL 
##GO##

UPDATE Version SET versionNumber = 538 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.38' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 539
BEGIN

ALTER TABLE TeamEntrysCompetitors ADD familyName VARCHAR(50) NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD firstName VARCHAR(50) NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD orgName VARCHAR(255) NULL
##GO##

ALTER TABLE TeamEntrysCompetitors ADD orgShortName VARCHAR(50) NULL
##GO##

UPDATE Version SET versionNumber = 539 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.39' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 540
BEGIN

ALTER TABLE ResultCompetitors ADD nationality VARCHAR(5) NULL
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

UPDATE OrganisationsTelecoms OT SET OT.webURL=(SELECT OA.webURL FROM OrganisationsAddresses OA WHERE OA.organisationId=OT.organisationId)
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

ALTER TABLE RaceClasses ADD maxNumberInRaceClass SMALLINT(5) NULL
##GO##

ALTER TABLE EventClasses ADD allowEventRaceEntry TINYINT(1) NULL
##GO##

UPDATE Version SET versionNumber = 543 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.43' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 544
BEGIN

ALTER TABLE Transactions ADD entryId INT(10) NULL
##GO##

UPDATE Version SET versionNumber = 544 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.44' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 545
BEGIN

ALTER TABLE ElectronicPunchingCards ADD entryId INT(10) NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD teamEntryCompetitorId INT(10) NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK03 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK04 FOREIGN KEY (teamEntryCompetitorId)
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

ALTER TABLE ResultCompetitors ALTER COLUMN cardNumber VARCHAR(50) NULL
##GO##

CREATE TABLE TeamEntrysCompetitorsEntryFees (
  teamEntryCompetitorId INT(10) NOT NULL,
  entryId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  entryFeeId INT(10) NOT NULL,
  eventRaceId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (teamEntryCompetitorId, entryId, ordered)
)
##GO##

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK00 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK01 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK03 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK04 FOREIGN KEY (teamEntryCompetitorId)
    REFERENCES TeamEntrysCompetitors (teamEntryCompetitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
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

ALTER TABLE EventsAddresses ALTER COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE OrganisationsAddresses ALTER COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE PersonsAddresses ALTER COLUMN streetAddress VARCHAR(100) NULL
##GO##

ALTER TABLE Organisations ALTER COLUMN name VARCHAR(100) NULL
##GO##

ALTER TABLE Organisations ALTER COLUMN shortName VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 547 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.47' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 548
BEGIN

ALTER TABLE EventClasses ADD allowCardReusage TINYINT(1) NULL
##GO##

ALTER TABLE Results ADD forkedCourseId INT(10) NULL
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

ALTER TABLE Results ADD forkedCourseOrder SMALLINT(5) NULL
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

CREATE TABLE CompetitionUploadEntries (
  competitionUploadEntryId VARCHAR(36) NOT NULL,
  entryId INT(10) NULL,
  eventId INT(10) NOT NULL,
  eventClassId INT(10) NULL,
  allocationControl VARCHAR(20) NULL,
  allocationEntryId VARCHAR(100) NULL,
  teamName VARCHAR(100) NULL,
  teamLeader VARCHAR(100) NULL,
  bibNumber VARCHAR(10) NULL,
  type VARCHAR(20) NULL,
  createDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadEntryId)
)
##GO##

ALTER TABLE CompetitionUploadEntries ADD CONSTRAINT CompetitionEntries_FK01 FOREIGN KEY (eventClassId)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntries ADD CONSTRAINT CompetitionEntries_FK02 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntries ADD CONSTRAINT CompetitionEntries_FK03 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntries ADD CONSTRAINT CompetitionEntries_FK04 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE CompetitionUploadResults (
  competitionUploadResultId VARCHAR(36) NOT NULL,
  competitionUploadEntryId VARCHAR(36) NOT NULL,  
  eventRaceId INT(10) NULL,
  raceClassId INT(10) NULL,
  competitorId INT(10) NULL,
  familyName VARCHAR(50) NULL,
  firstName VARCHAR(50)  NULL,
  sex VARCHAR(1) NULL,
  dateOfBirth DATETIME NULL,
  nationality VARCHAR(5) NULL,
  organisationId INT(10) NULL,
  organisationName VARCHAR(255) NULL,
  organisationShortName VARCHAR(100) NULL,
  countryId INT(10) NULL,
  bibNumber VARCHAR(10) NULL,
  legNumber INT(10) NULL,
  legOrder INT(10) NULL,
  startTime DATETIME NULL,
  finishTime DATETIME NULL,
  totalTime INT(10) NULL,
  timeAfterClass INT(10) NULL,
  timeAfterCourse INT(10) NULL,
  positionClass SMALLINT(5) NULL,
  positionCourse SMALLINT(5) NULL,
  runnerStatus VARCHAR(50) NOT NULL,
  overallTotalTime INT(10) NULL,
  overallTimeAfterClass INT(10) NULL,
  overallPositionClass SMALLINT(5) NULL,
  overallRunnerStatus VARCHAR(50) NULL,
  cardNumber VARCHAR(255) NULL,
  comment VARCHAR(255) NULL,
  createDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadResultId)
)
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK01 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK02 FOREIGN KEY (raceClassId)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK03 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK04 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK05 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK06 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE CompetitionUploadPunching (
  competitionUploadResultId VARCHAR(36) NOT NULL,
  ordered INT(10) NOT NULL,
  punchingCode INT(10) NULL,
  punchingTime DATETIME NULL,
  totalTime INT(10) NULL,
  status VARCHAR(50) NULL,
  PRIMARY KEY (competitionUploadResultId,ordered)
)
##GO##

ALTER TABLE CompetitionUploadPunching ADD CONSTRAINT CompetitionUploadPunching_FK00 FOREIGN KEY (competitionUploadResultId)
    REFERENCES CompetitionUploadResults (competitionUploadResultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
##GO##

CREATE TABLE CompetitionUploadEntryFees (
  competitionUploadEntryFeeId VARCHAR(36) NOT NULL,
  competitionUploadEntryId VARCHAR(36) NULL,  
  competitionUploadResultId VARCHAR(36) NULL,  
  ordered INT(10) NOT NULL,
  entryFeeId INT(10) NULL,
  entryFeeName VARCHAR(100) NULL,
  amount FLOAT(53) NULL,
  externalFee FLOAT(53) NULL,
  valueOperator VARCHAR(25) NULL,
  includedInTax TINYINT(1) NULL,
  paidAmount FLOAT(53) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadEntryFeeId)
)
##GO##

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK01 FOREIGN KEY (competitionUploadResultId)
    REFERENCES CompetitionUploadResults (competitionUploadResultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK02 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (modifiedBy)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

CREATE TABLE CompetitionUploadEntriesOrganisations (
  competitionUploadEntryOrganisationId VARCHAR(36) NOT NULL,
  competitionUploadEntryId VARCHAR(36) NULL,
  organisationId INT(10) NULL,
  organisationName VARCHAR(255) NULL,
  organisationShortName VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadEntryOrganisationId)
)
##GO##

ALTER TABLE CompetitionUploadEntriesOrganisations ADD CONSTRAINT CompetitionUploadEntriesOrganisations_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
##GO##

ALTER TABLE CompetitionUploadEntriesOrganisations ADD CONSTRAINT CompetitionUploadEntriesOrganisations_FK01 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
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

ALTER TABLE Competitors ADD COLUMN personId INT(10) NOT NULL
##GO##

ALTER TABLE Competitors ADD COLUMN disciplineId INT(10) NULL
##GO##

UPDATE Competitors SET disciplineId=1
##GO##

ALTER TABLE Competitors MODIFY competitorId INT(10) NOT NULL AUTO_INCREMENT
##GO##

INSERT INTO Competitors (organisationId,personId) SELECT organisationId,competitorId FROM CompetitorsDefaultClasses GROUP BY competitorId
##GO##

ALTER TABLE Competitors 
ADD CONSTRAINT Competitors_FK00 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
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

DELETE FROM CompetitorsDefaultClasses CDC WHERE CDC.competitorId NOT IN (select competitorId FROM Competitors)
##GO##

ALTER TABLE CompetitorsDefaultClasses 
ADD CONSTRAINT CompetitorsDefaultClasses_FK01 FOREIGN KEY (competitorId)
    REFERENCES Competitors (competitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Competitors DROP FOREIGN KEY Competitors_FK03
##GO##

ALTER TABLE Disciplines CHANGE disciplinesId disciplineId INT(10) NOT NULL AUTO_INCREMENT
##GO##

ALTER TABLE Competitors ADD CONSTRAINT Competitors_FK03 FOREIGN KEY (disciplineId)
    REFERENCES Disciplines (disciplineId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ElectronicPunchingCards DROP FOREIGN KEY ElectronicPunchingCards_FK01
##GO##

ALTER TABLE ElectronicPunchingCards CHANGE competitorId personId INT(10) NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD COLUMN competitorId INT(10) NULL
##GO##

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK05 FOREIGN KEY (competitorId)
    REFERENCES Competitors (competitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntryFees ADD currency VARCHAR(5) NULL
##GO##

ALTER TABLE EventsDisciplines CHANGE disciplinesId disciplineId INT(10) NOT NULL
##GO##

ALTER TABLE Events ADD parentEventId INT(10) NULL
##GO##

CREATE TABLE OrganisationStatuses (
  organisationStatusId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationStatusId)
)
##GO##

ALTER TABLE OrganisationStatuses ADD CONSTRAINT OrganisationStatuses_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Organisations ADD organisationStatusId INT(10) NULL
##GO##

ALTER TABLE Organisations ADD createDate DATETIME NULL
##GO##

ALTER TABLE Organisations ADD memberToDate DATETIME NULL
##GO##

ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK03 FOREIGN KEY (organisationStatusId)
    REFERENCES OrganisationStatuses (organisationStatusId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE Services ADD validRoles VARCHAR(50) NULL
##GO##

ALTER TABLE ServiceFees ADD currency VARCHAR(5) NULL
##GO##

UPDATE Version SET versionNumber = 551 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.51' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 552
BEGIN

ALTER TABLE OrganisationsAddresses ALTER COLUMN name VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 552 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.52' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 553
BEGIN
	
	
ALTER TABLE EventClassEntryFees 
  ADD eventRaceId INT(10) NULL DEFAULT NULL
##GO##

ALTER TABLE EventClassEntryFees 
  ADD isWholeEventFee TINYINT NOT NULL DEFAULT 0
##GO##

ALTER TABLE EventClassEntryFees 
  ADD CONSTRAINT EventClassEntryFees_FK03
    FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE EntriesEntryFees 
  ADD isWholeEventFee TINYINT NOT NULL DEFAULT 0 AFTER eventRaceId
##GO##

ALTER TABLE Entries ADD data VARCHAR(65535) NULL
##GO##


CREATE TABLE PreDirectEntryResults (
	preDirectEntryId INT(10) NOT NULL,
	eventRaceId int(10) NOT NULL ,
  	runnerStatus VARCHAR(50) NOT NULL,
  PRIMARY KEY (preDirectEntryId,eventRaceId)
)
##GO##
	
ALTER TABLE PreDirectEntryResults ADD CONSTRAINT PreDirectEntryResults_FK01 FOREIGN KEY (preDirectEntryId)
    REFERENCES PreDirectEntry (preDirectEntryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

ALTER TABLE PreDirectEntryResults ADD CONSTRAINT PreDirectEntryResults_FK02 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 553 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.53' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 554
BEGIN

ALTER TABLE Organisations ADD mediaName VARCHAR(50) NULL
##GO##

UPDATE Version SET versionNumber = 554 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.54' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 555
BEGIN

ALTER TABLE Entries 
ADD COLUMN createdBy INT(10) NULL AFTER noTotalResult
##GO##

ALTER TABLE Entries 
ADD CONSTRAINT Entries_FK05
  FOREIGN KEY (createdBy)
  REFERENCES Persons (personId)
  ON DELETE SET NULL
  ON UPDATE CASCADE
##GO##

ALTER TABLE ServiceRequests 
ADD COLUMN createdBy INT(10) NULL AFTER modifiedBy
##GO##

ALTER TABLE ServiceRequests 
ADD CONSTRAINT ServiceRequests_FK04
  FOREIGN KEY (createdBy)
  REFERENCES Persons (personId)
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

UPDATE Version SET versionNumber = 556 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.56' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 557
BEGIN

ALTER TABLE Transactions MODIFY accountId INT(10) NULL;
##GO##

UPDATE Version SET versionNumber = 557 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.57' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 558
BEGIN

ALTER TABLE Courses MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE Entries MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE EntryFees MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE EventClasses MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE EventClassificationTypes MODIFY externalId NULL
##GO##

ALTER TABLE EventRaces MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE OrganisationIds MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE PersonIds MODIFY externalId VARCHAR(100) NULL
##GO##

ALTER TABLE Services MODIFY externalId VARCHAR(100) NULL
##GO##

UPDATE Version SET versionNumber = 558 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.58' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 559
BEGIN

ALTER TABLE ServiceRequests ADD COLUMN resultId INT(10)
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

ALTER TABLE ServiceRequests MODIFY payedAmount FLOAT(53) NULL DEFAULT 0
##GO##
	
UPDATE Version SET versionNumber = 560 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.60' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 561
BEGIN

ALTER TABLE Entries ADD COLUMN bookingNumber VARCHAR(255) NULL
##GO##

ALTER TABLE Entries ADD COLUMN bibPrinted VARCHAR(23) NULL
##GO##
	
UPDATE Version SET versionNumber = 561 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.61' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 562
BEGIN

ALTER TABLE Entries ADD COLUMN noTimePresentation TINYINT(1) NOT NULL DEFAULT 0
##GO##

ALTER TABLE BaseClasses ADD COLUMN allowNoTimePresentationEntries TINYINT(1) NOT NULL DEFAULT 0
##GO##

ALTER TABLE EventClasses ADD COLUMN allowNoTimePresentationEntries TINYINT(1) NOT NULL DEFAULT 0
##GO##

UPDATE Version SET versionNumber = 562 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.62' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 563
BEGIN

ALTER TABLE Entries ADD COLUMN allocationGroupId INT(10) NULL
##GO##

UPDATE Version SET versionNumber = 563 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.63' WHERE moduleId=1
##GO##
END
  
IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 564
BEGIN

CREATE TABLE BibTemplates (
  eventId INT(10) NOT NULL,
  startName VARCHAR(50) NOT NULL,
  chaseStart TINYINT(1) NULL,
  templateName VARCHAR(255) NOT NULL,
  template LONGTEXT,
  modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
)
##GO##

ALTER TABLE Results ALTER COLUMN createDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE Results ALTER COLUMN modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE SplitTimes ALTER COLUMN modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
##GO##

ALTER TABLE SplitTimes ADD timingControl INT(10) NOT NULL
##GO##

UPDATE SplitTimes AS ST SET ST.timingControl=(select STC.timingControl from SplitTimeControls AS STC WHERE ST.SplitTimeControlId=STC.SplitTimeControlId)
##GO##

ALTER TABLE SplitTimes DROP CONSTRAINT IF EXISTS SplitTimes_FK01
##GO##

ALTER TABLE SplitTimes DROP PRIMARY KEY
##GO##

ALTER TABLE SplitTimes DROP COLUMN splitTimeControlId
##GO##

ALTER TABLE SplitTimes ADD PRIMARY KEY (`resultRaceIndividualNumber`, `passedCount`, `timingControl`)
##GO##

ALTER TABLE SplitTimes 
ADD CONSTRAINT `SplitTimes_FK01`
  FOREIGN KEY (`timingControl`)
  REFERENCES Controls (`controlId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
##GO##

ALTER TABLE RaceClassSplitTimeControls DROP CONSTRAINT `RaceClassSplitTimeControl_FK01`
##GO##

DROP TABLE SplitTimeControls
##GO##

ALTER TABLE RaceClassSplitTimeControls ADD COLUMN `name` VARCHAR(50) NULL
##GO##

ALTER TABLE RaceClassSplitTimeControls 
ADD CONSTRAINT `RaceClassSplitTimeControl_FK01`
  FOREIGN KEY (`splitTimeControlId`)
  REFERENCES Controls (`controlId`)
##GO##

ALTER TABLE RaceClassSplitTimeControls DROP PRIMARY KEY;
##GO##

ALTER TABLE RaceClassSplitTimeControls ADD PRIMARY KEY (`raceClassId`, `splitTimeControlId`, `ordered`)
##GO##

UPDATE Version SET versionNumber = 564 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.64' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 565
BEGIN

ALTER TABLE RaceClassSplitTimeControls ADD COLUMN noSplitTimes TINYINT(1) NULL
##GO##

UPDATE Version SET versionNumber = 565 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.65' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 566
BEGIN

ALTER TABLE RaceClasses ADD COLUMN mustHaveFinishPunch TINYINT(1) NULL
##GO##

ALTER TABLE RaceClasses ADD COLUMN defaultFinishDelaySeconds INT(10) NULL
##GO##

UPDATE Version SET versionNumber = 566 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.66' WHERE moduleId=1
##GO##
END

IF (SELECT VersionNumber FROM Version WHERE moduleId = 1) < 567
BEGIN

CREATE TABLE Logotypes (
  eventId INT(10) NOT NULL,
  name VARCHAR(255) NOT NULL,
  logotype LONGTEXT,
  verticalPosition VARCHAR(50) NOT NULL,
  horizontalPosition VARCHAR(50) NOT NULL,
  height INT(10) NOT NULL,
  space INT(10) NOT NULL,
  classStartlist TINYINT(1) NOT NULL,
  clubStartlist TINYINT(1) NOT NULL,
  classResultlist TINYINT(1) NOT NULL,
  clubResultlist TINYINT(1) NOT NULL,
  classSplittimes TINYINT(1) NOT NULL,
  individualSplittimes TINYINT(1) NOT NULL,
  modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
)
##GO##

ALTER TABLE Logotypes ADD CONSTRAINT Logotypes_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
##GO##

UPDATE Version SET versionNumber = 567 WHERE moduleId=1
##GO##

UPDATE Version SET Comment = 'OLA Databas 5.67' WHERE moduleId=1
##GO##
END

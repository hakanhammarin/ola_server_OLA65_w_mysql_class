SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `Accounts` (
  `accountId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `accountNo` INT NULL,
  `directEntryEventRaceId` INT NULL,
  `defaultAmount` FLOAT(53) NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`accountId`),
  CONSTRAINT `Accounts_FK00` FOREIGN KEY `Accounts_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `AllocationGroups` (
  `allocationGroupId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `eventId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`allocationGroupId`),
  CONSTRAINT `AllocationGroups_FK00` FOREIGN KEY `AllocationGroups_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AllocationsGroups_FK01` FOREIGN KEY `AllocationsGroups_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `AllocationGroupsStartTimes` (
  `allocationGroupId` INT NOT NULL,
  `eventRaceId` INT NOT NULL,
  `firstStart` DATETIME NULL,
  `groupLength` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`allocationGroupId`, `eventRaceId`),
  CONSTRAINT `AllocationGroupsStartTimes_FK00` FOREIGN KEY `AllocationGroupsStartTimes_FK00` (`allocationGroupId`)
    REFERENCES `AllocationGroups` (`allocationGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AllocationGroupsStartTimes_FK01` FOREIGN KEY `AllocationGroupsStartTimes_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AllocationGroupsStartTimes_FK02` FOREIGN KEY `AllocationGroupsStartTimes_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `BadgeGroups` (
  `badgeGroupId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`badgeGroupId`),
  CONSTRAINT `BadgeGroups_FK00` FOREIGN KEY `BadgeGroups_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `BadgeLimits` (
  `badgeLimitId` INT NOT NULL AUTO_INCREMENT,
  `badgeGroupId` INT NULL,
  `timeFactor` INT NULL,
  `comment` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `classTypeId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `badgeName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `badgeNameShort` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `lowAge` SMALLINT NULL,
  `highAge` SMALLINT NULL,
  PRIMARY KEY (`badgeLimitId`),
 CONSTRAINT `BadgeLimits_FK00` FOREIGN KEY `BadgeLimits_FK00` (`classTypeId`)
    REFERENCES `ClassTypes` (`classTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 CONSTRAINT `BadgeLimits_FK01` FOREIGN KEY `BadgeLimits_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 CONSTRAINT `BadgeLimits_FK02` FOREIGN KEY `BadgeLimits_FK02` (`badgeGroupId`)
    REFERENCES `BadgeGroups` (`badgeGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `BaseClassEntryFees` (
  `baseClassId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `type` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `entryFeeId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`baseClassId`, `ordered`),
  CONSTRAINT `BaseClassEntryFees_FK00` FOREIGN KEY `BaseClassEntryFees_FK00` (`entryFeeId`)
    REFERENCES `EntryFees` (`entryFeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassEntryFees_FK01` FOREIGN KEY `BaseClassEntryFees_FK01` (`baseClassId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClassEntryFees_FK02` FOREIGN KEY `BaseClassEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `BaseClasses` (
  `classId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `lowAge` SMALLINT NULL,
  `highAge` SMALLINT NULL,
  `minAverageAge` DECIMAL(5,2) NULL,
  `maxAverageAge` DECIMAL(5,2) NULL,
  `sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `numberInTeam` SMALLINT NULL,
  `teamEntry` TINYINT NOT NULL,
  `maxNumberInClass` SMALLINT NULL,
  `actualForRanking` TINYINT NOT NULL,
  `noTimePresentation` TINYINT NOT NULL,
  `owningOrganisationId` INT NOT NULL,
  `substituteClassId` INT NULL,
  `notQualifiedSubstitutionClassId` INT NULL,
  `classTypeId` INT NULL,
  `normalizedClass` TINYINT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `sequence` INT NULL,
  `allowNoTimePresentationEntries` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`classId`),
  CONSTRAINT `BaseClasses_FK00` FOREIGN KEY `BaseClasses_FK00` (`classTypeId`)
    REFERENCES `ClassTypes` (`classTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClasses_FK01` FOREIGN KEY `BaseClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BaseClasses_FK02` FOREIGN KEY `BaseClasses_FK02` (`owningOrganisationId`)
   	REFERENCES `Organisations` (`organisationId`)
   	ON DELETE NO ACTION
   	ON UPDATE NO ACTION
)
ENGINE = INNODB;

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
    ON UPDATE NO ACTION
)ENGINE = INNODB;

CREATE TABLE `BaseClassesEventForms` (
  `eventForm` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `classId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventForm`, `classId`),
  CONSTRAINT `BaseClassesEventForms_FK00` FOREIGN KEY `BaseClassesEventForms_FK00` (`classId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `BibTemplates` (
  `eventId` INT NOT NULL,
  `startName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `chaseStart` TINYINT NULL,
  `templateName` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `template` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  `modifyDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
)
ENGINE = INNODB;

CREATE TABLE `ClassCollection` (
  `classCollectionId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`classCollectionId`),
  CONSTRAINT `ClassCollection_FK00` FOREIGN KEY `ClassCollection_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ClassCollectionClasses` (
  `classCollectionId` INT NOT NULL,
  `baseClassId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`classCollectionId`, `baseClassId`),
  INDEX `ClassCollectionOrdered` (`ordered`),
  CONSTRAINT `ClassCollectionClasses_FK00` FOREIGN KEY `ClassCollectionClasses_FK00` (`classCollectionId`)
    REFERENCES `ClassCollection` (`classCollectionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ClassCollectionClasses_FK01` FOREIGN KEY `ClassCollectionClasses_FK01` (`baseClassId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ClassCollectionClasses_FK02` FOREIGN KEY `ClassCollectionClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ClassTypes` (
  `classTypeId` INT NOT NULL AUTO_INCREMENT,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`classTypeId`),
  CONSTRAINT `ClassTypes_FK00` FOREIGN KEY `ClassTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ClassTypesEntryFees` (
  `classTypeId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `type` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `entryFeeId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`classTypeId`, `ordered`, `type`),
  CONSTRAINT `ClassTypesEntryFees_FK00` FOREIGN KEY `ClassTypesEntryFees_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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
ENGINE = INNODB;

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
ENGINE = INNODB;

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
ENGINE = INNODB;

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
ENGINE = INNODB;

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
ENGINE = INNODB;

CREATE TABLE `Competitors` (
  `competitorId` INT NOT NULL AUTO_INCREMENT,
  `personId` INT NOT NULL,
  `disciplineId` INT NULL,
  `organisationId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitorId`),
  CONSTRAINT `Competitors_FK00` FOREIGN KEY `Competitors_FK00` (`personId`)
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
    ON UPDATE NO ACTION,
  CONSTRAINT `Competitors_FK03` FOREIGN KEY `Competitors_FK03` (`disciplineId`)
    REFERENCES `Disciplines` (`disciplineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `CompetitorsDefaultClasses` (
  `competitorId` INT NOT NULL,
  `baseClassId` INT NOT NULL,
  `ordered` SMALLINT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitorId`, `baseClassId`),
  CONSTRAINT `CompetitorsDefaultClasses_FK00` FOREIGN KEY `CompetitorsDefaultClasses_FK00` (`baseClassId`)
    REFERENCES `BaseClasses` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitorsDefaultClasses_FK01` FOREIGN KEY `CompetitorsDefaultClasses_FK01` (`competitorId`)
    REFERENCES `Competitors` (`competitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CompetitorsDefaultClasses_FK02` FOREIGN KEY `CompetitorsDefaultClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Controls` (
  `controlId` INT NOT NULL AUTO_INCREMENT,
  `ID` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `location` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `pathLength` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `typeCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `controlAreaName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `status` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `eventRaceId` INT NOT NULL,
  `maxFreeTime` INT NOT NULL DEFAULT 0,
  `controlAsFinish` TINYINT NOT NULL,
  `xPos` FLOAT(53) NULL,
  `yPos` FLOAT(53) NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`controlId`),
  INDEX `ControlsID` (`ID`),
  CONSTRAINT `Controls_FK01` FOREIGN KEY `Controls_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Controls_FK02` FOREIGN KEY `Controls_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ControlsPunchingUnits` (
  `control` INT NOT NULL,
  `punchingUnit` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`control`, `punchingUnit`),
  CONSTRAINT `ControlsPunchingUnits_FK00` FOREIGN KEY `ControlsPunchingUnits_FK00` (`control`)
    REFERENCES `Controls` (`controlId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ControlsPunchingUnits_FK01` FOREIGN KEY `ControlsPunchingUnits_FK01` (`punchingUnit`)
    REFERENCES `PunchingUnits` (`punchingUnitId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ControlsPunchingUnits_FK02` FOREIGN KEY `ControlsPunchingUnits_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Countries` (
  `countryId` INT NOT NULL,
  `alpha2` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `alpha3` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`countryId`),
  INDEX `CountriesAlpha3` (`alpha3`),
  CONSTRAINT `Countries_FK00` FOREIGN KEY `Countries_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `Courses` (
  `courseId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `courseLength` INT NULL,
  `startControl` INT NULL,
  `finishControl` INT NULL,
  `eventRaceId` INT NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`courseId`),
  CONSTRAINT `Courses_FK00` FOREIGN KEY `Courses_FK00` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Courses_FK01` FOREIGN KEY `Courses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `CoursesClassShortNames` (
  `courseId` INT NOT NULL,
  `classShortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`courseId`,`classShortName`),
  CONSTRAINT `CoursesClassShortNames_FK01` FOREIGN KEY `CoursesClassShortNames_FK01` (`courseId`)
    REFERENCES `Courses` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `CoursesWayPointControls` (
  `courseId` INT NOT NULL,
  `controlId` INT NOT NULL,
  `ordered` SMALLINT NOT NULL,
  `distanceFrom` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `estimatedBestTime` INT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`courseId`, `controlId`, `ordered`),
  CONSTRAINT `CoursesWayPointControls_FK00` FOREIGN KEY `CoursesWayPointControls_FK00` (`controlId`)
    REFERENCES `Controls` (`controlId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CoursesWayPointControls_FK01` FOREIGN KEY `CoursesWayPointControls_FK01` (`courseId`)
    REFERENCES `Courses` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CourseWayPointControls_FK02` FOREIGN KEY `CourseWayPointControls_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Disciplines` (
  `disciplineId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`disciplineId`),
  CONSTRAINT `Disciplines_FK00` FOREIGN KEY `Disciplines_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `ElectronicPunchingCards` (
  `cardId` INT NOT NULL AUTO_INCREMENT,
  `cardNumber` INT NOT NULL,
  `electronicPunchingCardType` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `competitorId` INT NULL,
  `personId` INT NULL,
  `organisationId` INT NULL,
  `entryId` INT NULL,
  `teamEntryCompetitorId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`cardId`),
  INDEX `ElectronicPunchingCardsCardNumber` (`cardNumber`),
  INDEX `ElectronicPunchingCardsCompetitor` (`competitorId`),
  INDEX `ElectronicPunchingCardsElectronicPunchingCardType` (`electronicPunchingCardType`),
  CONSTRAINT `ElectronicPunchingCards_FK00` FOREIGN KEY `ElectronicPunchingCards_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ElectronicPunchingCards_FK01` FOREIGN KEY `ElectronicPunchingCards_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ElectronicPunchingCards_FK02` FOREIGN KEY `ElectronicPunchingCards_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ElectronicPunchingCards_FK03` FOREIGN KEY `ElectronicPunchingCards_FK03` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ElectronicPunchingCards_FK04` FOREIGN KEY `ElectronicPunchingCards_FK04` (`teamEntryCompetitorId`)
    REFERENCES `TeamEntrysCompetitors` (`teamEntryCompetitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ElectronicPunchingCards_FK05` FOREIGN KEY `ElectronicPunchingCards_FK05` (`competitorId`)
    REFERENCES `Competitors` (`competitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Entries` (
  `entryId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `entryOrganisationId` INT NULL,
  `allocationControl` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `allocationEntryId` INT NULL,
  `allocationOrganisationId` INT NULL,
  `allocationPersonId` INT NULL,
  `seedingGroup` INT NULL,
  `competitorId` INT NULL,
  `sportIdentCCardNumber` INT NULL,
  `emitCCardNumber` INT NULL,
  `acceptedEventClassId` INT NULL,
  `teamName` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `teamLeader` VARCHAR(100) NULL,
  `bibNumber` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `type` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `createDate` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `noTotalResult` TINYINT NOT NULL,
  `modifiedBy` INT NULL,
  `resultTag` VARCHAR(255) CHARACTER SET utf8mb4 NULL,
  `bookingNumber` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `bibPrinted` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `noTimePresentation` TINYINT NOT NULL DEFAULT 0,
  `allocationGroupId` INT NULL,
  PRIMARY KEY (`entryId`),
  INDEX `EntriesAcceptedEventClassId` (`acceptedEventClassId`),
  INDEX `EntriesCompetitorId` (`competitorId`),
  CONSTRAINT `Entries_FK00` FOREIGN KEY `Entries_FK00` (`entryOrganisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Entries_FK01` FOREIGN KEY `Entries_FK01` (`acceptedEventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Entries_FK02` FOREIGN KEY `Entries_FK02` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Entries_FK03` FOREIGN KEY `Entries_FK03` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Entries_FK04` FOREIGN KEY `Entries_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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
ENGINE = INNODB;

CREATE TABLE `EntriesEntryFees` (
  `entryId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `entryFeeId` INT NOT NULL,
  `eventRaceId` INT NULL,
  `isWholeEventFee` TINYINT NOT NULL DEFAULT 0,
  `payedAmount` FLOAT(53) NULL DEFAULT 0,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`entryId`, `ordered`),
  CONSTRAINT `EntriesEntryFees_FK00` FOREIGN KEY `EntriesEntryFees_FK00` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EntriesEntryFees_FK01` FOREIGN KEY `EntriesEntryFees_FK01` (`entryFeeId`)
    REFERENCES `EntryFees` (`entryFeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EntriesEntryFees_FK02` FOREIGN KEY `EntriesEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EntriesEntryFees_FK03` FOREIGN KEY `EntriesEntryFees_FK03` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `TeamEntrysCompetitorsEntryFees` (
  `teamEntryCompetitorId` INT NOT NULL,
  `entryId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `entryFeeId` INT NOT NULL,
  `eventRaceId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`teamEntryCompetitorId`, `entryId`, `ordered`),
  CONSTRAINT `TeamEntrysCompetitorsEntryFees_FK00` FOREIGN KEY `TeamEntrysCompetitorsEntryFees_FK00` (`teamEntryCompetitorId`)
    REFERENCES `TeamEntrysCompetitors` (`teamEntryCompetitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitorsEntryFees_FK01` FOREIGN KEY `TeamEntrysCompetitorsEntryFees_FK01` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitorsEntryFees_FK02` FOREIGN KEY `TeamEntrysCompetitorsEntryFees_FK02` (`entryFeeId`)
    REFERENCES `EntryFees` (`entryFeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitorsEntryFees_FK03` FOREIGN KEY `TeamEntrysCompetitorsEntryFees_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TeamEntrysCompetitorsEntryFees_FK04` FOREIGN KEY `TeamEntrysCompetitorsEntryFees_FK04` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EntryFees` (
  `entryFeeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `amount` FLOAT(53) NOT NULL,
  `externalFee` FLOAT(53) NOT NULL,
  `valueOperator` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `includedInTax` TINYINT NOT NULL,
  `feeType` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `fromDate` DATETIME NULL,
  `toDate` DATETIME NULL,
  `fromDateOfBirth` DATETIME NULL,
  `toDateOfBirth` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `seasonId` INT NULL,
  `teamFee` TINYINT NULL,
  `vatPercentage` FLOAT(53) NULL,
  `currency` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`entryFeeId`),
  CONSTRAINT `EntryFees_FK00` FOREIGN KEY `EntryFees_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EntryFees_FK01` FOREIGN KEY `EntryFees_FK01` (`seasonId`)
    REFERENCES `Seasons` (`seasonId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EntrysClasses` (
  `entryId` INT NOT NULL,
  `ordered` SMALLINT NOT NULL,
  `classId` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`entryId`, `ordered`),
  CONSTRAINT `EntrysClasses_FK00` FOREIGN KEY `EntrysClasses_FK00` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EntrysClasses_FK01` FOREIGN KEY `EntrysClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EventClassEntryFees` (
  `eventClassId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `type` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `entryFeeId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `eventRaceId` INT NULL DEFAULT NULL,
  `isWholeEventFee` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventClassId`, `ordered`),
  CONSTRAINT `EventClassEntryFees_FK00` FOREIGN KEY `EventClassEntryFees_FK00` (`entryFeeId`)
    REFERENCES `EntryFees` (`entryFeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClassEntryFees_FK01` FOREIGN KEY `EventClassEntryFees_FK01` (`eventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClassEntryFees_FK02` FOREIGN KEY `EventClassEntryFees_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClassEntryFees_FK03` FOREIGN KEY `EventClassEntryFees_FK03` (`eventRaceId`)
    REFERENCES EventRaces (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EventClasses` (
  `eventClassId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NOT NULL,
  `classStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `collectedTo` INT NULL,
  `dividedFrom` INT NULL,
  `finalFromClassId` INT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `lowAge` SMALLINT NULL,
  `highAge` SMALLINT NULL,
  `minAverageAge` DECIMAL(5,2) NULL,
  `maxAverageAge` DECIMAL(5,2) NULL,
  `sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `numberInTeam` SMALLINT NULL,
  `teamEntry` TINYINT NOT NULL,
  `numberOfLegs` SMALLINT NULL,
  `numberOfVacancies` SMALLINT NULL,
  `maxNumberInClass` SMALLINT NULL,
  `divideClassMethod` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `actualForRanking` TINYINT NOT NULL,
  `noTimePresentation` TINYINT NOT NULL,
  `substituteClassId` INT NULL,
  `notQualifiedSubstitutionClassId` INT NULL,
  `classTypeId` INT NOT NULL,
  `normalizedClass` TINYINT NOT NULL,
  `badgeGroupId` INT NULL,
  `numberOfPrizesTotal` SMALLINT NULL,
  `noTotalResult` TINYINT NOT NULL,
  `allowEntryInAdvance` TINYINT NOT NULL,
  `allowEventRaceEntry` TINYINT NULL,
  `allowCardReusage` TINYINT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `baseClassId` INT NULL,
  `sequence` INT NULL,
  `noOfStarts` INT NULL,
  `noOfEntries` INT NULL,
  `allowNoTimePresentationEntries` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventClassId`),
  INDEX `EventClassesExternalId` (`externalId`),
  CONSTRAINT `EventClasses_FK00` FOREIGN KEY `EventClasses_FK00` (`classTypeId`)
    REFERENCES `ClassTypes` (`classTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClasses_FK01` FOREIGN KEY `EventClasses_FK01` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClasses_FK02` FOREIGN KEY `EventClasses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClasses_FK03` FOREIGN KEY `EventClasses_FK03` (`badgeGroupId`)
    REFERENCES `BadgeGroups` (`badgeGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `EventClassificationTypes` (
  `eventClassificationTypeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventClassificationTypeId`),
  CONSTRAINT `EventClassificationTypes_FK00` FOREIGN KEY `EventClassificationTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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
ENGINE = INNODB;

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
ENGINE = INNODB;

CREATE TABLE `EventOfficials` (
  `eventOfficialId` INT NOT NULL AUTO_INCREMENT,
  `eventRaceId` INT NULL,
  `eventId` INT NULL,
  `personId` INT NULL,
  `roleTypeId` INT NOT NULL,
  `entityType` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventOfficialId`),
  CONSTRAINT `EventOfficials_FK00` FOREIGN KEY `EventOfficials_FK00` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventOfficials_FK01` FOREIGN KEY `EventOfficials_FK01` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventOfficials_FK02` FOREIGN KEY `EventOfficials_FK02` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventOfficials_FK03` FOREIGN KEY `EventOfficials_FK03` (`roleTypeId`)
    REFERENCES `RoleTypes` (`roleTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventOfficials_FK04` FOREIGN KEY `EventOfficials_FK04` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EventsProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `EventsProperties_FK00` FOREIGN KEY `EventsProperties_FK00` (`id`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsProperties_FK01` FOREIGN KEY `EventsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;

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

CREATE TABLE `EventRaces` (
  `eventRaceId` INT NOT NULL AUTO_INCREMENT,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `eventId` INT NOT NULL,
  `raceDate` DATETIME NULL,
  `raceStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `raceLightCondition` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT "Day",
  `raceDistance` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT "Middle",
  `administrationTime` INT NULL,
  `xPos` FLOAT(53) NULL,
  `yPos` FLOAT(53) NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventRaceId`),
  CONSTRAINT `EventRaces_FK00` FOREIGN KEY `EventRaces_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventRaces_FK01` FOREIGN KEY `EventRaces_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Events` (
  `eventId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `eventNumber` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `district` INT NULL,
  `textURL` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `startDate` DATETIME NULL,
  `finishDate` DATETIME NULL,
  `postalGiroAccount` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `eventForm` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `eventClassificationTypeId` INT NULL,
  `defaultBadgeGroup` INT NULL,
  `punchingManual` TINYINT NOT NULL,
  `punchingSportIdent` TINYINT NOT NULL,
  `punchingEmit` TINYINT NOT NULL,
  `defaultRankingListId` INT NULL,
  `eventStatusId` INT NOT NULL,
  `comment` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `classTypeComment` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `parentEventId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`),
  CONSTRAINT `Events_FK00` FOREIGN KEY `Events_FK00` (`defaultBadgeGroup`)
    REFERENCES `BadgeGroups` (`badgeGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Events_FK01` FOREIGN KEY `Events_FK01` (`eventClassificationTypeId`)
    REFERENCES `EventClassificationTypes` (`eventClassificationTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Events_FK02` FOREIGN KEY `Events_FK02` (`eventStatusId`)
    REFERENCES `EventStatuses` (`eventStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Events_FK03` FOREIGN KEY `Events_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `EventsTelecoms` (
  `eventId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `phoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `faxNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mailAddress` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `webURL` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
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

CREATE TABLE `EventsAddresses` (
  `eventId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `streetAddress` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `countryId` INT NULL,
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

CREATE TABLE `EventClassTypes` (
  `eventId` INT NOT NULL,
  `classTypeId` INT NOT NULL,
  PRIMARY KEY (`eventId`,`classTypeId`),
  CONSTRAINT `EventClassTypes_FK00` FOREIGN KEY `EventClassTypes_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventClassTypes_FK01` FOREIGN KEY `EventClassTypes_FK01` (`classTypeId`)
    REFERENCES `ClassTypes` (`classTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `EventsDisciplines` (
  `disciplineId` INT NOT NULL,
  `eventId` INT NOT NULL,
  PRIMARY KEY (`disciplineId`,`eventId`),
  CONSTRAINT `EventsDisciplines_FK00` FOREIGN KEY `EventsDisciplines_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventsDisciplines_FK01` FOREIGN KEY `EventsDisciplines_FK01` (`disciplineId`)
    REFERENCES `Disciplines` (`disciplineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;

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
ENGINE = INNODB;

CREATE TABLE `MembersOfOrganisation` (
  `organisationId` INT NOT NULL,
  `personId` INT NOT NULL,
  `roleTypeId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`, `personId`, `roleTypeId`),
  CONSTRAINT `MembersOfOrganisation_FK00` FOREIGN KEY `MembersOfOrganisation_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MembersOfOrganisation_FK01` FOREIGN KEY `MembersOfOrganisation_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MembersOfOrganisation_FK02` FOREIGN KEY `MembersOfOrganisation_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MembersOfOrganisation_FK03` FOREIGN KEY `MembersOfOrganisation_FK03` (`roleTypeId`)
    REFERENCES `RoleTypes` (`roleTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `NumberedServices` (
  `numberedServicesId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `prefix` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `rangeFrom` INT NOT NULL,
  `rangeTo` INT NOT NULL,
  `price` FLOAT(53) NULL,
  `vatPercentage` FLOAT(53) NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`numberedServicesId`),
  CONSTRAINT `NumberedServices_FK00` FOREIGN KEY `NumberedServices_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NumberedServices_FK01` FOREIGN KEY `NumberedServices_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Organisations` (
  `organisationId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `account` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationTypeId` INT NOT NULL,
  `superOrganisationId` INT NULL,
  `countryId` INT NOT NULL,
  `organisationStatusId` INT NULL,
  `createDate` DATETIME NULL,
  `memberToDate` DATETIME NULL,
  `mediaName` VARCHAR(50) NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`),
  CONSTRAINT `Organisations_FK00` FOREIGN KEY `Organisations_FK00` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Organisations_FK01` FOREIGN KEY `Organisations_FK01` (`organisationTypeId`)
    REFERENCES `OrganisationTypes` (`organisationTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Organisations_FK02` FOREIGN KEY `Organisations_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Organisations_FK03` FOREIGN KEY `Organisations_FK03` (`organisationStatusId`)
    REFERENCES `OrganisationStatuses` (`organisationStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `OrganisationIds` (
  `organisationId` INT NOT NULL,
  `organisationIdsTypeId` INT NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`,`organisationIdsTypeId`),
  INDEX OrganisationIds_id (organisationIdsTypeId,externalId),
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
ENGINE = INNODB;

CREATE TABLE `OrganisationTypes` (
  `organisationTypeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `parentOrganisationTypeId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationTypeId`),
  CONSTRAINT `OrganisationTypes_FK00` FOREIGN KEY `OrganisationTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `OrganisationsAddresses` (
  `organisationId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `streetAddress` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `countryId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`,`type`),
  CONSTRAINT `OrganisationsAddresses_FK00` FOREIGN KEY `OrganisationsAddresses_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsAddresses_FK01` FOREIGN KEY `OrganisationsAddresses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsAddresses_FK02` FOREIGN KEY `OrganisationsAddresses_FK02` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

)
ENGINE = INNODB;

CREATE TABLE `OrganisationsProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `OrganisationsProperties_FK00` FOREIGN KEY `OrganisationsProperties_FK00` (`id`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsProperties_FK01` FOREIGN KEY `OrganisationsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;

CREATE TABLE `OrganisationsTelecoms` (
  `organisationId` INT NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `phoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `faxNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mailAddress` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `webURL` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`organisationId`,`type`),
  CONSTRAINT `OrganisationsTelecoms_FK00` FOREIGN KEY `OrganisationsTelecoms_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisationsTelecoms_FK01` FOREIGN KEY `OrganisationsTelecoms_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `OrganisersOfEvents` (
  `eventId` INT NOT NULL,
  `organisationId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`eventId`, `organisationId`),
  CONSTRAINT `OrganisersOfEvents_FK00` FOREIGN KEY `OrganisersOfEvents_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisersOfEvents_FK01` FOREIGN KEY `OrganisersOfEvents_FK01` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganisersOfEvents_FK02` FOREIGN KEY `OrganisersOfEvents_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Persons` (
  `personId` INT NOT NULL AUTO_INCREMENT,
  `familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `dateOfBirth` DATETIME NULL,
  `ssn` VARCHAR(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL, 
  `competitor` TINYINT NOT NULL,
  `defaultOrganisationId` INT NULL,
  `personIdInClub` INT NULL,
  `VIPType` INT NULL,
  `nationalityId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `dead` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`personId`),
  INDEX `PersonsFirstName` (`firstName`),
  INDEX `PersonsOrganisationId` (`defaultOrganisationId`),
  CONSTRAINT `Persons_FK00` FOREIGN KEY `Persons_FK00` (`nationalityId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Persons_FK01` FOREIGN KEY `Persons_FK01` (`VIPType`)
    REFERENCES `VIPTypes` (`VIPTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Persons_FK02` FOREIGN KEY `Persons_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PersonsOrganisations` (
  `personOrganisationId` INT NOT NULL AUTO_INCREMENT,
  `personId` INT NULL,
  `organisationId` INT NULL,
  `personRoleId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personOrganisationId`),
  INDEX `OrganisationId` (`organisationId`),
  INDEX `PersonsId` (`personId`),
  CONSTRAINT `PersonsOrganisations_FK00` FOREIGN KEY `PersonsOrganisations_FK00` (`organisationId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsOrganisations_FK01` FOREIGN KEY `PersonsOrganisations_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsOrganisations_FK02` FOREIGN KEY `PersonsOrganisations_FK02` (`personRoleId`)
    REFERENCES `PersonRoles` (`personRoleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsOrganisations_FK03` FOREIGN KEY `PersonsOrganisations_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PersonsProperties` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`id`,`name`),
  CONSTRAINT `PersonsProperties_FK00` FOREIGN KEY `PersonsProperties_FK00` (`id`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsProperties_FK01` FOREIGN KEY `PersonsProperties_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=INNODB;

CREATE TABLE `PersonRoles` (
  `personRoleId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `organisationTypeId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personRoleId`),
  INDEX `OrganisationTypeId` (`organisationTypeId`),
  CONSTRAINT `PersonRoles_FK00` FOREIGN KEY `PersonRoles_FK00` (`organisationTypeId`)
    REFERENCES `OrganisationTypes` (`organisationTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonRoles_FK01` FOREIGN KEY `PersonRoles_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PersonIds` (
  `personId` INT NOT NULL,
  `personIdsTypeId` INT NOT NULL,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`personIdsTypeId`),
  INDEX PersonIds_ids (personIdsTypeId,externalId),
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
ENGINE = INNODB;

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
ENGINE = INNODB;

CREATE TABLE `PersonsAddresses` (
  `personId` INT NOT NULL,
  `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `streetAddress` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `countryId` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`type`),
  CONSTRAINT `PersonsAddresses_FK00` FOREIGN KEY `PersonsAddresses_FK00` (`countryId`)
    REFERENCES `Countries` (`countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsAddresses_FK01` FOREIGN KEY `PersonsAddresses_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsAddresses_FK02` FOREIGN KEY `PersonsAddresses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PersonsTelecoms` (
  `personId` INT NOT NULL,
  `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `phoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `faxNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `mailAddress` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `webURL` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`,`type`),
  CONSTRAINT `PersonsTelecoms_FK00` FOREIGN KEY `PersonsTelecoms_FK00` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonsTelecoms_FK01` FOREIGN KEY `PersonsTelecoms_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PressList` (
  `pressListId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NULL,
  `organisationId` INT NULL,
  `pressId` INT NULL,
  `districtId` INT NULL,
  `topN` INT NOT NULL,
  `uptoPos` INT NULL,
  `showDistrictCode` TINYINT NOT NULL,
  `showEmptyClass` TINYINT NOT NULL,
  `listName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `ordered` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`pressListId`),
  CONSTRAINT `PressList_FK00` FOREIGN KEY `PressList_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PressList_FK01` FOREIGN KEY `PressList_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PressListClasses` (
  `pressListId` INT NOT NULL,
  `eventClassId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`pressListId`, `eventClassId`),
  CONSTRAINT `PressListClasses_FK00` FOREIGN KEY `PressListClasses_FK00` (`pressListId`)
    REFERENCES `PressList` (`pressListId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PressListClasses_FK01` FOREIGN KEY `PressListClasses_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PressListOrganisations` (
  `pressListId` INT NOT NULL,
  `organisationId` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`pressListId`, `organisationId`),
  CONSTRAINT `PressListOrganisations_FK00` FOREIGN KEY `PressListOrganisations_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PressPersons` (
  `personId` INT NOT NULL,
  `pressId` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`personId`, `pressId`),
  CONSTRAINT `PressPersons_FK00` FOREIGN KEY `PressPersons_FK00` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PressPersons_FK01` FOREIGN KEY `PressPersons_FK01` (`pressId`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PressPersons_FK02` FOREIGN KEY `PressPersons_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PunchingEntries` (
  `result` INT NOT NULL,
  `ordered` INT NOT NULL,
  `punchingCode` INT NOT NULL,
  `punchingTime` DATETIME NULL,
  `adjustedTime` INT NOT NULL DEFAULT 0,
  `totalTime` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`result`, `ordered`),
  CONSTRAINT `PunchingEntries_FK00` FOREIGN KEY `PunchingEntries_FK00` (`result`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PunchingEntries_FK01` FOREIGN KEY `PunchingEntries_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PunchingUnits` (
  `punchingUnitId` INT NOT NULL AUTO_INCREMENT,
  `eventRaceId` INT NOT NULL,
  `punchingCode` INT NOT NULL,
  `unitId` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `purpose` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `owner` INT NULL,
  `punchingUnitType` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`punchingUnitId`),
  CONSTRAINT `PunchingUnits_FK00` FOREIGN KEY `PunchingUnits_FK00` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PunchingUnits_FK01` FOREIGN KEY `PunchingUnits_FK01` (`owner`)
    REFERENCES `Organisations` (`organisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PunchingUnits_FK02` FOREIGN KEY `PunchingUnits_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `RaceClassCourses` (
  `raceClassId` INT NOT NULL,
  `courseId` INT NOT NULL,
  `restartCourseId` INT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`raceClassId`, `courseId`),
  CONSTRAINT `RaceClassCourses_FK00` FOREIGN KEY `RaceClassCourses_FK00` (`courseId`)
    REFERENCES `Courses` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassCourses_FK01` FOREIGN KEY `RaceClassCourses_FK01` (`raceClassId`)
    REFERENCES `RaceClasses` (`raceClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassCourses_FK02` FOREIGN KEY `RaceClassCourses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassCourses_FK03` FOREIGN KEY `RaceClassCourses_FK03` (`restartCourseId`)
    REFERENCES `Courses` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `RaceClasses` (
  `raceClassId` INT NOT NULL AUTO_INCREMENT,
  `raceClassName` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `raceClassLength` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `eventClassId` INT NOT NULL,
  `eventRaceId` INT NULL,
  `firstStartTime` DATETIME NULL,
  `startInterval` SMALLINT NULL,
  `startUnit` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `administrationLineCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `noRankingRace` TINYINT NOT NULL,
  `estimatedBestTime` INT NULL,
  `estimatedLastPrizeTime` INT NULL,
  `numberOfPrizes` SMALLINT NULL,
  `prizeCeremonyTime` DATETIME NULL,
  `prizeGivingDone` TINYINT NULL,
  `startNumberPrefix` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `startNumberBase` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `startNumberInherit` TINYINT NULL,
  `finishChute` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `badgeGroupId` INT NULL,
  `raceClassStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `allocationMethod` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `viewWhichOrganisation` VARCHAR(20) NOT NULL DEFAULT 'club',
  `maxAfterForChaseStart` INT NULL,
  `startMethod` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `earlyStartLimit` INT NULL,
  `lateStartLimit` INT NULL,
  `punchingUnitType` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `timeResolution` INT NOT NULL,
  `relayLeg` SMALLINT NULL,
  `minRunners` SMALLINT NULL,
  `maxRunners` SMALLINT NULL,
  `restartStopTime` DATETIME NULL,
  `restartTime` DATETIME NULL,
  `restartedTeamsAfter` TINYINT NULL,
  `noOfEntries` INT NULL,
  `noOfStarts` INT NULL,
  `startsPerInterval` INT NULL,
  `maxNumberInRaceClass` SMALLINT NULL,
  `mustHaveFinishPunch` TINYINT NULL,
  `defaultFinishDelaySeconds` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`raceClassId`),
  INDEX `RaceClassesEventClassId` (`eventClassId`),
  INDEX `RaceClassesEventRaceId` (`eventRaceId`),
  INDEX `RaceClassesFirstStartTime` (`firstStartTime`),
  CONSTRAINT `RaceClasses_FK00` FOREIGN KEY `RaceClasses_FK00` (`badgeGroupId`)
    REFERENCES `BadgeGroups` (`badgeGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClasses_FK01` FOREIGN KEY `RaceClasses_FK01` (`eventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClasses_FK02` FOREIGN KEY `RaceClasses_FK02` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClasses_FK03` FOREIGN KEY `RaceClasses_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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

CREATE TABLE `RaceClassSplitTimeControls` (
  `raceClassId` INT NOT NULL,
  `splitTimeControlId` INT NOT NULL,
  `ordered` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `estimatedBestTime` INT NULL,
  `modifiedBy` INT NULL,
  `noSplitTimes` TINYINT NULL,
  PRIMARY KEY (`raceClassId`, `splitTimeControlId`, `ordered`),
  CONSTRAINT `RaceClassSplitTimeControl_FK00` FOREIGN KEY `RaceClassSplitTimeControl_FK00` (`raceClassId`)
    REFERENCES `RaceClasses` (`raceClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassSplitTimeControl_FK01` FOREIGN KEY `RaceClassSplitTimeControl_FK01` (`splitTimeControlId`)
    REFERENCES `Controls` (`controlId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RaceClassSplitTimeControl_FK02` FOREIGN KEY `RaceClassSplitTimeControl_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `RankingLists` (
  `rankingListId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `validFrom` DATETIME NOT NULL,
  `validTo` DATETIME NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`rankingListId`),
  CONSTRAINT `RankingLists_FK00` FOREIGN KEY `RankingLists_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Rankings` (
  `competitorId` INT NOT NULL,
  `rankId` INT NOT NULL,
  `score` FLOAT(24) NULL,
  `rankingListId` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`competitorId`, `rankingListId`),
  CONSTRAINT `Rankings_FK00` FOREIGN KEY `Rankings_FK00` (`rankingListId`)
    REFERENCES `RankingLists` (`rankingListId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rankings_FK01` FOREIGN KEY `Rankings_FK01` (`competitorId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rankings_FK02` FOREIGN KEY `Rankings_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `RawDataFromElectronicPunchingCards` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `punchingCardType` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `countryCode` INT NULL,
  `clubCode` INT NULL,
  `cardNumber` INT NULL,
  `cardSeries` INT NULL,
  `startNumber` INT NULL,
  `startTime` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `checkTime` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `finishTime` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `punchingCounter` INT NULL,
  `softwareVersion` SMALLINT NULL,
  `mtrNumber` INT NULL,
  `readInNumber` INT NULL,
  `readInTime` DATETIME NULL,
  `hasResult` TINYINT NOT NULL,
  `eventRace` INT NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `takenCareOf` TINYINT NULL,
  `comment` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `RawDataFromElectronicPunc_FK00` FOREIGN KEY `RawDataFromElectronicPunc_FK00` (`eventRace`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RawDataFromElectronicPunc_FK01` FOREIGN KEY `RawDataFromElectronicPunc_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `RawPunches` (
  `rawCardId` INT NOT NULL,
  `controlNumber` INT NOT NULL,
  `punchingCode` INT NULL,
  `punchingTime` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`rawCardId`, `controlNumber`),
  CONSTRAINT `RawPunches_FK00` FOREIGN KEY `RawPunches_FK00` (`rawCardId`)
    REFERENCES `RawDataFromElectronicPunchingCards` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RawPunches_FK01` FOREIGN KEY `RawPunches_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Results` (
  `resultId` INT NOT NULL AUTO_INCREMENT,
  `bibNumber` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `raceStartNumber` INT NULL,
  `allocatedStartTime` DATETIME NULL,
  `startTime` DATETIME(3) NULL,
  `finishTime` DATETIME(3) NULL,
  `totalTime` INT NULL,
  `timeAfter` INT NULL,
  `position` SMALLINT NULL,
  `runnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `overallTotalTime` INT NULL,
  `overallTimeAfter` INT NULL,
  `overallPosition` SMALLINT NULL,
  `overallRunnerStatus` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `entryId` INT NULL,
  `electronicPunchingCardId` INT NULL,
  `individualCourseId` INT NULL,
  `forkedCourseId` INT NULL,
  `forkedCourseOrder` SMALLINT,
  `raceClassId` INT NULL,
  `rawDataFromElectronicPunchingCardsId` INT NULL,
  `relayPersonId` INT,
  `relayPersonOrder` SMALLINT,
  `createDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3),
  `modifyDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `modifiedBy` INT NULL,
  `takenCareOf` TINYINT NULL,
  `comment` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`resultId`),
  INDEX `ResultsAllocatedStartTime` (`allocatedStartTime`),
  INDEX `ResultsElectronicPunchingCardId` (`electronicPunchingCardId`),
  INDEX `ResultsEntryId` (`entryId`),
  INDEX `ResultsModifyDate` (`modifyDate`),
  INDEX `ResultsRaceClassId` (`raceClassId`),
  INDEX `ResultsRunnerStatus` (`runnerStatus`),
  CONSTRAINT `Results_FK00` FOREIGN KEY `Results_FK00` (`individualCourseId`)
    REFERENCES `Courses` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Results_FK01` FOREIGN KEY `Results_FK01` (`electronicPunchingCardId`)
    REFERENCES `ElectronicPunchingCards` (`cardId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Results_FK02` FOREIGN KEY `Results_FK02` (`entryId`)
    REFERENCES `Entries` (`entryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Results_FK03` FOREIGN KEY `Results_FK03` (`raceClassId`)
    REFERENCES `RaceClasses` (`raceClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Results_FK04` FOREIGN KEY `Results_FK04` (`relayPersonId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Results_FK05` FOREIGN KEY `Results_FK05` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ResultCompetitors` (
  `resultId` INT NOT NULL,
  `competitorId` INT NULL,
  `familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationId` INT NULL,
  `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  `dateOfBirth` DATETIME NULL,
  `countryId` INT NULL,
  `cardNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `nationality` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
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
ENGINE = INNODB;

CREATE TABLE `ServiceRequests` (
  `serviceRequestId` INT NOT NULL AUTO_INCREMENT,
  `serviceId` INT NOT NULL,
  `eventId` INT NOT NULL,
  `requestedQuantity` INT NULL,
  `deliveredQuantity` INT NULL,
  `returnedQuantity` INT NULL,
  `organisationId` INT NULL,
  `personId` INT NULL,
  `orderedById` INT NULL,
  `resultId` INT NULL,
  `serviceOrderNumber` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `data` TEXT(65535) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `orderedDate` DATETIME NULL,
  `deliveredDate` DATETIME NULL,
  `returnedDate` DATETIME NULL,
  `payedAmount` FLOAT(53) NULL DEFAULT 0,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`serviceRequestId`),
  INDEX `ServiceRequestsPersonId` (`personId`),
  INDEX `ServiceRequestsServiceId` (`serviceId`),
  CONSTRAINT `ServiceRequests_FK00` FOREIGN KEY `ServiceRequests_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ServiceRequests_FK01` FOREIGN KEY `ServiceRequests_FK01` (`serviceId`)
    REFERENCES `Services` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ServiceRequests_FK02` FOREIGN KEY `ServiceRequests_FK02` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ServiceRequests_FK03` FOREIGN KEY `ServiceRequests_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

    )
ENGINE = INNODB;

CREATE TABLE `Services` (
  `serviceId` INT NOT NULL AUTO_INCREMENT,
  `externalId` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `eventId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `price` FLOAT(53) NOT NULL,
  `vatPercentage` FLOAT(53) NULL,
  `maxNumber` INT NULL,
  `rentalCardEventRaceId` INT NULL,
  `rentalCardType` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `accountId` INT NULL,
  `allowWebOrder` TINYINT NOT NULL,
  `serviceTypeId` INT NULL,
  `fromDate` DATETIME NULL,
  `toDate` DATETIME NULL,
  `fromDateOfBirth` DATETIME NULL,
  `toDateOfBirth` DATETIME NULL,
  `validRoles` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`serviceId`),
  CONSTRAINT `Services_FK00` FOREIGN KEY `Services_FK00` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Services_FK01` FOREIGN KEY `Services_FK01` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Services_FK02` FOREIGN KEY `Services_FK02` (`serviceTypeId`)
    REFERENCES `ServiceTypes` (`serviceTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ServiceFees` (
  `serviceFeeId` INT NOT NULL AUTO_INCREMENT,
  `serviceId` INT NOT NULL,
  `price` FLOAT(53) NOT NULL,
  `vatPercentage` FLOAT(53) NULL,
  `fromDate` DATETIME NULL,
  `toDate` DATETIME NULL,
  `fromDateOfBirth` DATETIME NULL,
  `toDateOfBirth` DATETIME NULL,
  `currency` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
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
ENGINE = INNODB;

CREATE TABLE `ServicesNames` (
  `id` INT NOT NULL,
  `languageId` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `shortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  PRIMARY KEY (`id`, `languageId`),
  CONSTRAINT `ServicesNames_FK00` FOREIGN KEY `ServicesNames_FK00` (`id`)
    REFERENCES `Services` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ServiceTypes` (
  `serviceTypeId` INT NOT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`serviceTypeId`)
)
ENGINE = INNODB;

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
ENGINE = INNODB;

CREATE TABLE `SplitTimes` (
  `resultRaceIndividualNumber` INT NOT NULL,
  `timingControl` INT NOT NULL,
  `passedTime` DATETIME NOT NULL,
  `splitTime` INT NOT NULL,
  `passedCount` INT NOT NULL,
  `modifyDate` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `modifiedBy` INT NULL,
  PRIMARY KEY (`resultRaceIndividualNumber`, `passedCount`,`timingControl`),
  INDEX `SplitTimesModifyDate` (`modifyDate`),
  INDEX `SplitTimesTimingControl` (`timingControl`), 
  INDEX `SplitTimesResultRaceIndividualNumber` (`resultRaceIndividualNumber`), 
  CONSTRAINT `SplitTimes_FK00` FOREIGN KEY `SplitTimes_FK00` (`resultRaceIndividualNumber`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SplitTimes_FK01` FOREIGN KEY `SplitTimes_FK01` (`timingControl`)
    REFERENCES `Controls` (`controlId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SplitTimes_FK02` FOREIGN KEY `SplitTimes_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `TeamEntrysCompetitors` (
  `teamEntryCompetitorId` INT NOT NULL AUTO_INCREMENT,
  `teamEntryId` INT NOT NULL,
  `competitorId` INT NULL,
  `familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `organisationId` INT NULL,
  `orgName` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `orgShortName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `relayLeg` SMALLINT NULL,
  `relayPersonOrder` SMALLINT NULL,
  `sportIdentCCardNumber` INT NULL,
  `emitCCardNumber` INT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`teamEntryCompetitorId`),
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

CREATE TABLE `Transactions` (
  `transactionId` INT NOT NULL AUTO_INCREMENT,
  `eventId` INT NOT NULL,
  `organisationId` INT NULL,
  `personId` INT NULL,
  `entryId` INT NULL,
  `accountId` INT NULL,
  `foreignAccount` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `verificationNo` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `amount` FLOAT(53) NOT NULL,
  `vatAmount` FLOAT(53) NULL,
  `currency` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `comment` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `transactionDate` DATETIME NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`transactionId`),
  CONSTRAINT `Transactions_FK01` FOREIGN KEY `Transactions_FK01` (`eventId`)
    REFERENCES `Events` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Transactions_FK02` FOREIGN KEY `Transactions_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `UserRights` (
  `userRightId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `notAllowedNodeName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`userRightId`),
  CONSTRAINT `UserRights_FK00` FOREIGN KEY `UserRights_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `personId` INT NULL,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `userType` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `noOfAttempt` INT NOT NULL DEFAULT 0,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT Users_username UNIQUE (name,userType),
  CONSTRAINT `Users_FK00` FOREIGN KEY `Users_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Users_FK01` FOREIGN KEY `Users_FK01` (`personId`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Version` (
  `versionNumber` INT NOT NULL,
  `comment` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `moduleId` INT NOT NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`moduleId`),
  CONSTRAINT `Version_FK00` FOREIGN KEY `Version_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `VIPTypes` (
  `VIPTypeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  `modifiedBy` INT NULL,
  PRIMARY KEY (`VIPTypeId`),
  CONSTRAINT `VIPTypes_FK00` FOREIGN KEY `VIPTypes_FK00` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `PreDirectEntry` (
	`preDirectEntryId` INT NOT NULL AUTO_INCREMENT,
	`cardNumber` INT NULL ,
	`organisationId` INT NULL ,
	`familyName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
	`firstName` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
	`sex` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`birthYear` VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`streetAddress` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`zipCode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`city` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`country` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homeMobilePhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
	`homeMailAddress` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
  	`eventClassId` INT NULL,
  	`modifyDate` VARCHAR(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL,
    `modifiedBy` INT NULL,
  PRIMARY KEY (`PreDirectEntryId`),
  CONSTRAINT `PreDirectEntry_FK01` FOREIGN KEY `PreDirectEntry_FK01` (`eventClassId`)
    REFERENCES `EventClasses` (`eventClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PreDirectEntry_FK02` FOREIGN KEY `PreDirectEntry_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

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
ENGINE = INNODB;


CREATE TABLE `Bonuses` (
	`bonusId` INT NOT NULL AUTO_INCREMENT,
	`eventRaceId` INT NOT NULL,
	`bonusPoint` VARCHAR(255) NULL,
	`position` INT NOT NULL,
	`bonus` INT NOT NULL,
    `modifiedBy` INT NULL,
  PRIMARY KEY (`bonusId`),
  CONSTRAINT `Bonuses_FK01` FOREIGN KEY `Bonuses_FK01` (`eventRaceId`)
    REFERENCES `EventRaces` (`eventRaceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bonuses_FK02` FOREIGN KEY `Bonuses_FK02` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `ResultBonuses` (
	`resultId` INT NOT NULL,
	`bonusId` INT NOT NULL,
    `modifiedBy` INT NULL,
	PRIMARY KEY (`resultId`, `bonusId`),
  CONSTRAINT `ResultBonuses_FK01` FOREIGN KEY `ResultBonuses_FK01` (`bonusId`)
    REFERENCES `Bonuses` (`bonusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultBonuses_FK02` FOREIGN KEY `ResultBonuses_FK02` (`resultId`)
    REFERENCES `Results` (`resultId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ResultBonuses_FK03` FOREIGN KEY `ResultBonuses_FK03` (`modifiedBy`)
    REFERENCES `Persons` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;


SET FOREIGN_KEY_CHECKS = 1;

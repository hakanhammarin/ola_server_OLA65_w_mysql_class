CREATE TABLE Accounts (
  accountId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  accountNo INT(10) NULL,
  directEntryEventRaceId INT(10) NULL,
  defaultAmount FLOAT(53) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (accountId)
)
;

CREATE TABLE AllocationGroups (
  allocationGroupId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  eventId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (allocationGroupId)
)
;

CREATE TABLE AllocationGroupsStartTimes (
  allocationGroupId INT(10) NOT NULL,
  eventRaceId INT(10) NOT NULL,
  firstStart DATETIME NULL,
  groupLength INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (allocationGroupId, eventRaceId)
)
;

CREATE TABLE ApplianceBreaks (
  applianceBreakId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  applianceDate VARCHAR(23) NULL,
  seasonId INT(10) NOT NULL,
  eventAttributeId INT(10) NULL,
  eventClassificationTypeId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (applianceBreakId)
)
;

CREATE TABLE BadgeGroups (
  badgeGroupId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  shortName VARCHAR(50) NULL,
  comment VARCHAR(250) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (badgeGroupId)
)
;

CREATE TABLE BadgeLimits (
  badgeLimitId INT(10) NOT NULL AUTO_INCREMENT,
  badgeGroupId INT(10) NULL,
  timeFactor INT(10) NULL,
  comment VARCHAR(50) NULL,
  classTypeId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  badgeName VARCHAR(50) NULL,
  badgeNameShort VARCHAR(50) NULL,
  modifiedBy INT(10) NULL,
  lowAge SMALLINT(5) NULL,
  highAge SMALLINT(5) NULL,
  PRIMARY KEY (badgeLimitId)
)
;

CREATE TABLE BaseClassEntryFees (
  baseClassId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  type VARCHAR(15) NULL,
  entryFeeId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (baseClassId, ordered)
)
;

CREATE TABLE BaseClasses (
  classId INT(10) NOT NULL ,
  name VARCHAR(50) NOT NULL,
  shortName VARCHAR(50) NOT NULL,
  lowAge SMALLINT(5) NULL,
  highAge SMALLINT(5) NULL,
  minAverageAge DECIMAL(5,2) NULL,
  maxAverageAge DECIMAL(5,2) NULL,
  sex VARCHAR(1) NOT NULL,
  numberInTeam SMALLINT(5) NULL,
  teamEntry TINYINT(1) NOT NULL,
  maxNumberInClass SMALLINT(5) NULL,
  actualForRanking TINYINT(1) NOT NULL,
  noTimePresentation TINYINT(1) NOT NULL,
  owningOrganisationId INT(10) NOT NULL,
  substituteClassId INT(10) NULL,
  notQualifiedSubstitutionClassId INT(10) NULL,
  classTypeId INT NULL,
  normalizedClass TINYINT(1) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  sequence INT(10) NULL,
  allowNoTimePresentationEntries TINYINT(1) NOT NULL,
  PRIMARY KEY (classId)
)
;

CREATE TABLE BaseClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE BaseClassGroups (
  baseClassGroupId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  owningOrganisationId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (baseClassGroupId)
)
;

CREATE TABLE BaseClassBaseClassGroups (
  baseClassId INT(10) NOT NULL,
  baseClassGroupId INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (baseClassId, baseClassGroupId)
)
;

CREATE TABLE BaseClassesEventForms (
  eventForm VARCHAR(25) NOT NULL,
  classId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventForm, classId)
)
;

CREATE TABLE BibNumberSeries (
  bibNumberSerieId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NOT NULL,
  startNumberPrefix VARCHAR(50) NULL,
  firstStartNumber INT(10) NOT NULL,
  nextStartNumber INT(10) NULL,
  lastStartNumber INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  PRIMARY KEY (bibNumberSerieId)
)
;

CREATE TABLE BibTemplates (
  eventId INT(10) NOT NULL,
  startName VARCHAR(50) NOT NULL,
  chaseStart TINYINT(1) NULL,
  templateName VARCHAR(255) NOT NULL,
  template LONGTEXT,
  modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
)
;

CREATE TABLE Bonuses (
	bonusId INT(10) NOT NULL AUTO_INCREMENT,
	eventRaceId INT(10) NOT NULL,
	bonusPoint VARCHAR(255) NULL,
	position INT(10) NOT NULL,
	bonus INT(10) NOT NULL,
    modifiedBy INT(10) NULL,
  PRIMARY KEY (bonusId)
)
;

CREATE TABLE ClassCollection (
  classCollectionId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  shortName VARCHAR(50) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (classCollectionId)
)
;

CREATE TABLE ClassCollectionClasses (
  classCollectionId INT(10) NOT NULL,
  baseClassId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (classCollectionId, baseClassId)
)
;

CREATE TABLE ClassTypes (
  classTypeId INT(10) NOT NULL AUTO_INCREMENT,
  shortName VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (classTypeId)
)
;

CREATE TABLE ClassTypesEntryFees (
  classTypeId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  type VARCHAR(15) NOT NULL,
  entryFeeId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (classTypeId, ordered, type)
)
;

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
  type VARCHAR(20) NOT NULL,
  createDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadEntryId)
);

CREATE TABLE CompetitionUploadResults (
  competitionUploadResultId VARCHAR(36) NOT NULL,
  competitionUploadEntryId VARCHAR(36) NOT NULL,  
  eventRaceId INT(10) NULL,
  raceClassId INT(10) NULL,
  competitorId INT(10) NULL,
  familyName VARCHAR(50) NULL,
  firstName VARCHAR(50) NULL,
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
);

CREATE TABLE CompetitionUploadPunching (
  competitionUploadResultId VARCHAR(36) NOT NULL,
  ordered INT(10) NOT NULL,
  punchingCode INT(10) NULL,
  punchingTime DATETIME NULL,
  totalTime INT(10) NULL,
  status VARCHAR(50) NULL,
  PRIMARY KEY (competitionUploadResultId,ordered)
);

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
);

CREATE TABLE CompetitionUploadEntriesOrganisations (
  competitionUploadEntryOrganisationId VARCHAR(36) NOT NULL,
  competitionUploadEntryId VARCHAR(36) NULL,
  organisationId INT(10) NULL,
  organisationName VARCHAR(255) NULL,
  organisationShortName VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitionUploadEntryOrganisationId)
);

CREATE TABLE Competitors (
  competitorId INT(10) NOT NULL AUTO_INCREMENT,
  personId INT(10) NOT NULL,
  disciplineId INT(10) NULL,
  organisationId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitorId)
)
;

CREATE TABLE CompetitorsDefaultClasses (
  competitorId INT(10) NOT NULL,
  baseClassId INT(10) NOT NULL,
  ordered SMALLINT(5) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitorId, baseClassId)
)
;

CREATE TABLE Controls (
  controlId INT(10) NOT NULL AUTO_INCREMENT,
  ID INT(10) NOT NULL,
  name VARCHAR(50) NULL,
  location VARCHAR(50) NULL,
  pathLength VARCHAR(10) NULL,
  typeCode VARCHAR(50) NULL,
  controlAreaName VARCHAR(50) NULL,
  status VARCHAR(15) NULL,
  eventRaceId INT(10) NOT NULL,
  maxFreeTime INT(10) NOT NULL DEFAULT 0,
  controlAsFinish TINYINT(1) NOT NULL,
  xPos FLOAT(53) NULL,
  yPos FLOAT(53) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (controlId)
)
;

CREATE TABLE ControlsPunchingUnits (
  control INT(10) NOT NULL,
  punchingUnit INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (control, punchingUnit)
)
;

CREATE TABLE Countries (
  countryId INT(10) NOT NULL,
  alpha2 VARCHAR(2) NOT NULL,
  alpha3 VARCHAR(5) NOT NULL,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (countryId)
)
;

CREATE TABLE CountriesNames (
  id INT(10) NOT NULL,
  languageId VARCHAR(5) NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id, languageId)
)
;

CREATE TABLE Courses (
  courseId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  courseLength INT(10) NULL,
  startControl INT(10) NULL,
  finishControl INT(10) NULL,
  eventRaceId INT(10) NOT NULL,
  externalId VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (courseId)
)
;

CREATE TABLE CoursesClassShortNames (
  courseId INT(10) NOT NULL,
  classShortName VARCHAR(50) NOT NULL,
  PRIMARY KEY (courseId,classShortName)
)
;

CREATE TABLE CoursesWayPointControls (
  courseId INT(10) NOT NULL,
  controlId INT(10) NOT NULL,
  ordered SMALLINT(5) NOT NULL,
  distanceFrom INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (courseId, controlId, ordered)
)
;

CREATE TABLE Disciplines (
  disciplineId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (disciplineId)
)
;

CREATE TABLE DocumentInfos (
  documentInfoId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  type VARCHAR(50) NULL,
  url VARCHAR(255) NOT NULL,
  eventId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (documentInfoId)
)
;

CREATE TABLE ElectronicPunchingCards (
  cardId INT(10) NOT NULL AUTO_INCREMENT,
  cardNumber INT(10) NOT NULL,
  electronicPunchingCardType VARCHAR(50) NOT NULL,
  competitorId INT(10) NULL,
  personId INT(10) NULL,
  organisationId INT(10) NULL,
  entryId INT(10) NULL,
  teamEntryCompetitorId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (cardId)
)
;

CREATE TABLE Entries (
  entryId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NOT NULL,
  externalId VARCHAR(100) NULL,
  entryOrganisationId INT(10) NULL,
  allocationControl VARCHAR(20) NULL,
  allocationEntryId INT(10) NULL,
  allocationOrganisationId INT(10) NULL,
  allocationPersonId INT(10) NULL,
  seedingGroup INT(10) NULL,
  competitorId INT(10) NULL,
  sportIdentCCardNumber INT(10) NULL,
  emitCCardNumber INT(10) NULL,
  acceptedEventClassId INT(10) NULL,
  teamName VARCHAR(100) NULL,
  teamLeader VARCHAR(100) NULL,
  bibNumber VARCHAR(10) NULL,
  type VARCHAR(10) NOT NULL,
  createDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  noTotalResult TINYINT(1) NOT NULL,
  modifiedBy INT(10) NULL,
  resultTag VARCHAR(255) NULL,
  bookingNumber VARCHAR(255) NULL,
  bibPrinted VARCHAR(23) NULL,
  noTimePresentation TINYINT(1) NOT NULL DEFAULT 0,
  allocationGroupId INT(10) NULL,
  PRIMARY KEY (entryId)
)
;

CREATE TABLE EntriesEntryFees (
  entryId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  entryFeeId INT(10) NOT NULL,
  eventRaceId INT(10) NULL,
  isWholeEventFee TINYINT NOT NULL DEFAULT 0,
  payedAmount FLOAT(53) NOT NULL DEFAULT 0,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (entryId, ordered)
)
;

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
;

CREATE TABLE EntryFees (
  entryFeeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  amount FLOAT(53) NOT NULL,
  externalFee FLOAT(53) NOT NULL,
  valueOperator VARCHAR(25) NOT NULL,
  externalId VARCHAR(100) NULL,
  includedInTax TINYINT(1) NOT NULL,
  feeType VARCHAR(25) NOT NULL,
  fromDate DATETIME NULL,
  toDate DATETIME NULL,
  fromDateOfBirth DATETIME NULL,
  toDateOfBirth DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  seasonId INT(10) NULL,
  teamFee TINYINT(1) NULL,
  vatPercentage FLOAT(53) NULL,
  currency VARCHAR(5) NULL,
  PRIMARY KEY (entryFeeId)
)
;

CREATE TABLE EntrysClasses (
  entryId INT(10) NOT NULL,
  ordered SMALLINT(5) NOT NULL,
  classId INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (entryId, ordered)
)
;

CREATE TABLE EventClassEntryFees (
  eventClassId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  type VARCHAR(15) NULL,
  entryFeeId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  eventRaceId INT(10) NULL DEFAULT NULL,
  isWholeEventFee TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (eventClassId, ordered)
)
;

CREATE TABLE EventClasses (
  eventClassId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NOT NULL,
  classStatus VARCHAR(50) NOT NULL,
  collectedTo INT(10) NULL,
  dividedFrom INT(10) NULL,
  finalFromClassId INT(10) NULL,
  externalId VARCHAR(100) NULL,
  name VARCHAR(50) NOT NULL,
  shortName VARCHAR(50) NOT NULL,
  lowAge SMALLINT(5) NULL,
  highAge SMALLINT(5) NULL,
  minAverageAge DECIMAL(5,2) NULL,
  maxAverageAge DECIMAL(5,2) NULL,
  sex VARCHAR(1) NOT NULL,
  numberInTeam SMALLINT(5) NULL,
  teamEntry TINYINT(1) NOT NULL,
  numberOfLegs SMALLINT(5) NULL,
  numberOfVacancies SMALLINT(5) NULL,
  maxNumberInClass SMALLINT(5) NULL,
  divideClassMethod VARCHAR(15) NULL,
  actualForRanking TINYINT(1) NOT NULL,
  noTimePresentation TINYINT(1) NOT NULL,
  substituteClassId INT(10) NULL,
  notQualifiedSubstitutionClassId INT(10) NULL,
  classTypeId INT(10) NOT NULL,
  normalizedClass TINYINT(1) NOT NULL,
  badgeGroupId INT(10) NULL,
  numberOfPrizesTotal SMALLINT(5) NULL,
  noTotalResult TINYINT(1) NOT NULL,
  allowEntryInAdvance TINYINT(1) NOT NULL,
  allowEventRaceEntry TINYINT(1) NULL,
  allowCardReusage TINYINT(1) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  baseClassId INT(10) NULL,
  sequence INT(10) NULL,
  noOfStarts INT(10) NULL,
  noOfEntries INT(10) NULL,
  allowNoTimePresentationEntries TINYINT(1) NOT NULL,
  PRIMARY KEY (eventClassId)
)
;

CREATE TABLE EventClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE EventClassificationTypes (
  eventClassificationTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  externalId VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventClassificationTypeId)
)
;

CREATE TABLE EventAttributes (
  eventAttributeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  parentOrganisationId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventAttributeId)
)
;

CREATE TABLE EventStatuses (
  eventStatusId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventStatusId)
)
;

CREATE TABLE EventOfficials (
  eventOfficialId INT(10) NOT NULL AUTO_INCREMENT,
  eventRaceId INT(10) NULL,
  eventId INT(10) NULL,
  personId INT(10) NULL,
  roleTypeId INT(10) NOT NULL,
  entityType VARCHAR(45) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventOfficialId)
)
;

CREATE TABLE EventsProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value TEXT NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE EventRaces (
  eventRaceId INT(10) NOT NULL AUTO_INCREMENT,
  externalId VARCHAR(100) NULL,
  name VARCHAR(50) NULL,
  eventId INT(10) NOT NULL,
  raceDate DATETIME NULL,
  raceStatus VARCHAR(50) NOT NULL,
  raceLightCondition VARCHAR(50) NOT NULL DEFAULT 'Day',
  raceDistance VARCHAR(50) NOT NULL DEFAULT 'Middle',
  administrationTime INT(10) NULL,
  xPos FLOAT(53) NULL,
  yPos FLOAT(53) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventRaceId)
)
;

CREATE TABLE Events (
  eventId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  eventNumber VARCHAR(20) NULL,
  district INT(10) NULL,
  textURL VARCHAR(255) NULL,
  startDate DATETIME NULL,
  finishDate DATETIME NULL,
  postalGiroAccount VARCHAR(50) NULL,
  eventForm VARCHAR(25) NOT NULL,
  eventClassificationTypeId INT(10) NULL,
  defaultBadgeGroup INT(10) NULL,
  punchingManual TINYINT(1) NOT NULL,
  punchingSportIdent TINYINT(1) NOT NULL,
  punchingEmit TINYINT(1) NOT NULL,
  defaultRankingListId INT(10) NULL,
  eventStatusId INT(10) NOT NULL,
  comment VARCHAR(255) NULL,
  classTypeComment VARCHAR(100) NULL,
  parentEventId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventId)
)
;

CREATE TABLE EventsTelecoms (
  eventId INT(10) NOT NULL,
  type varchar(20) NOT NULL,
  phoneNumber VARCHAR(50) NULL,
  faxNumber VARCHAR(50) NULL,
  mobilePhoneNumber VARCHAR(50) NULL,
  mailAddress VARCHAR(255) NULL,
  webURL VARCHAR(255) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventId,type)
)
;

CREATE TABLE EventsAddresses (
  eventId INT(10) NOT NULL,
  type varchar(20) NOT NULL,
  name VARCHAR(100) NULL,
  streetAddress VARCHAR(100) NULL,
  zipCode VARCHAR(50) NULL,
  city VARCHAR(50) NULL,
  countryId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventId,type)
)
;

CREATE TABLE EventClassTypes (
  eventId INT(10) NOT NULL,
  classTypeId INT(10) NOT NULL,
  PRIMARY KEY (eventId,classTypeId)
)
;

CREATE TABLE EventAlternativeDates (
  eventId INT(10) NOT NULL,
  sequence INT(10) NOT NULL,
  startDate DATETIME NULL,
  finishDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventId,sequence)
)
;

CREATE TABLE EventsDisciplines (
  disciplineId INT(10) NOT NULL,
  eventId INT(10) NOT NULL,
  PRIMARY KEY (disciplineId,eventId)
)
;

CREATE TABLE EventsEventAttributes (
  eventAttributeId INT(10) NOT NULL,
  eventId INT(10) NOT NULL,
  PRIMARY KEY (eventAttributeId,eventId)
)
;

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
;

CREATE TABLE MembersOfOrganisation (
  organisationId INT(10) NOT NULL,
  personId INT(10) NOT NULL,
  roleTypeId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationId, personId, roleTypeId)
)
;

CREATE TABLE Notifications (
  notificationId INT(10) NOT NULL AUTO_INCREMENT,
  fromPersonId INT(10) NULL,
  toPersonId INT(10) NULL,
  toOrganisationId INT(10) NULL,
  toOrganisationTypeId INT(10) NULL,
  toRoleTypeId INT(10) NULL,
  messageType VARCHAR(50) NOT NULL,
  messageData VARCHAR(10000) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (notificationId)
)
;

CREATE TABLE NumberedServices (
  numberedServicesId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NULL,
  name VARCHAR(50) NOT NULL,
  prefix VARCHAR(50) NULL,
  rangeFrom INT(10) NOT NULL,
  rangeTo INT(10) NOT NULL,
  price FLOAT(53) NULL,
  vatPercentage FLOAT(53) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (numberedServicesId)
)
;

CREATE TABLE Organisations (
  organisationId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  shortName VARCHAR(50) NULL,
  account VARCHAR(50) NULL,
  organisationTypeId INT(10) NOT NULL,
  superOrganisationId INT(10) NULL,
  countryId INT(10) NOT NULL,
  organisationStatusId INT(10) NULL, 
  createDate DATETIME NULL,
  memberToDate DATETIME NULL,
  mediaName VARCHAR(50) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationId)
)
;

CREATE TABLE OrganisationsAllocationGroups (
  organisationId INT(10) NOT NULL,
  allocationGroupId INT(10) NOT NULL,
  eventId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (allocationGroupId, organisationId)
)
;

CREATE TABLE OrganisationIds (
  organisationId INT(10) NOT NULL,
  organisationIdsTypeId INT(10) NOT NULL,
  externalId VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationId,organisationIdsTypeId)
)
;

CREATE TABLE OrganisationIdTypes (
  organisationIdsTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationIdsTypeId)
)
;

CREATE TABLE OrganisationStatuses (
  organisationStatusId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationStatusId)
)
;

CREATE TABLE OrganisationTypes (
  organisationTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  parentOrganisationTypeId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationTypeId)
)
;

CREATE TABLE OrganisationsAddresses (
  organisationId INT(10) NOT NULL,
  type varchar(20) NOT NULL,
  name VARCHAR(100) NULL,
  streetAddress VARCHAR(100) NULL,
  zipCode VARCHAR(50) NULL,
  city VARCHAR(50) NULL,
  countryId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationId,type)
)
;

CREATE TABLE OrganisationsProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE OrganisationsTelecoms (
  organisationId INT(10) NOT NULL,
  type varchar(20) NOT NULL,
  phoneNumber VARCHAR(50) NULL,
  faxNumber VARCHAR(50) NULL,
  mobilePhoneNumber VARCHAR(50) NULL,
  mailAddress VARCHAR(255) NULL,
  webURL VARCHAR(255) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (organisationId,type)
)
;

CREATE TABLE OrganisersOfEvents (
  eventId INT(10) NOT NULL,
  organisationId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (eventId, organisationId)
)
;

CREATE TABLE Persons (
  personId INT(10) NOT NULL AUTO_INCREMENT,
  familyName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  sex VARCHAR(1) NULL,
  dateOfBirth DATETIME NULL,
  ssn VARCHAR(13) NULL, 
  competitor TINYINT(1) NOT NULL,
  defaultOrganisationId INT(10) NULL,
  personIdInClub INT(10) NULL,
  VIPType INT(10) NULL,
  nationalityId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  dead TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (personId)
)
;

CREATE TABLE PersonsOrganisations (
  personOrganisationId INT(10) NOT NULL AUTO_INCREMENT,
  personId INT(10) NULL,
  organisationId INT(10) NULL,
  personRoleId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personOrganisationId)
)
;

CREATE TABLE PersonsProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE PersonRoles (
  personRoleId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  organisationTypeId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personRoleId)
)
;

CREATE TABLE PersonIds (
  personId INT(10) NOT NULL,
  personIdsTypeId INT(10) NOT NULL,
  externalId VARCHAR(100) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personId,personIdsTypeId)
)
;

CREATE TABLE PersonIdTypes (
  personIdsTypeId INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personIdsTypeId)
)
;

CREATE TABLE PersonsAddresses (
  personId INT(10) NOT NULL,
  type VARCHAR(20) NOT NULL,
  name VARCHAR(100) NULL,
  streetAddress VARCHAR(100) NULL,
  zipCode VARCHAR(50) NULL,
  city VARCHAR(50) NULL,
  countryId INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personId,type)
)
;

CREATE TABLE PersonsTelecoms (
  personId INT(10) NOT NULL,
  type VARCHAR(20) NOT NULL,
  phoneNumber VARCHAR(50) NULL,
  faxNumber VARCHAR(50) NULL,
  mobilePhoneNumber VARCHAR(50) NULL,
  mailAddress VARCHAR(255) NULL,
  webURL VARCHAR(255) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personId,type)
)
;

CREATE TABLE PressList (
  pressListId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NULL,
  organisationId INT(10) NULL,
  pressId INT(10) NULL,
  districtId INT(10) NULL,
  topN INT(10) NOT NULL,
  uptoPos INT(10) NULL,
  showDistrictCode TINYINT(1) NOT NULL,
  showEmptyClass TINYINT(1) NOT NULL,
  listName VARCHAR(50) NULL,
  ordered INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (pressListId)
)
;

CREATE TABLE PressListClasses (
  pressListId INT(10) NOT NULL,
  eventClassId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (pressListId, eventClassId)
)
;

CREATE TABLE PressListOrganisations (
  pressListId INT(10) NOT NULL,
  organisationId INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (pressListId, organisationId)
)
;

CREATE TABLE PressPersons (
  personId INT(10) NOT NULL,
  pressId INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (personId, pressId)
)
;

CREATE TABLE PunchingEntries (
  result INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  punchingCode INT(10) NOT NULL,
  punchingTime DATETIME NULL,
  adjustedTime INT(10) NOT NULL DEFAULT 0,
  totalTime INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (result, ordered)
)
;

CREATE TABLE PunchingUnits (
  punchingUnitId INT(10) NOT NULL AUTO_INCREMENT,
  eventRaceId INT(10) NOT NULL,
  punchingCode INT(10) NOT NULL,
  unitId VARCHAR(50) NULL,
  purpose VARCHAR(50) NULL,
  owner INT(10) NULL,
  punchingUnitType VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (punchingUnitId)
)
;

CREATE TABLE RaceClassCourses (
  raceClassId INT(10) NOT NULL,
  courseId INT(10) NOT NULL,
  restartCourseId INT(10) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (raceClassId, courseId)
)
;

CREATE TABLE RaceClasses (
  raceClassId INT(10) NOT NULL AUTO_INCREMENT,
  raceClassName VARCHAR(25) NULL,
  raceClassLength VARCHAR(25) NULL,
  eventClassId INT(10) NOT NULL,
  eventRaceId INT(10) NULL,
  firstStartTime DATETIME NULL,
  startInterval SMALLINT(5) NULL,
  startUnit VARCHAR(50) NULL,
  administrationLineCode VARCHAR(50) NULL,
  noRankingRace TINYINT(1) NOT NULL,
  estimatedBestTime INT(10) NULL,
  estimatedLastPrizeTime INT(10) NULL,
  numberOfPrizes SMALLINT(5) NULL,
  prizeCeremonyTime DATETIME NULL,
  prizeGivingDone TINYINT(1) NULL,
  startNumberPrefix VARCHAR(50) NULL,
  startNumberBase VARCHAR(50) NULL,
  startNumberInherit TINYINT(1) NULL,
  finishChute VARCHAR(50) NULL,
  badgeGroupId INT(10) NULL,
  raceClassStatus VARCHAR(50) NOT NULL,
  allocationMethod VARCHAR(50) NOT NULL,
  viewWhichOrganisation VARCHAR(20) NOT NULL DEFAULT 'club',
  maxAfterForChaseStart INT(10) NULL,
  startMethod VARCHAR(50) NOT NULL,
  earlyStartLimit INT(10) NULL,
  lateStartLimit INT(10) NULL,
  punchingUnitType VARCHAR(20) NULL,
  timeResolution INT(10) NOT NULL,
  relayLeg SMALLINT(5) NULL,
  minRunners SMALLINT(5) NULL,
  maxRunners SMALLINT(5) NULL,
  restartStopTime DATETIME NULL,
  restartTime DATETIME NULL,
  restartedTeamsAfter TINYINT(1) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  noOfEntries INT(10) NULL, 
  noOfStarts INT(10) NULL,
  startsPerInterval INT(10) NULL,
  maxNumberInRaceClass SMALLINT(5) NULL,
  mustHaveFinishPunch TINYINT(1) NULL,
  defaultFinishDelaySeconds INT(10) NULL,
  PRIMARY KEY (raceClassId)
)
;

CREATE TABLE RaceClassesProperties (
  id INT(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  value VARCHAR(255) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (id,name)
)
;

CREATE TABLE RaceClassSplitTimeControls (
  raceClassId INT(10) NOT NULL,
  splitTimeControlId INT(10) NOT NULL,
  ordered INT(10) NOT NULL,
  name VARCHAR(50) NULL,
  estimatedBestTime INT(10) NULL,
  modifiedBy INT(10) NULL,
  noSplitTimes TINYINT(1) NULL,
  PRIMARY KEY (raceClassId, splitTimeControlId, ordered)
)
;

CREATE TABLE RankingLists (
  rankingListId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  validFrom DATETIME NOT NULL,
  validTo DATETIME NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (rankingListId)
)
;

CREATE TABLE Rankings (
  competitorId INT(10) NOT NULL,
  rankId INT(10) NOT NULL,
  score FLOAT(24) NULL,
  rankingListId INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (competitorId, rankingListId)
)
;

CREATE TABLE RawDataFromElectronicPunchingCards (
  ID INT(10) NOT NULL AUTO_INCREMENT,
  punchingCardType VARCHAR(25) NOT NULL,
  countryCode INT(10) NULL,
  clubCode INT(10) NULL,
  cardNumber INT(10) NULL,
  cardSeries INT(10) NULL,
  startNumber INT(10) NULL,
  startTime VARCHAR(50) NULL,
  checkTime VARCHAR(50) NULL,
  finishTime VARCHAR(50) NULL,
  punchingCounter INT(10) NULL,
  softwareVersion SMALLINT(5) NULL,
  mtrNumber INT(5) NULL,
  readInNumber INT(10) NULL,
  readInTime DATETIME NULL,
  hasResult TINYINT(1) NOT NULL,
  eventRace INT(10) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  takenCareOf TINYINT(1) NULL,
  comment VARCHAR(255) NULL,
  PRIMARY KEY (ID)
)
;

CREATE TABLE RawPunches (
  rawCardId INT(10) NOT NULL,
  controlNumber INT(10) NOT NULL,
  punchingCode INT(10) NULL,
  punchingTime VARCHAR(50) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (rawCardId, controlNumber)
)
;

CREATE TABLE RelayEntriesOrganisations (
  relayEntryOrganisationId INT(10) NOT NULL AUTO_INCREMENT,
  entryId INT(10) NOT NULL,
  organisationId INT(10) NOT NULL,
  ordered INT(10),
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (relayEntryOrganisationId)
)
;

CREATE TABLE ResultBonuses (
	resultId INT(10) NOT NULL,
	bonusId INT(10) NOT NULL,
    modifiedBy INT(10) NULL,
	PRIMARY KEY (resultId, bonusId)
)
;

CREATE TABLE Results (
  resultId INT(10) NOT NULL AUTO_INCREMENT,
  bibNumber VARCHAR(10) NULL,
  raceStartNumber INT(10) NULL,
  allocatedStartTime DATETIME NULL,
  startTime DATETIME NULL,
  finishTime DATETIME NULL,
  totalTime INT(10) NULL,
  position SMALLINT(5) NULL,
  runnerStatus VARCHAR(50) NOT NULL,
  entryId INT(10) NULL,
  electronicPunchingCardId INT(10) NULL,
  individualCourseId INT(10) NULL,
  forkedCourseId INT(10) NULL,
  forkedCourseOrder SMALLINT(5),
  raceClassId INT(10) NULL,
  rawDataFromElectronicPunchingCardsId INT(10) NULL,
  relayPersonId INT(10),
  relayPersonOrder SMALLINT(5),
  createDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3),
  modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  modifiedBy INT(10) NULL,
  timeAfter INT(10) NULL,
  overallTotalTime INT(10) NULL,
  overallTimeAfter INT(10) NULL,
  overallPosition SMALLINT(5) NULL,
  overallRunnerStatus VARCHAR(50) NULL,
  takenCareOf TINYINT(1) NULL,
  comment VARCHAR(255) NULL,
  PRIMARY KEY (resultId)
)
;

CREATE TABLE ResultCompetitors (
  resultId INT(10) NOT NULL,
  competitorId INT(10) NULL,
  familyName VARCHAR(50) NULL,
  firstName VARCHAR(50) NULL,
  organisationId INT(10) NULL,
  name VARCHAR(255) NULL,
  shortName VARCHAR(50) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  dateOfBirth DATETIME NULL,
  countryId INT(10) NULL,
  cardNumber VARCHAR(50) NULL,
  sex VARCHAR(1) NULL,
  nationality VARCHAR(5) NULL,
  PRIMARY KEY (resultId)
)
;

CREATE TABLE RoleTypes (
  roleTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  entityType VARCHAR(45) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (roleTypeId)
)
;

CREATE TABLE Seasons (
  seasonId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  startDate VARCHAR(23) NOT NULL,
  finishDate VARCHAR(23) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (seasonId)
)
;


CREATE TABLE ServiceRequests (
  serviceRequestId INT(10) NOT NULL AUTO_INCREMENT,
  serviceId INT(10) NOT NULL,
  eventId INT(10) NOT NULL,
  requestedQuantity INT(10) NULL,
  deliveredQuantity INT(10) NULL,
  returnedQuantity INT(10) NULL,
  organisationId INT(10) NULL,
  personId INT(10) NULL,
  orderedById INT(10) NULL,
  resultId INT(10) NULL,
  serviceOrderNumber VARCHAR(25) NULL,
  comment VARCHAR(100) NULL,
  orderedDate DATETIME NULL,
  deliveredDate DATETIME NULL,
  returnedDate DATETIME NULL,
  payedAmount FLOAT(53) NULL DEFAULT 0,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (serviceRequestId)
)
;

CREATE TABLE Services (
  serviceId INT(10) NOT NULL AUTO_INCREMENT,
  externalId VARCHAR(100) NULL,
  eventId INT(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  shortName VARCHAR(50) NULL,
  comment VARCHAR(500) NULL,
  price FLOAT(53) NOT NULL,
  vatPercentage FLOAT(53) NULL,
  maxNumber INT(10) NULL,
  rentalCardEventRaceId INT(10) NULL,
  rentalCardType VARCHAR(50) NULL,
  accountId INT(10) NULL,
  allowWebOrder TINYINT(1) NOT NULL,
  serviceTypeId INT(10) NULL,
  fromDate DATETIME NULL,
  toDate DATETIME NULL,
  fromDateOfBirth DATETIME NULL,
  toDateOfBirth DATETIME NULL,
  validRoles VARCHAR(50) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (serviceId)
)
;

CREATE TABLE ServiceFees (
  serviceFeeId INT(10) NOT NULL AUTO_INCREMENT,
  serviceId INT(10) NOT NULL,
  price FLOAT(53) NOT NULL,
  vatPercentage FLOAT(53) NULL,
  fromDate DATETIME NULL,
  toDate DATETIME NULL,
  fromDateOfBirth DATETIME NULL,
  toDateOfBirth DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  currency VARCHAR(5) NULL,
  PRIMARY KEY (serviceFeeId)
)
;

CREATE TABLE ServicesNames (
  id INT(10) NOT NULL,
  languageId VARCHAR(5) NOT NULL,
  name VARCHAR(100) NOT NULL,
  shortName VARCHAR(50) NULL,
  comment VARCHAR(500) NULL,
  PRIMARY KEY (id, languageId)
)
;

CREATE TABLE ServiceTypes (
  serviceTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (serviceTypeId)
)
;

CREATE TABLE ServiceTypesNames (
  id INT(10) NOT NULL,
  languageId VARCHAR(5) NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id, languageId)
)
;

CREATE TABLE SplitTimes (
  resultRaceIndividualNumber INT(10) NOT NULL,
  timingControl INT(10) NOT NULL,
  passedTime DATETIME NOT NULL,
  splitTime INT(10) NOT NULL,
  passedCount INT(10) NOT NULL,
  modifyDate DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  modifiedBy INT(10) NULL,
  PRIMARY KEY (resultRaceIndividualNumber, passedCount, timingControl)
)
;

CREATE TABLE TeamEntrysCompetitors (
  teamEntryCompetitorId INT(10) NOT NULL AUTO_INCREMENT,
  teamEntryId INT(10) NOT NULL,
  competitorId INT(10) NULL,
  familyName VARCHAR(50) NULL,
  firstName VARCHAR(50) NULL,
  organisationId INT(10) NULL,
  orgName VARCHAR(255) NULL,
  orgShortName VARCHAR(50) NULL,
  relayLeg SMALLINT(5) NULL,
  relayPersonOrder SMALLINT(5) NULL,
  sportIdentCCardNumber INT(10) NULL,
  emitCCardNumber INT(10) NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (teamEntryCompetitorId)
)
;

CREATE TABLE Transactions (
  transactionId INT(10) NOT NULL AUTO_INCREMENT,
  eventId INT(10) NOT NULL,
  organisationId INT(10) NULL,
  personId INT(10) NULL,
  entryId INT(10) NULL,
  accountId INT(10) NULL,
  foreignAccount VARCHAR(50) NULL,
  verificationNo VARCHAR(50) NULL,
  amount FLOAT(53) NOT NULL,
  vatAmount FLOAT(53) NULL,
  comment VARCHAR(100) NULL,
  transactionDate DATETIME NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (transactionId)
)
;

CREATE TABLE UserRights (
  userRightId INT(10) NOT NULL AUTO_INCREMENT,
  userId INT(10) NOT NULL,
  notAllowedNodeName VARCHAR(50) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (userRightId)
)
;

CREATE TABLE Users (
  userId INT(10) NOT NULL AUTO_INCREMENT,
  personId INT(10) NULL,
  name VARCHAR(50) NOT NULL,
  userType VARCHAR(10) NOT NULL,
  password VARCHAR(50) NOT NULL,
  noOfAttempt INT(10) NOT NULL DEFAULT 0,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (userId),
  CONSTRAINT Users_username UNIQUE (name,userType)
)
;

CREATE TABLE Version (
  versionNumber INT(10) NOT NULL,
  comment VARCHAR(50) NOT NULL,
  moduleId INT(10) NOT NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (moduleId)
)
;

CREATE TABLE VIPTypes (
  VIPTypeId INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  modifyDate VARCHAR(23) NULL,
  modifiedBy INT(10) NULL,
  PRIMARY KEY (VIPTypeId)
)
;

CREATE TABLE PreDirectEntry (
	preDirectEntryId INT(10) NOT NULL AUTO_INCREMENT,
	cardNumber int(10) NULL ,
	organisationId int(10) NULL ,
	familyName VARCHAR(50) NOT NULL,
	firstName VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NULL,
	birthYear VARCHAR(4) NULL,
	streetAddress VARCHAR(50) NULL,
	zipCode VARCHAR(50) NULL,
	city VARCHAR(50) NULL,
	country VARCHAR(5) NULL,
	homePhoneNumber VARCHAR(50) NULL,
	homeMobilePhoneNumber VARCHAR(50) NULL,
	homeMailAddress VARCHAR(255) NULL,
  	eventClassId INT(10) NULL,
  	modifyDate VARCHAR(23) NULL,
    modifiedBy INT(10) NULL,
  PRIMARY KEY (PreDirectEntryId)
)
;

CREATE TABLE PreDirectEntryResults (
	preDirectEntryId INT(10) NOT NULL,
	eventRaceId int(10) NOT NULL ,
  	runnerStatus VARCHAR(50) NOT NULL,
  PRIMARY KEY (preDirectEntryId,eventRaceId)
)
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE AllocationGroups ADD CONSTRAINT AllocationGroups_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE AllocationGroups ADD CONSTRAINT AllocationsGroups_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE AllocationGroupsStartTimes ADD CONSTRAINT AllocationGroupsStartTimes_FK00 FOREIGN KEY (allocationGroupId)
    REFERENCES AllocationGroups (allocationGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE AllocationGroupsStartTimes ADD CONSTRAINT AllocationGroupsStartTimes_FK01 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE AllocationGroupsStartTimes ADD CONSTRAINT AllocationGroupsStartTimes_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ApplianceBreaks ADD CONSTRAINT ApplianceBreaks_FK00 FOREIGN KEY (seasonId)
    REFERENCES Seasons (seasonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ApplianceBreaks ADD CONSTRAINT ApplianceBreaks_FK01 FOREIGN KEY (eventAttributeId)
    REFERENCES EventAttributes (eventAttributeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ApplianceBreaks ADD CONSTRAINT ApplianceBreaks_FK02 FOREIGN KEY (eventClassificationTypeId)
    REFERENCES EventClassificationTypes (eventClassificationTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ApplianceBreaks ADD CONSTRAINT ApplianceBreaks_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BadgeGroups ADD CONSTRAINT BadgeGroups_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BadgeLimits ADD CONSTRAINT BadgeLimits_FK00 FOREIGN KEY (classTypeId)
    REFERENCES ClassTypes (classTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BadgeLimits ADD CONSTRAINT BadgeLimits_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BadgeLimits ADD CONSTRAINT BadgeLimits_FK02 FOREIGN KEY (badgeGroupId)
    REFERENCES BadgeGroups (badgeGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassEntryFees ADD CONSTRAINT BaseClassEntryFees_FK00 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassEntryFees ADD CONSTRAINT BaseClassEntryFees_FK01 FOREIGN KEY (baseClassId)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassEntryFees ADD CONSTRAINT BaseClassEntryFees_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClasses ADD CONSTRAINT BaseClasses_FK00 FOREIGN KEY (classTypeId)
    REFERENCES ClassTypes (classTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClasses ADD CONSTRAINT BaseClasses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClasses ADD CONSTRAINT BaseClasses_FK02 FOREIGN KEY (owningOrganisationId)
   	REFERENCES Organisations (organisationId)
   	ON DELETE NO ACTION
   	ON UPDATE NO ACTION
;

ALTER TABLE BaseClassesProperties ADD CONSTRAINT BaseClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassesProperties ADD CONSTRAINT BaseClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassGroups ADD CONSTRAINT BaseClassGroups_FK00 FOREIGN KEY (owningOrganisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE BaseClassGroups ADD CONSTRAINT BaseClassGroups_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassBaseClassGroups ADD CONSTRAINT BaseClassBaseClassGroups_FK00 FOREIGN KEY (baseClassId)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassBaseClassGroups ADD CONSTRAINT BaseClassBaseClassGroups_FK01 FOREIGN KEY (baseClassGroupId)
    REFERENCES BaseClassGroups (baseClassGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE BaseClassBaseClassGroups ADD CONSTRAINT BaseClassBaseClassGroups_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BaseClassesEventForms ADD CONSTRAINT BaseClassesEventForms_FK00 FOREIGN KEY (classId)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE BibNumberSeries ADD CONSTRAINT BibNumberSeries_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ClassCollection ADD CONSTRAINT ClassCollection_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX ClassCollectionOrdered ON ClassCollectionClasses (ordered)
;

ALTER TABLE ClassCollectionClasses ADD CONSTRAINT ClassCollectionClasses_FK00 FOREIGN KEY (classCollectionId)
    REFERENCES ClassCollection (classCollectionId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ClassCollectionClasses ADD CONSTRAINT ClassCollectionClasses_FK01 FOREIGN KEY (baseClassId)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ClassCollectionClasses ADD CONSTRAINT ClassCollectionClasses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ClassTypes ADD CONSTRAINT ClassTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ClassTypesEntryFees ADD CONSTRAINT ClassTypesEntryFees_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK01 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK02 FOREIGN KEY (raceClassId)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK03 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK04 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK05 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitionUploadResults ADD CONSTRAINT CompetitionUploadResults_FK06 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadPunching ADD CONSTRAINT CompetitionUploadPunching_FK00 FOREIGN KEY (competitionUploadResultId)
    REFERENCES CompetitionUploadResults (competitionUploadResultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK01 FOREIGN KEY (competitionUploadResultId)
    REFERENCES CompetitionUploadResults (competitionUploadResultId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK02 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntryFees ADD CONSTRAINT CompetitionUploadEntryFees_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (modifiedBy)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntriesOrganisations ADD CONSTRAINT CompetitionUploadEntriesOrganisations_FK00 FOREIGN KEY (competitionUploadEntryId)
    REFERENCES CompetitionUploadEntries (competitionUploadEntryId)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitionUploadEntriesOrganisations ADD CONSTRAINT CompetitionUploadEntriesOrganisations_FK01 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Competitors ADD CONSTRAINT Competitors_FK00 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Competitors ADD CONSTRAINT Competitors_FK01 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Competitors ADD CONSTRAINT Competitors_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CompetitorsDefaultClasses ADD CONSTRAINT CompetitorsDefaultClasses_FK00 FOREIGN KEY (baseClassId)
    REFERENCES BaseClasses (classId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitorsDefaultClasses ADD CONSTRAINT CompetitorsDefaultClasses_FK01 FOREIGN KEY (competitorId)
    REFERENCES Competitors (competitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CompetitorsDefaultClasses ADD CONSTRAINT CompetitorsDefaultClasses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX ControlsID ON Controls (ID)
;

ALTER TABLE Controls ADD CONSTRAINT Controls_FK01 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Controls ADD CONSTRAINT Controls_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ControlsPunchingUnits ADD CONSTRAINT ControlsPunchingUnits_FK00 FOREIGN KEY (control)
    REFERENCES Controls (controlId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ControlsPunchingUnits ADD CONSTRAINT ControlsPunchingUnits_FK01 FOREIGN KEY (punchingUnit)
    REFERENCES PunchingUnits (punchingUnitId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ControlsPunchingUnits ADD CONSTRAINT ControlsPunchingUnits_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Countries ADD CONSTRAINT Countries_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CountriesNames ADD CONSTRAINT CountriesNames_FK00 FOREIGN KEY (id)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Courses ADD CONSTRAINT Courses_FK00 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Courses ADD CONSTRAINT Courses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CoursesClassShortNames ADD CONSTRAINT CoursesClassShortNames_FK00 FOREIGN KEY (courseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE CoursesWayPointControls ADD CONSTRAINT CoursesWayPointControls_FK00 FOREIGN KEY (controlId)
    REFERENCES Controls (controlId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CoursesWayPointControls ADD CONSTRAINT CoursesWayPointControls_FK01 FOREIGN KEY (courseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE CoursesWayPointControls ADD CONSTRAINT CourseWayPointControls_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Disciplines ADD CONSTRAINT Disciplines_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE DocumentInfos ADD CONSTRAINT DocumentInfo_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE DocumentInfos ADD CONSTRAINT DocumentInfo_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX ElectronicPunchingCardsCardNumber ON ElectronicPunchingCards (cardNumber)
;
CREATE INDEX ElectronicPunchingCardsCompetitor ON ElectronicPunchingCards (competitorId)
;
CREATE INDEX ElectronicPunchingCardsElectronicPunchingCardType ON ElectronicPunchingCards (electronicPunchingCardType)
;
ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK03 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK04 FOREIGN KEY (teamEntryCompetitorId)
    REFERENCES TeamEntrysCompetitors (teamEntryCompetitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ElectronicPunchingCards ADD CONSTRAINT ElectronicPunchingCards_FK05 FOREIGN KEY (competitorId)
    REFERENCES Competitors (competitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX EntriesAcceptedEventClassId ON Entries (acceptedEventClassId)
;
CREATE INDEX EntriesCompetitorId ON Entries (competitorId)
;
ALTER TABLE Entries ADD CONSTRAINT Entries_FK00 FOREIGN KEY (entryOrganisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Entries ADD CONSTRAINT Entries_FK01 FOREIGN KEY (acceptedEventClassId)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Entries ADD CONSTRAINT Entries_FK02 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Entries ADD CONSTRAINT Entries_FK03 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Entries ADD CONSTRAINT Entries_FK04 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RelayEntriesOrganisations ADD CONSTRAINT RelayEntriesOrganisations_FK01 FOREIGN KEY  (entryId)
    REFERENCES Entries (entryId)
;
ALTER TABLE RelayEntriesOrganisations ADD CONSTRAINT RelayEntriesOrganisations_FK00 FOREIGN KEY  (organisationId)
    REFERENCES Organisations (organisationId)
;
ALTER TABLE RelayEntriesOrganisations ADD CONSTRAINT RelayEntriesOrganisations_FK02 FOREIGN KEY  (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EntriesEntryFees ADD CONSTRAINT EntriesEntryFees_FK00 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EntriesEntryFees ADD CONSTRAINT EntriesEntryFees_FK01 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EntriesEntryFees ADD CONSTRAINT EntriesEntryFees_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EntriesEntryFees ADD CONSTRAINT EntriesEntryFees_FK03 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK00 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK01 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK03 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE TeamEntrysCompetitorsEntryFees ADD CONSTRAINT TeamEntrysCompetitorsEntryFees_FK04 FOREIGN KEY (teamEntryCompetitorId)
    REFERENCES TeamEntrysCompetitors (teamEntryCompetitorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EntryFees ADD CONSTRAINT EntryFees_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EntryFees ADD CONSTRAINT EntryFees_FK01 FOREIGN KEY (seasonId)
    REFERENCES Seasons (seasonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EntrysClasses ADD CONSTRAINT EntrysClasses_FK00 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EntrysClasses ADD CONSTRAINT EntrysClasses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventClassEntryFees ADD CONSTRAINT EventClassEntryFees_FK00 FOREIGN KEY (entryFeeId)
    REFERENCES EntryFees (entryFeeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClassEntryFees ADD CONSTRAINT EventClassEntryFees_FK01 FOREIGN KEY (eventClassId)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClassEntryFees ADD CONSTRAINT EventClassEntryFees_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClassEntryFees ADD CONSTRAINT EventClassEntryFees_FK03 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX EventClassesExternalId ON EventClasses (externalId)
;
ALTER TABLE EventClasses ADD CONSTRAINT EventClasses_FK00 FOREIGN KEY (classTypeId)
    REFERENCES ClassTypes (classTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClasses ADD CONSTRAINT EventClasses_FK01 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClasses ADD CONSTRAINT EventClasses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventClassesProperties ADD CONSTRAINT EventClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventClassesProperties ADD CONSTRAINT EventClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventClassificationTypes ADD CONSTRAINT EventClassificationTypes_FK00 FOREIGN KEY  (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventAttributes ADD CONSTRAINT EventAttributes_FK00 FOREIGN KEY (parentOrganisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventAttributes ADD CONSTRAINT EventAttributes_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventStatuses ADD CONSTRAINT EventStatuses_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventOfficials ADD CONSTRAINT EventOfficials_FK00 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventOfficials ADD CONSTRAINT EventOfficials_FK01 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventOfficials ADD CONSTRAINT EventOfficials_FK02 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventOfficials ADD CONSTRAINT EventOfficials_FK03 FOREIGN KEY (roleTypeId)
    REFERENCES RoleTypes (roleTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventOfficials ADD CONSTRAINT EventOfficials_FK04 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventsProperties ADD CONSTRAINT EventsProperties_FK00 FOREIGN KEY (id)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsProperties ADD CONSTRAINT EventsProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RoleTypes ADD CONSTRAINT RoleTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventRaces ADD CONSTRAINT EventRaces_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventRaces ADD CONSTRAINT EventRaces_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Events ADD CONSTRAINT Events_FK00 FOREIGN KEY (defaultBadgeGroup)
    REFERENCES BadgeGroups (badgeGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Events ADD CONSTRAINT Events_FK01 FOREIGN KEY (eventClassificationTypeId)
    REFERENCES EventClassificationTypes (eventClassificationTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Events ADD CONSTRAINT Events_FK02 FOREIGN KEY (eventStatusId)
    REFERENCES EventStatuses (eventStatusId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Events ADD CONSTRAINT Events_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventsTelecoms ADD CONSTRAINT EventsTelecoms_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsTelecoms ADD CONSTRAINT EventsTelecoms_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventsAddresses ADD CONSTRAINT EventsAddresses_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsAddresses ADD CONSTRAINT EventsAddresses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsAddresses ADD CONSTRAINT EventsAddresses_FK02 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventClassTypes ADD CONSTRAINT EventClassTypes_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventClassTypes ADD CONSTRAINT EventClassTypes_FK01 FOREIGN KEY (classTypeId)
    REFERENCES ClassTypes (classTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventAlternativeDates ADD CONSTRAINT EventAlternativeDates_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventsDisciplines ADD CONSTRAINT EventsDisciplines_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsDisciplines ADD CONSTRAINT EventsDisciplines_FK01 FOREIGN KEY (disciplineId)
    REFERENCES Disciplines (disciplineId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE EventsEventAttributes ADD CONSTRAINT EventsEventAttributes_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE EventsEventAttributes ADD CONSTRAINT EventsEventAttributes_FK01 FOREIGN KEY (eventAttributeId)
    REFERENCES EventAttributes (eventAttributeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Logotypes ADD CONSTRAINT Logotypes_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE MembersOfOrganisation ADD CONSTRAINT MembersOfOrganisation_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE MembersOfOrganisation ADD CONSTRAINT MembersOfOrganisation_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE MembersOfOrganisation ADD CONSTRAINT MembersOfOrganisation_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE MembersOfOrganisation ADD CONSTRAINT MembersOfOrganisation_FK03 FOREIGN KEY (roleTypeId)
    REFERENCES RoleTypes (roleTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK00 FOREIGN KEY (fromPersonId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK01 FOREIGN KEY (toPersonId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK02 FOREIGN KEY (toOrganisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK03 FOREIGN KEY (toOrganisationTypeId)
    REFERENCES OrganisationTypes (organisationTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK04 FOREIGN KEY (toRoleTypeId)
    REFERENCES RoleTypes (roleTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Notifications ADD CONSTRAINT Notifications_FK05 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE NumberedServices ADD CONSTRAINT NumberedServices_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE NumberedServices ADD CONSTRAINT NumberedServices_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK00 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK01 FOREIGN KEY (organisationTypeId)
    REFERENCES OrganisationTypes (organisationTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Organisations ADD CONSTRAINT Organisations_FK03 FOREIGN KEY (organisationStatusId)
    REFERENCES OrganisationStatuses (organisationStatusId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationsAllocationGroups ADD CONSTRAINT OrganisationsAllocationGroups_FK00 FOREIGN KEY (allocationGroupId)
    REFERENCES AllocationGroups (allocationGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsAllocationGroups ADD CONSTRAINT OrganisationsAllocationGroups_FK01 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsAllocationGroups ADD CONSTRAINT OrganisationAllocationGroups_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX OrganisationIds_id ON OrganisationIds (organisationIdsTypeId,externalId)
;

ALTER TABLE OrganisationIds ADD CONSTRAINT OrganisationIds_FK00 FOREIGN KEY (organisationIdsTypeId)
    REFERENCES OrganisationIdTypes (organisationIdsTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationIds ADD CONSTRAINT OrganisationIds_FK01 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationIds ADD CONSTRAINT OrganisationIds_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationIdTypes ADD CONSTRAINT OrganisationIdTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationTypes ADD CONSTRAINT OrganisationTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationStatuses ADD CONSTRAINT OrganisationStatuses_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
    
ALTER TABLE OrganisationsAddresses ADD CONSTRAINT OrganisationsAddresses_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsAddresses ADD CONSTRAINT OrganisationsAddresses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsAddresses ADD CONSTRAINT OrganisationsAddresses_FK02 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationsProperties ADD CONSTRAINT OrganisationsProperties_FK00 FOREIGN KEY (id)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsProperties ADD CONSTRAINT OrganisationsProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisationsTelecoms ADD CONSTRAINT OrganisationsTelecoms_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisationsTelecoms ADD CONSTRAINT OrganisationsTelecoms_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE OrganisersOfEvents ADD CONSTRAINT OrganisersOfEvents_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisersOfEvents ADD CONSTRAINT OrganisersOfEvents_FK01 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE OrganisersOfEvents ADD CONSTRAINT OrganisersOfEvents_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX PersonsFirstName ON Persons (firstName)
;
CREATE INDEX PersonsOrganisationId ON Persons (defaultOrganisationId)
;
ALTER TABLE Persons ADD CONSTRAINT Persons_FK00 FOREIGN KEY (nationalityId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Persons ADD CONSTRAINT Persons_FK01 FOREIGN KEY (VIPType)
    REFERENCES VIPTypes (VIPTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Persons ADD CONSTRAINT Persons_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX OrganisationId ON PersonsOrganisations (organisationId)
;
CREATE INDEX PersonsId ON PersonsOrganisations (personId)
;
ALTER TABLE PersonsOrganisations ADD CONSTRAINT PersonsOrganisations_FK00 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsOrganisations ADD CONSTRAINT PersonsOrganisations_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsOrganisations ADD CONSTRAINT PersonsOrganisations_FK02 FOREIGN KEY (personRoleId)
    REFERENCES PersonRoles (personRoleId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsOrganisations ADD CONSTRAINT PersonsOrganisations_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PersonsProperties ADD CONSTRAINT PersonsProperties_FK00 FOREIGN KEY (id)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsProperties ADD CONSTRAINT PersonsProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX OrganisationTypeId ON PersonRoles(organisationTypeId)
;
ALTER TABLE PersonRoles ADD CONSTRAINT PersonRoles_FK00 FOREIGN KEY (organisationTypeId)
    REFERENCES OrganisationTypes (organisationTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonRoles ADD CONSTRAINT PersonRoles_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX PersonIds_ids ON PersonIds(personIdsTypeId,externalId)
;
ALTER TABLE PersonIds ADD CONSTRAINT PersonIds_FK00 FOREIGN KEY (personIdsTypeId)
    REFERENCES PersonIdTypes (personIdsTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonIds ADD CONSTRAINT PersonIds_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonIds ADD CONSTRAINT PersonIds_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PersonIdTypes ADD CONSTRAINT PersonIdTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PersonsAddresses ADD CONSTRAINT PersonsAddresses_FK00 FOREIGN KEY (countryId)
    REFERENCES Countries (countryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsAddresses ADD CONSTRAINT PersonsAddresses_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsAddresses ADD CONSTRAINT PersonsAddresses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PersonsTelecoms ADD CONSTRAINT PersonsTelecoms_FK00 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PersonsTelecoms ADD CONSTRAINT PersonsTelecoms_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PressList ADD CONSTRAINT PressList_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PressList ADD CONSTRAINT PressList_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PressListClasses ADD CONSTRAINT PressListClasses_FK00 FOREIGN KEY (pressListId)
    REFERENCES PressList (pressListId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PressListClasses ADD CONSTRAINT PressListClasses_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PressListOrganisations ADD CONSTRAINT PressListOrganisations_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PressPersons ADD CONSTRAINT PressPersons_FK00 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PressPersons ADD CONSTRAINT PressPersons_FK01 FOREIGN KEY (pressId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PressPersons ADD CONSTRAINT PressPersons_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PunchingEntries ADD CONSTRAINT PunchingEntries_FK00 FOREIGN KEY (result)
    REFERENCES Results (resultId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PunchingEntries ADD CONSTRAINT PunchingEntries_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PunchingUnits ADD CONSTRAINT PunchingUnits_FK00 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PunchingUnits ADD CONSTRAINT PunchingUnits_FK01 FOREIGN KEY (owner)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PunchingUnits ADD CONSTRAINT PunchingUnits_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RaceClassCourses ADD CONSTRAINT RaceClassCourses_FK00 FOREIGN KEY (courseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClassCourses ADD CONSTRAINT RaceClassCourses_FK01 FOREIGN KEY (raceClassId)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClassCourses ADD CONSTRAINT RaceClassCourses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClassCourses ADD CONSTRAINT RaceClassCourses_FK03 FOREIGN KEY (restartCourseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX RaceClassesEventClassId ON RaceClasses (eventClassId)
;
CREATE INDEX RaceClassesEventRaceId ON RaceClasses (eventRaceId)
;
CREATE INDEX RaceClassesFirstStartTime ON RaceClasses (firstStartTime)
;
ALTER TABLE RaceClasses ADD CONSTRAINT RaceClasses_FK00 FOREIGN KEY (badgeGroupId)
    REFERENCES BadgeGroups (badgeGroupId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClasses ADD CONSTRAINT RaceClasses_FK01 FOREIGN KEY (eventClassId)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClasses ADD CONSTRAINT RaceClasses_FK02 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClasses ADD CONSTRAINT RaceClasses_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RaceClassesProperties ADD CONSTRAINT RaceClassesProperties_FK00 FOREIGN KEY (id)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RaceClassesProperties ADD CONSTRAINT RaceClassesProperties_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RaceClassSplitTimeControls ADD CONSTRAINT RaceClassSplitTimeControl_FK00 FOREIGN KEY (raceClassId)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClassSplitTimeControls ADD CONSTRAINT RaceClassSplitTimeControl_FK01 FOREIGN KEY (splitTimeControlId)
    REFERENCES Controls (controlId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RaceClassSplitTimeControls ADD CONSTRAINT RaceClassSplitTimeControl_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RankingLists ADD CONSTRAINT RankingLists_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Rankings ADD CONSTRAINT Rankings_FK00 FOREIGN KEY (rankingListId)
    REFERENCES RankingLists (rankingListId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Rankings ADD CONSTRAINT Rankings_FK01 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Rankings ADD CONSTRAINT Rankings_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RawDataFromElectronicPunchingCards ADD CONSTRAINT RawDataFromElectronicPunc_FK00 FOREIGN KEY (eventRace)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RawDataFromElectronicPunchingCards ADD CONSTRAINT RawDataFromElectronicPunc_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE RawPunches ADD CONSTRAINT RawPunches_FK00 FOREIGN KEY (rawCardId)
    REFERENCES RawDataFromElectronicPunchingCards (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE RawPunches ADD CONSTRAINT RawPunches_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

CREATE INDEX ResultsAllocatedStartTime ON Results (allocatedStartTime)
;
CREATE INDEX ResultsElectronicPunchingCardId ON Results (electronicPunchingCardId)
;
CREATE INDEX ResultsEntryId ON Results(entryId)
;
CREATE INDEX ResultsModifyDate ON Results (modifyDate)
;
CREATE INDEX ResultsRaceClassId ON Results (raceClassId)
;
CREATE INDEX ResultsRunnerStatus ON Results (runnerStatus)
;
ALTER TABLE Results ADD CONSTRAINT Results_FK00 FOREIGN KEY (individualCourseId)
    REFERENCES Courses (courseId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Results ADD CONSTRAINT Results_FK01 FOREIGN KEY (electronicPunchingCardId)
    REFERENCES ElectronicPunchingCards (cardId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Results ADD CONSTRAINT Results_FK02 FOREIGN KEY (entryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Results ADD CONSTRAINT Results_FK03 FOREIGN KEY (raceClassId)
    REFERENCES RaceClasses (raceClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Results ADD CONSTRAINT Results_FK04 FOREIGN KEY (relayPersonId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Results ADD CONSTRAINT Results_FK05 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ResultCompetitors ADD CONSTRAINT ResultCompetitors_FK00 FOREIGN KEY (resultId)
    REFERENCES Results (resultId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ResultCompetitors ADD CONSTRAINT ResultCompetitors_FK01 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ResultCompetitors ADD CONSTRAINT ResultCompetitors_FK02 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;   
CREATE INDEX ServiceRequestsPersonId ON ServiceRequests (personId)
;
CREATE INDEX ServiceRequestsServiceId ON ServiceRequests (serviceId)
;
ALTER TABLE ServiceRequests ADD CONSTRAINT ServiceRequests_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ServiceRequests ADD CONSTRAINT ServiceRequests_FK01 FOREIGN KEY (serviceId)
    REFERENCES Services (serviceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ServiceRequests ADD CONSTRAINT ServiceRequests_FK02 FOREIGN KEY (resultId)
    REFERENCES Results (resultId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ServiceRequests ADD CONSTRAINT ServiceRequests_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Services ADD CONSTRAINT Services_FK00 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Services ADD CONSTRAINT Services_FK01 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Services ADD CONSTRAINT Services_FK02 FOREIGN KEY (serviceTypeId)
    REFERENCES ServiceTypes (serviceTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ServiceFees ADD CONSTRAINT ServiceFees_FK00 FOREIGN KEY (serviceId)
    REFERENCES Services (serviceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ServicesNames ADD CONSTRAINT ServicesNames_FK00 FOREIGN KEY (id)
    REFERENCES Services (serviceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ServiceTypesNames ADD CONSTRAINT ServiceTypesNames_FK00 FOREIGN KEY (id)
    REFERENCES ServiceTypes (serviceTypeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
    
CREATE INDEX SplitTimesModifyDate ON SplitTimes(modifyDate)
;
CREATE INDEX SplitTimesTimingControl ON SplitTimes(timingControl)
; 
CREATE INDEX SplitTimesResultRaceIndividualNumber ON SplitTimes (resultRaceIndividualNumber)
;
ALTER TABLE SplitTimes ADD CONSTRAINT SplitTimes_FK00 FOREIGN KEY (resultRaceIndividualNumber)
    REFERENCES Results (resultId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE SplitTimes ADD CONSTRAINT SplitTimes_FK01 FOREIGN KEY (timingControl)
    REFERENCES Controls (controlId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE SplitTimes ADD CONSTRAINT SplitTimes_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE TeamEntrysCompetitors ADD CONSTRAINT TeamEntrysCompetitors_FK00 FOREIGN KEY (teamEntryId)
    REFERENCES Entries (entryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE TeamEntrysCompetitors ADD CONSTRAINT TeamEntrysCompetitors_FK02 FOREIGN KEY (competitorId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE TeamEntrysCompetitors ADD CONSTRAINT TeamEntrysCompetitors_FK03 FOREIGN KEY (organisationId)
    REFERENCES Organisations (organisationId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE TeamEntrysCompetitors ADD CONSTRAINT TeamEntrysCompetitors_FK04 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Transactions ADD CONSTRAINT Transactions_FK01 FOREIGN KEY (eventId)
    REFERENCES Events (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Transactions ADD CONSTRAINT Transactions_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE UserRights ADD CONSTRAINT UserRights_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Users ADD CONSTRAINT Users_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Users ADD CONSTRAINT Users_FK01 FOREIGN KEY (personId)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Version ADD CONSTRAINT Version_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE VIPTypes ADD CONSTRAINT VIPTypes_FK00 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PreDirectEntry ADD CONSTRAINT PreDirectEntry_FK01 FOREIGN KEY (eventClassId)
    REFERENCES EventClasses (eventClassId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE PreDirectEntry ADD CONSTRAINT PreDirectEntry_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PreDirectEntryResults ADD CONSTRAINT PreDirectEntryResults_FK01 FOREIGN KEY (preDirectEntryId)
    REFERENCES PreDirectEntry (preDirectEntryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE PreDirectEntryResults ADD CONSTRAINT PreDirectEntryResults_FK02 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE Bonuses ADD CONSTRAINT Bonuses_FK01 FOREIGN KEY (eventRaceId)
    REFERENCES EventRaces (eventRaceId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE Bonuses ADD CONSTRAINT Bonuses_FK02 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

ALTER TABLE ResultBonuses ADD CONSTRAINT ResultBonuses_FK01 FOREIGN KEY (bonusId)
    REFERENCES Bonuses (bonusId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ResultBonuses ADD CONSTRAINT ResultBonuses_FK02 FOREIGN KEY (resultId)
    REFERENCES Results (resultId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;
ALTER TABLE ResultBonuses ADD CONSTRAINT ResultBonuses_FK03 FOREIGN KEY (modifiedBy)
    REFERENCES Persons (personId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;

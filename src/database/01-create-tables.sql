
CREATE TABLE  Clients(
    ClientID SERIAL Primary Key,
    ClientCode VARCHAR(10),
    ClientName VARCHAR(30)
);

CREATE TABLE Participants(
    ParticipantID SERIAL Primary Key,
    EmployeeID VARCHAR(20),
    ClientID INT,
    FirstName Varchar(50),
    LastName Varchar(50),
    DateOfHire DATE,
    DateOfTermination DATE,
    CreateDate TimeStamp Default CURRENT_TIMESTAMP,
    Foreign key (ClientID) references  Clients(ClientID)
);

CREATE TYPE relationship AS ENUM ('Spouse', 'Child', 'Best Buddy');

CREATE TABLE Dependents(
    DependentID SERIAL Primary key,
    ParticipantID INT,
    DepRelationship relationship,
    DateOfBirth DATE,
    DepNotes Text,
    CreateDate TimeStamp Default CURRENT_TIMESTAMP,
    Foreign key (ParticipantID) references Participants(ParticipantID)
);

-- Coverage Section
Create Table Benefits (
    BenefitID SERIAL Primary Key,
    BenefitName varchar(50)
);

Create Table Carriers (
    CarrierID SERIAL Primary key,
    CarrierName varchar(50)
);

Create Table BenefitCoverage(
    BenefitCoverageID SERIAL Primary key,
    ParticipantID int,
    BenefitID int,
    CarrierID int,
    EmployeeCost money,
    EmpoloyerCost money,
    StartDate date,
    EndDate date,
    CreateDate TimeStamp default CURRENT_TIMESTAMP,
    Foreign key (ParticipantID) references Participants(ParticipantID),
    Foreign key (BenefitID) references Benefits(BenefitID),
    Foreign key (CarrierID) references Carriers(CarrierID)
);

CREATE TYPE Formats AS ENUM ('csv', 'tsv', 'fixed', 'json');

Create Table CoverageReport(
    ReportID serial Primary key,
    CarrierID int,
    ReportName varchar(50),
    ReportFileName varchar(50),
    ReportFormat Formats,
    Foreign key (CarrierID) references Carriers(CarrierID)
);

CREATE TYPE inboundTypes AS ENUM ('Participant', 'Dependent', 'BenefitCoverage');


Create Table InboundReports(
    InboundDataID serial Primary key,
    ClientID int,
    InbountDataType inboundTypes,
    InboundFormat Formats,
    Foreign key (ClientID) references Clients(ClientID)
);






-- Inserting Client Data

INSERT INTO Clients (ClientCode, ClientName )
VALUES 
    ('MSFT', 'Microsoft'),
    ('AMZN', 'Amazon'),
    ('MCDNLD', 'McDonalds'),
    ('STRBKS', 'Starbuccks'),
    ('TWTR', 'Twitter'),
    ('DSNY ', 'Disney'),
    ('APL', 'Apple');

-- Inserting Participant Data

INSERT INTO Participants(EmployeeID, ClientID, FirstName, LastName, DateOfHire )
Values
    ('393849', 2, 'Warren', 'Wrate', '2025-03-24'),
    ('373848', 2, 'Parker', 'Wrate', '2020-01-21'),
    ('283739', 2, 'Addison', 'Wrate', '2021-12-23'),
    ('283742', 2, 'Homer', 'Simpson', '2022-02-12'),
    ('847363', 2, 'Donald', 'Duck', '2023-06-28'),
    ('748493', 2, 'Marge', 'Simpson', '2024-08-03'),
    ('193846', 2, 'Benny', 'Johnson', '2021-09-07'),
    ('394743', 2, 'Elon', 'Musk', '2023-04-14'),
    ('039487', 2, 'Happy', 'Gilmore', '2017-07-17'),
    ('173254', 2, 'Bill', 'Gates', '2015-05-22'),
    ('839487', 2, 'Hulk', 'Hogan', '2022-04-29'),
    ('846343', 2, 'Jack', 'Black', '2024-03-02'),
    ('463543', 2, 'Tank', 'The-Dog', '2025-02-11');


-- Inserting Dependent Data

INSERT INTO Dependents(ParticipantID, DepRelationship, DateOfBirth)
Values
    ( 2, 'Spouse',  '1990-02-14'),
    ( 7, 'Spouse',  '1987-01-28'),
    ( 1, 'Child',  '2019-04-07'),
    ( 8, 'Spouse',  '1992-01-29'),
    ( 4, 'Spouse',  '1988-07-04'),
    ( 5, 'Child',  '2017-03-24'),
    ( 9, 'Spouse',  '1990-08-11'),
    ( 8, 'Child',  '2012-12-12'),
    ( 2, 'Child',  '2009-07-05'),
    ( 4, 'Child',  '2015-04-24');


Insert into Benefits ( BenefitName)
Values ('Medical'),
        ('Dental'),
        ('Vision');

insert into Carriers (CarrierName )
values ('Kaiser'),
        ('Blue Cross Blue Shield'),
        ('Aetna'),
        ('Cigna'),
        ('Delta Dental'),
        ('VSP'),
        ('Anthem');

insert into BenefitCoverage(ParticipantID,BenefitID,CarrierID ,EmployeeCost,EmpoloyerCost, StartDate)
values  (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12'),
        (1, 1, 1, 280, 500.00, '2022-10-12');

insert into CoverageReport(CarrierID,ReportName,ReportFileName, ReportFormat)
values 
(1, 'Medical Covrage', 'med_coverage.csv', 'csv'),
(1, 'Dental Covrage', 'dental_coverage.tsv', 'tsv'),
(1, 'Vision Covrage', 'vision_coverage.txt', 'fixed'),
(1, 'Happy Medical Covrage', 'happy_med.json', 'json'),
(1, 'Super Medical Covrage', 'super_med.txt', 'fixed'),
(1, 'Awesome Medical Covrage', 'awesome_med.tsv', 'tsv');

insert into InboundReports(ClientID, InbountDataType, InboundFormat)
values (1, 'Participant', 'csv'),
        (1, 'Dependent', 'csv'),
        (1, 'BenefitCoverage', 'csv'),
        (2, 'Participant', 'tsv'),
        (2, 'Dependent', 'tsv'),
        (2, 'BenefitCoverage', 'tsv');
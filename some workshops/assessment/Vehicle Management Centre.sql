create database VMC;
USE VMC;

create table vehicles (
VehicleNo int primary key,
VehicleType varchar(25),
VehicleModel varchar(25),
MileageRate int
);

create table department (
DepartmentID int primary key,
DepartmentName varchar(25),
DepartmentManager varchar(25)
);

create table faculty_member(
MemberID int primary key,
MemberName varchar(25),
Gender varchar(25),
DepartmentID int,
foreign key (DepartmentID) references department (DepartmentID)
);

create table reservation(
ReservationID int primary key,
ExpectedDepartureDate date,
Destination varchar(25),
TransportType varchar(25),
VehicleNo int,
DepartmentID int,
MemberID int,
foreign key (VehicleNo) references Vehicles(VehicleNo),
foreign key (DepartmentID) references department (DepartmentID),
foreign key (MemberID) references faculty_member(MemberID)
);

create table trip (
TripID int primary key,
Departure date,
Checkout datetime,
OdometerReading int,
ReservationID int,
foreign key (ReservationID) references reservation(ReservationID)
);

create table fuel(
FuelID int primary key,
Liters int,
CreditCardNo varchar(30),
TripID int,
foreign key (TripID) references trip (TripID)
);

create table bill(
BillNo int primary key,
TripID int,
DepartmentID int,
Amount int,
foreign key (TripID) references trip (TripID),
foreign key (DepartmentID) references department (DepartmentID)
);

create table maintenance(
MaintenanceID int primary key,
MaintenanceDate varchar(25),
MaintenanceType varchar(25),
Description text,
VehicleEntryDate date,
VehicleExitDate date,
Mechanic varchar(25),
VehicleNo int,
foreign key (VehicleNo) references Vehicles(VehicleNo)
);
create table parts(
PartID int primary key,
PartName varchar(25),
PartQuantity int
);

create table MaintenanceParts(
MaintenancePartID int primary key,
PartID int,
MaintenanceID int,
Quantity int,
foreign key (PartID) references Parts(PartID),
foreign key (MaintenanceID) references Maintenance(MaintenanceID)
);

INSERT INTO `vehicles` (`VehicleNo`, `VehicleType`, `VehicleModel`, `MileageRate`) VALUES ('321', 'SUV', '2029', '9');
INSERT INTO `vehicles` (`VehicleNo`, `VehicleType`, `VehicleModel`, `MileageRate`) VALUES ('123', 'AWD', '2022', '15');
INSERT INTO `vehicles` (`VehicleNo`, `VehicleType`, `VehicleModel`, `MileageRate`) VALUES ('312', 'FWD', '2021', '13');
INSERT INTO `vehicles` (`VehicleNo`, `VehicleType`, `VehicleModel`, `MileageRate`) VALUES ('349', 'Sedan', '2023', '10');
INSERT INTO `vehicles` (`VehicleNo`, `VehicleType`, `VehicleModel`, `MileageRate`) VALUES ('752', 'Sedan', '2021', '10');

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentManager`) VALUES ('1', 'Management', 'David');
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentManager`) VALUES ('2', 'Computer', 'Leo');
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentManager`) VALUES ('3', 'Psycology', 'Eve');
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentManager`) VALUES ('4', 'Bio Science', 'John');

INSERT INTO `faculty_member` (`MemberID`, `MemberName`, `Gender`, `DepartmentID`) VALUES ('11', 'Ahmed Ali', 'Male', '1');
INSERT INTO `faculty_member` (`MemberID`, `MemberName`, `Gender`, `DepartmentID`) VALUES ('12', 'David Warner', 'Male', '2');
INSERT INTO `faculty_member` (`MemberID`, `MemberName`, `Gender`, `DepartmentID`) VALUES ('13', 'Jet Lee', 'Male', '3');
INSERT INTO `faculty_member` (`MemberID`, `MemberName`, `Gender`, `DepartmentID`) VALUES ('14', 'Angela white', 'Female', '1');
INSERT INTO `faculty_member` (`MemberID`, `MemberName`, `Gender`, `DepartmentID`) VALUES ('15', 'Emma Mag', 'Female', '2');

INSERT INTO `reservation` (`ReservationID`, `ExpectedDepartureDate`, `Destination`, `TransportType`, `VehicleNo`, `DepartmentID`, `MemberID`) VALUES ('101', '2023-01-01', 'Texas', 'Lecture', '321', '1', '11');
INSERT INTO `reservation` (`ReservationID`, `ExpectedDepartureDate`, `Destination`, `TransportType`, `VehicleNo`, `DepartmentID`, `MemberID`) VALUES ('102', '2023-01-02', 'LA', 'Seminar', '123', '2', '12');
INSERT INTO `reservation` (`ReservationID`, `ExpectedDepartureDate`, `Destination`, `TransportType`, `VehicleNo`, `DepartmentID`, `MemberID`) VALUES ('103', '2023-01-10', 'Hill Town', 'Conference', '123', '2', '12');
INSERT INTO `reservation` (`ReservationID`, `ExpectedDepartureDate`, `Destination`, `TransportType`, `VehicleNo`, `DepartmentID`, `MemberID`) VALUES ('104', '2023-01-20', 'lay land', 'Lecture', '349', '3', '13');
INSERT INTO `reservation` (`ReservationID`, `ExpectedDepartureDate`, `Destination`, `TransportType`, `VehicleNo`, `DepartmentID`, `MemberID`) VALUES ('105', '2023-01-03', 'LA', 'Seminar', '123', '2', '12');

INSERT INTO `trip` (`TripID`, `Departure`, `Checkout`, `OdometerReading`, `ReservationID`) VALUES ('201', '2023-01-01', '2023-01-01', '120', '101');
INSERT INTO `trip` (`TripID`, `Departure`, `Checkout`, `OdometerReading`, `ReservationID`) VALUES ('202', '2023-01-02', '2023-01-02', '100', '102');
INSERT INTO `trip` (`TripID`, `Departure`, `Checkout`, `OdometerReading`, `ReservationID`) VALUES ('203', '2023-01-10', '2023-01-10', '50', '103');

INSERT INTO `fuel` (`FuelID`, `Liters`, `CreditCardNo`, `TripID`) VALUES ('11', '12', '1223453321', '201');

INSERT INTO `bill` (`BillNo`, `TripID`, `DepartmentID`, `Amount`) VALUES ('111', '201', '1', '231');
INSERT INTO `bill` (`BillNo`, `TripID`, `DepartmentID`, `Amount`) VALUES ('112', '202', '2', '111');
INSERT INTO `bill` (`BillNo`, `TripID`, `DepartmentID`, `Amount`) VALUES ('113', '203', '2', '80');

INSERT INTO `maintenance` (`MaintenanceID`, `MaintenanceDate`, `MaintenanceType`, `Description`, `VehicleEntryDate`, `VehicleExitDate`, `Mechanic`, `VehicleNo`) VALUES ('101', '2023-01-01', 'checking', 'normal checking', '2023-01-01', '2023-01-02', 'John jashson', '123');
INSERT INTO `maintenance` (`MaintenanceID`, `MaintenanceDate`, `MaintenanceType`, `Description`, `VehicleEntryDate`, `VehicleExitDate`, `Mechanic`, `VehicleNo`) VALUES ('102', '2023-01-03', 'tuning', 'tuning filter oil', '2023-01-03', '2023-01-05', 'John jashson', '321');

INSERT INTO `parts` (`PartID`, `PartName`, `PartQuantity`) VALUES ('1', 'Oil', '10');
INSERT INTO `parts` (`PartID`, `PartName`, `PartQuantity`) VALUES ('2', 'filter', '20');
INSERT INTO `parts` (`PartID`, `PartName`, `PartQuantity`) VALUES ('3', 'belts', '10');

INSERT INTO `maintenanceparts` (`MaintenancePartID`, `PartID`, `MaintenanceID`, `Quantity`) VALUES ('1', '2', '102', '1');

-- Display all available vehicles on a given date.
select * from vehicles where VehicleNo in (select VehicleNo from reservation where ExpectedDepartureDate='2023-01-02');

-- Display how many vehicles each department has used so far.
select r.DepartmentID,count(r.VehicleNo) as VehiclesUsed from  reservation  r 
inner join trip t on (r.ReservationID=t.ReservationID) 
group by r.DepartmentID;

-- Display the total mileage driven by a department this year.
select r.DepartmentID,sum(t.OdometerReading) as total_mileage from  reservation r 
inner join trip t on (r.ReservationID=t.ReservationID) 
where year(r.ExpectedDepartureDate)='2023'
group by r.DepartmentID;

-- Show details of a particular bill.
select * from bill where BillNo=112;

-- Display those who booked vehicles but not actually used them.
select MemberID,DepartmentID,VehicleNo from reservation where ReservationID not in (select ReservationID from trip where Departure<now());
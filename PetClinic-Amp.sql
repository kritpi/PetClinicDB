CREATE TABLE `Customer` (
  `Customer_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Id_Customer` varchar(13) NOT NULL,
  `Customer_Fname` text NOT NULL,
  `Customer_Sname` text NOT NULL,
  `Tel_number_Owner` varchar(10) NOT NULL,
  `Address` text NOT NULL
);

CREATE TABLE `Pet` (
  `HN` varchar(255) PRIMARY KEY NOT NULL,
  `Category` text NOT NULL,
  `Breed` text NOT NULL,
  `Pet_Name` text NOT NULL,
  `Bitrh_Date` date NOT NULL,
  `Sex` enum(M,FM) NOT NULL,
  `Allergy` text NOT NULL,
  `Congenital_Disease` text NOT NULL,
);

CREATE TABLE `Has_Allergy` (
  `HN` varchar(255) PRIMARY KEY NOT NULL,
  `Allergic_Thing` text NOT NULL
);

CREATE TABLE `Has_Congenital_Disease` (
  `HN` varchar(255) PRIMARY KEY NOT NULL,
  `Congenital_Disease_Thing` text NOT NULL
);

CREATE TABLE `Employee` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Employee_Fname` text NOT NULL,
  `Employee_Sname` text NOT NULL,
  `Id_card_Employee` varchar(255) NOT NULL,
  `Salary` float NOT NULL,
  `Tel_Number_Employee` varchar(10) NOT NULL,
  `Address` text NOT NULL,
  `Position_Id` varchar(255) NOT NULL
);

CREATE TABLE `Position` (
  `Position_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Position_Name` text NOT NULL,
  `DF_Value` float
);

CREATE TABLE `Medicine` (
  `Medicine_Id` varchar(255) PRIMARY KEY,
  `Medicine_Name` text NOT NULL,
  `Price` float NOT NULL,
  `Usage` text NOT NULL,
  `Dose` float NOT NULL,
  `Expiration_Date` date NOT NULL
);

CREATE TABLE `Medicine_Info` (
  `Medicine_name` text PRIMARY KEY NOT NULL,
  `Medicine_Detail` text NOT NULL
);

CREATE TABLE `Prescription` (
  `Prescription_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Quantity` int NOT NULL
);

CREATE TABLE Treatment(
	Treatment_Id varchar(255) Primary Key,
	CC text NOT NULL,
	Date_treatment date NOT NULL,
	Cure_Detail text NOT NULL,
	Severity varchar(255) NOT NULL,
	"Type" varchar(3) NOT NULL,
	"Temp" varchar(10) NOT NULL,
	HN varchar(255) NOT NULL,
	Employee_Id varchar(255) NOT NULL
);

CREATE TABLE IPD(
	AN varchar(255) Primary Key,
	Ward_Id varchar(255) NOT NULL,
	Date_Check_In date NOT NULL,
	Date_Check_Out date NOT NULL,
	Treatment_Id varchar(255) NOT NULL
);

CREATE TABLE Appointment(
	Appointment_Id varchar(255) Primary Key,
	Date_Appointment date NOT NULL,
	Appointment_Detail text NOT NULL,
	Status text NOT NULL,
	Treatment_Id varchar(255) NOT NULL
);

CREATE TABLE Stayed_By(
	Room_Id int,
	Date_Check_In date NOT NULL,
	Date_Check_Out date NOT NULL,
	HN varchar(255) NOT NULL
);

CREATE TABLE Hotel_Room(
	Room_Id int Primary Key,
	Room_Price int NOT NULL,
	Employee_Id varchar(255) NOT NULL
);

CREATE TABLE Grooming(
	Grooming_Id varchar(255) Primary Key,
	Groom_Date date NOT NULL,
	Groom_Detail text NOT NULL,
	Grooming_Price int NOT NULL,
	Employee_Id varchar(255) NOT NULL
);


ALTER TABLE `Has_Allergy` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Has_Congenital_Disease` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`Position_Id`) REFERENCES `Position` (`Position_Id`);

ALTER TABLE `Medicine_Info` ADD FOREIGN KEY (`Medicine_name`) REFERENCES `Medicine` (`Medicine_Name`);

ALTER TABLE Treatment ADD CONSTRAINT check_type CHECK(("Temp" IN ('OPD', 'IPD')));

ALTER TABLE IPD ADD FOREIGN KEY(Treatment_Id) REFERENCES Treatment(Treatment_Id);

ALTER TABLE Appointment ADD FOREIGN KEY(Treatment_Id) REFERENCES Treatment(Treatment_Id);

ALTER TABLE Stayed_By ADD PRIMARY KEY(Room_Id, HN);

ALTER TABLE Hotel_Room ADD FOREIGN KEY(Employee_Id) REFERENCES Employee(Employee_Id);

ALTER TABLE Grooming ADD FOREIGN KEY(Employee_Id) REFERENCES Employee(Employee_Id);


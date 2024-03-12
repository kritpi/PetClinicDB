CREATE TABLE `Customer` (
  `Customer_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Id_Customer` varchar(13) NOT NULL,
  `Customer_Fname` text NOT NULL,
  `Customer_Sname` text NOT NULL,
  `Tel_number_Owner` varchar(10) NOT NULL,
  `Customer_address` text NOT NULL
);

CREATE TABLE `Pet` (
  `HN` varchar(255) PRIMARY KEY NOT NULL,
  `Category` text NOT NULL,
  `Breed` text NOT NULL,
  `Pet_Name` text NOT NULL,
  `Birthdate` DATE NOT NULL, 
  `Sex` ENUM('M','F') NOT NULL,  
  `Weight` float NOT NULL
);

CREATE TABLE `Has_Allergy` (
  `HN` varchar(255) NOT NULL,
  `Allergic_Thing` varchar(255) NOT NULL
);

CREATE TABLE `Has_Congenital_Disease` (
  `HN` varchar(255) NOT NULL,
  `Congenital_Disease_Thing` varchar(255) NOT NULL
);

CREATE TABLE `Employee` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Employee_Fname` text NOT NULL,
  `Employee_Sname` text NOT NULL,
  `Id_card_Employee` varchar(255) NOT NULL,
  `Salary` float NOT NULL,
  `Tel_Number_Employee` varchar(10) NOT NULL,
  `Employee_Address` text NOT NULL,
  `Position` text NOT NULL
);

CREATE TABLE `Doctor` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL,
  `DF` float NOT NULL
);

CREATE TABLE `Groomer` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL
);

CREATE TABLE `Staff` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL
);

CREATE TABLE `Medicine` (
  `Medicine_Id` varchar(255) PRIMARY KEY,
  `Medicine_Name` varchar(255) NOT NULL,
  `Medicine_Price` float NOT NULL,
  `Usage` text NOT NULL,
  `Dose` float NOT NULL,
  `Expiration_Date` date NOT NULL
);

CREATE TABLE `Medicine_Info` (
  `Medicine_Name` varchar(255) PRIMARY KEY,
  `Medicine_Detail` text NOT NULL
);

CREATE TABLE `Prescription` (
  `Prescription_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Prescription_Date` date NOT NULL,  
  `Quantity` int NOT NULL
);

CREATE TABLE `Treatment` (
  `Treatment_Id` varchar(255) PRIMARY KEY,
  `CC` text NOT NULL,
  `Date_treatment` date NOT NULL,
  `Cure_Detail` text NOT NULL,
  `Severity` varchar(255) NOT NULL,
  `Type` varchar(3) NOT NULL,
  `Temp` varchar(10) NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Employee_Id` varchar(255) NOT NULL
);

CREATE TABLE `IPD` (
  `AN` varchar(255) PRIMARY KEY,
  `Ward_Id` varchar(255) NOT NULL,
  `Date_Check_In` date NOT NULL,
  `Date_Check_Out` date NOT NULL,
  `Treatment_Id` varchar(255) NOT NULL
);

CREATE TABLE `Appointment` (
  `Appointment_Id` varchar(255) PRIMARY KEY,
  `Date_Appointment` date NOT NULL,
  `Appointment_Detail` text NOT NULL,
  `Status` text NOT NULL,
  `Treatment_Id` varchar(255) NOT NULL
);

CREATE TABLE `Staying_Session` (
  `Stay_Id` varchar(255) PRIMARY KEY,
  `Room_Id` int NOT NULL,
  `Room_Price` float NOT NULL,
  `Date_Check_In` date NOT NULL,
  `Date_Check_Out` date NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Employee_Id` varchar(255) NOT NULL,
  `Receipt_stay_id` varchar(255) NOT NULL
);

CREATE TABLE `Grooming` (
  `Grooming_Id` varchar(255) PRIMARY KEY,
  `Groom_Date` date NOT NULL,
  `Groom_Detail` text NOT NULL,
  `Grooming_Price` int NOT NULL,
  `Employee_Id` varchar(255) NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Receipt_Grooming_id` varchar(255) NOT NULL
);

CREATE TABLE `Allergy` (
  `Allergic_Thing` varchar(255) PRIMARY KEY
);

CREATE TABLE `Congenital_Disease` (
  `Congenital_disease_thing` varchar(255) PRIMARY KEY
);

CREATE TABLE `Receipt_Grooming` (
  `Receipt_Grooming_id` varchar(255) PRIMARY KEY,
  `Total_Grooming_charges` float NOT NULL,
  `Payment_Grooming_Date` datetime NOT NULL,
  `Grooming_Id` varchar(255) NOT NULL
);

CREATE TABLE `Receipt_Stay` (
  `Receipt_stay_id` varchar(255) PRIMARY KEY,
  `Total_Stay_charges` float NOT NULL,
  `Payment_Stay_Date` datetime NOT NULL
);

CREATE TABLE `Receipt_Treatment` (
  `Receipt_Treatment_id` varchar(255) PRIMARY KEY,
  `Total_Treatment_charges` float NOT NULL,
  `Payment_Treatment_Date` datetime NOT NULL,
  `Treatment_Id` varchar(255) NOT NULL
);

CREATE TABLE `Own` (
  `Customer_id` varchar(255) NOT NULL,
  `HN` varchar(255) NOT NULL
);

CREATE TABLE `Dispensing` (
  `Prescription_Id` varchar(255) NOT NULL,
  `Medicine_Id` varchar(255) NOT NULL,
  `Treatment_Id` varchar(255) NOT NULL
);

ALTER TABLE `Own` ADD FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_Id`);

ALTER TABLE `Own` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Treatment` ADD CONSTRAINT check_type CHECK((`Temp` IN ('OPD', 'IPD')));

ALTER TABLE `Dispensing` ADD PRIMARY KEY (`Prescription_Id`,`Medicine_Id`);

ALTER TABLE `Dispensing` ADD FOREIGN KEY (`Treatment_Id`) REFERENCES `Treatment` (`Treatment_Id`);

ALTER TABLE `Dispensing` ADD FOREIGN KEY (`Medicine_Id`) REFERENCES `Medicine` (`Medicine_Id`);

ALTER TABLE `Dispensing` ADD FOREIGN KEY (`Prescription_Id`) REFERENCES `Prescription` (`Prescription_Id`);

ALTER TABLE `Receipt_Treatment` ADD FOREIGN KEY (`Treatment_Id`) REFERENCES `Treatment` (`Treatment_Id`);

ALTER TABLE `Staying_Session` ADD FOREIGN KEY (`Receipt_stay_id`) REFERENCES `Receipt_Stay` (`Receipt_stay_id`);

ALTER TABLE `Grooming` ADD FOREIGN KEY (`Receipt_Grooming_id`) REFERENCES `Receipt_Grooming` (`Receipt_Grooming_id`);

ALTER TABLE `Treatment` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Has_Allergy` ADD PRIMARY KEY (`HN`, `Allergic_Thing`);

ALTER TABLE `Has_Allergy` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Has_Allergy` ADD FOREIGN KEY (`Allergic_Thing`) REFERENCES `Allergy` (`Allergic_Thing`);

ALTER TABLE `Has_Congenital_Disease` ADD PRIMARY KEY (`HN`, `Congenital_Disease_Thing`);

ALTER TABLE `Has_Congenital_Disease` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Has_Congenital_Disease` ADD FOREIGN KEY (`Congenital_Disease_Thing`) REFERENCES `Congenital_Disease` (`Congenital_Disease_Thing`);

ALTER TABLE `Doctor` ADD FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`);

ALTER TABLE `Groomer` ADD FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`);

ALTER TABLE `Staff` ADD FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`);

ALTER TABLE `Medicine` ADD FOREIGN KEY (`Medicine_Name`) REFERENCES `Medicine_Info` (`Medicine_Name`);

ALTER TABLE `IPD` ADD FOREIGN KEY (`Treatment_Id`) REFERENCES `Treatment` (`Treatment_Id`);

ALTER TABLE `Appointment` ADD FOREIGN KEY (`Treatment_Id`) REFERENCES `Treatment` (`Treatment_Id`);

ALTER TABLE `Grooming` ADD FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`);

ALTER TABLE `Grooming` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Staying_Session` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Staying_Session` ADD FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`);

ALTER TABLE `Staying_Session` ADD FOREIGN KEY (`Receipt_stay_id`) REFERENCES `Receipt_Stay` (`Receipt_stay_id`);
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
  `Owner` varchar(255) NOT NULL
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

ALTER TABLE `Pet` ADD FOREIGN KEY (`Owner`) REFERENCES `Customer` (`Customer_Id`);

ALTER TABLE `Has_Allergy` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Has_Congenital_Disease` ADD FOREIGN KEY (`HN`) REFERENCES `Pet` (`HN`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`Position_Id`) REFERENCES `Position` (`Position_Id`);

ALTER TABLE `Medicine_Info` ADD FOREIGN KEY (`Medicine_name`) REFERENCES `Medicine` (`Medicine_Name`);

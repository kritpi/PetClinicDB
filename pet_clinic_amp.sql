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
  `Sex` enum('M','FM') NOT NULL,
  `Allergy` text NOT NULL,
  `Congenital_Disease` text NOT NULL,
  `Owner` varchar(255) NOT NULL
);
ALTER TABLE `Pet` ADD FOREIGN KEY (`Owner`) REFERENCES `Customer` (`Customer_Id`);

CREATE TABLE `Employee` (
  `Employee_Id` varchar(255) PRIMARY KEY NOT NULL,
  `Employee_Fname` text NOT NULL,
  `Employee_Sname` text NOT NULL,
  `Id_card_Employee` varchar(255) NOT NULL,
  `Salary` float NOT NULL,
  `Tel_Number_Employee` varchar(10) NOT NULL,
  `Address` text NOT NULL,
  `Position` enum(Doctor,Groomer,Staff) NOT NULL,
  `Doctor_DF` float
);



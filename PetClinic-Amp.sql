CREATE TABLE `CUSTOMER` (
  `Customer_id` varchar(255) PRIMARY KEY NOT NULL,
  `Id_card_customer` varchar(13) NOT NULL,
  `Customer_fname` text NOT NULL,
  `Customer_sname` text NOT NULL,
  `Tel_number_owner` varchar(11) NOT NULL,
  `Customer_address` text NOT NULL
);

CREATE TABLE `PET` (
  `HN` varchar(255) PRIMARY KEY NOT NULL,
  `Category` text NOT NULL,
  `Breed` text NOT NULL,
  `Pet_name` text NOT NULL,
  `Birthdate` date NOT NULL,
  `Sex` ENUM ('M', 'FM') NOT NULL,
  `Weight` varchar(9) NOT NULL
);

CREATE TABLE `HAS_ALLERGY` (
  `HN` varchar(255) NOT NULL,
  `Allergic_thing` varchar(255) NOT NULL,
  PRIMARY KEY (`HN`, `Allergic_thing`)
);

CREATE TABLE `HAS_CONGENITAL_DISEASE` (
  `HN` varchar(255) NOT NULL,
  `Congenital_disease_thing` varchar(255) NOT NULL,
  PRIMARY KEY (`HN`, `Congenital_disease_thing`)
);

CREATE TABLE `EMPLOYEE` (
  `Employee_id` varchar(255) PRIMARY KEY NOT NULL,
  `Employee_fname` text NOT NULL,
  `Employee_sname` text NOT NULL,
  `Id_card_employee` varchar(13) NOT NULL,
  `Salary` float NOT NULL,
  `Tel_number_employee` varchar(11) NOT NULL,
  `Employee_address` text NOT NULL,
  `Position` ENUM('Staff', 'Doctor', 'Groomer') NOT NULL
);

CREATE TABLE `DOCTOR` (
  `Employee_id` varchar(255) PRIMARY KEY NOT NULL,
  `DF` float NOT NULL
);

CREATE TABLE `GROOMER` (
  `Employee_id` varchar(255) PRIMARY KEY NOT NULL
);

CREATE TABLE `STAFF` (
  `Employee_id` varchar(255) PRIMARY KEY NOT NULL
);

CREATE TABLE `MEDICINE` (
  `Medicine_id` varchar(255) PRIMARY KEY,
  `Medicine_name` varchar(255) NOT NULL,
  `Medicine_price` float NOT NULL,
  `Usage` text NOT NULL,
  `Dose` varchar(10) NOT NULL,
  `Expiration_date` date NOT NULL
);

CREATE TABLE `MEDICINE_INFO` (
  `Medicine_name` varchar(255) PRIMARY KEY,
  `Medicine_detail` text NOT NULL
);

CREATE TABLE `PRESCRIPTION` (
  `Prescription_id` varchar(255) PRIMARY KEY NOT NULL,
  `Prescription_date` date NOT NULL,
  `Quantity` varchar(10) NOT NULL
);

CREATE TABLE `TREATMENT` (
  `Treatment_id` varchar(255) PRIMARY KEY,
  `CC` text NOT NULL,
  `Date_treatment` date NOT NULL,
  `Cure_detail` text NOT NULL,
  `Severity` varchar(255) NOT NULL,
  `Type` ENUM ('OPD', 'IPD') NOT NULL,
  `Temp` varchar(10) NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Employee_id` varchar(255) NOT NULL
);

CREATE TABLE `IPD` (
  `AN` varchar(255) PRIMARY KEY,
  `Ward_id` varchar(255) NOT NULL,
  `Date_check_in_ipd` date NOT NULL,
  `Date_check_out_ipd` date NOT NULL,
  `Treatment_id` varchar(255) NOT NULL
);

CREATE TABLE `APPOINTMENT` (
  `Appointment_id` varchar(255) PRIMARY KEY,
  `Date_appointment` date NOT NULL,
  `Appointment_detail` text NOT NULL,
  `Status` text NOT NULL,
  `Treatment_id` varchar(255) NOT NULL
);

CREATE TABLE `STAYING_SESSION` (
  `Stay_id` varchar(255) PRIMARY KEY,
  `Room_id` int NOT NULL,
  `Room_price` float NOT NULL,
  `Date_check_in_stay` date NOT NULL,
  `Date_check_out_stay` date NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Employee_id` varchar(255) NOT NULL,
  `Receipt_stay_id` varchar(255) NOT NULL
);

CREATE TABLE `GROOMING` (
  `Grooming_id` varchar(255) PRIMARY KEY,
  `Groom_date` date NOT NULL,
  `Groom_detail` text NOT NULL,
  `Grooming_price` float NOT NULL,
  `Employee_id` varchar(255) NOT NULL,
  `HN` varchar(255) NOT NULL,
  `Receipt_grooming_id` varchar(255) NOT NULL
);

CREATE TABLE `ALLERGY` (
  `Allergic_thing` varchar(255) PRIMARY KEY
);

CREATE TABLE `CONGENITAL_DISEASE` (
  `Congenital_disease_thing` varchar(255) PRIMARY KEY
);

CREATE TABLE `RECEIPT_GROOMING` (
  `Receipt_grooming_id` varchar(255) PRIMARY KEY,
  `Total_grooming_charges` float NOT NULL,
  `Payment_grooming_date` datetime NOT NULL,
  `Grooming_id` varchar(255) NOT NULL
);

CREATE TABLE `RECEIPT_STAY` (
  `Receipt_stay_id` varchar(255) PRIMARY KEY,
  `Total_stay_charges` float NOT NULL,
  `Payment_stay_date` datetime NOT NULL
);

CREATE TABLE `RECEIPT_TREATMENT` (
  `Receipt_treatment_id` varchar(255) PRIMARY KEY,
  `Total_treatment_charges` float NOT NULL,
  `Payment_treatment_date` datetime NOT NULL,
  `Treatment_id` varchar(255) NOT NULL
);

CREATE TABLE `OWN` (
  `Customer_id` varchar(255) NOT NULL,
  `HN` varchar(255) NOT NULL
);

CREATE TABLE `DISPENSING` (
  `Prescription_id` varchar(255) NOT NULL,
  `Medicine_id` varchar(255) NOT NULL,
  `Treatment_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Prescription_id`, `Medicine_id`)
);

ALTER TABLE `OWN` ADD FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`);

ALTER TABLE `OWN` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `DISPENSING` ADD FOREIGN KEY (`Treatment_id`) REFERENCES `TREATMENT` (`Treatment_id`);

ALTER TABLE `DISPENSING` ADD FOREIGN KEY (`Medicine_id`) REFERENCES `MEDICINE` (`Medicine_id`);

ALTER TABLE `DISPENSING` ADD FOREIGN KEY (`Prescription_id`) REFERENCES `PRESCRIPTION` (`Prescription_id`);

ALTER TABLE `RECEIPT_TREATMENT` ADD FOREIGN KEY (`Treatment_id`) REFERENCES `TREATMENT` (`Treatment_id`);

ALTER TABLE `GROOMING` ADD FOREIGN KEY (`Receipt_grooming_id`) REFERENCES `RECEIPT_GROOMING` (`Receipt_grooming_id`);

ALTER TABLE `TREATMENT` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `HAS_ALLERGY` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `HAS_ALLERGY` ADD FOREIGN KEY (`Allergic_thing`) REFERENCES `ALLERGY` (`Allergic_thing`);

ALTER TABLE `HAS_CONGENITAL_DISEASE` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `HAS_CONGENITAL_DISEASE` ADD FOREIGN KEY (`Congenital_disease_thing`) REFERENCES `CONGENITAL_DISEASE` (`Congenital_disease_thing`);

ALTER TABLE `DOCTOR` ADD FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`);

ALTER TABLE `GROOMER` ADD FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`);

ALTER TABLE `STAFF` ADD FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`);

ALTER TABLE `MEDICINE` ADD FOREIGN KEY (`Medicine_name`) REFERENCES `MEDICINE_INFO` (`Medicine_name`);

ALTER TABLE `IPD` ADD FOREIGN KEY (`Treatment_id`) REFERENCES `TREATMENT` (`Treatment_id`);

ALTER TABLE `APPOINTMENT` ADD FOREIGN KEY (`Treatment_id`) REFERENCES `TREATMENT` (`Treatment_id`);

ALTER TABLE `GROOMING` ADD FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`);

ALTER TABLE `GROOMING` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `STAYING_SESSION` ADD FOREIGN KEY (`HN`) REFERENCES `PET` (`HN`);

ALTER TABLE `STAYING_SESSION` ADD FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`);

ALTER TABLE `STAYING_SESSION` ADD FOREIGN KEY (`Receipt_stay_id`) REFERENCES `RECEIPT_STAY` (`Receipt_stay_id`);

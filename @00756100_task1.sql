-- creating a database
DROP DATABASE IF EXISTS Hospital

CREATE DATABASE Hospital

-- Use Database Hospital
USE Hospital

--Creating tables

--creating patient table, contains whole details regarding a patient.
DROP TABLE IF EXISTS Patients

CREATE TABLE Patients(PatientID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
MiddleName VARCHAR(100) NULL,
LastName VARCHAR(100) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(50) NULL,
Address VARCHAR(250) NOT NULL,
City NVARCHAR(50) NULL,
Postcode VARCHAR(10) NOT NULL,
Country VARCHAR(50) NOT NULL,
UserName VARCHAR(100) UNIQUE NOT NULL,
Password VARCHAR(50) UNIQUE NOT NULL,
Insurance VARCHAR(100),
TelephoneNO VARCHAR(100) NULL,
email VARCHAR(100) UNIQUE NULL CHECK(email LIKE '%@%'),)

--creating department table, Contains details regarding department
DROP TABLE IF EXISTS Department

CREATE TABLE Department(DepartmentID INT NOT NULL PRIMARY KEY,
DepartmentName VARCHAR(100) NOT NULL)

--creating doctor table, contains all information regarding doctor
DROP TABLE IF EXISTS Doctor

CREATE TABLE Doctor(DoctorID INT NOT NULL IDENTITY (10000,1) PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
MiddleName VARCHAR(100) NULL,
LastNAme VARCHAR(100) NOT NULL,
DepartmentID INT NOT NULL,
Speciality VARCHAR(100)NOT NULL,
Username VARCHAR(100) NOT NULL,
Password VARCHAR(100) NOT NULL)

--creating appointment table, this table contains or will store the newer or pending appointments
DROP TABLE IF EXISTS PendingAppointment

CREATE TABLE PendingAppointment(AppointmentID INT NOT NULL  PRIMARY KEY,
AppointmentTime TIME NOT NULL UNIQUE,
AppointmentDate DATE NOT NULL,
PatientID INT NOT NULL,
DepartmentID INT NOT NULL,
DoctorID INT NOT NULL,
AppointmentStatus VARCHAR(50) NOT NULL,
PatientReview VARCHAR NULL)

--creating appointment table, this table contains the appointment datas that are compeleted 
DROP TABLE IF EXISTS Appointment

CREATE TABLE Appointment(AppointmentID INT NOT NULL  PRIMARY KEY,
AppointmentTime TIME NOT NULL ,
AppointmentDate DATE NOT NULL,
PatientID INT NOT NULL,
DepartmentID INT NOT NULL,
DoctorID INT NOT NULL,
AppointmentStatus VARCHAR(50) NOT NULL,
PatientReview VARCHAR(150))

--creating medical records table, contains all details regarding the patients medical records.
DROP TABLE IF EXISTS Medical_Records

CREATE TABLE Medical_Records(MedicalRecordID INT NOT NULL IDENTITY (30000,1) PRIMARY KEY,
PastAppointments INT NULL,
Diagnosis VARCHAR(100) NULL,
MedPriscribedDate DATE NULL,
Medicine VARCHAR(200) NULL,
Alergies VARCHAR(100) NULL,
PatientID INT NOT NULL,
DoctorID INT NOT NULL,
PatientLeftDate DATE NULL)

--assigning foreign keys

ALTER TABLE Appointment ADD FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
ALTER TABLE Appointment ADD FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
ALTER TABLE PendingAppointment ADD FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
ALTER TABLE PendingAppointment ADD FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
ALTER TABLE Appointment ADD FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
ALTER TABLE PendingAppointment ADD FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
ALTER TABLE Doctor ADD FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
ALTER TABLE Medical_Records ADD FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
ALTER TABLE Medical_Records ADD FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)

--inserting value into Patients
INSERT INTO Patients(FirstName, MiddleName, LastName, DOB, Gender, Address, City, Postcode, Country, UserName, Password, Insurance, TelephoneNO, email)
VALUES('Sophia',' Grace','Johnson','1988-07-14','Female', '987 Cedar Drive','Manchester','M14 5TA','United Kingdom','sophia123','sophia123','TH23456','776554432435','sophia.johnson@gmail.com'),
				('Ethan','James','Smith','2000-03-29','Male', '147 Birch Terrace','wigan','WN1 2BB','United Kingdom','Ethan123','Ethan123','TH23145','765456789','ethan.smith@gmail.com'),
				('Olivia' ,'Rose' ,'Martinez','1993-10-07','Female','258 Walnut Circle','Wigan','WN1 1ZL','United Kingdom','olivia123','olivia123','TH43215','6564678098','olivia.martinez@gmail.com'),
				('Liam' ,' ', 'Brown','1987-11-11','Male',' 7 Davison Terrace','Bolton','BO2 7GP','United Kingdom','liam123','liam123','HT4352425','32548562154','liam.brown@gmail.com'),
				('Ava' ,'Elizabeth' ,'Taylor','2008-02-01','Female',' 4 Trafalgar Road','Manchester','M16 6TF','United Kingdom','ava123','ava123','TH6789','8845621254','ava.taylor@gmail.com'),
				('Noah','Benjamin',' Anderson','1981-10-25','Male','795 Dogwood Avenue','Hindly','HL2 4TG','United Kingdom','noha123','noha123','TH65789','84652315','noah.anderson@gmail.com'),
				('Isabella',' ', 'Lee','2012-12-03','Female','684 Redwood Drive','Wigan','WN2 4RT','United Kingdom','isba123','isba123','TH43289','895462123','isabella.lee@gmail.com'),
				('Lucas', 'Michael', 'Harris','1983-03-03','Male','753 Cherry Lane','Bolton','BO4 5YU','United Kingdom','lucas123','lucas123','TH3412','456123645','lucas.harris@gmail.com'),
				('Mia' ,' ' ,'Jackson','2010-05-08','Female','852 Ash Street','Manchester','M06 6YY','United Kingdom','mia123','mia123','TH4590','7894512852','mia.jackson@gmail.com'),
				('Oliver', 'William' ,'White','2007-12-20','Female','963 Sycamore Boulevard','Wigan','WN3 5RD','United Kingdom','oliver123','oliver123','TH21098','965217538','oliver.white@gmail.com'),
				('Amelia','Sophia', 'Garcia','2005-01-17','Female','976 Acacia Lane','Wigan','WN1 4HG','United Kingdom','amelia123','amelia123','TH673433','7452852963','amelia.garcia@gmail.com'),
				('Elijah' ,'Daniel', 'Martinez','1996-09-30','Male','468 Willow Way','Bolton','BO8 5RF','United Kingdom','elijah123','elijah123','TH544E','123456789985','elijah.martinez@gmail.com'),
				('Harper', 'Grace', 'Robinson','1999-06-19','Female','357 Hickory Lane','Hindly','HL3 2DD','United Kingdom','harper123','harper123','TH5R443','752385639641','harper.robinson@gmail.com'),
				('Benjamin',' ' ,'Hall','1990-08-12','Male','159 Poplar Avenue','Manchester','M08 7YY','United Kingdom','benjamin123','benjamin123','TH776655','7485969455','benjamin.hall@gmail.com'),
				('Charlotte', 'Emily', 'Lewis','2015-09-02','Female','654 Pine Court','Hindly','HL4 4RR','United Kingdom','charlotte123','charlotte123','TH56478','5642184945','charlotte.lewis@gmail.com'),
				('Jackson' ,'Alexander', 'Clark','1978-04-28','Male','321 Maple Road','Manchester','M09 2AD','United Kingdom','jackson123','jackson123','TH4567','7418548521','jackson.clark@gmail.com'),
				('Evelyn','Grace' ,'Scott','1997-07-05','Female','369 Spruce Place','Wigan','WN4 3RG','United Kingdom','evelyn123','evelyn123','TH22990','754859221','evelyn.scott@gmail.com'),
				('Aiden' ,'Christopher', 'Allen','2002-02-22','Female','456 Elm Avenue-Suite 201','Wigan','WN5 6TT','United Kingdom','aiden123','aiden123','TH12786','748512639','aiden.allen@gmail.com'),
				('Mia' ,'Olivia', 'King','1985-11-15','Female','789 Oak Lane','Manchester','M06 7YJ','United Kingdom','miaoliv123','miaoliv123','TH3456I','7548669223','mia.king@gmail.com'),
				('Oliver', 'Matthew', 'Young','1989-04-10','Male','123 Main Street-Apt 101','Hindly','HL4 3BN','United Kingdom','matoliver123','matolivaer123','TH56221','5468221259','oliver.young@gmail.com')

SELECT * FROM Patients

--Inserting sample datas into department table

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES(1,'Cardiology'),
				(2,'Pediatrics'),
				(3,'Oncology'),
				(4,'Neurology'),
				(5,'Orthopedics'),
				(6,'Dermatology'),
				(7,'Gynecology'),
				(8,'Psychiatry'),
				(9,'Gasterology')

SELECT * FROM Department

--Inserting sample datas into the doctor table

INSERT INTO Doctor(FirstName, MiddleName, LastNAme, DepartmentID, Speciality, Username , Password)
VALUES ('Emily', 'Anne', 'Johnson',2,'Pediatric Cardiology','emily145','emil145'),
				('Benjamin', 'Michael', 'Smith',6,'Cosmetic Dermatology','ben234','ben234'),
				('Sophia' ,'Elizabeth', 'Martinez',1,'Interventional Cardiology','sopheliza234','sopheliza234'),
				('Christopher',' James',' Brown',3,'Surgical Oncology','chris234','chris234'),
				('Olivia',' Grace','Taylor',8,'Child and Adolescent Psychiatry','oliviagrace234','olivia234'),
				('William', 'Alexander', 'Anderson',4,'Neurosurgery','william234','william234'),
				('Ava','Marie','Lee',5,'Joint Replacement Surgery','ava234','ava234'),
				('Jacob','Daniel','Harris',7,'Gynecologic Oncology','jacob234','jacob234'),
				('Mia','Nicole','Jackson',9,'Gastroenterology','mianic234','mianic234'),
				('Ethan','Patrick','White',2,'Pediatric Oncology','ethan234','ethan234'),
				('Charlotte','Rose','Garcia',6,'Mohs Surgery','charlott234','charlotte234'),
				('Liam','Andrew','Martinez',5,'Sports Medicine','liam234','liam234'),
				('Isabella','Claire','Robinson',7,'Reproductive Endocrinology and Infertility','isabella234','isabella234'),
				('Lucas','Matthew','Hall',2,'General Pediatrics','luca234','luca234'),
				('Amelia','Katherine','Lewis',4,'Pediatric Neurology','amelia234','amelia234')

SELECT * FROM Doctor

-- Inserting Sample data into the PendingAppointment table.
--(## Please insert current date insted of the date 2024-04-20, which allows us to ruu the whole data base sucessfully##) )

INSERT INTO PendingAppointment(AppointmentID, AppointmentTime, AppointmentDate , PatientID, DepartmentID, DoctorID, AppointmentStatus,PatientReview )
VALUES(8,'09:00:00','2024-06-01',6,2,10000,'Pending',' '),
(9,'10:15:00','2024-06-01',7,5,10006,'Pending',' '),
(10,'12:30:00','2024-06-01',8,9,10008,'Pending',' '),
(11,'14:45:00','2024-06-01',9,7,10007,'Pending',' '),
(12,'16:00:00','2024-04-20',10,2,10013,'Pending',' '),
(13,'12:20:00','2024-06-03',11,4,10005,'Pending',' '),
(14,'09:45:00','2024-06-03',12,6,10010,'Pending',' '),
(15,'10:45:00','2024-06-04',12,3,10003,'Pending',' '),
(16,'13:30:00','2024-06-04',13,9,10008,'Pending',' '),
(17,'11:00:00','2024-06-04',14,8,10004,'Pending',' '),
(18,'18:00:00','2024-04-20',19,9,10008,'Pending',' ')

SELECT * FROM PendingAppointment

--Inserting sample datas into Appointment table

INSERT INTO Appointment(AppointmentID, AppointmentTime, AppointmentDate , PatientID, DepartmentID, DoctorID, AppointmentStatus, PatientReview )
VALUES (1,'09:00:00','2024-04-01',6,3,10003,'compeleted','Good'),
(2,'10:15:00','2024-04-01',7,5,10006,'compeleted','Good'),
(3,'12:30:00','2024-04-01',8,9,10008,'compeleted','Satisfactory'),
(4,'14:45:00','2024-04-01',9,7,10007,'compeleted','Poor'),
(5,'16:00:00','2024-04-01',10,2,10013,'compeleted','Good'),
(6,'12:20:00','2024-04-03',11,4,10005,'compeleted','Poor'),
(7,'09:45:00','2024-04-03',12,6,10010,'compeleted','Satisfactory'),
(8,'10:15:00','2024-04-04',19,9,10008,'compeleted','Good')

SELECT * FROM Appointment

--Inserting sample data into medical record table

INSERT INTO Medical_Records(PastAppointments,Diagnosis , MedPriscribedDate, Medicine , Alergies, PatientID ,DoctorID,PatientLeftDate)
VALUES(1,'Lung Cancer','2024-04-01','Paclitaxel,Erlotinib,Pembrolizumab,Bevacizumab','Pollen Allergy,Dust Mite Allergy',6,10003, NULL ),
				(2,'leg Fracture','2024-04-01','Acetaminophen',' ',7,10006, '2024-04-10'),
				(3,'Gastritis','2024-04-01','Methimazole', 'Mold Allergy',8,10008,NULL),
				(4,'Osteoporosis', '2024-04-01','Pantoprazole', 'Insect Sting Allergy',9,10007,  NULL),
				(5,'Feaver','2024-04-01','Salmeterol','Latex Allergy',10,10013, NULL ),
				(6,'Brain Tumor','2024-04-03','Zolpidem', ' ',11,10005, NULL ),
				(7,'Acne','2024-04-03','Benzoyl peroxide, Methimazole',' ',12,10010, NULL ),
				(8, 'Eczema', ' ',' ','Nickel Allergy',19, 10008, NULL )

SELECT * FROM Medical_Records


--2.Add the constraint to check that the appointment date is not in the past.

ALTER TABLE PendingAppointment ADD CONSTRAINT check_appodate CHECK (AppointmentDate >= CAST(GETDATE() AS DATE))

--3.List all the patients with older than 40 and have Cancer in diagnosis.

SELECT  p.PatientID,p.DOB, p.FirstName+' '+p.LastName as FullName, mr.Diagnosis 
FROM Patients as p JOIN Medical_Records as mr
ON p.PatientID = mr.PatientID 
WHERE DATEDIFF (YEAR, DOB, GETDATE()) > 40 AND mr.Diagnosis LIKE '%Cancer%' OR  mr.Diagnosis  LIKE '%cancer%'

--4.a.Search the database of the hospital for matching character strings by name of medicine. Results should be sorted with most recent medicine prescribed date first.
DROP PROCEDURE IF EXISTS SearchMedicine

CREATE PROCEDURE SearchMedicine 
	@Medicine VARCHAR(200)
AS
BEGIN
	SELECT MedicalRecordID,PatientID,Medicine, MedPriscribedDate FROM Medical_Records 
	WHERE Medicine LIKE '%' + @Medicine + '%' 
	ORDER BY MedPriscribedDate DESC
END


--Excecuting

EXEC SearchMedicine @Medicine='Methimazole'

--4.b.Return a full list of diagnosis and allergies for a specific patient who has an appointment today (i.e., the system date when the query is run)
DROP FUNCTION IF EXISTS GetPatientsDiagnosinsAndAllergies

CREATE FUNCTION GetPatientsDiagnosinsAndAllergies()
RETURNS TABLE
AS
RETURN
	SELECT p.PatientID, p.FirstName+' '+p.LastName AS Name,pa.AppointmentDate, mr.Diagnosis, mr.Alergies
	FROM Patients as p JOIN Medical_Records as mr ON p.PatientID= mr.PatientID
	JOIN PendingAppointment as pa ON p.PatientID= pa.PatientID 
	WHERE pa.AppointmentDate= CAST(GETDATE() as DATE)

--call the function

SELECT * FROM GetPatientsDiagnosinsAndAllergies()

--4.c.Update the details for an existing doctor
DROP PROCEDURE IF EXISTS UpdateDoctordetails

CREATE PROCEDURE UpdateDoctordetails
	@DoctorID INT, 
	@NewFirstName VARCHAR(100), 
	@NewMiddleName VARCHAR(100), 
	@NewLastName VARCHAR(100),
	@NewDepartmentID INT,
	@NewSpeciality VARCHAR(100),
	@NewUserName VARCHAR(100),
	@NewPassword VARCHAR(100)
AS
BEGIN
		UPDATE Doctor
		SET FirstName=@NewFirstName,
				MiddleName=@NewMiddleName,
				LastName=@NewLastName,
				DepartmentID=@NewDepartmentID,
				Speciality=@NewSpeciality,
				Username=@NewUsername,
				Password=@NewPassword
		WHERE DoctorID = @DoctorID
END

--Executing

EXEC UpdateDoctordetails @DoctorID=10007,
@NewFirstName='Mohammed',
@NewMiddleName='Adnan',
@NewLastName='Ebin',
@NewDepartmentID=3,
@NewSpeciality='Surgen',
@NewUserName='moadnan234',
@NewPassword='moadnan234'

SELECT * FROM Doctor
--4.d.Delete the appointment who status is already completed.

--we need to create a temporary table first, this is because we need this data for the next question
CREATE TABLE CompeletedAppointments (
   AppointmentID INT NOT NULL  PRIMARY KEY,
AppointmentTime TIME NOT NULL ,
AppointmentDate DATE NOT NULL,
PatientID INT NOT NULL,
DepartmentID INT NOT NULL,
DoctorID INT NOT NULL,
AppointmentStatus VARCHAR(50) NOT NULL,
PatientReview VARCHAR(150)
)

INSERT INTO CompeletedAppointments(AppointmentID, AppointmentTime, AppointmentDate , PatientID, DepartmentID, DoctorID, AppointmentStatus, PatientReview)
SELECT AppointmentID, AppointmentTime, AppointmentDate , PatientID, DepartmentID, DoctorID, AppointmentStatus, PatientReview
FROM Appointment
WHERE AppointmentStatus LIKE 'Compeleted' OR AppointmentStatus LIKE 'compeleted'


SELECT * FROM CompeletedAppointments

--now delete the appointment with the status compeleted

CREATE PROCEDURE DeleteCompeletedAppointment
AS
BEGIN
 DELETE FROM Appointment
 WHERE AppointmentStatus LIKE 'Compeleted' OR AppointmentStatus LIKE 'compeleted'
END

--executing
EXEC DeleteCompeletedAppointment

--to check weather the storedprocedure has executed correctly
SELECT * FROM Appointment

--5.To Create view, appointment date and time, showing all previous and current appointments for all doctors,
--and including details of the department (the doctor is associated with), 
--doctor’s specialty and any associate review/feedback given for a doctor.


CREATE VIEW CompeleteAppointmentDetails AS
SELECT AppointmentID, AppointmentDate, 
AppointmentTime, d.FirstName+' '+d.LastName AS DoctorName,d.Speciality, dp.DepartmentName, PatientReview
FROM (SELECT * FROM CompeletedAppointments
				UNION
				SELECT * FROM PendingAppointment )
AS FullAppointments 
JOIN Doctor d ON FullAppointments.DoctorID= d.DoctorID
JOIN Department dp ON FullAppointments.DepartmentID= dp.DepartmentID


SELECT * FROM CompeleteAppointmentDetails

--6.Create a trigger so that the current state of an appointment can be changed to available when it is cancelled.

CREATE TRIGGER UpdateCancelledAppointments
ON PendingAppointment
AFTER UPDATE
AS
BEGIN
 IF UPDATE(AppointmentStatus)
 BEGIN
	UPDATE PendingAppointment
	SET AppointmentStatus='Available'
	WHERE AppointmentStatus LIKE 'Cancelled' OR AppointmentStatus LIKE 'cancelled'
	END
END

UPDATE PendingAppointment SET AppointmentStatus = 'Cancelled' WHERE AppointmentID=12

SELECT * FROM PendingAppointment

--select statement to show the appointment date and time thats been changed to available.

SELECT d.FirstName+' '+d.LastName AS DoctorName, dp.DepartmentName, pa.AppointmentDate, pa.AppointmentTime, pa.AppointmentStatus
FROM PendingAppointment pa JOIN Doctor d ON pa.DoctorID=d.DoctorID 
JOIN Department dp ON pa.DepartmentID=dp.DepartmentID
WHERE pa.AppointmentStatus='Available'

--7.Write a select query which allows the hospital to identify the number of completed appointments with the specialty of doctors as ‘Gastroenterologists’.

SELECT COUNT(AppointmentStatus) AS NoofCompeletedAppointments
FROM CompeletedAppointments ca 
JOIN Doctor d ON ca.DoctorID = d.DoctorID
WHERE ca.AppointmentStatus = 'Compeleted'
AND d.Speciality = 'Gastroenterology'

--8.

--creating a trigger inorted to move the compeleted appointments to the appointment table

CREATE TRIGGER MoveCompletedAppointments
ON PendingAppointment
AFTER INSERT
AS
BEGIN
    INSERT INTO Appointment (AppointmentID, AppointmentTime, AppointmentDate, PatientID , DepartmentID, DoctorID, AppointmentStatus, PatientReview)
    SELECT AppointmentID, AppointmentTime, AppointmentDate, PatientID, DepartmentID, DoctorID, 'Complete', PatientReview
    FROM inserted
    WHERE AppointmentDate < CAST(GETDATE() AS DATE) OR (AppointmentDate = CAST(GETDATE() AS DATE) AND AppointmentTime < CAST(GETDATE() AS TIME))

    DELETE FROM PendingAppointment
    WHERE AppointmentID IN (SELECT AppointmentID FROM inserted WHERE AppointmentDate < CAST(GETDATE() AS DATE) 
	OR (AppointmentDate = CAST(GETDATE() AS DATE) AND AppointmentTime < CAST(GETDATE() AS TIME)))
END

--granding some access to doctors

CREATE ROLE doctors
GRANT SELECT, INSERT, UPDATE ON Medical_Records TO doctors 
GRANT SELECT ON Appointment TO doctors
GRANT SELECT ON PendingAppointment TO doctors

-- revoking the access to the former doctors that left the hospital.

CREATE ROLE Formerdoctors
REVOKE SELECT, INSERT, UPDATE ON Medical_Records From Formerdoctors
REVOKE SELECT ON Appointment TO Formerdoctors
REVOKE SELECT ON PendingAppointment TO Formerdoctors
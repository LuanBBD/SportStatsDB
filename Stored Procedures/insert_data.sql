USE Test_Chadley
IF EXISTS(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='Manager')
SET IDENTITY_INSERT Manager ON
INSERT INTO Manager (manager_id, first_name, last_name, date_of_birth, country_of_birth) VALUES
(3000,'Sean','Dyche','1971-06-28','England'),
(3001,'Jürgen','Klopp','1967-06-16','Germany'),
(3002,'Pep','Guardiola','1971-01-18','Spain'),
(3003,'Marcelo','Bielsa','1955-07-21','Argentina'),
(3004,'Thomas','Frank','1973-10-09','Denmark'),
(3005,'Ralph','Hasenhüttl','1967-08-09','Austria'),
(3006,'Brendan','Rodgers','1973-01-26','Northern Ireland'),
(3007,'Graham','Potter','1975-05-20','England'),
(3008,'Mikel','Arteta','1982-03-26','Spain'),
(3009,'David','Moyes','1963-04-25','Scotland'),
(3010,'Thomas','Tuchel','1973-08-29','Germany'),
(3011,'Bruno','Lage','1978-05-12','Portugal'),
(3012,'Patrick','Vieira','1976-06-23','France'),
(3013,'Antonio','Conte','1969-07-31','Italy'),
(3014,'Eddie','Howe','1977-11-29','England'),
(3015,'Steven','Gerrard','1980-05-30','England'),
(3016,'Dean','Smith','1971-03-19','England'),
(3017,'Ralf','Rangnick','1958-06-29','Germany'),
(3018,'Roy','Hodgson','1947-08-09','England'),
(3019,'Frank','Lampard','1978-06-20','England');
SET IDENTITY_INSERT Manager OFF
GO

SELECT * FROM Country;

USE Test_Chadley;

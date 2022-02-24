CREATE TABLE Stadium(
    stadium_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	stadium_name varchar (120) NOT NULL,
	stadium_capacity int NOT NULL,
);
GO
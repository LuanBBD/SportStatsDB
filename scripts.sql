USE master
IF EXISTS(select * from sys.databases where name='SportStatsDB')
DROP DATABASE SportStatsDB

CREATE DATABASE SportStatsDB;
GO

USE SportStatsDB;
GO

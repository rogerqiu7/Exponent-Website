-- create database
CREATE DATABASE IF NOT EXISTS exponent_devops_project;

-- create table in athena from s3 location
CREATE EXTERNAL TABLE IF NOT EXISTS exponent_devops_project.calculations (
    ID STRING,
    BaseNumber INT,
    CalculatedResult FLOAT,
    CalculationTime STRING,
    Exponent INT,
    FirstName STRING,
    LastName STRING
)
STORED AS TEXTFILE
LOCATION 's3://exponent-database-devops-project/AWSDynamoDB/01733918832383-64ea0dd4/data/'
TBLPROPERTIES (
    'compressionType'='gzip',
    'has_encrypted_data'='false'
);

-- check table
SELECT * FROM exponent_devops_project.calculations_cleaned;

-- extract values from json object
SELECT
    json_extract_scalar(id, '$.Item.ID.S') AS ID,
    json_extract_scalar(id, '$.Item.CalculationTime.S') AS CalculationTime,
    CAST(json_extract_scalar(id, '$.Item.BaseNumber.S') AS INT) AS BaseNumber,
    json_extract_scalar(id, '$.Item.FirstName.S') AS FirstName,
    json_extract_scalar(id, '$.Item.LastName.S') AS LastName,
    CAST(json_extract_scalar(id, '$.Item.CalculatedResult.S') AS DOUBLE) AS CalculatedResult,
    CAST(json_extract_scalar(id, '$.Item.Exponent.S') AS INT) AS Exponent
FROM exponent_devops_project.calculations
LIMIT 10;
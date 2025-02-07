-- DATA CLEANING
/* It is getting a set of data in a more useable format */
/* It is all about fixing issues with the raw data */

/* The first thing we did was to create a new schema called world_layoffs */

SELECT *
FROM layoffs;

-- STEPS
-- (1) Remove duplicates if there is any 
-- (2) Standardize the data
-- (3) Check out for Null or Blank values and populate if possible
-- (4) Remove or delete unnecessary rows or columns
-- (5) 

-- Note:
/* To work on this, the layoffs table has to be duplicated in order for staging to be done */
/* Down below is how it is done */


CREATE TABLE layoffs_staging
LIKE layoffs;

-- observation
/* This duplicates the format of the table, ie columns with their resepect names */

SELECT *
FROM layoffs_staging;

-- copying data from layoffs tabe to that of the staging's
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

-- observation
/* the row numbers aid us to knwo if there are any dup[licates */
/* if there is any, the number will be 2 */

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1; 

SELECT *
FROM layoffs_staging 
WHERE company = 'Oda';


SELECT @@sql_mode;

SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';

SET NAMES 'utf8mb4';

ALTER TABLE layoffs CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SHOW WARNINGS;

SELECT * FROM layoffs LIMIT 10000; 

SELECT COUNT(*) FROM layoffs;

SELECT *
FROM layoffs;



ALTER TABLE layoffs MODIFY COLUMN country VARCHAR(255);

ALTER TABLE layoffs MODIFY COLUMN total_laid_off BIGINT;

SELECT @@sql_mode;

SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';





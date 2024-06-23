-- 10
CREATE TABLE branch_traces_sample_10 AS 
SELECT * FROM branches LIMIT 10;

CREATE TABLE branch_frequency_sample_10 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_10
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_10 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_10
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_10 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_10;

-- 100

CREATE TABLE branch_traces_sample_100 AS 
SELECT * FROM branches LIMIT 100;
 = 55.295

CREATE TABLE branch_frequency_sample_100 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_100
GROUP BY branch_type;
 = 20.492

CREATE TABLE branch_taken_analysis_sample_100 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_100
GROUP BY branch_type;
 = 20.158

CREATE TABLE branch_taken_proportion_sample_100 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_100;
 = 14.036

-- 1000
CREATE TABLE branch_traces_sample_1000 AS 
SELECT * FROM branches LIMIT 1000;

CREATE TABLE branch_frequency_sample_1000 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_1000
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_1000 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_1000
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_1000 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_1000;

-- 10000
CREATE TABLE branch_traces_sample_10000 AS 
SELECT * FROM branches LIMIT 10000;

CREATE TABLE branch_frequency_sample_10000 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_10000
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_10000 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_10000
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_10000 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_10000;

-- 100000
CREATE TABLE branch_traces_sample_100000 AS 
SELECT * FROM branches LIMIT 100000;

CREATE TABLE branch_frequency_sample_100000 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_100000
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_100000 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_100000
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_100000 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_100000;

-- 1000000
CREATE TABLE branch_traces_sample_1000000 AS 
SELECT * FROM branches LIMIT 1000000;

CREATE TABLE branch_frequency_sample_1000000 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_1000000
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_1000000 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_1000000
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_1000000 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_1000000;

-- 10000000
CREATE TABLE branch_traces_sample_10000000 AS 
SELECT * FROM branches LIMIT 10000000;

CREATE TABLE branch_frequency_sample_10000000 AS
SELECT branch_type, COUNT(*) AS frequency
FROM branch_traces_sample_10000000
GROUP BY branch_type;

CREATE TABLE branch_taken_analysis_sample_10000000 AS
SELECT 
    branch_type, 
    COUNT(CASE WHEN taken = 1 THEN 1 END) AS taken_1_count, 
    COUNT(CASE WHEN taken = 0 THEN 1 END) AS taken_0_count, 
    COUNT(*) AS total_count
FROM branch_traces_sample_10000000
GROUP BY branch_type;

CREATE TABLE branch_taken_proportion_sample_10000000 AS
SELECT 
    branch_type, 
    taken_1_count / total_count AS taken_1_proportion
FROM branch_taken_analysis_sample_10000000;
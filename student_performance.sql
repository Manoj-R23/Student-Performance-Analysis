create table students(
gender varchar(10),
race_ethnicity varchar(10),
parental_education varchar(20),
lunch varchar(20),
test_preparation varchar(10),
math_score int,
reading_score int,
writing_score int
);

select * from students limit 10;

select count(*) as total_students from students;


select count(distinct gender) as genders,
COUNT(DISTINCT race_ethnicity) AS ethnicities,
    COUNT(DISTINCT parental_education) AS education_levels,
    COUNT(DISTINCT lunch) AS lunch_types,
    COUNT(DISTINCT test_preparation) AS test_prep_types
FROM students;


SELECT
    COUNT(*) - COUNT(gender) AS gender_nulls,
    COUNT(*) - COUNT(race_ethnicity) AS ethnicity_nulls,
    COUNT(*) - COUNT(parental_education) AS education_nulls,
    COUNT(*) - COUNT(lunch) AS lunch_nulls,
    COUNT(*) - COUNT(test_preparation) AS test_prep_nulls,
    COUNT(*) - COUNT(math_score) AS math_nulls,
    COUNT(*) - COUNT(reading_score) AS reading_nulls,
    COUNT(*) - COUNT(writing_score) AS writing_nulls
FROM students;

SELECT
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing,
    MIN(math_score) AS min_math,
    MAX(math_score) AS max_math,
    MIN(reading_score) AS min_reading,
    MAX(reading_score) AS max_reading,
    MIN(writing_score) AS min_writing,
    MAX(writing_score) AS max_writing
FROM students;

SELECT
    parental_education,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM students
GROUP BY parental_education
ORDER BY avg_math DESC;

SELECT
    test_preparation,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing,
    COUNT(*) AS total_students
FROM students
GROUP BY test_preparation
ORDER BY avg_math DESC;
		
SELECT
    ROUND(CORR(math_score, reading_score)::numeric, 2) AS math_reading_corr,
    ROUND(CORR(math_score, writing_score)::numeric, 2) AS math_writing_corr,
    ROUND(CORR(reading_score, writing_score)::numeric, 2) AS reading_writing_corr
FROM students;

SELECT
    gender,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing,
    COUNT(*) AS total_students
FROM students
GROUP BY gender
ORDER BY gender;

SELECT
    ROUND(AVG(math_score + reading_score + writing_score), 2) AS avg_total,
    MIN(math_score + reading_score + writing_score) AS min_total,
    MAX(math_score + reading_score + writing_score) AS max_total,
    ROUND(STDDEV(math_score + reading_score + writing_score), 2) AS std_total
FROM students;

SELECT
    COUNT(*) AS total_at_risk
FROM students
WHERE math_score < 50
   OR reading_score < 50
   OR writing_score < 50;

   SELECT
    gender,
    test_preparation,
    parental_education,
    COUNT(*) AS at_risk_count,
    ROUND(COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(), 2) AS percentage
FROM students
WHERE math_score < 50
   OR reading_score < 50
   OR writing_score < 50
GROUP BY gender, test_preparation, parental_education
ORDER BY at_risk_count DESC
LIMIT 10;

SELECT
    gender,
    COUNT(*) AS at_risk_count,
    ROUND(COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM students
         WHERE math_score < 50
            OR reading_score < 50
            OR writing_score < 50), 2) AS percentage
FROM students
WHERE math_score < 50
   OR reading_score < 50
   OR writing_score < 50
GROUP BY gender
ORDER BY at_risk_count DESC;

SELECT
    test_preparation,
    COUNT(*) AS at_risk_count,
    ROUND(COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM students
         WHERE math_score < 50
            OR reading_score < 50
            OR writing_score < 50), 2) AS percentage
FROM students
WHERE math_score < 50
   OR reading_score < 50
   OR writing_score < 50
GROUP BY test_preparation
ORDER BY at_risk_count DESC;

SELECT
    gender,
    race_ethnicity,
    parental_education,
    lunch,
    test_preparation,
    math_score,
    reading_score,
    writing_score,
    math_score + reading_score + writing_score AS total_score,
    CASE
        WHEN math_score < 50 OR reading_score < 50 OR writing_score < 50
        THEN 'At-Risk'
        ELSE 'Safe'
    END AS risk_status
FROM students
ORDER BY total_score DESC;
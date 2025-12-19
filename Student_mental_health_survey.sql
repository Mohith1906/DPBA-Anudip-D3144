use StudentMentalHealthSurvey;

SELECT COUNT(*) AS total_records FROM mentalhealthsurvey;

SELECT SUM(CASE WHEN depression IS NULL OR depression = '' THEN 1 ELSE 0 END) AS missing_depression FROM mentalhealthsurvey;

SELECT gender, COUNT(*) AS count FROM mentalhealthsurvey GROUP BY gender ORDER BY count DESC;

SELECT university, COUNT(*) AS students FROM mentalhealthsurvey GROUP BY university ORDER BY students DESC;

SELECT COUNT(*) AS total_records FROM mentalhealthsurvey;

SELECT gender, COUNT(*) AS count FROM mentalhealthsurvey GROUP BY gender ORDER BY count DESC;


SELECT university, COUNT(*) AS students FROM mentalhealthsurvey GROUP BY university ORDER BY students DESC;

#Total Records
SELECT COUNT(*) AS total_records FROM mentalhealthsurvey;

#Check NULL values (important for cleaning)
SELECT
    SUM(gender IS NULL) AS gender_nulls,
    SUM(age IS NULL) AS age_nulls,
    SUM(cgpa IS NULL) AS cgpa_nulls,
    SUM(average_sleep IS NULL) AS sleep_nulls
FROM mentalhealthsurvey;

#Distinct values check
SELECT DISTINCT gender FROM mentalhealthsurvey;

#Replace empty strings with NULL
UPDATE mentalhealthsurvey SET gender = NULL WHERE gender = '';

#Fix CGPA range
UPDATE mentalhealthsurvey SET cgpa = NULL WHERE cgpa < 0 OR cgpa > 10;

#Depression Count
SELECT depression, COUNT(*) AS total_students FROM mentalhealthsurvey GROUP BY depression;

#Anxiety by Gender
SELECT gender, COUNT(*) AS anxiety_cases
FROM mentalhealthsurvey WHERE anxiety > 3 GROUP BY gender;


#Sleep vs Mental Health
SELECT
    CASE
        WHEN average_sleep < 6 THEN 'Low Sleep'
        WHEN average_sleep BETWEEN 6 AND 7 THEN 'Moderate Sleep'
        ELSE 'Good Sleep'
    END AS sleep_category,
    COUNT(*) AS students
FROM mentalhealthsurvey
GROUP BY sleep_category;

#Academic Pressure Impact
SELECT academic_pressure, COUNT(*) AS total_students
FROM mentalhealthsurvey WHERE depression >= 3 GROUP BY academic_pressure ORDER BY academic_pressure DESC;

#Financial Concerns vs Stress
SELECT financial_concerns, COUNT(*) AS stressed_students FROM mentalhealthsurvey WHERE anxiety >=3 GROUP BY financial_concerns;

#Students with Multiple Mental Health Issues
SELECT * FROM mentalhealthsurvey WHERE depression >=3 AND anxiety >=3 AND isolation >=3 ;

#Sports Engagement Impact
SELECT sports_engagement, COUNT(*) AS total_students FROM mentalhealthsurvey GROUP BY sports_engagement;

#Average Sleep by Academic Year
SELECT academic_year, AVG(average_sleep) AS avg_sleep FROM mentalhealthsurvey GROUP BY academic_year;

#Gender distribution
SELECT gender, AVG(depression) AS avg_depression, AVG(anxiety) AS avg_anxiety FROM mentalhealthsurvey GROUP BY gender;

#Students per university
SELECT university, AVG(study_satisfaction) AS avg_study_satisfaction, AVG(academic_pressure) AS avg_academic_pressure,
AVG(depression) AS avg_depression, AVG(anxiety) AS avg_anxiety FROM mentalhealthsurvey GROUP BY university ORDER BY 
avg_depression DESC;


#Average depression/anxiety by gender
SELECT average_sleep,COUNT(*) AS respondents, AVG(depression) AS avg_depression, AVG(anxiety) AS avg_anxiety FROM 
mentalhealthsurvey GROUP BY average_sleep ORDER BY avg_depression DESC;

#Average scores by university
SELECT sports_engagement, COUNT(*) AS respondents, AVG(depression) AS avg_depression FROM mentalhealthsurvey GROUP BY 
sports_engagement ORDER BY avg_depression DESC;

#Sleep vs depression
SELECT * FROM mentalhealthsurvey WHERE depression >= 4;


#Sports vs depression
SELECT count(depression) AS students_depressed FROM mentalhealthsurvey  WHERE depression >= 4 and sports_engagement <3;
SELECT count(depression) AS students_depressed FROM mentalhealthsurvey  WHERE depression >= 4 group by sports_engagement;
#High depression (score ≥ 4)
SELECT count(depression) AS students_depressed FROM mentalhealthsurvey  WHERE depression >= 4 group by stress_relief_activities;
 
 #Overall mental‑health risk score
SELECT *,(depression + anxiety + isolation + future_insecurity) AS mental_health_risk FROM mentalhealthsurvey;


#Categorize CGPA bands numerically 
SELECT *, CASE cgpa WHEN '1.5-2.0' THEN 1.75 WHEN '2.0-2.5' THEN 2.25 WHEN '2.5-3.0' THEN 2.75 WHEN '3.0-3.5' THEN 3.25
WHEN '3.5-4.0' THEN 3.75 ELSE NULL END AS cgpa_mid FROM mentalhealthsurvey;


#Gender vs average mental‑health scores
SELECT gender, AVG(depression) AS avg_depression, AVG(anxiety) AS avg_anxiety, AVG(isolation) AS avg_isolation,
AVG(future_insecurity)    AS avg_future_insecurity FROM mentalhealthsurvey GROUP BY gender;


# University vs average depression
SELECT university, AVG(depression) AS avg_depression, COUNT(*) AS respondents FROM mentalhealthsurvey GROUP BY university;

# Sleep and sports vs depression
SELECT average_sleep, sports_engagement, COUNT(*) AS respondents, AVG(depression) AS avg_depression FROM mentalhealthsurvey
GROUP BY average_sleep, sports_engagement;

#Stress‑relief activities word‑level
SELECT stress_relief_activities, COUNT(*) AS respondents FROM mentalhealthsurvey GROUP BY stress_relief_activities
ORDER BY respondents DESC;

# KPI Dataset
SELECT COUNT(*) AS total_students, AVG(cgpa) AS avg_cgpa, AVG(average_sleep) AS avg_sleep FROM mentalhealthsurvey;

#Dashboard Dataset
SELECT gender, academic_year, depression, anxiety, average_sleep, cgpa FROM mentalhealthsurvey;


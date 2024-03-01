-- Creating a Join Table

SELECT * FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON 
a.Reason_for_absence = r.Number;

-- find the healthiest employees for the bonus

SELECT * FROM Absenteeism_at_work
WHERE Social_drinker = 0 AND Social_smoker = 0
AND Body_mass_index < 25 AND 
Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) from Absenteeism_at_work);

-- compensation increase for non-smokers
-- with the budget being 983,221 dollars

SELECT count(*) as nonsmokers from Absenteeism_at_work
WHERE Social_smoker = 0


-- optimize the query
SELECT 
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index < 18.5 then 'Underweight'
	 WHEN Body_mass_index BETWEEN 18.5 AND 25  THEN 'Healthy Weight'
	 WHEN Body_mass_index BETWEEN 25 AND 30 THEN  'Overweight'
	 WHEN Body_mass_index > 30 then 'Obese'
	 ELSE 'Unknown'end as BMI_Category,

CASE WHEN MONTH_of_absence IN (12,1,12) THEN 'Winter'
     WHEN MONTH_of_absence IN (3,4,5) THEN 'Spring'
	 WHEN MONTH_of_absence IN (6,7,8) THEN 'Summer'
	 WHEN MONTH_of_absence IN (9,10,11) THEN 'Fall'
	 ELSE 'UNKNOWN' END AS Season_Names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son, 
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON 
a.Reason_for_absence = r.Number;
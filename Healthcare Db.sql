SELECT * FROM healthcare_database.healthcare_dataset;

#Q1. What is total bill amount?

select sum(`Billing Amount`) as total_bill_amount from healthcare_dataset;


#Q2. What is total number of patient?

select count(`Name`) as total_patient from healthcare_dataset;


#Q3. What is total number of doctors?

select count(distinct`Doctor`) as total_doctor from healthcare_dataset;


#Q4. What is total treatment time?

select sum(datediff(`Discharge date`,`Date of Admission`)) 
as total_treatment_time from healthcare_dataset;


#Q5. What is total treatment time by medical condition?

select `Medical Condition`,sum(datediff(`Discharge date`,`Date of Admission`)) from healthcare_dataset
group by `Medical Condition`;


#Q6. What is total number of hospital by medical condition?

select `Medical Condition`, count(`Hospital`) from healthcare_dataset
group by `Medical Condition`;


#Q7. Find top 5 doctor who have treated the most number of patients?

select `Doctor`, count(*) as total_patient from healthcare_dataset
group by `Doctor` order by total_patient desc limit 5;


#Q8. Find top 7 hospital who have treated the most number of patients?

select `Hospital`, count(*) as total_patient from healthcare_dataset
group by `Hospital` order by total_patient desc limit 7;


#Q9. What is the percentage of total no. of patient  by medical condition?

SELECT 
  `Medical Condition`,
  COUNT(`Name`) AS patient_count,
  ROUND(COUNT(`Name`) * 100.0 / SUM(COUNT(`Name`)) OVER (), 2) AS percentage
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY percentage DESC;


#Q10. What is total treatment time by Hospitals?

select `Hospital`,sum(datediff(`Discharge date`,`Date of Admission`)) 
as total_treatment_time
 from healthcare_dataset
group by `Hospital` order by total_treatment_time desc limit 7;


#Q11. What is the percentage of total bill amount by insurance provider?

SELECT 
  `Insurance Provider`,
  COUNT(`Billing Amount`) AS total_bill,
  ROUND(COUNT(`Billing Amount`) * 100.0 / SUM(COUNT(`Billing Amount`))
  OVER (),2) AS percentage
FROM healthcare_dataset
GROUP BY `Insurance Provider`ORDER BY percentage DESC;


#Q12. Find top 7 hospital who have the most amount of bill?

select `Hospital`, sum(`Billing Amount`) as total_bill
from healthcare_dataset group by `Hospital` 
order by total_bill desc limit 7;


#Q13. What is total bill amount by medical condition?

select `Medical Condition`, sum(`Billing Amount`) as total_bill from healthcare_dataset
group by `Medical Condition`;


#Q14. What is the avg. treatment time?

select avg(datediff(`Discharge date`,`Date of Admission`)) 
as avg_treatment_time
 from healthcare_dataset;




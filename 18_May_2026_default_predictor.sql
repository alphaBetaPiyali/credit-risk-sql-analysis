CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    person_age INT,
    person_income NUMERIC(12,2),
    person_home_ownership VARCHAR(50),
    person_emp_length INT,
    loan_intent VARCHAR(100),
    loan_grade CHAR(1),
    loan_amnt NUMERIC(12,2),
    loan_int_rate NUMERIC(5,2),
    loan_status INT,
    loan_percent_income NUMERIC(5,2),
    cb_person_default_on_file CHAR(1),
    cb_person_cred_hist_length INT
);
SELECT * FROM loans limit 7;
SELECT COUNT(*) FROM loans;
SELECT 
    ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) 
    AS default_percentage
FROM loans;
SELECT 
    loan_status, sum(person_income), count(*), avg(person_income)
FROM loans GROUP BY loan_status;
SELECT 
    loan_status,
    AVG(loan_amnt) AS avg_loan_amount,
    COUNT(*) AS count_loans,
    SUM(loan_amnt) as total_amount,
    SUM(loan_amnt) * 100.0 / SUM(SUM(loan_amnt)) OVER() AS percentage_loan_amnt
FROM loans GROUP BY loan_status;
SELECT
 CASE
 WHEN person_income < 30000 THEN 'LOW INCOME'
 WHEN person_income BETWEEN 30000 AND 70000 THEN 'MODDLE INCOME'
ELSE 'HIGH INCOME' END AS income_bucket,
COUNT(*) as borrower_count,
sum(case when loan_status = 1 then 1 ELSE 0 end) as no_of_default,
round(100*sum(case when loan_status = 1 then 1 end)/count(*),4) as percent_share
from loans group by income_bucket order by percent_share desc;
SELECT
 CASE
 WHEN loan_percent_income >= 0.5 THEN 'high burden'
 WHEN loan_percent_income BETWEEN 0.2 AND 0.5 THEN 'Medium burden'
ELSE 'low burden' END AS burden_Risk_category,
COUNT(*) as total_loans,
sum(case when loan_status = 1 then 1 ELSE 0 end) as no_of_default,
round(100*sum(case when loan_status = 1 then 1 end)/count(*),4) as percent_share
from loans group by burden_Risk_category order by percent_share desc;
SELECT
  CASE
    WHEN cb_person_default_on_file = 'Y' THEN 'Past_default_yes' ELSE 'Past_default_No' END AS past_default,
  COUNT(cb_person_default_on_file) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) as no_of_cases,
  round((100.00*SUM(loan_status)/COUNT(*)),2) as percent_share
FROM loans
GROUP BY past_default
ORDER BY percent_share desc;

SELECT
  CASE
    WHEN loan_int_rate < 8 THEN 'Low interest rate'
    WHEN loan_int_rate BETWEEN 8 AND 15 THEN 'Medium interest rate'
    ELSE 'High interest rate'
  END AS interest_rate_group,
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS no_of_defaults,
ROUND(100.0*avg(loan_status),2) AS percent_share
FROM loans GROUP BY interest_rate_group ORDER BY percent_share DESC;
SELECT 
  CASE 
        WHEN person_home_ownership = 'RENT' THEN 'rent'
        WHEN person_home_ownership = 'MORTGAGE' THEN 'mortgage'
        WHEN person_home_ownership = 'OWN' THEN 'own'
  ELSE 'other' END AS home_ownership, COUNT(*) AS total_loans,
    ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_percentage   
FROM loans
GROUP BY home_ownership
ORDER BY default_rate_percentage DESC;








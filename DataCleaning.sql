SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long,
 a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id,
 o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty,
  COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd,
	 COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;



WITH sub1 AS (
	SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) first_poc,
       RIGHT(primary_poc, -STRPOS(primary_poc, ' ')) last_poc,
    name comp_name
FROM accounts

)

SELECT REPLACE(website, ' ', '')
FROM (
	SELECT first_poc, last_poc,
       CONCAT(LOWER(first_poc),'.',LOWER(last_poc),'@',LOWER(comp_name),'.com') website
FROM sub1
) sub2

SELECT LEFT(LEFT(LOWER(primary_poc), STRPOS(primary_poc, ' ')), 1) FLFN,
      RIGHT(LEFT(LOWER(primary_poc), STRPOS(primary_poc, ' ')-1)     ,1)   LLFN  ,
       LEFT(RIGHT(LOWER(primary_poc), -STRPOS(primary_poc, ' '))   ,1) flln,
   RIGHT( RIGHT(LOWER(primary_poc), -STRPOS(primary_poc, ' ')-1)   ,1)  llln,
LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) )lf,
  LENGTH(RIGHT(primary_poc, -STRPOS(primary_poc, ' '))) ll,
   REPLACE(LOWER(name), ' ', '')   comp_name
FROM accounts
LIMIT 10


WITH sub1 AS (
SELECT LEFT(LEFT(LOWER(primary_poc), STRPOS(primary_poc, ' ')), 1) FLFN,
	RIGHT(LEFT(LOWER(primary_poc), STRPOS(primary_poc, ' ')-1)     ,1)   LLFN  ,
	 LEFT(RIGHT(LOWER(primary_poc), -STRPOS(primary_poc, ' '))   ,1) flln,
RIGHT( RIGHT(LOWER(primary_poc), -STRPOS(primary_poc, ' ')-1)   ,1)  llln,
LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) )lf,
LENGTH(RIGHT(primary_poc, -STRPOS(primary_poc, ' '))) ll,
REPLACE(UPPER(name), ' ', '')   comp_name
FROM accounts


)

SELECT CONCAT(flfn,llfn,flln,llln,lf,ll,comp_name) password_poc
FROM sub1




SELECT date orig_date,
(SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data


WITH sub1 AS (
	SELECT date,
SUBSTR(date, 7, 4) yr,
SUBSTR(date, 4, 2) dy,
SUBSTR(date, 1, 2) mon
FROM sf_crime_data
LIMIT 10
)

SELECT CONCAT(yr, '-', dy, '-', mon)::DATE new_date
FROM sub1

WITH sub1 AS (
	SELECT date,
SUBSTR(date, 7, 4) yr,
SUBSTR(date, 4, 2) dy,
SUBSTR(date, 1, 2) mon
FROM sf_crime_data
LIMIT 10
)

SELECT EXTRACT(YEAR FROM CAST(CONCAT(yr, '-', mon, '-', dy)  as DATE))
FROM sub1


SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data;











-*------------------------------------
SELECT primary_poc,
	LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) first_name,
    RIGHT(primary_poc, -STRPOS(primary_poc, ' ')) last_name

                               FROM accounts




SELECT CASE
	       WHEN LEFT(UPPER(name),1) IN (A,E,I,O,U) THEN 1 ELSE 0
    END vowels,
    	CASE
    WHEN LEFT(UPPER(name), 1) IN (A,E,I,O,U) THEN 0 ELSE 1
    	END consonants
FROM accounts

SELECT name,
LEFT(name, STRPOS(name, ' ') -1) first_name,
		RIGHT(name, -STRPOS(name, ' ')) last_name
FROM sales_reps





WITH sub1 AS (
SELECT website,
	RIGHT(website, 3) webTypes
FROM accounts a
)

SELECT webTypes,
	COUNT(webTypes)
FROM sub1
GROUP BY 1

WITH sub1 AS (SELECT LEFT(name, 1) as firstLetter
FROM accounts)

SELECT firstLetter,
	COUNT(*)
FROM sub1
GROUP BY 1
ORDER BY 2 DESC

WITH sub1 AS (
SELECT
	CASE
    	WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 'number'
        ELSE 'string'
    END numberCat

FROM accounts )

SELECT numberCat,
	COUNT(*)
FROM sub1
GROUP BY 1


WITH sub1 AS (

SELECT
	CASE
    	WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 0
        ELSE 1
    END letters,
    CASE
    	WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 1
        ELSE 0
	END numbers
FROM accounts
)



SELECT SUM(letters) letterCount,
	SUM(numbers) numCount
FROM sub1

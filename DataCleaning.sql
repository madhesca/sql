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

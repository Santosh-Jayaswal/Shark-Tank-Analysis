USE SharkTank;

/*
	Que:1	Total Deal by Season
*/
SELECT
	`Season Number`,
    COUNT(*) `Offer Deal`
FROM dataset
WHERE `Accepted Offer` = 1
GROUP BY `Season Number`;

/*
	Que:2	What is the average amount of investment requested by entrepreneurs across different seasons?
*/
SELECT
	`Season Number`,
    ROUND(AVG(`Original Ask Amount`) / 10, 2) AS `Average Ask Amount (MN)`
FROM dataset
GROUP BY `Season Number`;



/*
	Que:3	Top 5 industries receive the most investment offers from the sharks?
*/
WITH top_industry AS (
SELECT
	*,
    DENSE_RANK() OVER(PARTITION BY `Season Number` ORDER BY `Offer Received` DESC) AS most_rank
FROM (
SELECT
	`Season Number`,
	Industry,
    COUNT(`Accepted Offer`) AS `Offer Received`
FROM dataset
WHERE `Accepted Offer` = 1
GROUP BY `Season Number`, Industry
ORDER BY `Season Number`, `Offer Received` DESC) a)

SELECT
	`Season Number`,
	Industry,
    `Offer Received`
FROM top_industry
WHERE most_rank <= 5;



/*
	Que:4	How does the number of sharks involved in a deal impact the total deal amount?
*/
SELECT
	`Number of Sharks in Deal`,
    ROUND(AVG(`Total Deal Amount`) / 10, 2) AS `Average Deal Amount (MN)`
FROM dataset
WHERE `Accepted Offer` = 1
GROUP BY `Number of Sharks in Deal`
ORDER BY `Average Deal Amount (MN)` DESC;



/*
	Que:5	Which shark invests the most frequently and how much do they typically invest?
*/
SELECT
	Shark,
    COUNT(*) AS `Number of Investment Made`,
    ROUND(SUM(`Amount Invested`) / 10, 2) AS `Total Amount Invested (MN)`,
    ROUND(AVG(`Amount Invested`) / 10, 2) AS `Average Amount Invested (MN)`
FROM (
		SELECT
			'Namita' AS Shark,
			`Namita Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Namita Investment Amount` > 0
			UNION ALL
		SELECT
			'Vineeta' AS Shark,
			`Vineeta Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Vineeta Investment Amount` > 0
			UNION ALL
		SELECT
			'Anupam' AS Shark,
			`Anupam Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Anupam Investment Amount` > 0
			UNION ALL
		SELECT
			'Aman' AS Shark,
			`Aman Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Aman Investment Amount` > 0
			UNION ALL
		SELECT
			'Peyush' AS Shark,
			`Peyush Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Peyush Investment Amount` > 0
			UNION ALL
		SELECT
			'Amit' AS Shark,
			`Amit Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Amit Investment Amount` > 0
			UNION ALL
		SELECT
			'Ashneer' AS Shark,
			`Ashneer Investment Amount` AS `Amount Invested`
		FROM dataset
		WHERE `Ashneer Investment Amount` > 0) x
GROUP BY Shark
ORDER BY `Number of Investment Made` DESC;



/*
	Que:6	How does the average equity offered by entrepreneurs change across different seasons?
*/
SELECT
	`Season Number`,
	ROUND(AVG(`Original Offered Equity`)) AS `Average Equity Offered`
FROM dataset
GROUP BY `Season Number`;



/*
	Que:7	What are the top 5 cities and states represented by pitchers on the show?
*/
SELECT
	`Pitchers City`,
    `Pitchers State`,
    COUNT(*) AS `Numbers of Pitchers`
FROM dataset
GROUP BY `Pitchers City`, `Pitchers State`
ORDER BY `Numbers of Pitchers` DESC
LIMIT 5;



/*
	Que:8	How does the original ask amount compare to the final deal amount for successful pitches?
*/
SELECT
	ROUND(AVG(`Original Ask Amount`) / 10, 2) AS `Amount Ask (MN)`,
    ROUND(AVG(`Total Deal Amount`) / 10, 2) AS `Total Deal Amount (MN)`
FROM dataset
WHERE `Accepted Offer` = 1;



/*
	Que:9	What is the success rate of pitches by industry type 
    (e.g., technology, food & beverage, health & wellness)?
*/
SELECT
    Industry,
    COUNT(*) AS Total_Pitches,
    SUM(`Accepted Offer`) AS Successful_Pitches,
    ROUND(SUM(`Accepted Offer`) / COUNT(*), 2) AS Success_Rate
FROM dataset
GROUP BY Industry
ORDER BY Success_Rate DESC;




/*
	Que:10	How often do entrepreneurs end up giving more equity than initially offered to secure a deal?
*/
SELECT
	COUNT(*) AS Total_Deal,
    SUM(CASE WHEN `Total Deal Equity` > `Original Offered Equity` THEN 1 ELSE 0 END) AS More_Equity_Deal,
    ROUND(SUM(CASE WHEN `Total Deal Equity` > `Original Offered Equity` THEN 1 ELSE 0 END) / COUNT(*), 2) AS More_Equity_Deal_Ratio
FROM dataset
WHERE `Accepted Offer` = 1;

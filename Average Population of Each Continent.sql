/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT Continent, ROUND(AVG(CITY.Population), 1)
FROM COUNTRY
INNER JOIN CITY
ON COUNTRY.Code = CITY.CountryCode 
GROUP BY continent;

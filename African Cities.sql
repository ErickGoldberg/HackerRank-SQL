/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  city.name
FROM city
INNER JOIN country
ON city.countrycode = country.code 
where continent = 'Africa';

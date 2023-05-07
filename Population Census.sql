/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT sum(city.population)
FROM city
INNER JOIN country
ON city.countrycode = country.code where continent='asia';

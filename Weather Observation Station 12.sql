/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select distinct city from station where ((lower(city) NOT LIKE '[aeiou]%') AND (lower(city) NOT LIKE '%[aeiou]')) order by city;

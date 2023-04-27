/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select TOP 1 CITY AS c, LEN(CITY) AS l FROM STATION ORDER BY l DESC, c ASC;
select TOP 1 CITY AS c, LEN(CITY) AS l FROM STATION ORDER BY l ASC, c ASC;

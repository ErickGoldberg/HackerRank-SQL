/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select max(months * salary), count(months * salary) 
from Employee where (months * salary) 
= (select max(months * salary) from Employee);

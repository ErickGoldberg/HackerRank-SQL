/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT s.Name
FROM Students s INNER JOIN Friends f
ON s.ID = f.ID INNER JOIN Packages p1
ON s.ID = p1.ID INNER JOIN Packages p2
ON f.Friend_ID  = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;

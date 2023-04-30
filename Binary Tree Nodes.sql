/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT b.N,
       (CASE 
        	 WHEN b.P IS NULL THEN 'Root' 
             WHEN (SELECT COUNT(*) FROM BST b2 WHERE b2.P = b.N) > 0 THEN 'Inner'
             ELSE 'Leaf'
        END)
FROM bst b ORDER BY N;

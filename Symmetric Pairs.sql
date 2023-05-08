/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

with temp as (SELECT *, ROW_NUMBER() OVER(ORDER BY X) rnk 
    FROM Functions)
    
    SELECT  F1.X, F1.Y
FROM temp F1
JOIN temp F2
    ON F1.X = F2.Y
    AND F1.Y = F2.X
    AND F1.X <= F1.Y
    AND F1.rnk != F2.rnk
group by F1.X,F1.Y
ORDER BY F1.X;

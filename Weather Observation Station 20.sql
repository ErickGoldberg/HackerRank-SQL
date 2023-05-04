/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT 
CASE
        WHEN (SELECT COUNT(*) FROM Station) % 2 = 1 THEN 
             (SELECT FORMAT(lat_n, 'N4') 
             FROM Station 
             ORDER BY lat_n 
             OFFSET ((SELECT COUNT(*) FROM Station) - 1)/2 ROWS
             FETCH NEXT 1 ROW ONLY)
        ELSE (SELECT FORMAT(AVG(t.lat_n), 'N4')
             FROM (SELECT lat_n 
                  FROM Station
                  ORDER BY lat_n 
                  OFFSET ((SELECT COUNT(*) FROM Station) - 1)/2-1 ROWS
                  FETCH NEXT 2 ROWS ONLY) t)
    END AS Median;

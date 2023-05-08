/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    W.id,
    WP.age,
    W.coins_needed,
    W.power
FROM Wands W
INNER JOIN Wands_Property WP ON W.code = WP.code
WHERE WP.is_evil != 1
AND W.coins_needed = (
    SELECT
        MIN(W2.coins_needed)
    FROM Wands W2
    INNER JOIN Wands_Property WP2 ON W2.code = WP.code
    WHERE WP2.age = WP.age
    AND W2.power = W.power)
ORDER BY
    W.power DESC,
    WP.age DESC;

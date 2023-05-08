/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH MAXS AS (
SELECT H.hacker_id, name, challenge_id, max(score) AS maxs FROM Hackers AS H
    INNER JOIN Submissions AS S ON S.hacker_id = H.hacker_id
    GROUP BY H.hacker_id, name, challenge_id)
SELECT hacker_id, name, SUM(maxs) FROM MAXS
GROUP BY hacker_id, name
HAVING SUM(maxs) > 0
ORDER BY 3 DESC, 1;

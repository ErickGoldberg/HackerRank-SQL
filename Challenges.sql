/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH T1 AS (
SELECT hacker_id,COUNT(challenge_id) AS challenge_count FROM Challenges
GROUP BY hacker_id)

SELECT h.hacker_id, h.name, T1.challenge_count
FROM Hackers h JOIN T1 ON h.hacker_id = T1.hacker_id
WHERE 
    T1.challenge_count = (SELECT MAX(T1.challenge_count) FROM T1)
OR
    T1.challenge_count IN (SELECT T2.challenge_count FROM (SELECT
                           challenge_count,COUNT(T1.challenge_count) AS
                           d_challenge_count FROM T1 GROUP BY challenge_count
                           HAVING COUNT(T1.challenge_count) = 1)T2)
ORDER BY T1.challenge_count DESC, h.hacker_id;

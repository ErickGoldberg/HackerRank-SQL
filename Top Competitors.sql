/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    h.hacker_id, h.name
FROM
    hackers h
    JOIN submissions s ON h.hacker_id = s.hacker_id
    JOIN challenges c ON s.challenge_id = c.challenge_id
    JOIN difficulty d ON c.difficulty_level = d.difficulty_level AND s.score = d.score
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(c.challenge_id) > 1
ORDER BY
    COUNT(c.challenge_id) DESC,
    h.hacker_id;

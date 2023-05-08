/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH Subm_summary AS    (SELECT challenge_id, SUM(total_submissions) AS Ts,
SUM(total_accepted_submissions) AS Tas FROM Submission_Stats
GROUP BY challenge_id),
View_Summary AS  (SELECT challenge_id, SUM(total_views) AS Tv,
SUM(total_unique_views) AS Tuv FROM View_Stats
GROUP BY challenge_id)
SELECT
    Contests.contest_id,    Contests.hacker_id,     Contests.name, 
    SUM(Subm_summary.Ts),   SUM(Subm_summary.Tas),  SUM(View_Summary.Tv),
    SUM(View_Summary.Tuv)
FROM    Contests
JOIN    Colleges ON Contests.contest_id = Colleges.contest_id
JOIN    Challenges ON Colleges.college_id = Challenges.College_id
LEFT JOIN    View_Summary ON Challenges.challenge_id = View_Summary.challenge_id
LEFT JOIN    Subm_summary ON Challenges.challenge_id = Subm_summary.challenge_id
GROUP BY Contests.contest_id,Contests.hacker_id,Contests.name
HAVING (SUM(Subm_summary.Ts)+SUM(Subm_summary.Tas)+SUM(View_Summary.Tv)+SUM(View_Summary.Tuv))>0
ORDER BY contest_id;

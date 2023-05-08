/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH tmp_start AS (
        SELECT Start_Date, ROW_NUMBER() OVER (ORDER BY Start_Date) as s_row
        FROM Projects
        WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)),

        tmp_end AS (
        SELECT End_Date, ROW_NUMBER() OVER (ORDER BY End_Date) as e_row
        FROM Projects
        WHERE End_Date NOT IN (SELECT Start_Date FROM Projects))

SELECT Start_Date, End_Date FROM tmp_start JOIN tmp_end ON tmp_start.s_row = tmp_end.e_row
ORDER BY datediff(day,Start_Date,end_date),Start_Date;

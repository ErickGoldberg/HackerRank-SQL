/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT 
    CASE WHEN grade >= 8 THEN name ELSE NULL END, grade, marks
FROM STUDENTS, GRADES
WHERE marks BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME, MARKS;

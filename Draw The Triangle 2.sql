/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

DECLARE @i INT = 1
WHILE (@i < 21) 
BEGIN
   PRINT REPLICATE('* ', @i) 
   SET @i = @i + 1
END;

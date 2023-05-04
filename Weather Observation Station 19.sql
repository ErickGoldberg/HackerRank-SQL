/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select cast(sqrt(power(MIN(Lat_n) - MAX(lat_n),2) + power(MIN(Long_w) - MAX(long_w),2))as decimal(10,4)) from station;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

with t1 as (
select s.*, h.name as hacker_name
from submissions s
join hackers h
    on s.hacker_id = h.hacker_id
where s.submission_date between '2016-03-01' and '2016-03-15'),

t2 as (
select 
    submission_date
    , hacker_id
    , hacker_name
    , count(distinct submission_id) as submissions
    , row_number() over (partition by hacker_id order by submission_date) as submission_rank
from t1
group by submission_date, hacker_id, hacker_name
having count(distinct submission_id) >= 1),

t3 as (
select submission_date, hacker_id, hacker_name
from
    (
    select t2.submission_date, t2.hacker_id, t2.hacker_name, row_number() over (partition by t2.submission_date order by hacker_id) as rn
    from t2
    join
        (
        select submission_date, max(submissions) as max_submissions
        from t2
        group by submission_date
        ) t
        on t2.submission_date = t.submission_date
        and t2.submissions = t.max_submissions
    ) t
where t.rn = 1),

t4 as (
select submission_date, row_number() over (order by submission_date) as date_rank
from (select distinct submission_date from t2) t),

t5 as (
select
submission_date, 
    count(distinct case when date_rank = submission_rank then hacker_id end) as hackers_commited
from
(
select
    t2.*, t4.date_rank
from t2
join t4
    on t2.submission_date = t4.submission_date) t
group by submission_date)

select t5.*, hacker_id, hacker_name
from t3
join t5
 on t3.submission_date = t5.submission_date
order by submission_date;

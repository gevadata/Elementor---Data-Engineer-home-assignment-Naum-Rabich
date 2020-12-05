1.

with temp as

(select d.department_id,
       e.employee_id,
       e.salary,
       RANK () OVER ( PARTITION BY d.department_id ORDER BY e.salary DESC) as rank_salary
from departments d
left join employees e
on d.department_id = e.department_id )


select t.department_id,
       t.employee_id,
       t.salary,
       (t.salary - temp.salary) as diff

from (
select x.department_id, x.employee_id , x.salary
from  temp x
where x.rank_salary = 1 ) t
left join temp
on t.department_id = temp.department_id
where temp.rank_salary = 2





2.

with promotion_tarffic as
(
select s.site, sum(s.number_of_visitors) as number_of_visitors
from  site_visitors s
join promotion_dates p
on s.site = p.site and s.date between p.start_date and p.end_date
group by s.site
)

, all_trafic as

(select site , sum(number_of_visitors) as number_of_visitors
from site_visitors
group by site)


select ((p.number_of_visitors / a.number_of_visitors) * 100) as  promotion_tarffic_precent
from promotion_tarffic p
join all_trafic a
on p.site = a.site






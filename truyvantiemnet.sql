use quanlytiemnet
select c.* from computer c
join account_computer_history ach on c.Computer_id=ach.Computer_id
where ach.Account_id=1


select distinct w.Web_name  from web w
join web_access_history wah on wah.Web_id=w.Web_id
join account_computer_history ach on ach.Access_id=wah.Access_id
join account a on a.Account_id=ach.Account_id
--join customer c on c.Customer_id= a.customer_id
where a.customer_id=1

select c.*  from computer c
join account_computer_history ach on c.Computer_id=ach.Computer_id
join web_access_history wah on ach.Access_id=wah.Access_id
where wah.Web_id=3

select distinct a.* from account a
join account_computer_history ach on ach.Account_id=a.Account_id
join computer c on c.Computer_id=ach.Computer_id
where c.Computer_id=1 or c.Computer_id=2

select wah.* from web_access_history wah
join account_computer_history ach on ach.Access_id=wah.Access_id
join account a on a.Account_id=ach.Account_id
where a.total_money_spent<=80000

use quanlytiemnet
select a.* from account a
where a.total_money_spent>50000

select a.* from account a
join account_computer_history ach on ach.Account_id=a.Account_id
join web_access_history wah on wah.Access_id=ach.Access_id
join web w on w.Web_id=wah.Web_id
where w.Web_name='youtube.com'

select w.* from web w
inner join web_access_history wah on wah.Web_id=w.Web_id
inner join account_computer_history ach on ach.Access_id=wah.Access_id
where cast(ach.start_time as date)='2023-09-20' and cast(ach.start_time AS time) between '06:00:00' and '12:00:00'

select   c.name, c.Customer_id , count(distinct ach.Combo_id) as combo_cnt
from account_computer_history ach
inner join account a on ach.Account_id=a.Account_id
inner join customer c on a.customer_id=c.Customer_id
where ach.Combo_id=1
group by c.Customer_id,c.name
order by combo_cnt desc

select c.Computer_id,c.config  ,count(distinct wah.Web_id) as web_cnt
from web_access_history wah
inner join account_computer_history ach on ach.Access_id = wah.Access_id
inner join computer c on c.Computer_id = ach.Computer_id
where wah.Web_id=1
group by c.Computer_id,c.config
order by web_cnt asc

select  c.Computer_id,c.config , count(distinct ach.Access_id) as cnt
from account_computer_history ach
inner join computer c on c.Computer_id=ach.Computer_id
where day(ach.start_time) = 20
group by c.Computer_id,c.config
order by cnt desc


select top 2 cu.Customer_id,cu.name, count(distinct a.Account_id) as cnt
from customer cu
inner join account a on cu.Customer_id=a.customer_id
group by cu.Customer_id,cu.name
order by cnt desc

use quanlytiemnet
select cu.name,w.Web_name , count(distinct wah.Access_id) as cnt
from customer cu
inner join account a on a.customer_id =cu.Customer_id
inner join account_computer_history ach on ach.Account_id=a.Account_id
inner join web_access_history wah on wah.Access_id=ach.Access_id
inner join web w on w.Web_id =wah.Web_id
group by cu.name,w.Web_name
order by cnt desc

select cu.Customer_id,cu.name , count(distinct wah.Access_id) as cnt
from customer cu
inner join account a on a.customer_id =cu.Customer_id
inner join account_computer_history ach on ach.Account_id=a.Account_id
inner join web_access_history wah on wah.Access_id=ach.Access_id
group by cu.Customer_id,cu.name
order by cnt desc

use quanlytiemnet
select c.name,ach.start_time from customer c
inner join account a on a.customer_id=c.Customer_id
inner join account_computer_history ach on ach.Account_id=a.Account_id
where c.name like '%u%' and day(ach.start_time)=21
group by c.name,ach.start_time

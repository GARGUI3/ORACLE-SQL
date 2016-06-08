create table distribucion as
select to_number(to_char(fecha, 'MM'))/1 Xi,
count(*) Fi,
round((count(*)/max((select count(*) from cabpres)))*100, 2) || '%' Fr,

-----------------------FA-------------------------------

Max((select sum(count(*)) from cabpres a where to_char(a.fecha,'MM')<=to_char(C.fecha,'MM') group by tipcte)) Fa,

-----------------------FRA------------------------------
round(Max((select
sum((count(*)/max((select count(*) from cabpres)))*100) Fr

from cabpres a where to_char(a.fecha,'MM')<=to_char(C.fecha,'MM')
group by tipcte)), 2) || '%' Fra
------------------------------------------------------

from cabpres C
group by to_number(to_char(fecha, 'MM'))/1
order by 1;

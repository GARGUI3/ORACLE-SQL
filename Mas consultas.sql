--select * from cabpres;

create or replace view vsaldos as
select c.id, max(c.tipo) tipo, max(c.descripcion) descripcion, max(c.descuento),
sum(decode(MOVTO,'C',IMPORTE,0)) cargo ,
sum(decode(MOVTO,'A',IMPORTE,0)) abono ,
sum(IMPORTE) saldo
from cabpres c, detpres d where d.id=c.id
group by c.id;

create or replace view vcompra as
select c.id, max(c.tipo) tipo, max(c.descripcion) descripcion,max(c.descuento) descuento,
sum(decode(MOVTO,'C',IMPORTE,0)) cargo ,
sum(decode(MOVTO,'A',IMPORTE,0)) abono ,
sum(IMPORTE) saldo
from cabpres c, detpres d where d.id=c.id
group by c.id;

select tipo, descripcion, cargo, abono, saldo, ceil(saldo/descuento) faltantes from vcompra;

select tipo, descripcion, cargo, abono, saldo, noAbono,descuento,
(noAbono*descuento) importe,
(abono+(noAbono*descuento)) diferencia
from vabono;

create or replace view vabono as
select c.id, max(c.tipo) tipo, max(c.descripcion) descripcion,max(c.descuento) descuento, max(monto) monto,
count(decode(MOVTO,'A',IMPORTE,0)) noAbono,
sum(decode(MOVTO,'C',IMPORTE,0)) cargo ,
sum(decode(MOVTO,'A',IMPORTE,0)) abono ,
sum(IMPORTE) saldo
from cabpres c, detpres d where d.id=c.id
group by c.id;

select * from vabono where saldo<=(monto*.10);

select * from vabono where abono>cargo;

select tipcte,
count(id) creditos,
sum(decode(to_char(fecha, 'YYYY'), 2008, monto, 0)) A2008,
sum(decode(to_char(fecha, 'YYYY'), 2009, monto, 0)) A2009,
sum(decode(to_char(fecha, 'YYYY'), 2010, monto, 0)) A2010,
sum(decode(to_char(fecha, 'YYYY'), 2011, monto, 0)) A2011,
sum(decode(to_char(fecha, 'YYYY'), 2012, monto, 0)) A2012,
sum(decode(to_char(fecha, 'YYYY'), 2013, monto, 0)) A2013,
max(monto) maximo,
min(monto) minimo,
avg(monto) promedio,
sum(monto) total
from CABPRES
group by tipcte
order by 1;

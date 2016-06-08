--Consulta si FECHA = Lunes forma rapida
select trim(to_char(FECHA, 'Day')) FECHA from CABPRES where trim(to_char(FECHA, 'Day'))='Lunes'

--Consulta si FECHA = Lunes con Like
select 'Oaxaca Mexico, a ' ||
  trim(to_char(FECHA, 'Day')) || ' ' || 
  to_char(FECHA, 'dd') || ' de ' || 
  trim(to_char(FECHA, 'Month')) || ' del ' || 
  trim(to_char(FECHA, 'YYYY')) FECHA from CABPRES
where 'Oaxaca Mexico, a ' ||
  trim(to_char(FECHA, 'Day')) || ' ' || 
  to_char(FECHA, 'dd') || ' de ' || 
  trim(to_char(FECHA, 'Month')) || ' del ' || 
  trim(to_char(FECHA, 'YYYY')) LIKE '%Lunes%'

--Consulta si FECHA = Lunes con Substr  
select 'Oaxaca Mexico, a ' ||
  trim(to_char(FECHA, 'Day')) || ' ' || 
  to_char(FECHA, 'dd') || ' de ' || 
  trim(to_char(FECHA, 'Month')) || ' del ' || 
  trim(to_char(FECHA, 'YYYY')) FECHA from CABPRES
where Substr('Oaxaca Mexico, a ' ||
  trim(to_char(FECHA, 'Day')) || ' ' || 
  to_char(FECHA, 'dd') || ' de ' || 
  trim(to_char(FECHA, 'Month')) || ' del ' || 
  trim(to_char(FECHA, 'YYYY')),18,5)='Lunes'

DECLARE
CURSOR cur_07 is
SELECT p.persons_id as id, p.name as nombre, p.lastname as apellido,p.sex as sexo,(sysdate - p.birthdate)/365 as edad FROM persons p
INNER JOIN persons_defuntions pf ON pf.persons_id = p.persons_id
WHERE (sysdate - p.birthdate) <= 6570 ;

BEGIN
for i in cur_07 loop
DBMS_OUTPUT.PUT_LINE('ID: ' || i.id ||'  NOMBRE: ' || i.nombre || ' APELLIDO: ' || i.apellido ||'  SEXO: ' || i.sexo || ' EDAD: ' || i.edad );
 end loop;
end;
--1- Generar una funci�n que retorne cuantos a�os tiene una persona.
CREATE OR REPLACE FUNCTION person_a�o(id_person IN persons.persons_id%TYPE) 
RETURN NUMBER IS
    v_birth_date persons.birthdate%TYPE;
    v_age NUMBER;
BEGIN
    -- Obtener la fecha de nacimiento de la persona
    SELECT birthdate INTO v_birth_date FROM persons WHERE persons_id = id_person;
    -- Calcular la edad en a�os usando EXTRACT y la diferencia de a�os entre la fecha actual y la fecha de nacimiento
    v_age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM v_birth_date);

    RETURN v_age;
END;

SELECT person_a�o(478)as A�os FROM dual;
select * from persons;
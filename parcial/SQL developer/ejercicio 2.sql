CREATE OR REPLACE PROCEDURE register_worker(
  p_id IN workers.id%TYPE,
  p_name IN workers.name%TYPE,
  p_job IN workers.job%TYPE
) AS
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_exists
  FROM workers
  WHERE id = p_id;

  IF v_exists = 0 THEN
    INSERT INTO workers (id, name, job)
    VALUES (p_id, p_name, p_job);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Trabajador registrado exitosamente.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('La persona ya existe en la tabla workers.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error al registrar el trabajador: ' || SQLERRM);
END register_worker;
/

create or replace TRIGGER human_check BEFORE DELETE
    ON human FOR EACH ROW  
    
declare
 vaar varchar(20);
begin
select drink into vaar from drinktime where :old.humanid = humanid;
    IF (vaar != '') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Can`t delete cause of not null');
    END IF;
END;
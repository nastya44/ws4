CREATE OR REPLACE PACKAGE cool_package IS
    TYPE drinktimeiscoming IS RECORD (
        humanid1  drinktime_view.humanid%TYPE,
        drink1   drinktime_view.drink%TYPE,
        drinktime1 drinktime_view.drinktime%TYPE
    );
    TYPE tabledrinktimeiscoming IS
        TABLE OF drinktimeiscoming;
--
    FUNCTION getByTimeAndHuman (
        human_id NUMBER,
        dtime  Date
    ) RETURN tabledrinktimeiscoming
        PIPELINED;

    PROCEDURE updatedrinktime (
       human_id Integer,
       dtime Date,
       c_drink Varchar
    );

END cool_package;
/

create or replace PACKAGE BODY cool_package IS

procedure updatedrinktime(
human_id Integer,
dtime Date,
c_drink Varchar
) as
human_status Number;
drink_status Number;
time_status Number;
no_data Exception;

begin 
 
 select 
 Count(*)
 into human_status
 from
 human
 where
 humanid = human_id;

 select 
 Count(*)
 into drink_status
 from
drinks
 where
 drink like c_drink;
 
  
 select 
 Count(*)
 into time_status
 from
drinktime
 where
 humanid = human_id and
 drinktime Like dtime;

if(human_status = 1) and (drink_status = 1) and (time_status = 0) then
update drinktime
set
drinktime = dtime
where 
humanid = human_id
and
drink = c_drink;

else 
raise no_data;

end if;

exception
    WHEN no_data THEN
        dbms_output.put_line('Current time already taken or human doesnt exist or drink doesnt exist');
    WHEN OTHERS THEN
        dbms_output.put_line('Something else went wrong - '
                             || sqlcode
                             || ' : '
                             || sqlerrm);
end;


FUNCTION getByTimeAndHuman (
        human_id NUMBER,
        dtime  Date
    ) RETURN tabledrinktimeiscoming
        PIPELINED
        is
        Cursor curs IS(
        select 
        humanid,
        drink,
        drinktime
        from drinktime_view
        where 
        humanid = human_id and
        drinktime like dtime);
      begin
      FOR recs IN curs 
      loop
      pipe row (recs);
      end loop;
      end;
end;
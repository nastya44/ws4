   create TYPE drinktimeiscoming IS Object (
        humanid1  NUMBER,
        drink1   varchar(20),
        drinktime1 date 
    );
    /
  create  TYPE tabledrinktimeiscoming IS
        TABLE OF drinktimeiscoming;
        
     / 


     create or replace FUNCTION getByTimeAndHuman (
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
        myrec drinktimeiscoming;
      begin
      FOR recs IN curs 
      loop
      myrec.humanid1 := recs.humanid;
      myrec.drink1 := recs.drink;
      myrec.drinktime1 := recs.drinktime;
      pipe row (myrec);
      end loop;
      end;  
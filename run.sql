set serveroutput on
begin
cool_package.updatedrinktime(2,'20110302','Vodka');
cool_package.updatedrinktime(2,'20110302','Voda');
cool_package.updatedrinktime(1,'20110301','Martini');
end;
/
select * from table (cool_package.getByTimeAndHuman(1,'20.10.01'))
select * from table (cool_package.getByTimeAndHuman(3,'20.10.02'))
/
delete from human where humanid = 1;
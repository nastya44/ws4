Insert into HumanSex(sex)
Values('F');

Insert into HumanSex(sex)
Values('M');


Insert into HumanHealth(health)
Values(1);

Insert into HumanHealth(health)
Values(2);

Insert into HumanHealth(health)
Values(3);

Insert into HumanHealth(health)
Values(4);

Insert into HumanHealth(health)
Values(5);


Insert into AlcoholDalcCons(dalc)
Values(1);

Insert into AlcoholDalcCons(dalc)
Values(2);

Insert into AlcoholDalcCons(dalc)
Values(3);

Insert into AlcoholDalcCons(dalc)
Values(4);

Insert into AlcoholDalcCons(dalc)
Values(5);


Insert into AlcoholConsWalc(walc)
Values(1);

Insert into AlcoholConsWalc(walc)
Values(2);

Insert into AlcoholConsWalc(walc)
Values(3);

Insert into AlcoholConsWalc(walc)
Values(4);

Insert into AlcoholConsWalc(walc)
Values(5);


Insert into Drinks(drink)
Values('Martini');

Insert into Drinks(drink)
Values('Vodka');

Insert into Drinks(drink)
Values('Beer');


Insert into Human(humanid,age,sex,health)
Values(1,15,'M',3);

Insert into Human(humanid,age,sex,health)
Values(2,17,'F',1);

Insert into Human(humanid,age,sex,health)
Values(3,14,'M',5);


Insert into AlcoholCons(humanid,Dalc,Walc)
Values(1,4,3);

Insert into AlcoholCons(humanid,Dalc,Walc)
Values(2,5,5);

Insert into AlcoholCons(humanid,Dalc,Walc)
Values(3,1,2);



Insert into DrinkTime(humanid,drinktime,drink)
Values(1,'20100301','Martini');

Insert into DrinkTime(humanid,drinktime,drink)
Values(2,'20110301','Vodka');

Insert into DrinkTime(humanid,drinktime,drink)
Values(3,'20120301','Beer');
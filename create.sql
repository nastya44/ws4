CREATE TABLE alcoholcons (
    dalc      INTEGER NOT NULL,
    walc      INTEGER NOT NULL,
    humanid   INTEGER NOT NULL
);

ALTER TABLE alcoholcons ADD CONSTRAINT alcoholcons_pk PRIMARY KEY ( humanid );

CREATE TABLE alcoholconswalc (
    walc INTEGER NOT NULL
);

ALTER TABLE alcoholconswalc ADD CONSTRAINT alcoholconswalc_pk PRIMARY KEY ( walc );

CREATE TABLE alcoholdalccons (
    dalc INTEGER NOT NULL
);

ALTER TABLE alcoholdalccons ADD CONSTRAINT alcoholdalccons_pk PRIMARY KEY ( dalc );

CREATE TABLE drinks (
    drink VARCHAR2(20) NOT NULL
);

ALTER TABLE drinks ADD CONSTRAINT drinks_pk PRIMARY KEY ( drink );

CREATE TABLE drinktime (
    drinktime   DATE NOT NULL,
    humanid     INTEGER NOT NULL,
    drink       VARCHAR2(20) NOT NULL
);

ALTER TABLE drinktime ADD CONSTRAINT drinktime_pk PRIMARY KEY ( drinktime,
                                                                humanid );

CREATE TABLE human (
    age       INTEGER,
    humanid   INTEGER NOT NULL,
    sex       VARCHAR2(1) NOT NULL,
    health    INTEGER NOT NULL
);

ALTER TABLE human ADD CONSTRAINT human_pk PRIMARY KEY ( humanid );

CREATE TABLE humanhealth (
    health INTEGER NOT NULL
);

ALTER TABLE humanhealth ADD CONSTRAINT humanhealth_pk PRIMARY KEY ( health );

CREATE TABLE humansex (
    sex VARCHAR2(1) NOT NULL
);

ALTER TABLE humansex ADD CONSTRAINT humansex_pk PRIMARY KEY ( sex );

ALTER TABLE alcoholcons
    ADD CONSTRAINT alcoholcons_alcoholconswalc_fk FOREIGN KEY ( walc )
        REFERENCES alcoholconswalc ( walc );

ALTER TABLE alcoholcons
    ADD CONSTRAINT alcoholcons_alcoholdalccons_fk FOREIGN KEY ( dalc )
        REFERENCES alcoholdalccons ( dalc );

ALTER TABLE alcoholcons
    ADD CONSTRAINT "AlcoholCons_Human _FK" FOREIGN KEY ( humanid )
        REFERENCES human ( humanid );

ALTER TABLE drinktime
    ADD CONSTRAINT drinktime_drinks_fk FOREIGN KEY ( drink )
        REFERENCES drinks ( drink );

ALTER TABLE drinktime
    ADD CONSTRAINT "DrinkTime_Human _FK" FOREIGN KEY ( humanid )
        REFERENCES human ( humanid );

ALTER TABLE human
    ADD CONSTRAINT "Human _HumanHealth_FK" FOREIGN KEY ( health )
        REFERENCES humanhealth ( health );

ALTER TABLE human
    ADD CONSTRAINT "Human _HumanSex_FK" FOREIGN KEY ( sex )
        REFERENCES humansex ( sex );
CREATE TABLE USER_ROLES (
  USER_ROLES_ID INT NOT NULL,
  ROLE_ID INT NOT NULL,
  ACCESS_ID INT NOT NULL,
  CONSTRAINT USER_ROLES_PK PRIMARY KEY (USER_ROLES_ID),
  CONSTRAINT ROLE_ID_FK FOREIGN KEY (ROLE_ID) REFERENCES ACCESS_ROLES(ROLE_ID),
  CONSTRAINT ACCESS_ID_FK FOREIGN KEY (ACCESS_ID) REFERENCES ACCESS_USER(ACCESS_ID)
);

select * from access_user;
select * from access_roles;
select * from user_roles;

CREATE TABLE LOGIN_TYPE(
  LOGIN_TYPE_ID INT NOT NULL,
  TYPE VARCHAR2(20) NOT NULL,
  CONSTRAINT LOGIN_TYPE_ID_PK PRIMARY KEY(LOGIN_TYPE_ID)
);

CREATE TABLE LOGOUT_TYPE(
  LOGOUT_TYPE_ID INT NOT NULL,
  TYPE VARCHAR2(20) NOT NULL,
  CONSTRAINTS LOGOUT_TYPE_ID_PK PRIMARY KEY(LOGOUT_TYPE_ID)
);

CREATE TABLE USER_LOGGING(
  LOGIN_ID INT NOT NULL,
  ACCESS_ID INT NOT NULL,
  IN_TIME DATE NOT NULL,
  OUT_TIME DATE,
  LOGIN_TYPE_ID INT NOT NULL,
  LOGOUT_TYPE_ID INT,
  CONSTRAINT LOGIN_ID_PK PRIMARY KEY(LOGIN_ID),
  CONSTRAINT ACCESS_ID_FK_2 FOREIGN KEY(ACCESS_ID) REFERENCES ACCESS_USER(ACCESS_ID),
  CONSTRAINT LOGIN_TYPE_ID_FK FOREIGN KEY(LOGIN_TYPE_ID) REFERENCES LOGIN_TYPE(LOGIN_TYPE_ID),
  CONSTRAINT LOGOUT_TYPE_ID_FK FOREIGN KEY(LOGOUT_TYPE_ID) REFERENCES LOGOUT_TYPE(LOGOUT_TYPE_ID)
);


--CREATING SEQUENCES FOR INSERTION OF DATA IN THE TABLE

CREATE SEQUENCE SEQ_ACCESS_USER MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE SEQ_ROLES MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE SEQ_LOGIN_TYPE MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE SEQ_LOGOUT_TYPE MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE SEQ_USER_LOGGGIN MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE SEQ_USER_ROLES MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

--INSERTING DATA IN TABLES

--INSERT INTO LOGIN_TYPE VALUES(SEQ_LOGIN_TYPE.NEXTVAL,'DIRECT');
--INSERT INTO LOGIN_TYPE VALUES(SEQ_LOGIN_TYPE.NEXTVAL,'WEB SERVICE');

--INSERT INTO LOGOUT_TYPE VALUES(SEQ_LOGOUT_TYPE.NEXTVAL,'USER LOGOUT');
--INSERT INTO LOGOUT_TYPE VALUES(SEQ_LOGOUT_TYPE.NEXTVAL,'SESSION TIMEOUT');
--INSERT INTO LOGOUT_TYPE VALUES(SEQ_LOGOUT_TYPE.NEXTVAL,'SESSION ERROR');

--INSERT INTO ACCESS_ROLES VALUES(SEQ_ROLES.NEXTVAL,'GUEST');
--INSERT INTO ACCESS_ROLES VALUES(SEQ_ROLES.NEXTVAL,'USER');
--INSERT INTO ACCESS_ROLES VALUES(SEQ_ROLES.NEXTVAL,'MANAGER');
--INSERT INTO ACCESS_ROLES VALUES(SEQ_ROLES.NEXTVAL,'ADMIN');

--INSERT INTO ACCESS_USER VALUES(SEQ_ACCESS_USER.NEXTVAL,'RAHIL','BASHIR','PATHAN','PATHANRAHIL143@GMAIL.COM',9768084899,'Y');

--INSERT INTO USER_ROLES VALUES(SEQ_USER_ROLES.NEXTVAL,1,1);
--INSERT INTO USER_ROLES VALUES(SEQ_USER_ROLES.NEXTVAL,2,1);
--INSERT INTO USER_ROLES VALUES(SEQ_USER_ROLES.NEXTVAL,3,1);
--INSERT INTO USER_ROLES VALUES(SEQ_USER_ROLES.NEXTVAL,4,1);

--CREATING VIEWS FOR TABLES

CREATE VIEW V_ACCESS_ROLES AS SELECT * FROM ACCESS_ROLES;
CREATE VIEW V_ACCESS_USER AS SELECT * FROM ACCESS_USER;
CREATE VIEW V_LOGIN_TYPE AS SELECT * FROM LOGIN_TYPE;
CREATE VIEW V_LOGOUT_TYPE AS SELECT * FROM LOGOUT_TYPE;
CREATE VIEW V_USER_LOGGING AS SELECT * FROM USER_LOGGING;
CREATE VIEW V_USER_ROLES AS SELECT * FROM USER_ROLES;

--CREATING PROCEDURES FOR APPLICATION ACCESS AND OPERATIONS

select * from access_user;
select * from access_roles;
select * from login_type;
select * from logout_type;
select * from user_logging;
select * from user_roles;

show user;

--Creating RONALDO user audit table

CREATE TABLE RONALDO_AUDIT(
    DDL_DATE DATE,
    DDL_USER VARCHAR2(15),
    OBJECT_CREATED VARCHAR2(15),
    OBJECT_NAME VARCHAR2(15),
    DDL_OPERATION VARCHAR2(15)
);





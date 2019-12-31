--Creating User Access Related tables

CREATE  TABLE access_user(
    access_id number(10,0) not null,
    f_name varchar2(20) not null,
    m_name varchar2(20) not null,
    s_name varchar2(20) not null,
    u_emailid varchar2(50) not null,
    u_passwd varchar2(20) not null,
    CONSTRAINT ACCESS_ID_PK PRIMARY KEY(access_id)
);

CREATE TABLE USER_ROLES(
    USER_ROLES_ID NUMBER(10,0) NOT NULL,
    ROLE_ID NUMBER(5,0) NOT NULL,
    ACCESS_ID NUMBER(10,0) NOT NULL,
    CONSTRAINT USER_ROLES_ID_PK PRIMARY KEY(USER_ROLES_ID),
    CONSTRAINT ROLE_ID_FK FOREIGN KEY(ROLE_ID) REFERENCES ACCESS_ROLES(ROLE_ID),
    CONSTRAINT ACCESS_ID_FK FOREIGN KEY(ACCESS_ID) REFERENCES ACCESS_USER(ACCESS_ID)
);

CREATE TABLE LOGIN_TYPE(
    LOGIN_TYPE_ID NUMBER(5,0) NOT NULL,
    L_TYPE VARCHAR2(20) NOT NULL,
    CONSTRAINT LOGIN_TYPE_ID_PK PRIMARY KEY(LOGIN_TYPE_ID)
);

CREATE TABLE LOGOUT_TYPE(
    LOGOUT_TYPE_ID NUMBER(5,0) NOT NULL,
    LOGOUT_TYPE_NAME VARCHAR2(20) NOT NULL,
    CONSTRAINT LOGOUT_TYPE_ID_PK PRIMARY KEY(LOGOUT_TYPE_ID)
);

CREATE TABLE USER_LOGGING (
    LOGIN_ID NUMBER(10,0) NOT NULL,
    ACCESS_ID NUMBER(10,0) NOT NULL,
    IN_TIME DATE NOT NULL,
    OUT_TIME DATE,
    LOGIN_TYPE_ID NUMBER(10,0) NOT NULL,
    LOGOUT_TYPE_ID NUMBER(10,0),
    CONSTRAINT LOGIN_ID_PK PRIMARY KEY(LOGIN_ID),
    CONSTRAINT ACCESS_ID_FK_2 FOREIGN KEY(ACCESS_ID) REFERENCES ACCESS_USER(ACCESS_ID),
    CONSTRAINT LOGIN_TYPE_ID_FK FOREIGN KEY(LOGIN_TYPE_ID) REFERENCES LOGIN_TYPE(LOGIN_TYPE_ID),
    CONSTRAINT LOGOUT_TYPE_ID_FK FOREIGN KEY(LOGOUT_TYPE_ID) REFERENCES LOGOUT_TYPE(LOGOUT_TYPE_ID)
);

--Creating Views for User access tables

CREATE VIEW V_ACCESS_ROLES AS SELECT * FROM ACCESS_ROLES;
CREATE VIEW V_ACCESS_USER AS SELECT * FROM ACCESS_USER;
CREATE VIEW V_LOGIN_TYPE AS SELECT * FROM LOGIN_TYPE;
CREATE VIEW V_LOGOUT_TYPE AS SELECT * FROM LOGOUT_TYPE;
CREATE VIEW V_USER_ROLES AS SELECT * FROM USER_ROLES;

--INSERTING BASIC DATA IN TABLES

INSERT INTO LOGIN_TYPE VALUES(1,'DIRECT');
INSERT INTO LOGIN_TYPE VALUES(2,'WEB SERVICE');

INSERT INTO LOGOUT_TYPE VALUES(1,'SESSION TIME OUT');
INSERT INTO LOGOUT_TYPE VALUES(2,'SESSION ERROR');
INSERT INTO LOGOUT_TYPE VALUES(3,'USER ACTION');



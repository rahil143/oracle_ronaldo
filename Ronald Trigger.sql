--CREATING TRIGGERS FOR RONALDO TABLE

CREATE OR REPLACE TRIGGER RONALDO_AUDIT_TR
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO RONALDO_AUDIT VALUES(
        SYSDATE,
        SYS_CONTEXT('USERENV','CURRENT_USER'),
        ORA_DICT_OBJ_TYPE,
        ORA_DICT_OBJ_NAME,
        ORA_SYSEVENT
    );
END;
/


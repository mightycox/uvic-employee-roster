--Loading Department data
INSERT INTO DEPARTMENT (VERSION, CODE, TITLE) VALUES ( '0', 'SYST', 'Systems' );
INSERT INTO DEPARTMENT (VERSION, CODE, TITLE) VALUES ( '0', 'PSYC', 'Psychology' );
INSERT INTO DEPARTMENT (VERSION, CODE, TITLE) VALUES ( '0', 'HIST', 'History' );

--Loading Employee data
INSERT INTO EMPLOYEE (VERSION, PHONE, NAME, TITLE, EMAIL, DEPARTMENT_ID) VALUES ( '0', '250.111.1111', 'Jane Doe', 'Software developer', 'jane.doe@uvic.ca', '1' );
INSERT INTO EMPLOYEE (VERSION, PHONE, NAME, TITLE, EMAIL, DEPARTMENT_ID) VALUES ( '0', '250.111.1112', 'Maria Rossi', 'Manager', 'maria.rossi@uvic.ca', '1' );
INSERT INTO EMPLOYEE (VERSION, PHONE, NAME, TITLE, EMAIL, DEPARTMENT_ID) VALUES ( '0', '250.111.1113', 'Peter Schmidt', 'Network analyst', 'peter.schmidt@uvic.ca', '1' );
INSERT INTO EMPLOYEE (VERSION, PHONE, NAME, TITLE, EMAIL, DEPARTMENT_ID) VALUES ( '0', '250.111.1114', 'Ashok Kumar', 'Professor', 'ashok.kumar@uvic.ca', '2' );
INSERT INTO EMPLOYEE (VERSION, PHONE, NAME, TITLE, EMAIL, DEPARTMENT_ID) VALUES ( '0', '250.111.1115', 'Pablo Perez', 'Assistant', 'pablo.perez@uvic.ca', '2' );


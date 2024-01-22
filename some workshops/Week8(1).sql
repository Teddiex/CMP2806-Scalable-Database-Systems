create schema week8;
use week8;

CREATE TABLE Project (
  PID INTEGER(7) PRIMARY KEY,
  Pname VARCHAR(30) NOT NULL
);

CREATE TABLE Employee (
  EID INTEGER(7) PRIMARY KEY,
  Ename VARCHAR(30) NOT NULL,
  PID INTEGER(7),
  CONSTRAINT EID_FK
    FOREIGN KEY (PID)
    REFERENCES Project (PID)
    ON DELETE CASCADE
);

CREATE TABLE Vehicle (
  VID INTEGER(7) PRIMARY KEY,
  Vmodel VARCHAR(30) NOT NULL,
  EID INTEGER(7) NOT NULL,
  CONSTRAINT VID_FK
    FOREIGN KEY (EID)
    REFERENCES Employee (EID)
    ON DELETE CASCADE
);

CREATE TABLE Manager (
  MID INTEGER(7) PRIMARY KEY,
  Mname VARCHAR(30) NOT NULL,
  PID INTEGER(7) NOT NULL,
  CONSTRAINT MID_FK
    FOREIGN KEY (PID)
    REFERENCES Project (PID)
    ON DELETE CASCADE
);

INSERT INTO Project VALUES (21, "Alpha");
INSERT INTO Project VALUES (22, "Beta");
INSERT INTO Project VALUES (23, "Gamma");
INSERT INTO Project VALUES (24, "Pi");
INSERT INTO Project VALUES (25, "Lambda");

INSERT INTO Employee Values(1, "Joe", 21);
INSERT INTO Employee Values(2, "Lou", 21);
INSERT INTO Employee Values(3, "Mary", 22);
INSERT INTO Employee Values(4, "Lakshmi", 23);
INSERT INTO Employee Values(5, "Robin", 23);
INSERT INTO Employee (EID, Ename) Values(6, "James");

INSERT INTO Vehicle VALUES (31, "Mustang", 4);
INSERT INTO Vehicle VALUES (32, "Corrolla", 5);
INSERT INTO Vehicle VALUES (33, "Corvette", 5);
INSERT INTO Vehicle VALUES (34, "Metro", 2);
INSERT INTO Vehicle VALUES (35, "Tundra", 2);

INSERT INTO Manager VALUES (41, "Becky", 21);
INSERT INTO Manager VALUES (42, "Kerrie", 22);
INSERT INTO Manager VALUES (43, "Corey", 23);
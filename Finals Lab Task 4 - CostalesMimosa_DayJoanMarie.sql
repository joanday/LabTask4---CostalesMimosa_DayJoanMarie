-- Finals Lab Task 4
-- Transforming ER Model to Relational Tables

CREATE DATABASE IF NOT EXISTS lab_final;
USE lab_final;

-- Table 1: STUDENT
CREATE TABLE IF NOT EXISTS student (
  username VARCHAR(50) NOT NULL,
  PRIMARY KEY (username)
);

-- Table 2: ASSIGNMENT
CREATE TABLE IF NOT EXISTS assignment (
  shortname VARCHAR(50) NOT NULL,
  due_date DATE NOT NULL,
  url VARCHAR(255),
  PRIMARY KEY (shortname)
);

-- Table 3: SUBMISSION
CREATE TABLE IF NOT EXISTS submission (
  username VARCHAR(50) NOT NULL,
  shortname VARCHAR(50) NOT NULL,
  version INT NOT NULL,
  submit_date DATE NOT NULL,
  data TEXT,
  PRIMARY KEY (username, shortname, version),
  FOREIGN KEY (username) REFERENCES student(username)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (shortname) REFERENCES assignment(shortname)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- Verify tables
SHOW TABLES;
DESCRIBE student;
DESCRIBE assignment;
DESCRIBE submission;

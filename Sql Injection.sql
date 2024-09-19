CREATE DATABASE User_Authentication;
USE User_Authentication;
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO users (id, username, password, email) 
VALUES 
    (1, 'admin', 'password123', 'admin@example.com'),
    (2, 'user1', 'pass456', 'user1@example.com'),
    (3, 'user2', 'pass789', 'user2@example.com'),
    (4, 'Pankaj', 'pkpassword', 'pankaj@example.com'),
    (5, 'Mohit', 'MMpw123', 'mohit@example.com');

    select * from users;
    
SELECT * FROM users WHERE username = '$username' AND password = '$password';

-- SQL Injection Testing-- 
-- Simple SQL Injection:-- 
SELECT * FROM users WHERE username = 'admin' -- ' AND password = '';

-- Union-Based SQL Injection:-- 

-- SELECT username, password FROM users WHERE username = 'admin' UNION SELECT database(), version();-- 

-- Error-Based SQL Injection:-- 

SELECT * FROM users WHERE id = 1' AND 1=2;

-- Blind SQL Injection:-- 

SELECT * FROM users WHERE username = 'admin' AND IF(1=1, SLEEP(5), 0); 

-- Preventing SQL Injection-- 

SELECT * FROM users WHERE username = ? AND password = ?;

CREATE TABLE user_roles(
id INT PRIMARY KEY,
role_name VARCHAR(50),
description VARCHAR(100)
);

INSERT INTO user_roles (id, role_name, description)
VALUES
(1, 'Admin', 'Administrator role with full access'),
(2, 'User', 'Regular user with limited access'),
(3, 'Moderator', 'Can moderate content'),
(4, 'Editor', 'Can edit content'),
(5, 'Guest', 'Guest user with minimal access');

SELECT * from user_roles;

CREATE TABLE login_attempts (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    attempt_date DATETIME,
    success BOOLEAN
);
INSERT INTO login_attempts (id, username, attempt_date, success)
VALUES
(1, 'admin', '2024-09-14 08:30:00', TRUE),
(2, 'user1', '2024-09-14 09:15:00', FALSE),
(3, 'john_doe', '2024-09-14 10:00:00', TRUE),
(4, 'user2', '2024-09-14 11:45:00', FALSE),
(5, 'jane_doe', '2024-09-14 12:30:00', TRUE);

SELECT * FROM login_attempts;

Select username, password from users where username = 'admin' Union select database(), version();

Select * from users where username = 'admin' and if(1=1, SLEEP(5), 0);
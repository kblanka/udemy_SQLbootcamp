DROP DATABASE join_me;
CREATE DATABASE join_me;
USE join_me; 

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

-- challenge 1: find the earlist date a user joined
SELECT 
    DATE_FORMAT(created_at, "%b %D %Y") AS earliest_date
FROM users 
ORDER BY created_at LIMIT 1;

-- challenge 2: find email of the first user
SELECT * FROM users 
WHERE created_at = (SELECT MIN(created_at) FROM users);

-- challenge 3: users according to the month they joined
SELECT 
    MONTHNAME(created_at) AS month,
    COUNT(*) AS count 
FROM users
GROUP BY month
ORDER BY count;

-- challenge 4: count number of users with yahoo emails
SELECT 
    COUNT(*) AS yahoo_users 
FROM users
WHERE email LIKE "%@yahoo.com";

-- challenge 5: calculate total number of users for each email host
SELECT 
    CASE
        WHEN email LIKE "%@yahoo.com" THEN "yahoo"
        WHEN email LIKE "%@gmail.com" THEN "gmail"
        WHEN email LIKE "%@hotmail.com" THEN "hotmail"
        ELSE "other"
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider DESC;

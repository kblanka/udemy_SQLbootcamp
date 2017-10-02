-- challenge 1: find the 5 oldest users

SELECT * FROM users ORDER BY created_at LIMIT 5;

-- challenge 2: find the day of the week most users register on

SELECT COUNT(*) AS number_of_users, DAYNAME(created_at) AS day_name
FROM users GROUP BY day_name ORDER BY number_of_users DESC; 

-- challenge 3: find the users who have never posted a photo

SELECT username,
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE image_url IS NULL;

-- challenge 4: find the most liked photo

SELECT username, COUNT(*) as number_of_likes, image_url FROM photos
INNER JOIN likes
    ON photos.id = likes.photo_id
INNER JOIN users
    ON users.id = photos.user_id
GROUP BY image_url 
ORDER BY number_of_likes DESC 
LIMIT 1;

-- challenge 5: calculate the avg posts per user

SELECT 
    (SELECT COUNT(*) FROM users) / (SELECT COUNT(*) FROM photos) AS avg;
    
-- challenge 6: find the top 5 most commonly used hashtags

SELECT COUNT(*) as occurence, tag_name FROM tags
INNER JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY occurence DESC
LIMIT 5;

-- challenge 7:

SELECT username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


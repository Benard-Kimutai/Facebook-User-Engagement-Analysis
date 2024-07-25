SELECT*
FROM facebook.book3;

-- Provide a comprehensive overview of user engagement metrics,
-- including average likes, friend count, and friendships initiated across the dataset
SELECT userid, 
ROUND(AVG(likes),0) AS avg_likes,
ROUND(AVG(friend_count),0) AS avg_friend_count,
ROUND(AVG(friendships_initiated),0) AS avg_friendships_initiated
FROM facebook.book3
GROUP BY userid, tenure
ORDER BY tenure DESC
LIMIT 10;

-- - How are user engagement metrics distributed across the gender?
SELECT gender,
ROUND(SUM(likes),0) AS total_likes,
ROUND(SUM(friend_count),0) AS total_friend_count,
ROUND(SUM(friendships_initiated),0) AS total_friendships_initiated
FROM facebook.book3
GROUP BY gender;

-- Explore the engagement patterns based on the device used (mobile likes vs. www likes) by gender.
SELECT gender,
SUM(mobile_likes) AS total_mobile_likes,
SUM(www_likes) AS total_www_likes
FROM facebook.book3
GROUP BY gender;

--  Explore the engagement patterns based on the device used (mobile_likes_received vs. mobile_likes_received) by gender.
    
SELECT gender,
SUM(mobile_likes_received) AS total_mobile_likes_received,
SUM(mobile_likes_received) AS total_www_likes_received
FROM facebook.book3
GROUP BY gender;

-- platform used engagement summary
SELECT
  CASE
    WHEN mobile_likes > 0 THEN 'mobile'
    WHEN www_likes > 0 THEN 'www'
    ELSE 'unknown'
  END AS platform,
  COUNT(*) AS user_count,
  SUM(likes) AS total_likes,
  SUM(likes_received) AS total_likes_received,
  SUM(friend_count) AS total_friend_count,
  SUM(friendships_initiated) AS total_friendships_initiated,
  SUM(mobile_likes_received) AS total_mobile_likes_received,
  SUM(www_likes_received) AS total_www_likes_received,
  SUM(mobile_likes) AS total_mobile_likes,
  SUM(www_likes) AS total_www_likes
FROM facebook.book3
GROUP BY platform;

-- Identify the top 10 users with the highest likes received.
SELECT userid, likes_received
FROM facebook.book3
ORDER BY likes_received DESC
LIMIT 10;

-- Identify the top 10 users with the highest friendships initiated.
SELECT userid,
friendships_initiated
FROM facebook.book3
ORDER BY friendships_initiated DESC
LIMIT 10;
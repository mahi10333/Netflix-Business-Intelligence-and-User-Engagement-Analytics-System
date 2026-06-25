1. Basic Retrieval Queries

--Show all content

SELECT *
FROM contentsinformation


--Show all premium users

SELECT *
FROM usersinformation
WHERE subscription_type = 'Premium'


--Show all movies only

SELECT 
	title,
	type
FROM contentsinformation
WHERE type = 'Movie'



2. Filtering Queries

--Show all content after 2020

SELECT *
FROM contentsinformation
WHERE release_year > 2020


--Show all users from India

SELECT *
FROM usersinformation
WHERE country = 'India'


--Content with ratings > 8

SELECT *
FROM contentsinformation
JOIN ratinginformation
ON contentsinformation.content_id = ratinginformation.content_id
WHERE ratinginformation.imdb_rating >8


--Sci-Fi content

SELECT *
FROM contentsinformation
WHERE genre = 'Sci-Fi'


--Duration longer than 120 minutes

SELECT *
FROM contentsinformation
WHERE duration > 120



3. Row level Functions

--Convert titles to uppercase and find title lengths

SELECT 
	UPPER(title) AS TITLE,
	LEN(title) AS lengthoftitle
FROM contentsinformation


--Combine username + country

SELECT
	user_name,
	country,
	CONCAT(user_name,' ',country) AS userscountry
FROM usersinformation


--Extract first 3 letters of genre

SELECT 
	genre,
	LEFT(genre,3) AS threecharacters
FROM contentsinformation



4. Aggregation Functions

--Count total content, genre, average duration

SELECT
	content_id,
	title,
	genre,
	duration,
	COUNT(title) OVER() AS number_of_titles,
	COUNT(genre) OVER() AS number_of_genres,
	AVG(duration) OVER() AS avg_duration
FROM contentsinformation

SELECT 
	genre,
	COUNT(title) AS number_of_titles
FROM contentsinformation
GROUP BY genre


--Count by subscription type

SELECT 
	subscription_type,
	COUNT(*) AS number_of_subscription
FROM usersinformation
GROUP BY subscription_type


--Count by country

SELECT
	country,
	COUNT(*) AS number_of_users
FROM usersinformation
GROUP BY country


--Total revenue

SELECT 
	plan_type,
	plan_amount,
	SUM(plan_amount) OVER(PARTITION BY plan_type) AS totalrevenue,
	AVG(plan_amount) OVER(PARTITION BY plan_type) AS avgerage_amount
FROM subscriptioninformation


--Total and average watch time

SELECT
	content_id,
	watch_time_minutes,
	SUM(watch_time_minutes) OVER(PARTITION BY content_id) AS total_watch_time,
	AVG(watch_time_minutes) OVER(PARTITION BY content_id) AS average_watch_time
FROM watchhistoriesinformation



5. Group By + Having

--Genres having more than 3 titles

SELECT
	genre,
	COUNT(*) AS total_titles
FROM contentsinformation
GROUP BY genre
HAVING COUNT(*) > 3


--Countries having more than 2 users

SELECT
	country,
	COUNT(*) AS userscountry
FROM usersinformation
GROUP BY country
HAVING COUNT(*) > 2


--Users with watch time above average

SELECT 
	user_id,
	content_id,
	watch_time_minutes
FROM watchhistoriesinformation
WHERE watch_time_minutes > (
	SELECT 
		AVG(watch_time_minutes)
		FROM watchhistoriesinformation
);


--Content watched more than 2 times

SELECT 
	content_id,
	COUNT(*) AS watch_count
FROM watchhistoriesinformation
GROUP BY content_id
HAVING COUNT(*) > 2



6. Analytical/window functions

--Rank by IMDB rating

SELECT *,
DENSE_RANK() OVER(ORDER BY imdb_rating) AS ranked_imdb_ratings,
DENSE_RANK() OVER(ORDER BY user_rating) AS ranked_user_ratings
FROM ratinginformation 


--Rank users by watch time

SELECT *,
ROW_NUMBER() OVER(ORDER BY watch_time_minutes) AS ranked_watch_time
FROM watchhistoriesinformation


--Rank users by subscription payment

SELECT *,
DENSE_RANK() OVER(ORDER BY plan_amount) AS ranked_subscription_payment
FROM subscriptioninformation


--Rank genres by popularity

SELECT 
	contentsinformation.genre,
	COUNT(watchhistoriesinformation.watch_id) AS total_views,
	RANK() OVER(ORDER BY COUNT(watchhistoriesinformation.watch_id) DESC) AS popularity_rank
FROM contentsinformation
JOIN watchhistoriesinformation
ON contentsinformation.content_id = watchhistoriesinformation.content_id
GROUP BY contentsinformation.genre



7. Business Insight Queries

--Most active users

SELECT 
	usersinformation.user_id,
	usersinformation.user_name,
	COUNT(watchhistoriesinformation.watch_id) AS total_watches,
	RANK() OVER(ORDER BY COUNT(watchhistoriesinformation.watch_id) DESC) AS activity_rank
FROM usersinformation
JOIN watchhistoriesinformation
ON usersinformation.user_id = watchhistoriesinformation.user_id
GROUP BY usersinformation.user_id,
	usersinformation.user_name


--Least active users

SELECT 
	usersinformation.user_id,
	usersinformation.user_name,
	COUNT(watchhistoriesinformation.watch_id) AS total_watches,
	RANK() OVER(ORDER BY COUNT(watchhistoriesinformation.watch_id) ASC) AS activity_rank
FROM usersinformation
JOIN watchhistoriesinformation
ON usersinformation.user_id = watchhistoriesinformation.user_id
GROUP BY usersinformation.user_id,
	usersinformation.user_name


--Average watch time per user

SELECT 
	usersinformation.user_id,
	usersinformation.user_name,
	AVG(contentsinformation.duration) AS avg_watch_time
FROM usersinformation
JOIN watchhistoriesinformation
ON usersinformation.user_id = watchhistoriesinformation.user_id
JOIN contentsinformation
ON watchhistoriesinformation.content_id = contentsinformation.content_id
GROUP BY usersinformation.user_id, usersinformation.user_name


--Most watched content

SELECT 
	contentsinformation.content_id,
	contentsinformation.title,
	COUNT(watchhistoriesinformation.watch_id) AS total_watches,
	ROW_NUMBER() OVER(ORDER BY COUNT(watchhistoriesinformation.watch_id) DESC) AS most_watched
FROM contentsinformation
JOIN watchhistoriesinformation
ON contentsinformation.content_id = watchhistoriesinformation.content_id
GROUP BY contentsinformation.content_id,
	contentsinformation.title

--Highest rated content

SELECT 
	contentsinformation.content_id,
	contentsinformation.title,
	ratinginformation.imdb_rating,
	ROW_NUMBER() OVER(ORDER BY ratinginformation.imdb_rating DESC) AS highest_rated
FROM contentsinformation
JOIN ratinginformation
ON contentsinformation.content_id = ratinginformation.content_id


--Most popular genre

SELECT 
	contentsinformation.genre,
	AVG(ratinginformation.imdb_rating) AS avg_rating,
	RANK() OVER(ORDER BY AVG(ratinginformation.imdb_rating) DESC) AS most_popular_genre
FROM contentsinformation
JOIN ratinginformation
ON contentsinformation.content_id = ratinginformation.content_id
GROUP BY 
	contentsinformation.genre
	

--Total monthly revenue

SELECT 
	user_id,
	plan_amount,
	SUM(plan_amount) OVER() AS total_monthly_revenue
FROM subscriptioninformation


--Highest paying users

SELECT 
	usersinformation.user_id,
	usersinformation.user_name,
	SUM(subscriptioninformation.plan_amount) AS total_paid,
	RANK() OVER(ORDER BY SUM(subscriptioninformation.plan_amount) DESC) AS highest_paying
FROM usersinformation
JOIN subscriptioninformation
ON usersinformation.user_id = subscriptioninformation.user_id
GROUP BY usersinformation.user_id,
	usersinformation.user_name


--Premium vs Basic Distribution

SELECT 
	plan_type,
    COUNT(user_id) AS total_users
FROM subscriptioninformation
GROUP BY plan_type


--Country wise user count

SELECT 
	usersinformation.country,
	COUNT(usersinformation.user_id) AS total_users
FROM usersinformation
GROUP BY usersinformation.country


--Country wise premium users

SELECT 
	usersinformation.country,
	COUNT(usersinformation.user_id) AS total_users
FROM usersinformation
JOIN subscriptioninformation
ON usersinformation.user_id = subscriptioninformation.user_id
WHERE subscriptioninformation.plan_type = 'Premium'
GROUP BY usersinformation.country
ORDER BY total_users DESC

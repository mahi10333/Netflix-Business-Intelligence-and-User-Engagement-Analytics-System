DROP TABLE IF EXISTS contentsinformation;
DROP TABLE IF EXISTS usersinformation;
DROP TABLE IF EXISTS watchhistoriesinformation;
DROP TABLE IF EXISTS ratinginformation;
DROP TABLE IF EXISTS subscriptioninformation;
DROP TABLE IF EXISTS directorinformation;

--Content table

CREATE TABLE contentsinformation (
	content_id INT,
	title VARCHAR(100),
	type VARCHAR(20),
	genre VARCHAR(50),
	release_year INT,
	duration INT
);


--Users table

CREATE TABLE usersinformation (
	user_id INT,
	user_name VARCHAR(50),
	country VARCHAR(50),
	subscription_type VARCHAR(20),
	plan_amount INT
);


--Watch History table

CREATE TABLE watchhistoriesinformation (
	watch_id INT,
	user_id INT,
	content_id INT,
	watch_date DATE,
	watch_time_minutes INT
);


--Ratings table

CREATE TABLE ratinginformation (
	rating_id INT,
	content_id INT,
	imdb_rating DECIMAL(2,1),
	user_rating DECIMAL(2,1)
);


--Subscription Revenue table

CREATE TABLE subscriptioninformation (
	subscription_id INT,
	user_id INT,
	plan_type VARCHAR(20),
	plan_amount INT,
	payment_date DATE
);


--Directors table

CREATE TABLE directorinformation (
	content_id INT,
	director_id INT,
	director_name VARCHAR(50),
	country VARCHAR(50)
);

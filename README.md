# Netflix-Business-Intelligence-and-User-Engagement-Analytics-System

## Project Overview
This project is a SQL-based Netflix analytics system designed to analyze content performance, user engagement, subscription trends, ratings, and revenue insights.

The database simulates a real-world OTT platform like Netflix and applies SQL concepts such as joins, aggregation, subqueries, window functions, ranking, and filtering to extract business intelligence.

---

## Objectives
- Analyze content popularity and performance
- Track user watch behavior
- Evaluate subscription revenue
- Compare premium vs basic users
- Identify highly rated and most watched content
- Understand genre-wise trends

---

## Database Schema

This project consists of 6 tables:

### 1. Contents Information
Stores details of movies and series.

| Column | Type |
|---|---|
| content_id | INT |
| title | VARCHAR |
| type | VARCHAR |
| genre | VARCHAR |
| release_year | INT |
| duration | INT |

---

### 2. Users Information
Stores user details and subscription type.

| Column | Type |
|---|---|
| user_id | INT |
| user_name | VARCHAR |
| country | VARCHAR |
| subscription_type | VARCHAR |
| plan_amount | INT |

---

### 3. Watch Histories Information
Tracks user watch history.

| Column | Type |
|---|---|
| watch_id | INT |
| user_id | INT |
| content_id | INT |
| watch_date | DATE |
| watch_time_minutes | INT |

---

### 4. Rating Information
Stores IMDb and user ratings.

| Column | Type |
|---|---|
| rating_id | INT |
| content_id | INT |
| imdb_rating | DECIMAL |
| user_rating | DECIMAL |

---

### 5. Subscription Information
Tracks subscription payments.

| Column | Type |
|---|---|
| subscription_id | INT |
| user_id | INT |
| plan_type | VARCHAR |
| plan_amount | INT |
| payment_date | DATE |

---

### 6. Director Information
Stores content directors.

| Column | Type |
|---|---|
| content_id | INT |
| director_id | INT |
| director_name | VARCHAR |
| country | VARCHAR |

---

## SQL Concepts Used

- SELECT Statements
- WHERE Clause
- ORDER BY
- GROUP BY
- HAVING
- JOINS
- Aggregate Functions
- Window Functions
- Subqueries
- Ranking Functions
- String Functions

---

## Business Problems Solved

### Content Analysis
- Show all content
- Show movies only
- Show content released after 2020
- Find Sci-Fi content
- Find content longer than 120 minutes

### User Analysis
- Show premium users
- Show users from India
- Country-wise user count
- Country-wise premium users
- Most active users
- Least active users

### Rating Analysis
- Content with rating above 8
- Highest rated content
- Rank by IMDb rating
- Most popular genre

### Watch Behavior Analysis
- Total and average watch time
- Average watch time per user
- Most watched content
- Content watched more than 2 times
- Users with watch time above average

### Revenue Analysis
- Total monthly revenue
- Highest paying users
- Premium vs Basic distribution
- Revenue by subscription type

---

## Advanced SQL Queries Implemented

### Most Watched Content
Uses:
- JOIN
- COUNT()
- ROW_NUMBER()

### Highest Rated Content
Uses:
- JOIN
- Window Functions
- Ranking

### Most Popular Genre
Uses:
- AVG()
- GROUP BY
- RANK()

### Highest Paying Users
Uses:
- SUM()
- RANK()

### Country-wise Premium Users
Uses:
- JOIN
- WHERE
- GROUP BY

---

## Key Insights

- Sci-Fi and Crime genres dominate user engagement
- Premium users contribute the highest revenue
- Some content has significantly higher repeat watches
- User watch behavior varies across countries
- IMDb ratings strongly influence content popularity

---

## Skills Demonstrated

- SQL Database Design
- Business Intelligence
- Data Analytics
- Query Optimization
- Window Functions
- Data Aggregation
- Relational Database Management

---

## Tools Used

- SQL Server / MySQL
- GitHub
- LinkedIn
- Database Design Concepts

---

## Future Improvements

- Add recommendation engine logic
- Add user retention analysis
- Add content-based recommendation system
- Create dashboards using Power BI / Tableau
- Add genre growth trends over time

---

## Author

**Mahi Vijay**  
Aspiring Data Analyst / SQL Developer

LinkedIn: Add your LinkedIn profile here  
GitHub: Add your GitHub repository link here




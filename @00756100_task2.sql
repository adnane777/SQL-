--creating databases
CREATE DATABASE FoodserviceDB

USE FoodserviceDB

-- just dooing select queries on each table.

select * from dbo.consumers
select * from dbo.restaurant_cuisines
select* from dbo.restaurants
select * from dbo.ratings


-- Add foreign key constraint to Ratings table
ALTER TABLE ratings
ADD FOREIGN KEY (Consumer_ID) REFERENCES consumers(Consumer_ID)

ALTER TABLE ratings
ADD FOREIGN KEY (Restaurant_ID) REFERENCES restaurants(Restaurant_ID)

-- Add foreign key constraint to Restaurant_Cuisines table
ALTER TABLE restaurant_cuisines
ADD FOREIGN KEY (Restaurant_ID) REFERENCES restaurants(Restaurant_ID)


--1.Write a query that lists all restaurants with a Medium range price with open area, serving Mexican food.

SELECT * FROM restaurants as r 
WHERE r.Price = 'Medium' AND r.Area = 'Open' 
AND EXISTS (
    SELECT * 
    FROM restaurant_cuisines as rc 
    WHERE r.Restaurant_ID = rc.Restaurant_ID  AND Cuisine = 'Mexican'
)

--2.Write a query that returns the total number of restaurants who have the overall rating as 1 and are serving Mexican food. 
-- Compare the results with the total number of restaurants who have the overall rating as 1 serving Italian food (please give explanations on their comparison)

SELECT Cuisine, COUNT(DISTINCT  rc.Restaurant_ID) AS Total_Restaurants
FROM restaurant_cuisines as rc
JOIN ratings r ON rc.Restaurant_ID = r.Restaurant_ID
WHERE Overall_Rating = 1
AND Cuisine IN ('Mexican', 'Italian')
GROUP BY Cuisine	

--3.Calculate the average age of consumers who have given a 0 rating to the 'Service_rating' column. (NB: round off the value if it is a decimal)

SELECT ROUND(AVG(c.Age), 2) AS Average_Age
FROM consumers AS c INNER JOIN ratings AS r
ON c.Consumer_ID = r.Consumer_ID   
WHERE Service_Rating = 0


--4Write a query that returns the restaurants ranked by the youngest consumer. 
--You should include the restaurant name and food rating that is given by that customer to the restaurant in your result. Sort the results based on food rating from high to low.

SELECT r.Name, ratings.Food_Rating
FROM restaurants r 
JOIN ratings ON r.Restaurant_ID = ratings.Restaurant_ID
JOIN consumers c ON ratings.Consumer_ID = c.Consumer_ID  WHERE  c.Age= (SELECT  MIN(Age)FROM consumers)
ORDER BY  Food_Rating DESC

--5.Write a stored procedure for the query given as:
---Update the Service_rating of all restaurants to '2' if they have parking available, either as 'yes' or 'public'

CREATE PROCEDURE UpdateServiceRatingWithParking
AS
BEGIN
    UPDATE ratings
    SET Service_Rating = 2
    WHERE Restaurant_ID IN (
        SELECT Restaurant_ID
        FROM restaurants
        WHERE Parking IN ('Yes', 'Public')
    )
END

--ecexuting the stored procedure'

EXEC UpdateServiceRatingWithParking

--checking weather the stored procedure has runned sucessfully by just selecting those datas.

SELECT Service_Rating  from ratings
    WHERE Restaurant_ID IN (
        SELECT Restaurant_ID
        FROM restaurants
        WHERE Parking IN ('Yes', 'Public')
    )

--6.You should also write four queries of your own and provide a brief explanation of the results which each query returns. You should make use of all of the following at least once:
--Nested queries-EXISTS
--Nested queries-IN
--System functions
--Use of GROUP BY, HAVING and ORDER BY clauses

-- using Nested queries-EXISTS, listing the restaurents that have franchises

SELECT Name, City, State
FROM restaurants AS rs
WHERE EXISTS (
    SELECT *
    FROM ratings
    WHERE ratings.Restaurant_ID = rs.Restaurant_ID
) AND Franchise = 'Yes'

--unsing Nested queries-IN, listing the consumers that have given the overall ratings>=2

SELECT Consumer_ID, City, State
FROM consumers
WHERE Consumer_ID IN (
    SELECT Consumer_ID
    FROM ratings
    WHERE Overall_Rating >= 2
)

--using System functions, using the count system function to get the details of  restaurat with most number of ratings.

SELECT TOP 1
 rt.Restaurant_ID, r.Name, Numberoff_Ratings 
 FROM (SELECT Restaurant_ID, COUNT(*) AS Numberoff_Ratings FROM  Ratings 
    GROUP BY Restaurant_ID) AS rt
JOIN restaurants AS r ON r.Restaurant_ID = rt.Restaurant_ID
ORDER BY  Numberoff_Ratings DESC

--Use of GROUP BY, HAVING and ORDER BY clauses, code is to find the cuisines that are more than in 5 restaurents.

SELECT Cuisine, COUNT(DISTINCT Restaurant_ID) AS Numberoff_Restaurants
FROM restaurant_cuisines
GROUP BY Cuisine
HAVING COUNT(*) > 5
ORDER BY Numberoff_Restaurants DESC

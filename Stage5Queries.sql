-- Query 1
SELECT name AS 'Restaurant', text_content AS 'Review'
FROM review
INNER JOIN restaurant ON review.restID = restaurant.restID
WHERE restaurant.name = 'Blue Harbor'
AND review.diningDate BETWEEN '2025-04-10' AND '2026-05-10';


-- Query 2
SELECT restaurant.name, COUNT(reservation.reservationID) AS 'Total Reservations'
FROM reservation
INNER JOIN restaurant ON reservation.restID = restaurant.restID
WHERE restaurant.restID IN (
    SELECT restaurantCuisine.restID
    FROM restaurantCuisine
    INNER JOIN cuisine ON restaurantCuisine.cuisineID = cuisine.cuisineID
    WHERE cuisine.cuisineName = 'American'
)
AND restaurant.city = 'New York'
GROUP BY restaurant.name;


-- Query 3
SELECT restaurant.name, restaurant.street, cuisine.cuisineName,
       experience.name AS 'experience name', experience.description, experience.price
FROM restaurant
INNER JOIN experience ON restaurant.restID = experience.restID
INNER JOIN restaurantCuisine ON restaurant.restID = restaurantCuisine.restID
INNER JOIN cuisine ON restaurantCuisine.cuisineID = cuisine.cuisineID
WHERE restaurant.city = 'Chicago'
AND (experience.name LIKE '%tasting%' OR experience.description LIKE '%tasting%');


-- Query 4
SELECT restaurant.name,restaurant.street,restaurant.city,details.priceRange,
	   details.diningStyle,reservation.partySize, reservation.resTime, reservation.resDate
FROM restaurant
INNER JOIN details ON restaurant.restID = details.restID
INNER JOIN reservation ON restaurant.restID = reservation.restID
WHERE details.diningStyle = 'Casual Dining'
AND restaurant.city = 'Austin'
AND reservation.partySize = 4
AND reservation.resDate = '2026-05-11'
AND reservation.resTime = '19:00:00';
  
-- Query 5
SELECT restaurant.name, restaurant.street, details.dressCode,
       details.parkDetail, details.priceRange, details.paymentOptions
FROM restaurant
INNER JOIN details ON restaurant.restID = details.restID
INNER JOIN RestHasTag ON restaurant.restID = RestHasTag.restID
INNER JOIN tag ON RestHasTag.tagID = tag.tagID
WHERE tag.tagName = 'Outdoor Seating'
AND details.paymentOptions = 'Credit Cards'
AND restaurant.city = 'Austin';


-- Query 6
SELECT restaurant.name, restaurant.street, restaurant.city,
       restaurant.state, restaurant.zipCode, cuisine.cuisineName
FROM saved
INNER JOIN restaurant ON saved.restID = restaurant.restID
INNER JOIN restaurantCuisine ON restaurant.restID = restaurantCuisine.restID
INNER JOIN cuisine ON restaurantCuisine.cuisineID = cuisine.cuisineID
WHERE saved.userID = 10;


-- Query 7
SELECT restaurant.name, AVG(review.overallRating) AS 'avg overall', AVG(review.foodRating) AS 'avg food',
       AVG(review.serviceRating) AS 'avg service', AVG(review.ambRating) AS 'avg ambience', 
       AVG(review.numOfStars) AS 'avg stars'
FROM restaurant
INNER JOIN review ON restaurant.restID = review.restID
INNER JOIN details ON restaurant.restID = details.restID
WHERE restaurant.city = 'Chicago'
AND details.diningStyle = 'Fine Dining'
GROUP BY restaurant.name;


-- Query 8
SELECT user.firstName, user.lastName, user.email,reservation.partySize,
       reservation.resTime, reservation.specialReq, restaurantTable.tableID
FROM reservation
INNER JOIN user ON reservation.userID = user.userID
INNER JOIN restaurant ON reservation.restID = restaurant.restID
INNER JOIN isAvailable ON reservation.reservationID = isAvailable.reservationID
INNER JOIN restaurantTable ON isAvailable.tableID = restaurantTable.tableID
WHERE restaurant.name = 'Urban Table'
AND reservation.resDate = '2026-04-21';

-- Query 9
SELECT restaurant.name, review.reviewID, review.diningDate, review.overallRating,
       review.foodRating, review.serviceRating, review.ambRating, review.text_content,
       response.text_body AS response_text
FROM review
INNER JOIN restaurant ON review.restID = restaurant.restID
LEFT JOIN response ON review.reviewID = response.reviewID;


-- Query 10
SELECT restaurant.name AS 'Restaurant name', restaurant.city, restaurant.capacity,
       COUNT(reservation.reservationID) AS 'Total reservations',
       COUNT(review.reviewID) AS 'Total reviews',
       AVG(review.overallRating) AS 'Avg overall rating',
       AVG(review.foodRating) AS 'Avg food rating',
       AVG(review.serviceRating) AS 'Avg service rating',
       SUM(reservation.partySize) AS 'Total guests served'
FROM restaurant
INNER JOIN reservation ON restaurant.restID = reservation.restID
INNER JOIN review ON restaurant.restID = review.restID
INNER JOIN details ON restaurant.restID = details.restID
WHERE reservation.status = 'Confirmed'
AND details.diningStyle IN ('Fine Dining', 'Upscale Casual', 'Casual Dining')
GROUP BY restaurant.name, restaurant.city, restaurant.capacity
HAVING COUNT(DISTINCT reservation.reservationID) >= 2
AND AVG(review.overallRating) >= 3.5;
SELECT * FROM FactHotelOccupancy;

SELECT Region, Country, State, City, SUM(Revenue) 
FROM DimHotel 
INNER JOIN FactHotelOccupancy 
ON DimHotel.HotelID = FactHotelOccupancy.HotelID 
GROUP BY Region, Country, State, City 
WITH ROLLUP;

SELECT Country, StarRating, SUM(Revenue) 
FROM DimHotel 
INNER JOIN FactHotelOccupancy 
ON DimHotel.HotelID = FactHotelOccupancy.HotelID 
WHERE Country IN ('Canada', 'Finland') AND StarRating IN (1, 2, 3, 4, 5) 
GROUP BY Country, StarRating;

SELECT Country, HotelType, SUM(Revenue) 
FROM DimHotel 
INNER JOIN FactHotelOccupancy 
ON DimHotel.HotelID = FactHotelOccupancy.HotelID 
GROUP BY Country, HotelType;

SELECT Country, HotelType, SUM(Revenue) 
FROM DimHotel 
INNER JOIN FactHotelOccupancy 
ON DimHotel.HotelID = FactHotelOccupancy.HotelID 
WHERE HotelType IN ('Hotel', 'Motel') AND Country = 'Canada' 
GROUP BY Country, HotelType;
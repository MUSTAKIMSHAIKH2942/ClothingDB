--Fetching the product details along with its available sizes and colors
SELECT 
    p.productName, 
    p.description, 
    p.price,
    c.categoryName,
    GROUP_CONCAT(DISTINCT s.sizeLabel) AS sizes,
    GROUP_CONCAT(DISTINCT col.colorName) AS colors
FROM ClothingProducts p
JOIN ClothingCategories c ON p.categoryID = c.categoryID
LEFT JOIN ProductSizes ps ON p.productID = ps.productID
LEFT JOIN Sizes s ON ps.sizeID = s.sizeID
LEFT JOIN ProductColors pc ON p.productID = pc.productID
LEFT JOIN Colors col ON pc.colorID = col.colorID
WHERE p.productName = 'Classic Red Shirt'
GROUP BY p.productID;

--Get the stock level for each product in the 'Shirts' category.
SELECT 
    p.productName, 
    p.stock 
FROM ClothingProducts p
JOIN ClothingCategories c ON p.categoryID = c.categoryID
WHERE c.categoryName = 'Shirts';

--Top 5 Most Expensive Products:
SELECT productName, price 
FROM ClothingProducts 
ORDER BY price DESC 
LIMIT 5;

--Average Price of Products by Category:
SELECT c.categoryName, AVG(p.price) AS avgPrice 
FROM ClothingProducts p
JOIN ClothingCategories c ON p.categoryID = c.categoryID 
GROUP BY c.categoryName;

--Products Available in Both 'Red' and 'Blue' Colors:
SELECT p.productName 
FROM ClothingProducts p
JOIN ProductColors pc ON p.productID = pc.productID
JOIN Colors col ON pc.colorID = col.colorID 
WHERE col.colorName IN ('Red', 'Blue')
GROUP BY p.productName
HAVING COUNT(DISTINCT col.colorName) = 2;

--Products without Any Size Information:
SELECT p.productName 
FROM ClothingProducts p
LEFT JOIN ProductSizes ps ON p.productID = ps.productID
WHERE ps.sizeID IS NULL;

--Categories with More Than 10 Products:
SELECT c.categoryName, COUNT(p.productID) AS numProducts 
FROM ClothingCategories c
LEFT JOIN ClothingProducts p ON c.categoryID = p.categoryID
GROUP BY c.categoryName
HAVING numProducts > 10;

--Products Available in Size 'M' But Not in 'L':
SELECT p.productName 
FROM ClothingProducts p
JOIN ProductSizes psM ON p.productID = psM.productID
JOIN Sizes sM ON psM.sizeID = sM.sizeID AND sM.sizeLabel = 'M'
LEFT JOIN ProductSizes psL ON p.productID = psL.productID
LEFT JOIN Sizes sL ON psL.sizeID = sL.sizeID AND sL.sizeLabel = 'L'
WHERE sL.sizeID IS NULL;

--List of Products with Their Material and Total Stock:
SELECT p.productName, p.material, SUM(p.stock) AS totalStock 
FROM ClothingProducts p 
GROUP BY p.material, p.productName 
ORDER BY totalStock DESC;

--Products That Need Re-stocking (stock less than 20):
SELECT productName, stock 
FROM ClothingProducts 
WHERE stock < 20;

--Total Revenue Potential:
SELECT SUM(price * stock) AS potentialRevenue 
FROM ClothingProducts;

--Find Products with Material 'Cotton' in 'Shirts' Category:
SELECT p.productName
FROM ClothingProducts p
JOIN ClothingCategories c ON p.categoryID = c.categoryID
WHERE p.material = 'Cotton' AND c.categoryName = 'Shirts';

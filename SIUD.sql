-- INSERT: Adding a category and a product

-- Adding a new category for T-Shirts
INSERT INTO ClothingCategories (categoryName, description) 
VALUES ('T-Shirts', 'Casual upper wear');

-- Inserting a product related to the T-Shirt category
INSERT INTO ClothingProducts (productName, description, price, stock, categoryID, material, careInstructions)
VALUES ('Cool Graphic Tee', 'A cotton T-shirt with a cool graphic design.', 19.99, 100, LAST_INSERT_ID(), 'Cotton', 'Machine wash cold');

-- SELECT: Retrieving products

-- Fetching all products
SELECT * FROM ClothingProducts;

-- Fetching the Cool Graphic Tee details using its ID
SELECT * FROM ClothingProducts WHERE productName = 'Cool Graphic Tee';

-- UPDATE: Modifying the description and price of the Cool Graphic Tee
UPDATE ClothingProducts 
SET description = 'A soft cotton T-shirt with a stylish graphic design.', price = 17.99 
WHERE productName = 'Cool Graphic Tee';

-- DELETE: Removing the Cool Graphic Tee from the database
DELETE FROM ClothingProducts WHERE productName = 'Cool Graphic Tee';

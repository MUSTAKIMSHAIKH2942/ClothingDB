-- Categories for clothing, e.g., shirts, trousers, jackets, etc.
CREATE TABLE ClothingCategories (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL,
    description TEXT
);

-- Available sizes for clothing items, e.g., S, M, L, XL, etc.
CREATE TABLE Sizes (
    sizeID INT PRIMARY KEY AUTO_INCREMENT,
    sizeLabel VARCHAR(10) NOT NULL
);

-- Colors available for clothing items, e.g., red, blue, green, etc.
CREATE TABLE Colors (
    colorID INT PRIMARY KEY AUTO_INCREMENT,
    colorName VARCHAR(50) NOT NULL,
    colorCode VARCHAR(7)  -- E.g., #FFFFFF for white
);

-- The main table for clothing products
CREATE TABLE ClothingProducts (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoryID INT,
    material VARCHAR(255),   -- E.g., cotton, polyester, etc.
    careInstructions TEXT,   -- E.g., 'Machine wash cold'
    FOREIGN KEY (categoryID) REFERENCES ClothingCategories(categoryID)
);

-- Relational table for product sizes (since one product can have many sizes)
CREATE TABLE ProductSizes (
    productSizeID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT,
    sizeID INT,
    FOREIGN KEY (productID) REFERENCES ClothingProducts(productID),
    FOREIGN KEY (sizeID) REFERENCES Sizes(sizeID)
);

-- Relational table for product colors (since one product can have many colors)
CREATE TABLE ProductColors (
    productColorID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT,
    colorID INT,
    FOREIGN KEY (productID) REFERENCES ClothingProducts(productID),
    FOREIGN KEY (colorID) REFERENCES Colors(colorID)
);

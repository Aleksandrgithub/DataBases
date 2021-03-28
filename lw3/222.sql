DROP DATABASE IF EXISTS lw3_6variable;
CREATE DATABASE lw3_6variable collate utf16_general_ci;
USE lw3_6variable;

CREATE TABLE Сook 
(
	id_cook INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    post VARCHAR(50) NOT NULL,
    id_order INT NOT NULL,
    PRIMARY KEY (id_cook)
);

CREATE TABLE Decree 
(
	id_decree INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    total_price INT(11) NOT NULL,
    id_dish INT NOT NULL,
    PRIMARY KEY (id_decree)
);

CREATE TABLE Recipe 
(
	id_recipe INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    country_cuisine VARCHAR(50) NOT NULL,
    price INT(11) NOT NULL,
    supply VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_recipe)
);

CREATE TABLE Dish 
(
	id_dish INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    price INT(11) NOT NULL,
    id_recipe INT NOT NULL,
    FOREIGN KEY (id_recipe) REFERENCES Recipe (id_recipe),
    PRIMARY KEY (id_dish)
);

CREATE TABLE Product 
(
	id_product INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_product)
);

CREATE TABLE Products_in_dish
(
    id_product INT NOT NULL,
    id_dish INT NOT NULL,
    FOREIGN KEY (id_dish) REFERENCES Dish (id_dish),
    FOREIGN KEY (id_product) REFERENCES Product (id_product),
    PRIMARY KEY (id_product, id_dish)
);

CREATE TABLE Dish_in_Decree
(
    id_dish INT NOT NULL,
    id_decree INT NOT NULL,
    FOREIGN KEY (id_dish) REFERENCES Dish (id_dish),
    FOREIGN KEY (id_decree) REFERENCES Decree (id_decree),
    PRIMARY KEY (id_dish, id_decree)
);

CREATE TABLE Decree_To_Cook
(
	
    id_cook INT NOT NULL,
    id_decree INT NOT NULL,
    PRIMARY KEY (id_cook, id_decree)
    
);


alter table Decree_To_Cook
add foreign key (id_cook) REFERENCES Cook (id_cook)
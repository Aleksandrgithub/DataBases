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
    PRIMARY KEY (id_order)
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
    PRIMARY KEY (id_order)
);

CREATE TABLE Products 
(
	id_products INT NOT NULL auto_increment,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_products)
);

CREATE TABLE Products_in_recipe
(
    id_products INT NOT NULL,
    id_recipe INT NOT NULL,
    FOREIGN KEY (id_recipe) REFERENCES Recipe (id_recipe),
    FOREIGN KEY (id_products) REFERENCES Products (id_products),
    PRIMARY KEY (id_products, id_recipe)
);




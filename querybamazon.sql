DROP DATABASE IF EXISTS bamazonDB;

CREATE DATABASE bamazonDB;

USE bamazonDB;

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(30) NULL,
  departent_name VARCHAR(30) NULL,
  price INT NULL,
  stock_quantity INT NULL, 
  PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Feet", "Body Parts", 25, 7);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Elbows", "Body Parts", 5, 13);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Ears", "Body Parts", 8, 3);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Neck Bolts", "Accessories", 19, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Lab Coat", "Accessories", 99, 2);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Beaker", "Lab Equipment", 5, 13);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Flask", "Lab Equipment", 25, 7);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Bunson Burner", "Lab Equipment", 5, 13);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Frankenstein Name Tag", "Accessories", 25, 7);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Lightning Rod", "Electrical", 799, 0);

select * FROM products;
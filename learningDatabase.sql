DROP DATABASE learningDatabase;
CREATE DATABASE learningDatabase;
USE learningDatabase;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE purchases_historic (
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Inserção de dados nas tabelas
INSERT INTO users(name, age, city) VALUES 
("Antonio", 22, "Santo Antonio de Posse"),
("Maria", 30, "São Paulo"),
("João", 25, "Rio de Janeiro"),
("Ana", 28, "Belo Horizonte"),
("Carlos", 35, "Curitiba"),
("Fernanda", 27, "Porto Alegre"),
("Marcos", 33, "Florianópolis"),
("Julia", 24, "Salvador"),
("Pedro", 29, "Fortaleza"),
("Paula", 26, "Recife");

INSERT INTO products(description, price) VALUES
("Batata Doce", 12.99),
("Maçã Gala", 8.50),
("Cenoura", 4.25),
("Banana Prata", 7.30),
("Tomate", 6.80),
("Laranja Pera", 5.20),
("Alface", 3.00),
("Pimentão Vermelho", 9.40),
("Couve", 4.10),
("Abacaxi", 10.75);

INSERT INTO purchases_historic(user_id, product_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Selecionar todas as entradas nas tabelas
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM purchases_historic;

-- Seleção melhorada usando JOINs
SELECT 
	users.name,
    products.description, 
    products.price
FROM purchases_historic
INNER JOIN users ON purchases_historic.user_id = users.id
INNER JOIN products ON purchases_historic.product_id = products.id;
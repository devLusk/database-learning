DROP DATABASE IF EXISTS learningJoins;
CREATE DATABASE learningJoins;
USE learningJoins;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DOUBLE NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

-- Inserindo dados nas tabelas
INSERT INTO customers (first_name, last_name) VALUES 
('John', 'Doe'),
('Jane', 'Smith'),
('Michael', 'Johnson'),
('Emily', 'Davis'),
('David', 'Brown');

INSERT INTO transactions (amount, customer_id) VALUES 
(100.50, 1),
(200.75, 2),
(150.00, 1),
(300.20, 3),
(250.40, 2),
(400.60, 4),
(500.80, 5);

-- Listando tudo
SELECT * FROM customers;
SELECT * FROM transactions;

-- Listando com Joins
SELECT
	transaction_id,
	amount,
	first_name,
	last_name
FROM transactions
INNER JOIN customers ON transactions.customer_id = customers.customer_id;
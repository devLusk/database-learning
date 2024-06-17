DROP DATABASE IF EXISTS taskManagement;
CREATE DATABASE taskManagement;
USE taskManagement;

-- Criando Tables
CREATE TABLE users (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE projects (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE tasks (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    project_id INT NOT NULL,
    creation_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    status VARCHAR(9) NOT NULL
);

-- Adicionando Constraints
ALTER TABLE users
ADD CONSTRAINT pk_user PRIMARY KEY (id);

ALTER TABLE users
MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE projects 
ADD CONSTRAINT pk_project PRIMARY KEY (id);

ALTER TABLE projects 
MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE projects 
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE tasks
ADD CONSTRAINT pk_task PRIMARY KEY (ID);

ALTER TABLE tasks
MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE tasks
ADD CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES projects(id);

-- Adicionando valores nas tabelas
INSERT INTO users (name, email, password) VALUES 
('Alice Johnson', 'alice.johnson@example.com', 'password123'),
('Bob Smith', 'bob.smith@example.com', 'password456'),
('Carol White', 'carol.white@example.com', 'password789');

INSERT INTO projects (name, description, user_id, start_date, end_date) VALUES 
('Project Alpha', 'Descrição do Projeto Alpha', 1, '2024-06-01', '2024-12-31'),
('Project Beta', 'Descrição do Projeto Beta', 2, '2024-07-01', '2024-11-30'),
('Project Gamma', 'Descrição do Projeto Gamma', 3, '2024-08-01', '2024-10-31');

INSERT INTO tasks (name, description, project_id, creation_date, expiration_date, status) VALUES 
('Task 1', 'Descrição da Tarefa 1', 1, '2024-06-05', '2024-06-15', 'Pendente'),
('Task 2', 'Descrição da Tarefa 2', 1, '2024-06-10', '2024-06-20', 'Pendente'),
('Task 3', 'Descrição da Tarefa 3', 2, '2024-07-05', '2024-07-15', 'Completo'),
('Task 4', 'Descrição da Tarefa 4', 2, '2024-07-10', '2024-07-20', 'Pendente'),
('Task 5', 'Descrição da Tarefa 5', 3, '2024-08-05', '2024-08-15', 'Progresso');

-- Métodos de select
SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM tasks;

SELECT * FROM projects WHERE user_id = 1;
SELECT * FROM tasks WHERE project_id = 1 ORDER BY expiration_date;

SELECT * FROM projects WHERE end_date < CURDATE();
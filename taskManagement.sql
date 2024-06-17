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
    status VARCHAR(10) NOT NULL
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
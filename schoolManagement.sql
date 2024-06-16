DROP DATABASE IF EXISTS schoolManagement;
CREATE DATABASE schoolManagement;
USE schoolManagement;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    class_name VARCHAR(255) NOT NULL
);

CREATE TABLE teachers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL
);

CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    teacher_id INT NOT NULL,
    CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id)
        REFERENCES teachers (id)
);

CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subjects_id INT NOT NULL,
    note INT NOT NULL,
    CONSTRAINT fk_student_id FOREIGN KEY (student_id)
        REFERENCES students (id),
    CONSTRAINT fk_subjects_id FOREIGN KEY (subjects_id)
        REFERENCES subjects (id)
);

INSERT INTO students(name, birth_date, class_name) VALUES
('Antonio Carlos', '2004-01-12', 'Class A-01'),
('Pedro Luis', '2003-05-13', 'Class A-02'),
('Maria Luiza', '2005-12-02', 'Class B-01'),
('Ana Beatriz', '2003-08-21', 'Class A-02'),
('João da Silva', '2004-03-17', 'Class B-01'),
('Carolina Santos', '2005-11-30', 'Class A-01');

INSERT INTO teachers(name, specialty) VALUES
('John Smith', 'Mathematics'),
('Emily Davis', 'English Literature'),
('Michael Johnson', 'Physics'),
("Roberto Carlos", "Arts");

INSERT INTO subjects(name, teacher_id) VALUES
('Mathematics', 1),
('English Literature', 2),
('Physics', 3),
('Arts', 4);

INSERT INTO notes(student_id, subjects_id, note) VALUES
(1, 1, 85),
(1, 3, 99),
(2, 2, 78),
(3, 3, 92),
(4, 2, 80),
(5, 3, 88),
(6, 1, 90);

-- TODO: Realizar consultas para listar alunos de uma turma específica, notas de um aluno em disciplinas, média geral dos alunos, etc.
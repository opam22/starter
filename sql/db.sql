CREATE TABLE todos (
    id INT,
    todo VARCHAR(100)
);

INSERT INTO todos (id, todo) VALUES (1, 'Coding');
INSERT INTO todos (id, todo) VALUES (2, 'Sleep');

CREATE TABLE users (
    id INT,
    nama VARCHAR(100)
);

INSERT INTO users (id, nama) VALUES (1, 'sadewo');
INSERT INTO users (id, nama) VALUES (2, 'bambang');


CREATE TABLE users (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    password int NOT NULL,
    status tinyint(2) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE forms (
    id bigint NOT NULL AUTO_INCREMENT,
    id_user bigint NOT NULL,
    name varchar(100) NOT NULL,
    id_form_type bigint(11),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE form_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE form_activities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form_type bigint NOT NULL,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE questions (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form bigint NOT NULL,
    id_questions_type bigint NOT NULL,
    question_answer varchar(255) DEFAULT NULL,
    template varchar(255) DEFAULT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE question_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE question_entities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_questions_types bigint NOT NULL,
    id_entity bigint NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE entities (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
);

CREATE TABLE entity_values (
    id bigint NOT NULL AUTO_INCREMENT,
    id_entity bigint NOT NULL,
    id_question_value bigint NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
)
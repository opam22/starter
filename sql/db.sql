CREATE TABLE todos (
    id INT,
    todo VARCHAR(100)
);

INSERT INTO todos (id, todo) VALUES (1, 'Coding');
INSERT INTO todos (id, todo) VALUES (2, 'Sleep');

CREATE TABLE users (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(100) NOT NULL,
    password varchar(255) NOT NULL,
    activation_code varchar(255) NOT NULL,
    status tinyint(2) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE users
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE forms (
    id bigint NOT NULL AUTO_INCREMENT,
    id_user bigint NOT NULL,
    name varchar(100) NOT NULL,
    id_form_type bigint(11),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE forms
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE form_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE form_types
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE form_activities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form_type bigint NOT NULL,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE form_activities
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE questions (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form bigint NOT NULL,
    id_questions_type bigint NOT NULL,
    question_answer varchar(255) DEFAULT NULL,
    template varchar(255) DEFAULT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE questions
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE question_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE question_types
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE question_entities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_questions_types bigint NOT NULL,
    id_entity bigint NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE question_entities
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE entities (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE entities
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE entity_values (
    id bigint NOT NULL AUTO_INCREMENT,
    id_entity bigint NOT NULL,
    id_question_value bigint NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE entity_values
MODIFY created_at datetime DEFAULT CURRENT_TIMESTAMP;
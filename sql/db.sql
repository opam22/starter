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
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE forms (
    id bigint NOT NULL AUTO_INCREMENT,
    id_user bigint NOT NULL,
    name varchar(100) NOT NULL,
    id_form_type bigint(11),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE form_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE form_activities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form_type bigint NOT NULL,
    name varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE questions (
    id bigint NOT NULL AUTO_INCREMENT,
    id_form bigint NOT NULL,
    id_questions_type bigint NOT NULL,
    question varchar(255) NOT NULL,
    question_answer varchar(255) DEFAULT NULL,
    template varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE choices (
    id bigint NOT NULL AUTO_INCREMENT,
    choice varchar(255) NOT NULL,
    img varchar(255),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE question_types (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE question_entities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_questions_types bigint NOT NULL,
    id_entity bigint NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE entities (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE entity_values (
    id bigint NOT NULL AUTO_INCREMENT,
    id_entity bigint NOT NULL,
    id_question_value bigint NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);
CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT,
    todo VARCHAR(100),
    PRIMARY key (id)
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

INSERT INTO users (name, email, password, activation_code, status) VALUES ('admin', 'admin@vanara.com', '5ACF8A4CB255C413B6BA3B0DDF22D0151842C174CB6FB8F365ACB22C7E58B87FF28B445CFD4A10B985DE2352E0F155F0F62033D70F182FB35878295701CC49EF', '123', 1);

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
    id_question_type bigint NOT NULL,
    question varchar(255) NOT NULL,
    question_answer varchar(255) DEFAULT NULL,
    template varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE choices (
    id bigint NOT NULL AUTO_INCREMENT,
    id_question bigint NOT NULL,
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

INSERT INTO question_types (id, name, created_at) VALUES (1, 'Welcome Screen', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (2, 'Thank You Screen', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (3, 'Multiple Choice', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (4, 'Short Text', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (5, 'Long Text', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (6, 'Statement', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (7, 'Picture Choice', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (8, 'Yes / No', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (9, 'Email', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (10, 'Opinion Scale', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (11, 'Question Group', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (12, 'Rating', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (13, 'Date', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (14, 'Number', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (15, 'Dropdown', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (16, 'Question Type', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (17, 'File Upload', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (18, 'Payment', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (19, 'Website', '2019-03-23 00:00:00');
INSERT INTO question_types (id, name, created_at) VALUES (20, 'Hidden Fields', '2019-03-23 00:00:00');

CREATE TABLE entities (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

INSERT INTO entities (id, name, created_at) VALUES (1, 'Description', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (2, 'Variables', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (3, 'Image', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (4, 'Video', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (5, 'Button', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (6, 'Required', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (7, 'Multiple Selection', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (8, 'Randomize', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (9, 'Other Option', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (10, 'Vertical Alignment', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (11, 'Max Characters', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (12, 'Quotation Marks', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (13, 'Show Choice Labels', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (14, 'Super Size', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (15, 'Start Scale At 1', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (16, 'Steps', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (17, 'Show Labels', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (18, 'Shape', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (19, 'Date Format', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (20, 'Min Number', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (21, 'Max Number', '2019-03-23 00:00:00');
INSERT INTO entities (id, name, created_at) VALUES (22, 'Alphabetical Order', '2019-03-23 00:00:00');

CREATE TABLE question_entities (
    id bigint NOT NULL AUTO_INCREMENT,
    id_question_type bigint NOT NULL,
    id_entity bigint NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);

INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (1, 1, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (2, 1, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (3, 1, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (4, 1, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (5, 1, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (6, 1, 5, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (7, 2, 5, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (8, 3, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (9, 3, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (10, 3, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (11, 3, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (12, 3, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (13, 3, 7, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (14, 3, 8, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (15, 3, 9, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (16, 3, 10, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (17, 4, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (18, 4, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (19, 4, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (20, 4, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (21, 4, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (22, 4, 11, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (23, 5, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (24, 5, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (25, 5, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (26, 5, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (27, 5, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (28, 5, 11, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (29, 6, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (30, 6, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (31, 6, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (32, 6, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (33, 6, 5, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (34, 6, 12, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (35, 7, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (36, 7, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (37, 7, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (38, 7, 13, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (39, 7, 14, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (40, 7, 7, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (41, 7, 8, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (42, 7, 9, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (43, 8, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (44, 8, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (45, 8, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (46, 8, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (47, 8, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (48, 9, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (49, 9, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (50, 9, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (51, 9, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (52, 9, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (53, 10, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (54, 10, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (55, 10, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (56, 10, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (57, 10, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (58, 10, 15, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (59, 10, 16, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (60, 10, 17, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (61, 11, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (62, 11, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (63, 11, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (64, 11, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (65, 11, 5, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (66, 12, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (67, 12, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (68, 12, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (69, 12, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (70, 12, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (71, 12, 16, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (72, 12, 18, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (73, 13, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (74, 13, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (75, 13, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (76, 13, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (77, 13, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (78, 13, 19, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (79, 14, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (80, 14, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (81, 14, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (82, 14, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (83, 14, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (84, 14, 20, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (85, 14, 21, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (86, 15, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (87, 15, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (88, 15, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (89, 15, 3, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (90, 15, 4, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (91, 15, 22, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (92, 16, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (93, 16, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (94, 16, 2, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (95, 19, 6, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (96, 19, 1, '2019-03-23 00:00:00');
INSERT INTO question_entities (id, id_question_type, id_entity, created_at) VALUES (97, 19, 2, '2019-03-23 00:00:00');

CREATE TABLE entity_values (
    id bigint NOT NULL AUTO_INCREMENT,
    id_entity bigint NOT NULL,
    id_question_value bigint NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    PRIMARY KEY (id)
);
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

INSERT INTO users (name, email, password, activation_code, status) VALUES ('admin', 'admin@admin.com', 'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC', '123', 1);
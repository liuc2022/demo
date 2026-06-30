CREATE DATABASE IF NOT EXISTS cmb_demo DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE cmb_demo;

CREATE TABLE IF NOT EXISTS t_user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    status VARCHAR(32) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_username (username)
);

INSERT INTO t_user (username, email, status)
VALUES
    ('alice', 'alice@example.com', 'ACTIVE'),
    ('bob', 'bob@example.com', 'INACTIVE');

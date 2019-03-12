-- create database if not exists smart_web_3;
-- use smart_web_3;
-- CREATE TABLE users (
--     id BIGINT(20) NOT NULL AUTO_INCREMENT,
--     name VARCHAR(40) NOT NULL,
--     username VARCHAR(15) NOT NULL,
--     email VARCHAR(40) NOT NULL,
--     password VARCHAR(100) NOT NULL,
--     created_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
--     updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     isActive BOOLEAN,
--     confirmationToken VARCHAR(200),
--     mobile VARCHAR(11),
--     note TEXT,
--     avatar TEXT,
--     skype TEXT,
--     facebook TEXT,
--     address TEXT,
--     education TEXT,
--     school TEXT,
--     faculty TEXT,
--     yaerFinish VARCHAR(4),
--     skill TEXT,
--     PRIMARY KEY (id),
--     UNIQUE KEY uk_users_username (username),
--     UNIQUE KEY uk_users_email (email)
-- );
-- 
-- CREATE TABLE roles (
--     id BIGINT(20) NOT NULL AUTO_INCREMENT,
--     name VARCHAR(20) NOT NULL,
--     PRIMARY KEY (id),
--     UNIQUE KEY uk_roles_name (name)
-- );
-- 
-- CREATE TABLE user_roles (
--     user_id BIGINT(20) NOT NULL,
--     role_id BIGINT(20) NOT NULL,
--     PRIMARY KEY (user_id , role_id),
--     CONSTRAINT fk_user_roles_role_id FOREIGN KEY (role_id)
--         REFERENCES roles (id),
--     CONSTRAINT fk_user_roles_user_id FOREIGN KEY (user_id)
--         REFERENCES users (id)
-- );

CREATE TABLE categories (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    title varchar(20),
    PRIMARY KEY (id),
    UNIQUE KEY uk_categories (title)
);

CREATE TABLE news (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    text TEXT NOT NULL,
    categories_id BIGINT(20) NOT NULL,
    user_id BIGINT(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_categories_id FOREIGN KEY (categories_id)
        REFERENCES categories (id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id)
        REFERENCES users (id)
);

CREATE TABLE job (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    avatar TEXT,
    title TEXT,
    city TEXT,
    salary TEXT,
    note TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE candidate (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    birthday VARCHAR(20),
    mobile VARCHAR(11),
    content TEXT,
    cvfile TEXT,
    job_id BIGINT(20) NOT NULL,
    PRIMARY KEY (id),
    KEY fk_candidate_job_id (job_id),
    CONSTRAINT fk_candidate_job_id FOREIGN KEY (job_id)
        REFERENCES job (id)
);
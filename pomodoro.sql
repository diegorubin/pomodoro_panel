CREATE TABLE users(
    id int auto_increment,
    name varchar[255],
    login varchar[255],
    primary key(login)
);

INSERT INTO users(id, login, name) VALUES(1, 'drubin', 'Diego Rubin');
INSERT INTO users(id, login, name) VALUES(2, 'bmacedo', 'Bruno Macedo');

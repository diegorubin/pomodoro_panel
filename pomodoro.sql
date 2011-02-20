CREATE TABLE users(
    id int auto_increment,
    name varchar[255],
    login varchar[255],
    active int default 0,
    primary key(login)
);

INSERT INTO users(id, login, name, active) VALUES(1, 'drubin', 'Diego Rubin', 1);
INSERT INTO users(id, login, name, active) VALUES(2, 'bmacedo', 'Bruno Macedo', 0);

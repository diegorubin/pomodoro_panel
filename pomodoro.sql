CREATE TABLE users(
    id int auto_increment,
    name varchar[255],
    login varchar[255],
    active int default 0,
    time varchar[12],
    primary key(login)
);

INSERT INTO users(id, login, name, active) VALUES(1, 'drubin', 'Diego Rubin', 1);
INSERT INTO users(id, login, name, active) VALUES(2, 'bmacedo', 'Bruno Macedo', 0);
INSERT INTO users(id, login, name, active) VALUES(3, 'danilol', 'Danilo M. S. de Lima', 0);
INSERT INTO users(id, login, name, active) VALUES(4, 'kaio', 'Kaio Roberto de Azevedo', 0);
INSERT INTO users(id, login, name, active) VALUES(5, 'dmatoso', 'Douglas Matoso', 0);
INSERT INTO users(id, login, name, active) VALUES(6, 'fbrolesi', 'Fábio Brolesi', 0);
INSERT INTO users(id, login, name, active) VALUES(7, 'gperez', 'Gabrielle C. Perez', 0);


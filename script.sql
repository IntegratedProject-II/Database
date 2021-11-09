CREATE TABLE country (
    ct_id   INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(50),
    PRIMARY KEY(ct_id)
);

CREATE TABLE history (
    h_id    INT NOT NULL AUTO_INCREMENT,
    h_date  TIMESTAMP,
    wish    VARCHAR(200),
    kt_id   INT,
    user_id INT,
    p_id    INT,
    PRIMARY KEY(h_id)
);

CREATE TABLE krathong (
    kt_id    INT NOT NULL AUTO_INCREMENT,
    kt_name  VARCHAR(50),
    amount   INT,
    kt_image VARCHAR(200),
    detail   VARCHAR(4000),
    t_id     INT NOT NULL,
    PRIMARY KEY(kt_id)
);

CREATE TABLE kt_type (
    t_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(50),
    PRIMARY KEY(t_id)
);

CREATE TABLE person (
    user_id  INT NOT NULL AUTO_INCREMENT,
    fname    VARCHAR(100),
    lname    VARCHAR(100),
    username VARCHAR(50),
    password VARCHAR(250),
    email    VARCHAR(200),
    phone    VARCHAR(10),
    id_card  VARCHAR(20),
    ct_id    INT NOT NULL,
    role_id  INT NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE person_role (
    role_id   INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(10),
    PRIMARY KEY(role_id)
);

CREATE TABLE place (
    p_id    INT NOT NULL AUTO_INCREMENT,
    p_name  VARCHAR(100),
    p_image VARCHAR(200),
    tp_id   INT NOT NULL,
    PRIMARY KEY(p_id)
);

CREATE TABLE place_type (
    tp_id   INT NOT NULL AUTO_INCREMENT,
    tp_name VARCHAR(50),
    PRIMARY KEY(tp_id)
);

CREATE TABLE token (
    tk_id   INT NOT NULL AUTO_INCREMENT,
    token   VARCHAR(500),
    user_id INT,
    PRIMARY KEY(tk_id)
);

ALTER TABLE history
    ADD CONSTRAINT history_krathong_fk FOREIGN KEY ( kt_id )
        REFERENCES krathong ( kt_id );

ALTER TABLE history
    ADD CONSTRAINT history_person_fk FOREIGN KEY ( user_id )
        REFERENCES person ( user_id );

ALTER TABLE history
    ADD CONSTRAINT history_place_fk FOREIGN KEY ( p_id )
        REFERENCES place ( p_id );

ALTER TABLE krathong
    ADD CONSTRAINT krathong_kt_type_fk FOREIGN KEY ( t_id )
        REFERENCES kt_type ( t_id );

ALTER TABLE person
    ADD CONSTRAINT person_country_fk FOREIGN KEY ( ct_id )
        REFERENCES country ( ct_id );

ALTER TABLE person
    ADD CONSTRAINT person_person_role_fk FOREIGN KEY ( role_id )
        REFERENCES person_role ( role_id );

ALTER TABLE place
    ADD CONSTRAINT place_place_type_fk FOREIGN KEY ( tp_id )
        REFERENCES place_type ( tp_id );

ALTER TABLE token
    ADD CONSTRAINT token_person_fk FOREIGN KEY ( user_id )
        REFERENCES person ( user_id );


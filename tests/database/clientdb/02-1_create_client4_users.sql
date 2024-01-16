
CREATE TABLE IF NOT EXISTS client4.users (
     id SERIAL PRIMARY KEY,
     login varchar(100) NOT NULL,
     first_name varchar(60) NOT NULL,
     last_name varchar(80) NOT NULL,
     email varchar(150) NOT NULL,
     pass varchar(255),
     enabled boolean DEFAULT TRUE NOT NULL,
     created_at timestamp DEFAULT current_timestamp,
     updated_at timestamp DEFAULT current_timestamp,

     CONSTRAINT users_login_key UNIQUE (login),
     CONSTRAINT users_email_key UNIQUE (email)
);

INSERT INTO client4.users (login, first_name, last_name, email, pass)
VALUES
    ('alan', 'Alan', 'Trantow', 'alan.trantow@client4.com.br', md5('password')),
    ('lucia', 'Lucia', 'Bailey', 'lucia.bailey@gmail.com', md5('password'))
;

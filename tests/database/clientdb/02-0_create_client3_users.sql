
CREATE TABLE IF NOT EXISTS client3.users (
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

INSERT INTO client3.users (login, first_name, last_name, email, pass)
VALUES
    ('user1', 'User', 'Test', 'user.test@client3.com', md5('password')),
    ('user2', 'Andres', 'Bernier', 'andres.bernier39@gmail.com', md5('password')),
    ('user3', 'Reese', 'Hegmann', 'laury4@hotmail.com', md5('password')),
    ('user4', 'Beverly', 'Barrows', 'bbarrows@client3.com', md5('password')),
    ('user5', 'Soledad', 'McClure', 'soledad.mcclure55@hotmail.com', md5('password')),
    ('user6', 'David', 'Bernier', 'dbernier@client3.com', md5('password')),
    ('user7', 'Leroy', 'Schroeder', 'leroy@client3.com', md5('password')),
    ('user8', 'Javier', 'Dietrich', 'javier_dietrich87@yahoo.com', md5('password')),
    ('user9', 'Jenna', 'Baumbach', 'jennab@client3.com', md5('password')),
    ('user10', 'Caio', 'Test', 'caio.test@client1.org', md5('password'))
;

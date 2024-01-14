
CREATE TABLE IF NOT EXISTS client1.users (
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

INSERT INTO client1.users (login, first_name, last_name, email, pass)
VALUES
    ('user1', 'User', 'Test', 'user.test@client1.org', md5('password')),
    ('user2', 'User', 'Jr', 'user.jr@client1.org', md5('password')),
    ('user3', 'User', 'Neto', 'user.neto@client1.org', md5('password')),
    ('user4', 'Usuario', 'Test', 'usuario.test@client1.org', md5('password')),
    ('user5', 'Caio', 'Test', 'caio.test@client1.org', md5('password'))
;

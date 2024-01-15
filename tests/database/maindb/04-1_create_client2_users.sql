
CREATE TABLE IF NOT EXISTS client2.users (
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

INSERT INTO client2.users (login, first_name, last_name, email, pass)
VALUES
    ('teste1', 'Usuário', 'Teste', 'uteste@client2.com.br', md5('password')),
    ('teste2', 'Testador', 'Goodman', 'tgoodman@client2.com.br', md5('password')),
    ('teste3', 'User', 'Qualquer', 'uqualquer@client2.com.br', md5('password'))
;

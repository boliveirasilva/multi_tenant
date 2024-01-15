
CREATE TABLE admin.companies (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    schema_name varchar(100) NOT NULL,
    db_host varchar(255),
    db_name varchar(255),
    db_user varchar(255),
    db_pass varchar(255),
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp DEFAULT current_timestamp,

    CONSTRAINT companies_schema_name_key UNIQUE (schema_name)
);

INSERT INTO admin.companies (name, schema_name)
VALUES
    ('Cliente de Teste 1', 'client1'),
    ('Testolandia S.A.', 'client2');

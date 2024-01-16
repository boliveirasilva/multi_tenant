
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


INSERT INTO admin.companies (name, schema_name, db_host, db_name, db_user, db_pass)
VALUES
    ('Test4U International', 'client3', '127.0.0.1:5431', 'client_tenant', 'client', 'client'),
    ('Fábrica de Testes', 'client4', '127.0.0.1:5431', 'client_tenant', 'client', 'client');

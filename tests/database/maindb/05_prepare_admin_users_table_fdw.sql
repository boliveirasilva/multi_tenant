
CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA admin;

-- DROP SERVER tenants_data CASCADE;
CREATE SERVER tenants_data TYPE 'Dados Compartilhados dos CLientes'
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'client_database', dbname 'client_tenant');

-- DROP USER MAPPING FOR current_user SERVER tenants_data;
CREATE USER MAPPING FOR CURRENT_USER
    SERVER tenants_data
    OPTIONS (user 'client', password 'client');


-- DROP FOREIGN TABLE protein_info_remote;
CREATE FOREIGN TABLE admin.users_client3 (
    id bigint,
    login varchar(100),
    first_name varchar(60),
    last_name varchar(80),
    email varchar(150),
    pass varchar(255),
    enabled boolean,
    created_at timestamp,
    updated_at timestamp
)
SERVER tenants_data
OPTIONS (table_name 'users', schema_name 'client3');


CREATE FOREIGN TABLE admin.users_client4 (
    id bigint,
    login varchar(100),
    first_name varchar(60),
    last_name varchar(80),
    email varchar(150),
    pass varchar(255),
    enabled boolean,
    created_at timestamp,
    updated_at timestamp
)
SERVER tenants_data
OPTIONS (table_name 'users', schema_name 'client4');



CREATE OR REPLACE VIEW admin.users AS
    SELECT
        'client1' as company, id, login, first_name, last_name, email, pass,
        enabled, created_at, updated_at
    FROM client1.users
    UNION ALL
    SELECT
        'client2' as company, id, login, first_name, last_name, email, pass,
        enabled, created_at, updated_at
    FROM client2.users
    UNION ALL
    SELECT
        'client3' as company, id, login, first_name, last_name, email, pass,
        enabled, created_at, updated_at
    FROM admin.users_client3
    UNION ALL
    SELECT
        'client4' as company, id, login, first_name, last_name, email, pass,
        enabled, created_at, updated_at
    FROM admin.users_client4
;


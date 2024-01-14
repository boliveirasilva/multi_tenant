
CREATE UNLOGGED TABLE admin.tokens (
    company_id bigint NOT NULL,
    user_id bigint NOT NULL,
    value varchar(255) NOT NULL,
    created_at timestamp DEFAULT current_timestamp,
    expiry_at timestamp DEFAULT current_timestamp + INTERVAL '1 hour',
    applications_list integer[],

    CONSTRAINT tokens_company_user_pk PRIMARY KEY (company_id, user_id),
    CONSTRAINT tokens_value_key UNIQUE (value),

    CONSTRAINT tokens_company_id_fk FOREIGN KEY (company_id) REFERENCES admin.companies (id) ON DELETE CASCADE
);

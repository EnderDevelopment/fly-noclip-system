CREATE TABLE IF NOT EXISTS fly_noclip_permissions (
    identifier VARCHAR(60) PRIMARY KEY,
    fly_permission BOOLEAN DEFAULT FALSE,
    noclip_permission BOOLEAN DEFAULT FALSE
);

INSERT INTO fly_noclip_permissions (identifier, fly_permission, noclip_permission) VALUES ('steam:11000010abcdef1', TRUE, TRUE);
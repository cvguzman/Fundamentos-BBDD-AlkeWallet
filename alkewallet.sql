-- CREACION BASE DE DATOS
DROP DATABASE IF EXISTS AlkeWallet;
CREATE DATABASE AlkeWallet;
SHOW DATABASES;
USE AlkeWallet;

-- CREACIÓN DE TABLAS
CREATE TABLE moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(10) NOT NULL
);

CREATE TABLE usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR (100) NOT NULL UNIQUE,
    contrasena VARCHAR(15) NOT NULL,
    saldo DECIMAL(12,2) NOT NULL DEFAULT 0,
    currency_id INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (currency_id) REFERENCES moneda(currency_id)
    );

CREATE TABLE transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    currency_id INT NOT NULL,
    importe DECIMAL (12,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES moneda(currency_id)
    );

SHOW TABLES;

-- VERIFICAMOS TABLAS
DESCRIBE moneda;
DESCRIBE usuario;
DESCRIBE transaccion;

--  INSERTAMOS DATOS A LAS TABLAS
INSERT INTO moneda (
    currency_name,
    currency_symbol
)
VALUES 
    ('Peso Chileno', 'CLP'),
    ('Dólar', 'USD'),
    ('Euro', 'EUR');

INSERT INTO usuario (
    nombre,
    correo_electronico,
    contrasena,
    saldo,
    currency_id
)
VALUES
    ('Cynthia','cynthia@gmail.com','1234',800000,1),
    ('Pedro','pedro@gmail.com','1234',400000,2),
    ('María','maria@gmail.com','1234',250000,1),
    ('Juan','juan@gmail.com','1234',150000,3),
    ('Ana','ana@gmail.com','1234',900000,1);

INSERT INTO transaccion (
    sender_user_id,
    receiver_user_id,
    currency_id,
    importe
)
VALUES
    (1,2,1,50000),
    (2,3,2,100),
    (5,1,1,250000),
    (4,5,3,300);

-- CONSULTAS SOLICITADAS:

-- CONSULTA MONEDA ELEGIDA POR UN USUARIO
SELECT
    u.nombre,
    m.currency_name,
    m.currency_symbol
FROM usuario u 
INNER JOIN moneda m 
    ON u.currency_id = m.currency_id
WHERE u.user_id = 1;

-- CONSULTA DE TODAS LAS TRANSACCIONES
SELECT * FROM transaccion;

-- CONSULTA TRANSACCIONES DE UN USUARIO
SELECT *
FROM transaccion
WHERE sender_user_id = 1;

-- CAMBIAR CORREO ELECTRONICO CON UPDATE
UPDATE usuario
SET correo_electronico = 'nuevo_correo@gmail.com'
WHERE user_id = 1;

-- ELIMINAR UNA TRANSACCION
DELETE FROM transaccion
WHERE transaction_id = 4;

-- CRUCE DE TABLA USUARIO Y TRANSACCION CON JOIN
SELECT 
    t.transaction_id,
    u.nombre,
    t.importe,
    t.transaction_date
FROM transaccion t
INNER JOIN usuario u    
    ON t.sender_user_id = u.user_id;

-- SUBCONSULTA
SELECT
    nombre,
    (
    SELECT COUNT(*)
    FROM transaccion
    WHERE sender_user_id = u.user_id
    ) AS total_transacciones
    FROM usuario u;

-- CONSULTAS CON GROUP BY
SELECT
    sender_user_id,
    SUM(importe) AS total_enviado
FROM transaccion    
GROUP BY sender_user_id;

-- CREACION VISTA TOP 5 USUARIOS 
CREATE VIEW top5_usuarios AS
SELECT
    nombre,
    saldo
FROM usuario
ORDER BY saldo DESC
LIMIT 5;

SELECT * FROM top5_usuarios;

-- TRANSACCIONES ACID
START TRANSACTION;

-- ACTUALIZAR SALDO
UPDATE usuario
SET saldo = saldo - 50000
WHERE user_id = 1;

UPDATE usuario
SET saldo = saldo + 50000
WHERE user_id = 2;

-- GUARDAR DEFINITIVAMENTE
COMMIT;

-- PARA DESHACER CAMBIO
ROLLBACK;

-- SIMULACION ERROR DE INTEGRIDAD
START TRANSACTION;
INSERT INTO transaccion
(
    sender_user_id,
    receiver_user_id,
    currency_id,
    importe
)
VALUES
(
    100,2,1,5000
);

ROLLBACK;

-- BUSCAR POR INDICE
CREATE INDEX idx_usuario_fecha
    ON transaccion(sender_user_id, transaction_date);

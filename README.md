# 📘 Fundamentos-BBDD-AlkeWallet

## 📝 Descripción general del proyecto:
Este proyecto corresponde al desarrollo de la base de datos relacional para Alke Wallet, una billetera virtual que permite a los usuarios administrar sus fondos, realizar transferencia a usuarios entre cuentas
y consultar el historial de sus transacciones. El desarrollo fue realizando utilizando MySQL, implementando sentencias DDL y DML, relaciones entre tablas utilizando claves primarias y foráneas y además de consultas SQL
para manipulación y recuperación de la información.

## Objetivo general
- Diseñar una base de datos relacional que garantice la integridad y consistencia de los datos.
- Implementar las tablas necesarias para representar usuarios, monedas y transacciones.
- Establecer relaciones mediante claves primarias y foráneas.
- Ejecutar operaciones de inserción, consulta, actualización y eliminación de datos.
- Aplicar transacciones para demostrar el cumplimientos de los principios ACID.

## Tecnologías utilizadas
- MySQL Workbench
- Terminal macOS
- SQL

## Modelo Base de Datos
La base de datos Alke Wallet está compuesta por tres entidades principales:

### **Usuario**
Almacena la información de cada usuario registrado, campos principales
- user_id(PK)
- nombre
- correo_electronico
- contrasena
- saldo
- currency_id(FK)
- fecha_Creacion

### **Moneda**
Contiene las monedas disponibles dentro del sistema, campos
- currency_id(PK)
- currency_name
- currency_symbol

### **Transaccion**
Registra cada transferencia realiza entre los usuarios, campos:
- transaction_id(PK)
- sender_user_id(FK)
- receiver_user_id(FK)
- currency_id(FK)
- importe
- transaction_date

## Relaciones
- Una moneda puede estar asociada a varios usuarios.
- Un usuario puede enviar múltiples transacciones.
- Un usuario puede recibir múltiples transferencia
- Cada transacción pertenece a una única moneda.

## Funcionalidades implementadas
- Creación de la base de datos.
- Creación de tablas.
- Definición de claves primarias.
- Definición de claves foráneas.
- Restricciones NOT NULL.
- Inserción de registros.
- Consultas SELECT.
- Cruce de tablas con INNER JOIN.
- Subconsultas,
- ORDER BY
- Creación de una vista.
- Actualización de datos mediante UPDATE.
- Eliminación de registros mediante DELETE.
- Ïndices para optimizar búsquedas.
- Transacciones utilizando START TRANSACTION, COMMIT y ROLLBACK.

## Consultas implementadas
Durante el desarrollo se realizaron consultas para:
- Obtener monedas asociadas a un usuario.
- Listar todas las transacciones.
- Consultar las transacciones realizadas por un usuario específico.
- Obtener el total de transacciones por usuarios.
- Mostrar el top 5 de usuarios con mayor saldo.
- Actualizar el correo electrónico de un usuario.
- Eliminación de un usuario.

## Integridad referencial
La base de datos utiliza claves foráneas para garantizar la integridad de la información. Se comprobó su funcionamiento intentando registrar una transacción
con un usuario inexistente, obteniendo un error de restricción de clave foránea. Posteriormente se ejecutó un ROLLBACK, manteniendo la consistencia de la base de datos.

## Principios ACID
- **Atomicidad:** Las operaciones dentro de una transacción se ejecutan completamente o se revierten mediante un ROLLBACK.
- **Consistencia::** Las claves foráneas impiden registrar información inválida.
- **Aislamiento:** Cada transacción mantiene la integridad de los datos durante su ejecución.
- **Durabilidad:** Las operaciones confirmadas mediane COMMIT permanecen almacenadas en la base de datos.


## Evidencias
El proyecto incluye las siguientes capturas de pantalla

- **Creación de la base de datos:**

<img width="2560" height="1656" alt="creacionBD" src="https://github.com/user-attachments/assets/b556165f-c030-4533-9df8-1a34268b72de" />

- **Creación de las tablas:**

Tabla moneda
<img width="1782" height="87" alt="tabla moneda" src="https://github.com/user-attachments/assets/7740c7d2-bb12-4671-8fe9-6c0295ee1b0b" />

Tabla Usuario
<img width="1271" height="418" alt="image" src="https://github.com/user-attachments/assets/348fedca-d0f0-4b04-8fb1-7b6de8afe3e5" />

Tabla transaction
<img width="2560" height="1476" alt="TABLATRANSACCION" src="https://github.com/user-attachments/assets/c57f8c21-5e9d-4032-bbce-89e65c9b03ea" />

Describe
<img width="2560" height="1664" alt="describe" src="https://github.com/user-attachments/assets/e45f28c7-6c43-490d-967a-5f8df2ea9ee4" />

- **Inserción de los datos:**

Inserción datos moneda
<img width="934" height="291" alt="insertintomoneda" src="https://github.com/user-attachments/assets/bbbd1cbb-6bb8-4efc-a7f4-5a766c9675d6" />

Inserción datos usuario
<img width="1399" height="866" alt="inserciondatosusuario" src="https://github.com/user-attachments/assets/9910b5ce-8cd8-4dc3-bea0-51ea137f6e76" />

Inserción datos transacción
<img width="1414" height="432" alt="inserciondatostransaccion" src="https://github.com/user-attachments/assets/11da4927-3bf2-47f6-94d3-a841b877db71" />

- **Ejecución de consultas:**

Ejecutar consultas SELECT básicas sobre la tabla usuario.
<img width="1557" height="186" alt="1" src="https://github.com/user-attachments/assets/4535b614-3337-42f5-9420-a5710f8cae66" />

Actualización de datos UPDATE
<img width="1123" height="100" alt="6" src="https://github.com/user-attachments/assets/15346a4f-50f3-4339-ace9-a601c42722df" />

Eliminación de datos de una fila con DELETE
<img width="1112" height="73" alt="7" src="https://github.com/user-attachments/assets/3537418e-51c7-4af3-b1ca-b8dc76971096" />

Unir las tablas transacción y usuario mediante INNER JOIN.
<img width="1617" height="244" alt="2" src="https://github.com/user-attachments/assets/4272e208-add6-4e5f-b67e-72ee8e9e7a97" />

Practicar sub‐consultas para obtener el total de transacciones por usuario.
<img width="1346" height="272" alt="3" src="https://github.com/user-attachments/assets/36e6c8dd-c670-4432-86da-98962556fa1f" />

Implementar una transacción con START TRANSACTION, COMMIT y ROLLBACK y simular un error de integridad.
<img width="2043" height="742" alt="4" src="https://github.com/user-attachments/assets/760e181d-274f-457b-b47e-c8be4e19d72d" />

- **Ejecución vista:**
Creación de vista top 5 usuarios
<img width="1369" height="323" alt="8" src="https://github.com/user-attachments/assets/f2016185-2b29-4d5f-8445-db58f8e21080" />

- **Ejecución de indice:**
Creación de índice
<img width="923" height="176" alt="9" src="https://github.com/user-attachments/assets/8368395f-92f5-4bba-810d-dfe24b0438c5" />

## Diagrama Modelo Entidad Relación:
Para la creación del diagrama se uso la herramienta web: https://dbdiagram.io/d
Adjuntando el siguiente código:

Table moneda {
  currency_id int [pk]
  currency_name varchar
  currency_symbol varchar
}

Table usuario {
  user_id int [pk]
  nombre varchar
  correo_electronico varchar
  contrasena varchar
  saldo decimal
  fecha_creacion timestamp
  currency_id int
}

Table transaccion {
  transaction_id int [pk]
  sender_user_id int
  receiver_user_id int
  currency_id int
  importe decimal
  transaction_date timestamp
}

Ref: usuario.currency_id > moneda.currency_id
Ref: transaccion.sender_user_id > usuario.user_id
Ref: transaccion.receiver_user_id > usuario.user_id
Ref: transaccion.currency_id > moneda.currency_id

<img width="1694" height="634" alt="12" src="https://github.com/user-attachments/assets/8e728eae-eeea-4214-aa7a-d107d9f6b3d5" />

## Conclusión:
El proyecto permitió aplicar los fundamentos de las bases de datos relacionales mediante el diseño e implementación de una billetera digital
utilizando MySQL. Se creó un modelo de datos normalizado con relaciones entre usuarios, monedas y transacciones, asegurando la integridad 
referencial mediante claves foráneas.
asimismo se implementaron operaciones DDL y DML, consultas SQL, transacciones y mecanismos de control que garantizan el cumplimiento de los 
principios ACID, proporcionando una base de datos consistente, segura y preparada para soportar las operaciones básicas de una app de 
billetera digital.





  



  

  


  


/*tabla clientes*/
CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT NOT NULL,
nombre VARCHAR (30),
direccion VARCHAR (70),
telefono INT,
PRIMARY KEY (id_cliente)
)ENGINE=INNODB

/*tabla mascotas*/
CREATE TABLE IF NOT EXISTS  mascotas(
id_mascota INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
edad INT NOT NULL, 
raza VARCHAR(30),
enfermedades VARCHAR(120), 
tamanio VARCHAR (30),
cod_registro INT, 
numero_serie INT, 
PRIMARY KEY (id_mascota)
)ENGINE=INNODB


/*tabla servicios*/
CREATE TABLE IF NOT EXISTS servicios(
id_servicio INT NOT NULL,
tipo_membresia VARCHAR(40),
numero_chip_mascota INT, 
descripcion VARCHAR(200),
PRIMARY KEY (id_servicio)
)ENGINE=INNODB;

/*tabla factura*/
CREATE TABLE IF NOT EXISTS  factura(
id_factura INT NOT NULL UNIQUE,
fecha_registro DATE,
id_cliente VARCHAR(20),
forma_pago VARCHAR(40),
PRIMARY KEY (id_factura)
clientes_id_clientes INT NOT NULL,
CONSTRAINT fkclientes_information
FOREIGN KEY (clientes_id_clientes)
REFERENCES clientes(id_cliente),
)ENGINE=INNODB;

SELECT distinct id_factura, fecha_registro, id_cliente, forma_pago
from factura;

/*tabla cliente_mascota*/
CREATE TABLE IF NOT EXISTS cliente_mascota(
clientes_id_clientes INT NOT NULL, 
mascotas_id_mascota INT NOT NULL,
PRIMARY KEY (clientes_id_clientes, mascotas_id_mascota),
CONSTRAINT fkmascotas_clientes_mascotas
FOREIGN KEY (mascotas_id_mascota)
REFERENCES mascotas(id_mascota),
CONSTRAINT fkclientes_clientes_mascotas
FOREIGN KEY (clientes_id_clientes)
REFERENCES clientes(id_cliente)
)ENGINE=INNODB;

/*tabla detalle_factura*/
CREATE TABLE IF NOT EXISTS factura_servicio (
factura_id_factura INT NOT NULL,
servicio_id_servicio INT NOT NULL,
PRIMARY KEY (factura_id_factura, servicio_id_servicio),
CONSTRAINT fkfactura_servicio_factura
FOREIGN KEY (servicio_id_servicio)
REFERENCES servicios(id_servicio),
CONSTRAINT fkfactura_factura_servicio
FOREIGN KEY (factura_id_factura)
REFERENCES factura(id_factura)
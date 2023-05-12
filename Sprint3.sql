#Creacion de base de datos.
create database Sprint3;
use Sprint3;

#creacion de tabla clientes
CREATE TABLE clientes (
    ID_clientes INT NOT NULL auto_increment,
    Nombres VARCHAR(40) NOT NULL,
    Apellidos VARCHAR(40) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    PRIMARY KEY(ID_clientes)
);

#creacion de tabla productos
CREATE TABLE productos (
    SKU INT(50) NOT NULL, 
    ID_Proveedor INT NOT NULL,
    Nombre_producto VARCHAR(100) NOT NULL,
    Categoria VARCHAR(100) NOT NULL, 
    Proveedor VARCHAR(100) NOT NULL,
    Color VARCHAR(20) NOT NULL,    
    Stock INT(5) NOT NULL,
    Precio INT NOT NULL,
    PRIMARY KEY(SKU)
);

#creacion de tabla proveedores
CREATE TABLE Proveedores(
ID_Proveedor INT NOT NULL,
Nombre_corporativo VARCHAR(50) NOT NULL,
Nombre_Representante VARCHAR(50) NOT NULL,
Apellido_Representante VARCHAR(50) NOT NULL,
Telefono_1 INT NOT NULL,
Telefono_2 INT NOT NULL, 
Nombre_Contacto VARCHAR(80) NOT NULL,
Apellido_Contacto VARCHAR(80) NOT NULL,
Email VARCHAR(50) NOT NULL,
Categoria_producto VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_PROVEEDOR)
);


#ingreso de datos a tabla clientes
insert into clientes(Nombres,Apellidos,Direccion)
values 
("CELSO","ZAPATA","Avenida España 68"),
("MARIA","CARDENAS","LAS AMAPOLAS 163"),
("MATIAS","SANCHEZ","PASAJE EL VIGIA 69"),
("BRANDON","MULLER","PASAJE CUARENTA Y SEIS 1713"),
("ROSA","CUEVAS","ARTURO PRAT 30");

#ingreso de datos a tabla productos
insert into productos(SKU,ID_Proveedor,Nombre_producto,Categoria,Proveedor,Color,Stock,Precio)
values
(156669,112,"Notebook Lenovo IdeaPad 3","Notebooks","LENOVO","Negro",4,349990),
(156670,112,"Notebook Gamer Lenovo Legion 7","Notebooks","LENOVO","Negro",10,2499990),
(156671,113,"Notebook Asus Laptop E410","Notebooks","ASUS","Gris",15,369990),
(156672,115,"Notebook HP Pavilion 14","Notebooks","HP","Gris",11,999990),
(156673,113,"Notebook Gamer Asus TUF Gaming F15","Notebooks","ASUS","Gris",3,729990),
(156674,114,"iPhone 13 5G 128GB Rosado","SmartPhones","Apple","Rosa",10,799990),
(156675,114,"iPhone 13 5G 128GB Negro","SmartPhones","Apple","Negro",9,799990),
(156676,114,"iPhone 13 5G 128GB Azul","SmartPhones","Apple","Azul",21,799990),
(156677,114,"iPhone 14 5G 128GB Midnight","SmartPhones","Apple","Negro",11,	999990),
(156678,116,"Samsung Galaxy S23","SmartPhones","SAMSUNG","Azul",15,949990),
(156679,116,"Samsung Galaxy A53","SmartPhones","SAMSUNG","Negro",2,299990);

#ingreso de datos a tabla proveedores
insert into Proveedores(ID_Proveedor,Nombre_corporativo,Nombre_Representante, Apellido_Representante,Telefono_1,Telefono_2,Nombre_Contacto,Apellido_Contacto,Email,Categoria_producto)
values (112,'LENOVO','CAROLINA','MORAGA',954678546,933307605,'ALBERTO','AGUILERA','alberto.aguilera@lenovo.cl','Notebooks'),
(113,'ASUS','IGNACIO','REYES',941636745,930792470,'ALEJANDRO','MUNOZ','alejandro.munoz@asus.cl','Notebooks'),
(114,'Apple','ALEX','MONSALVE',921456871,928277334,'ANDRÉS','VELENZUELA','andresvalenzuela@applechile.cl','SmartPhones'),
(115,'HP','ALEJANDRO','BOZO',938751254,925762198,'ANGEL','NORAMBUENA','angel.norambuena@hpchile.cl','Notebooks'),
(116,'Samsung','MARGOT','VALDEBENITO',945687536,923247063,'GRACIELA','TORRES','graciela.torres@samsung.cl','SmartPhones');

#Se define llave foránea
ALTER TABLE productos ADD FOREIGN KEY (ID_Proveedor) REFERENCES proveedores(ID_Proveedor);

#I-Categoria que más se repite.
SELECT categoria, COUNT(*) Total
FROM productos
GROUP BY categoria
ORDER BY COUNT(*) DESC LIMIT 1;

#II-Productos con mayor stock.
SELECT Nombre_producto, Stock
FROM productos
WHERE Stock = (SELECT MAX(Stock) FROM productos);

#III- Color más común.
SELECT color, COUNT(*)
FROM productos
GROUP BY color
ORDER BY COUNT(*) DESC LIMIT 1;

#IV- Proveedor con menos productos en stock.
SELECT Proveedor, Stock
FROM productos
WHERE Stock = (SELECT MIN(Stock) FROM productos);

#Se define nuevamente producto con mayor stock.
SELECT Nombre_producto, Stock
FROM productos
WHERE Stock = (SELECT MAX(Stock) FROM productos);

#V- Cambio de nombre de categoría del producto más popular. Definimos como más popular al producto que posee más stock obtenido anteriormente.
UPDATE productos
SET Categoria = 'Electrónica y computación'
WHERE Nombre_producto = 'iPhone 13 5G 128GB Azul';

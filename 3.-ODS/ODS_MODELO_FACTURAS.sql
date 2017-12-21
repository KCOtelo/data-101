USE ODS;

DROP TABLE IF EXISTS ODS_HC_FACTURAS;

CREATE TABLE ODS_HC_FACTURAS (
	ID_FACTURA INT UNSIGNED NOT NULL PRIMARY KEY
    ,ID_CLIENTE INT UNSIGNED NOT NULL
    ,ID_CICLO_FACTURACION INT UNSIGNED NOT NULL
    ,ID_METODO_PAGO INT UNSIGNED NOT NULL
    ,CANTIDAD INT 
    ,FC_INICIO DATETIME
    ,FC_FIN DATETIME
    ,FC_FACTURACION DATETIME
    ,FC_PAGO DATETIME
    ,FC_INSERT DATETIME
	,FC_MODIFICACION DATETIME
);

DROP TABLE IF EXISTS ODS_DM_CICLOS_FACTURACION;

CREATE TABLE ODS_DM_CICLOS_FACTURACION (
	ID_CICLO_FACTURACION  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,DE_CICLO_FACTURACION VARCHAR(512)
    ,FC_INSERT DATETIME
	,FC_MODIFICACION DATETIME
);

DROP TABLE IF EXISTS ODS_DM_METODOS_PAGO;

CREATE TABLE ODS_DM_METODOS_PAGO (
	ID_METODO_PAGO  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,DE_METODO_PAGO  VARCHAR(512)
    ,FC_INSERT DATETIME
	,FC_MODIFICACION DATETIME
);


/*----- AÑADIMOS LAS RELACIONES --------------------------------*/

# RELACION DE LA TABLA ODS_HC_FACTURAS CON LA TABLA ODS_HC_CLIENTES
ALTER TABLE ODS.ODS_HC_FACTURAS MODIFY COLUMN ID_CLIENTE INT(11);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fct_cli_idx (ID_CLIENTE ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fct_cli FOREIGN KEY (ID_CLIENTE)
	REFERENCES ODS.ODS_HC_CLIENTES (ID_CLIENTE);
    
# RELACION DE LA TABLA ODS_HC_FACTURAS CON LA TABLA ODS_DM_CICLOS_FACTURACION
ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fct_clo_idx (ID_CICLO_FACTURACION ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fct_clo FOREIGN KEY (ID_CICLO_FACTURACION)
	REFERENCES ODS.ODS_DM_CICLOS_FACTURACION (ID_CICLO_FACTURACION);
    
    
# RELACION DE LA TABLA ODS_HC_FACTURAS CON LA TABLA ODS_DM_CICLOS_FACTURACION
ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fct_pag_idx (ID_METODO_PAGO ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fct_pag FOREIGN KEY (ID_METODO_PAGO)
	REFERENCES ODS.ODS_DM_METODOS_PAGO (ID_METODO_PAGO);    

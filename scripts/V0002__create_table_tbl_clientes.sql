CREATE TABLE tbl_clientes (
  id_cliente BIGSERIAL,
  nm_cliente VARCHAR(150) NOT NULL,
  nr_telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY(id_cliente)
)
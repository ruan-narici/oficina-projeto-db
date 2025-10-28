CREATE TABLE tbl_veiculos (
  id_veiculo BIGSERIAL,
  ds_modelo VARCHAR(255) NOT NULL,
  nr_ano INTEGER NOT NULL,
  id_cliente BIGINT NOT NULL,
  PRIMARY KEY(id_veiculo),
  CONSTRAINT fk_tbl_veiculos_tbl_clientes_id_cliente FOREIGN KEY(id_cliente) REFERENCES tbl_clientes(id_cliente)
)
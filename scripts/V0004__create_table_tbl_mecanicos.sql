CREATE TABLE tbl_mecanicos (
  id_mecanico BIGSERIAL,
  nm_mecanico VARCHAR(150) NOT NULL,
  ds_endereco VARCHAR(255) NOT NULL,
  ds_especialidade VARCHAR(150) NOT NULL,
  CONSTRAINT pk_tbl_mecanicos_id_mecanico PRIMARY KEY(id_mecanico)
)
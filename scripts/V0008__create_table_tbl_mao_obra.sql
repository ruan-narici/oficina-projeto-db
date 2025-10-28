CREATE TABLE tbl_mao_obra (
  id_mao_obra BIGSERIAL,
  ds_mao_obra VARCHAR(255) NOT NULL,
  vl_mao_obra NUMERIC(10, 2) NOT NULL,
  CONSTRAINT pk_tbl_mao_obra PRIMARY KEY(id_mao_obra)
)
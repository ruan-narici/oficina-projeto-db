CREATE TABLE tbl_pecas (
  id_peca BIGSERIAL,
  ds_peca VARCHAR(255) NOT NULL,
  qt_estoque NUMERIC(10, 3) NOT NULL,
  vl_peca NUMERIC(10, 2) NOT NULL,
  CONSTRAINT pk_tbl_pecas_id_peca PRIMARY KEY(id_peca)
)
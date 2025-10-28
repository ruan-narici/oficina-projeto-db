CREATE TABLE tbl_pecas_utilizadas (
  id_peca_utilizada BIGSERIAL,
  id_peca BIGINT NOT NULL,
  id_servico BIGINT NOT NULL,
  qt_pecas NUMERIC(10, 3) NOT NULL,
  CONSTRAINT pk_tbl_pecas_utilizadas_id_peca_utilizada PRIMARY KEY(id_peca_utilizada),
  CONSTRAINT fk_tbl_pecas_utilizadas_tbl_pecas_id_peca FOREIGN KEY(id_peca) REFERENCES tbl_pecas(id_peca),
  CONSTRAINT fk_tbl_pecas_utilizadas_tbl_servicos_id_servico FOREIGN KEY(id_servico) REFERENCES tbl_servicos(id_servico)
)
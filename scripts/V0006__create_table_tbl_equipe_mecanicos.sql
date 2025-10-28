CREATE TABLE tbl_equipe_mecanicos (
  id_equipe_mecanico BIGSERIAL,
  id_mecanico BIGINT NOT NULL,
  id_avaliacao BIGINT NOT NULL,
  CONSTRAINT pk_tbl_equipe_mecanicos_id_equipe_mecanico PRIMARY KEY(id_equipe_mecanico),
  CONSTRAINT fk_tbl_equipe_mecanicos_tbl_mecanicos_id_mecanico FOREIGN KEY(id_mecanico) REFERENCES tbl_mecanicos(id_mecanico),
  CONSTRAINT fk_tbl_equipe_mecanicos_tbl_avaliacoes_id_avaliacao FOREIGN KEY(id_avaliacao) REFERENCES tbl_avaliacoes(id_avaliacao)
)
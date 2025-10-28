CREATE TABLE tbl_avaliacoes (
  id_avaliacao BIGSERIAL,
  id_veiculo BIGINT NOT NULL,
  ds_observacao VARCHAR(255),
  CONSTRAINT pk_tbl_avaliacoes_id_avaliacao PRIMARY KEY(id_avaliacao),
  CONSTRAINT fk_tbl_avaliacoes_tbl_veiculos_id_veiculo FOREIGN KEY(id_veiculo) REFERENCES tbl_veiculos(id_veiculo)
)
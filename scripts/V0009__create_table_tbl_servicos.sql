CREATE TABLE tbl_status_autorizacao_servicos (
  cd_autorizacao INTEGER UNIQUE NOT NULL,
  ds_autorizacao VARCHAR(100) NOT NULL
);

INSERT INTO tbl_status_autorizacao_servicos (cd_autorizacao, ds_autorizacao) VALUES (
  1, 'AUTORIZADO'
), (
  2, 'NÃO AUTORIZADO'
);



CREATE TABLE tbl_servicos (
  id_servico BIGSERIAL,
  id_mao_obra BIGINT NOT NULL,
  id_ordem_servico BIGINT NOT NULL,
  cd_autorizacao INTEGER NOT NULL DEFAULT 1,
  vl_servico NUMERIC(10, 2),
  CONSTRAINT pk_tbl_servicos_id_servico PRIMARY KEY(id_servico),
  CONSTRAINT fk_tbl_servicos_tbl_mao_obra_id_mao_obra FOREIGN KEY(id_mao_obra) REFERENCES tbl_mao_obra(id_mao_obra),
  CONSTRAINT fk_tbl_servicos_tbl_ordem_servicos_id_ordem_servico FOREIGN KEY(id_ordem_servico) REFERENCES tbl_ordem_servicos(id_ordem_servico),
  CONSTRAINT fk_tbl_servicos_tbl_status_autorizacao_servicos_cd_autorizacao FOREIGN KEY(cd_autorizacao) REFERENCES tbl_status_autorizacao_servicos(cd_autorizacao)
);
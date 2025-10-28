CREATE TABLE tbl_status_ordem_servicos (
  cd_status INTEGER UNIQUE NOT NULL,
  ds_status VARCHAR(100) NOT NULL
);

INSERT INTO tbl_status_ordem_servicos (cd_status, ds_status) VALUES (
  1, 'PENDENTE'
), (
  2, 'EM EXECUÇÃO'
), (
  3, 'PARADO'
), (
  4, 'FINALIZADO'
), (
  5, 'CANCELADO'
);

CREATE TABLE tbl_ordem_servicos (
  id_ordem_servico BIGSERIAL,
  dt_emissao DATE NOT NULL DEFAULT NOW(),
  cd_status INTEGER NOT NULL DEFAULT 1,
  dt_conclusao DATE,
  vl_total NUMERIC(10, 2),
  id_avaliacao BIGINT NOT NULL,
  CONSTRAINT pk_tbl_ordem_servicos_id_ordem_servico PRIMARY KEY(id_ordem_servico),
  CONSTRAINT fk_tbl_ordem_servicos_tbl_status_ordem_servicos_cd_status FOREIGN KEY(cd_status) REFERENCES tbl_status_ordem_servicos(cd_status),
  CONSTRAINT fk_tbl_ordem_servicos_tbl_avaliacoes_id_avaliacao FOREIGN KEY(id_avaliacao) REFERENCES tbl_avaliacoes(id_avaliacao)
);
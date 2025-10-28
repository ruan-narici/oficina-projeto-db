SELECT 
    c.nm_cliente AS cliente,
    v.ds_modelo AS veiculo,
    v.nr_ano AS ano_veiculo,
    o.id_ordem_servico AS ordem_servico,
    s.id_servico AS servico_id,
    m.ds_mao_obra AS mao_obra,
    s.vl_servico AS valor_mao_obra,
    p.ds_peca AS peca,
    pu.qt_pecas AS qt_peca_utilizada,
    (pu.qt_pecas * p.vl_peca) AS valor_peca,
    ((pu.qt_pecas * p.vl_peca) + s.vl_servico) AS valor_total_servico,
    o.cd_status AS status_ordem,
    st.ds_status AS status_ordem_desc,
    sa.ds_autorizacao AS autorizacao_servico
FROM tbl_clientes c
JOIN tbl_veiculos v ON v.id_cliente = c.id_cliente
JOIN tbl_avaliacoes a ON a.id_veiculo = v.id_veiculo
JOIN tbl_ordem_servicos o ON o.id_avaliacao = a.id_avaliacao
JOIN tbl_servicos s ON s.id_ordem_servico = o.id_ordem_servico
JOIN tbl_mao_obra m ON m.id_mao_obra = s.id_mao_obra
JOIN tbl_pecas_utilizadas pu ON pu.id_servico = s.id_servico
JOIN tbl_pecas p ON p.id_peca = pu.id_peca
JOIN tbl_status_ordem_servicos st ON st.cd_status = o.cd_status
JOIN tbl_status_autorizacao_servicos sa ON sa.cd_autorizacao = s.cd_autorizacao
WHERE s.cd_autorizacao = 1 
GROUP BY 
    c.nm_cliente,
    v.ds_modelo,
    v.nr_ano,
    o.id_ordem_servico,
    s.id_servico,
    m.ds_mao_obra,
    s.vl_servico,
    p.ds_peca,
    pu.qt_pecas,
    p.vl_peca,
    o.cd_status,
    st.ds_status,
    sa.ds_autorizacao
HAVING ((pu.qt_pecas * p.vl_peca) + s.vl_servico) > 100 
ORDER BY c.nm_cliente ASC, o.dt_emissao DESC;

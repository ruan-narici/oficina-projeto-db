SELECT 
    s.id_servico,
    m.ds_mao_obra AS mao_obra,
    s.vl_servico AS valor_mao_obra,
    SUM(pu.qt_pecas * p.vl_peca) AS valor_pecas,
    (s.vl_servico + SUM(pu.qt_pecas * p.vl_peca)) AS valor_total
FROM tbl_servicos s
JOIN tbl_mao_obra m ON m.id_mao_obra = s.id_mao_obra
JOIN tbl_pecas_utilizadas pu ON pu.id_servico = s.id_servico
JOIN tbl_pecas p ON p.id_peca = pu.id_peca
WHERE s.cd_autorizacao = 1
GROUP BY s.id_servico, m.ds_mao_obra, s.vl_servico
HAVING (s.vl_servico + SUM(pu.qt_pecas * p.vl_peca)) > 200
ORDER BY valor_total DESC;
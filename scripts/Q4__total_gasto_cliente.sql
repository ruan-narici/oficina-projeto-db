SELECT 
    c.nm_cliente AS cliente,
    COUNT(s.id_servico) AS total_servicos,
    SUM(s.vl_servico + COALESCE(pu.qt_pecas * p.vl_peca, 0)) AS total_gasto
FROM tbl_clientes c
JOIN tbl_veiculos v ON v.id_cliente = c.id_cliente
JOIN tbl_avaliacoes a ON a.id_veiculo = v.id_veiculo
JOIN tbl_ordem_servicos o ON o.id_avaliacao = a.id_avaliacao
JOIN tbl_servicos s ON s.id_ordem_servico = o.id_ordem_servico
LEFT JOIN tbl_pecas_utilizadas pu ON pu.id_servico = s.id_servico
LEFT JOIN tbl_pecas p ON p.id_peca = pu.id_peca
WHERE s.cd_autorizacao = 1
GROUP BY c.nm_cliente
HAVING SUM(s.vl_servico + COALESCE(pu.qt_pecas * p.vl_peca, 0)) > 500
ORDER BY total_gasto DESC;
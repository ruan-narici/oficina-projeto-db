SELECT 
    c.nm_cliente AS cliente,
    v.ds_modelo AS veiculo,
    v.nr_ano AS ano_veiculo
FROM tbl_clientes c
JOIN tbl_veiculos v ON v.id_cliente = c.id_cliente
ORDER BY c.nm_cliente ASC;
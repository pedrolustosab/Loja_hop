INSERT INTO dim_departamento (
    sk_departamento, cod_departamento, nom_departamento, dtc_inicio, dtc_fim, versao
) VALUES (
    -1, -1, 'SEM INFORMACAO', '1900-01-01', NULL, 1
);

INSERT INTO dim_vendedor (
    sk_vendedor, cod_vendedor, nom_vendedor, dtc_inicio, dtc_fim, versao
) VALUES (
    -1, -1, 'SEM INFORMACAO', '1900-01-01', NULL, 1
);

INSERT INTO dim_produto (
    sk_produto, cod_produto, nom_produto, dtc_inicio, dtc_fim, versao
) VALUES (
    -1, -1, 'SEM INFORMACAO', '1900-01-01', NULL, 1
);

UPDATE STG.stg_vendedor 
SET nom_vendedor = 'PEDRO LUSTOSA' 
WHERE cod_vendedor = 1;

UPDATE STG.stg_produto 
SET nom_produto = 'CANETA_AZUL' 
WHERE cod_produto = 1;

SELECT DISTINCT 
    dt."data", 
    fv.sk_produto, 
    dp.cod_produto, 
    dp.nom_produto 
FROM fat_venda fv 
INNER JOIN dim_produto dp ON dp.sk_produto = fv.sk_produto
INNER JOIN dim_tempo dt ON dt.sk_tempo = fv.sk_tempo
WHERE cod_produto = 1;
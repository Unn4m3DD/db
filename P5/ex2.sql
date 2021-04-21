--2.a)
-- σ encomenda.fornecedor = null (fornecedor ⟕ fornecedor.nif = encomenda.fornecedor (encomenda))
select *
from fornecedor
    left join encomenda on fornecedor.nif = encomenda.fornecedor
where encomenda.fornecedor is null;
/*
 fornecedor.nif 590972623
 fornecedor.nome ConservasMac
 fornecedor.fax 234112233
 fornecedor.endereco Rua da Recta 233
 fornecedor.condpag 30
 fornecedor.tipo 104
 encomenda.numero null
 encomenda.data null
 encomenda.fornecedor null
 */
--2.b)
--π produto.codigo, produto.nome, produto.preco, produto.iva, avgT.avg 
--  (produto ⟕ produto.codigo = avgT.codProd ρ avgT π codProd, avg γ codProd; AVG(unidades)→avg (item))
select produto.codigo,
    produto.nome,
    produto.preco,
    produto.iva,
    avgT.avg
from produto
    left join (
        select codProd,
            AVG(unidades) as avg
        from item
        group by codProd
    ) as avgT on produto.codigo = avgT.codProd;
/*
 produto.codigo	produto.nome	           produto.preco   produto.iva	avgT.avg
 10001	        Bife da Pa	               8.75	           23	        200
 10002	        Laranja Algarve	           1.25	           23	        1200
 10003	        Pera Rocha	               1.45	           23	        2200
 10004	        Secretos de Porco Preto    10.15           23	        300
 10005	        Vinho Rose Plus	           2.99	           13	        500
 10006	        Queijo de Cabra da Serra   15	           23	        50
 10007	        Queijo Fresco do Dia	   0.65	           23	        40
 10008	        Cerveja Preta Artesanal	   1.65	           13	        10
 10009	        Lixivia de Cor	           1.85	           23	        150
 10010	        Amaciador Neutro	       4.05	           23	        250
 10011	        Agua Natural	           0.55	           6	        1000
 10012	        Pao de Leite	           0.15	           6	        200
 10013	        Arroz Agulha	           1	           13	        625
 10014	        Iogurte Natural	           0.4	           13	        200     
 */
--2.c)
-- π avg γ ; AVG(sumT.sum)→avg ρ sumT 
-- (encomenda ⟕ encomenda.numero = sumT.numEnc ρ sumT π numEnc, sum γ numEnc; SUM(unidades)→sum (item))
select AVG(sumT.sum) as avg
from (
        select *
        from encomenda
            left join (
                select numEnc,
                    SUM(unidades) as sum
                from item
                group by numEnc
            ) as sumT on encomenda.numero = sumT.numEnc
    ) as sumT;
/*
 avg
 1015
 */
--2.d)
--π fornecedor.nif, fornecedor.nome, produto.nome, produto.unidades
--fornecedor ⟕ fornecedor.nif = prod.fornecedor ρ prod 
--encomenda ⟕ encomenda.numero = item.numEnc 
--item ⨝ produto.codigo = prod.codProd produto
select fornecedor.nif,
    fornecedor.nome,
    produto.nome,
    produto.unidades
from fornecedor
    left join (
        select *
        from encomenda
            left join item on encomenda.numero = item.numEnc
    ) as prod on fornecedor.nif = prod.fornecedor
    inner join produto on produto.codigo = prod.codProd;
/*
fornecedor.nif	fornecedor.nome	produto.nome	         produto.unidades
509111222	    LactoSerrano   	Bife da Pa	             125
509111222	    LactoSerrano   	Secretos de Porco Preto	 342
509121212	    FrescoNorte   	Laranja Algarve	         1000
509121212	    FrescoNorte   	Pera Rocha	             2000
509294734	    PinkDrinks   	Vinho Rose Plus	         5232
509294734	    PinkDrinks   	Cerveja Preta Artesanal	 937
509294734	    PinkDrinks   	Agua Natural	         919323
509827353	    LactoSerrano   	Queijo de Cabra da Serra 3243
509827353	    LactoSerrano   	Queijo Fresco do Dia	 452
509827353	    LactoSerrano   	Iogurte Natural	         998
509836433	    LeviClean   	Lixivia de Cor	         9382
509836433	    LeviClean   	Amaciador Neutro	     932432
509987654	    MaduTex   	    Arroz Agulha	         7665
509987654	    MaduTex   	    Pao de Leite	         5434
*/       
--2.a)
/*
 σ encomenda.fornecedor = null (fornecedor ⟕ fornecedor.nif = encomenda.fornecedor (encomenda))
 
 fornecedor.nif	fornecedor.nome
 590972623	      ConservasMac
 */
select
  *
from
  fornecedor
  left join encomenda on fornecedor.nif = encomenda.fornecedor
where
  encomenda.fornecedor is null;

--2.b)
/*
 π codigo, nome, avg_uni 
 (produto ⨝ codigo = codProd (γ codProd; avg_uni←avg(unidades) (item)))
 
 produto.codigo	produto.nome	             	avgT.avg
 10001	        Bife da Pa	                 200
 10002	        Laranja Algarve	             1200
 10003	        Pera Rocha	                 2200
 10004	        Secretos de Porco Preto      300
 10005	        Vinho Rose Plus	             500
 10006	        Queijo de Cabra da Serra     50
 10007	        Queijo Fresco do Dia	       40
 10008	        Cerveja Preta Artesanal	     10
 10009	        Lixivia de Cor	             150
 10010	        Amaciador Neutro	           250
 10011	        Agua Natural	               1000
 10012	        Pao de Leite	               200
 10013	        Arroz Agulha	               625
 10014	        Iogurte Natural	             200     
 */
select
  produto.codigo,
  produto.nome,
  produto.preco,
  produto.iva,
  avgT.avg
from
  produto
  left join (
    select
      codProd,
      AVG(unidades) as avg
    from
      item
    group by
      codProd
  ) as avgT on produto.codigo = avgT.codProd;

--2.c)
/*
 γ;avg(item_count)->avg_item_count
 γ numero; item_count<-count(numero) ((encomenda) ⨝ numero = numEnc (item))
 
 avg_item_count
 1.8
 */
select
  avg(item_count) as avg_item_count
from
  (
    select
      numero,
      count(*) as item_count
    from
      encomenda
      inner join item on numero = numEnc
    group by
      numero
  ) as tmp;

--2.d)
/*
 τ produto.nome 
 (
 γ fornecedor.nome, produto.nome; total_uni←sum(item.unidades)
 (
 π fornecedor.nome, produto.nome, item.unidades
 (
 encomenda ⨝ numero = numEnc 
 item ⨝ codigo = codProd 
 produto ⨝ nif = fornecedor
 fornecedor
 )
 )
 )
 
 fornecedor.nif	fornecedor.nome	produto.nome	total_uni
 509111222	LactoSerrano	Bife da Pa	200
 509111222	LactoSerrano	Secretos de Porco Preto	300
 509121212	FrescoNorte	Laranja Algarve	1200
 509121212	FrescoNorte	Pera Rocha	4400
 509294734	PinkDrinks	Vinho Rose Plus	500
 509294734	PinkDrinks	Cerveja Preta Artesanal	10
 509294734	PinkDrinks	Agua Natural	1000
 509827353	LactoSerrano	Queijo de Cabra da Serra	50
 509827353	LactoSerrano	Queijo Fresco do Dia	40
 509827353	LactoSerrano	Iogurte Natural	200
 509836433	LeviClean	Lixivia de Cor	300
 509836433	LeviClean	Amaciador Neutro	500
 509987654	MaduTex	Arroz Agulha	1250
 509987654	MaduTex	Pao de Leite	200
 */
select
  fornecedor.nif,
  fornecedor.nome,
  produto.nome,
  sum(item.unidades) as total_uni
from
  fornecedor
  inner join encomenda on fornecedor.nif = encomenda.fornecedor
  inner join item on encomenda.numero = item.numEnc
  inner join produto on produto.codigo = item.codProd
group by
  fornecedor.nif,
  fornecedor.nome,
  produto.nome;
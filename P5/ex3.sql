--3.a)
-- σ prescricao.numUtente = null (paciente ⟗ paciente.numUtente = prescricao.numUtente (prescricao))
select *
from paciente
    full outer join prescricao on paciente.numUtente = prescricao.numUtente
where prescricao.numUtente is null;
/*
 paciente.numUtente	paciente.nome	    paciente.dataNasc	    paciente.endereco	prescricao.numPresc	prescricao.numUtente	prescricao.numMedico	prescricao.farmacia	prescricao.dataProc
 2	                Paula Vasco Silva	1972-010-30         	Rua Direita         43	                null	                null	                null	            null
 */
--3.b)
-- (medico ⟕ numMedico = numSNS ρ prescCount π numMedico, num γ numMedico; COUNT(*)→num (prescricao))
select *
from medico
    left join (
        select numMedico,
            count(*) as num
        from prescricao
        group by numMedico
    ) as prescCount on numMedico = numSNS;
/*
 medico.numSNS	medico.nome	        medico.especialidade	prescCount.numMedico	prescCount.num
 101	            Joao Pires Lima     Cardiologia	            101	                    1
 102	            Manuel Jose Rosa    Cardiologia	            102	                    4
 103	            Rui Luis Caraca     Pneumologia	            103	                    2
 104	            Sofia Sousa Silva   Radiologia	            null                    null
 105	            Ana Barbosa	        Neurologia              105	                    2
 */
--3.c)
--(farmacia ⟕ nome = prescCount.farmacia ρ prescCount π farmacia, num γ farmacia; COUNT(*)→num (prescricao))
select *
from farmacia
    left join (
        select farmacia,
            count(*) as num
        from prescricao
        group by farmacia
    ) as prescCount on nome = prescCount.farmacia;
/*
 farmacia.nome	    farmacia.telefone	farmacia.endereco	       prescCount.farmacia	prescCount.num
 Farmacia BelaVista	221234567	        Avenida Principal 973	   Farmacia BelaVista	1
 Farmacia Central	234370500	        Avenida da Liberdade 33	   Farmacia Central	    4
 Farmacia Peixoto	234375111	        Largo da Vila 523	       Farmacia Peixoto	    1
 Farmacia Vitalis	229876543	        Rua Visconde Salgado 263   Farmacia Vitalis	    1
 */
--3.d)
-- π farmaco.numRegFarm, nome σ farmaco.numRegFarm = 906 and presc.numRegFarm ≠ 906 
-- (farmaco ⟕ presc.nomeFarmaco = nome ρ presc π numRegFarm, nomeFarmaco (presc_farmaco))
select farmaco.numRegFarm,
    nome
from farmaco
    left join (
        select numRegFarm,
            nomeFarmaco
        from presc_farmaco
    ) as presc on presc.nomeFarmaco = nome
where farmaco.numRegFarm = 906
    and presc.numRegFarm != 906;
/*
 farmaco.numRegFarm	farmaco.nome
 906	                Gucolan 1000
 */
--3.e)
-- π prescricao.farmacia, numReg, farmaceu.soma σ prescricao.farmacia ≠ null 
-- (prescricao ⟕ presc_farmaco.numPresc = prescricao.numPresc 
-- (presc_farmaco ⟕ farmaceu.numReg = presc_farmaco.numRegFarm ρ farmaceu π numReg, soma γ numReg; COUNT(numReg)→soma (farmaceutica)))
select prescricao.farmacia,
    numReg,
    farmaceu.soma
from prescricao
    left join presc_farmaco on presc_farmaco.numPresc = prescricao.numPresc
    left join (
        select numReg,
            count(numReg) as soma
        from farmaceutica
        group by numReg
    ) as farmaceu on farmaceu.numReg = presc_farmaco.numRegFarm
where prescricao.farmacia is not null;
/*
prescricao.farmacia	  farmaceu.numReg	farmaceu.soma
Farmacia Central	  905	            1
Farmacia Central	  906	            1
Farmacia Central	  908	            1
Farmacia BelaVista	  905	            1
Farmacia BelaVista	  908	            1
Farmacia Vitalis	  905	            1
Farmacia Vitalis	  906	            1
Farmacia Vitalis	  908	            1
Farmacia Peixoto	  905	            1
Farmacia Peixoto	  906	            1
Farmacia Peixoto	  908	            1
*/
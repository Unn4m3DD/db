--3.a)
/*
 π numUtente, nome 
 (
 paciente ▷
 π numUtente (prescricao)
 )
 
 paciente.numUtente	paciente.nome
 2	Paula Vasco Silva
 */
select
  *
from
  paciente full
  outer join prescricao on paciente.numUtente = prescricao.numUtente
where
  prescricao.numUtente is null;

--3.b)
/* 
 γ especialidade; count(especialidade)->especialidade_count (prescricao ⨝ numSNS = numMedico medico)
 
 medico.especialidade	especialidade_count
 Neurologia	2
 Cardiologia	5
 Pneumologia	2
 */
select
  especialidade,
  count(especialidade) as cnt
from
  prescricao
  inner join medico on numSNS = numMedico
group by
  especialidade;

--3.c)
/*
 γ farmacia.nome; count(nome)->perscription_count (farmacia ⨝ farmacia=nome prescricao)
 
 farmacia.nome	perscription_count
 Farmacia BelaVista	1
 Farmacia Central	4
 Farmacia Peixoto	1
 Farmacia Vitalis	1
 */
select
  nome,
  count(nome) as perscription_count
from
  farmacia
  inner join prescricao on nome = farmacia
group by
  nome;

--3.d)
/*
 π farmaco.nome, formula
 (σ numPresc = null (
 presc_farmaco ⟖ nomeFarmaco = farmaco.nome
 (farmaco ⨝ numReg = numRegFarm (σ numReg=906 (farmaceutica)))
 ))
 
 farmaco.nome	farmaco.formula
 Gucolan 1000	VFR-750
 */
select
  farmaco.nome,
  formula
from
  farmaco
  inner join (
    select
      *
    from
      farmaceutica
    where
      numReg = 906
  ) as f906 on numReg = numRegFarm
  left join presc_farmaco on nomeFarmaco = farmaco.nome
where
  numPresc is null;

/*
 */
--3.e)
/*
 γ numRegFarm, farmacia.nome, nomeFarmaco; count(*)->farmaco_count (farmacia ⨝ prescricao ⨝  presc_farmaco ⨝ numRegFarm = numReg farmaceutica)
 
 presc_farmaco.numRegFarm	farmacia.nome	presc_farmaco.nomeFarmaco	farmaco_count
 905	Farmacia BelaVista	Boa Saude em 3 Dias	5
 907	Farmacia BelaVista	GEROaero Rapid	1
 906	Farmacia BelaVista	Voltaren Spray	5
 906	Farmacia BelaVista	Xelopironi 350	2
 908	Farmacia BelaVista	Aspirina 1000	5
 905	Farmacia Central	Boa Saude em 3 Dias	5
 907	Farmacia Central	GEROaero Rapid	1
 906	Farmacia Central	Voltaren Spray	5
 906	Farmacia Central	Xelopironi 350	2
 908	Farmacia Central	Aspirina 1000	5
 905	Farmacia Peixoto	Boa Saude em 3 Dias	5
 907	Farmacia Peixoto	GEROaero Rapid	1
 906	Farmacia Peixoto	Voltaren Spray	5
 906	Farmacia Peixoto	Xelopironi 350	2
 908	Farmacia Peixoto	Aspirina 1000	5
 905	Farmacia Vitalis	Boa Saude em 3 Dias	5
 907	Farmacia Vitalis	GEROaero Rapid	1
 906	Farmacia Vitalis	Voltaren Spray	5
 906	Farmacia Vitalis	Xelopironi 350	2
 908	Farmacia Vitalis	Aspirina 1000	5
 */
select
  numRegFarm,
  farmacia.nome,
  nomeFarmaco,
  count(*) as farmaco_count
from
  farmacia
  inner join prescricao natural
  inner join presc_farmaco natural
  inner join farmaceutica on numRegFarm = numReg
group by
  numRegFarm,
  farmacia.nome,
  nomeFarmaco;

-- f)
/*
 π tmp.nome, tmp.numUtente (
 σ m_min ≠ m_max 
 ρ tmp 
 π paciente.numUtente, paciente.nome, m_min, m_max 
 γ paciente.numUtente, paciente.nome;	 
 MAX(prescricao.numMedico)→m_min, 
 MIN(prescricao.numMedico)→m_max 
 (paciente ⨝ paciente.numUtente = prescricao.numUtente (prescricao))
 )
 tmp.nome	tmp.numUtente
 Renato Manuel Cavaco	1
 Ines Couto Souto	3
 */
select
  tmp.nome,
  tmp.numUtente
from
  (
    select
      paciente.numUtente,
      paciente.nome,
      max(prescricao.numMedico) as m_min,
      min(prescricao.numMedico) as m_max
    from
      paciente
      inner join prescricao on paciente.numUtente = prescricao.numUtente
    group by
      paciente.numUtente,
      paciente.nome
  ) as tmp
where
  m_min != m_max;
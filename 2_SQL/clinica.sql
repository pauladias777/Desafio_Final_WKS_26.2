#criacao da base de dados clinica_care:
CREATE DATABASE clinica_care;
USE clinica_care;

# criação da tabela pacientes:
CREATE TABLE pacientes (
id_paciente INT(40) NOT NULL,
nome_completo VARCHAR(50) NOT NULL,
cpf VARCHAR(50)NOT NULL,
data_nascimento DATE,
data_cadastro DATE,
sexo VARCHAR(40) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone VARCHAR(40) NOT NULL, 
email VARCHAR (40) NOT NULL,
tipo_plano VARCHAR (50) NOT NULL,
tipo_sanguineo VARCHAR(2)NOT NULL,
PRIMARY KEY(id_paciente)
);

# criação da tabela médicos:
CREATE TABLE medicos (
id_medico INT(40) NOT NULL,
nome_medico VARCHAR(40) NOT NULL,
cpf_medico VARCHAR(50) NOT NULL,
crm VARCHAR(50) NOT NULL,
endereco_medico VARCHAR(100) NOT NULL,
telefone_medico VARCHAR(40) NOT NULL,
email_medico VARCHAR(40) NOT NULL,
dias_trabalho VARCHAR(40) NOT NULL,
PRIMARY KEY(id_medico)
);

# criação da tabela especialidades:
CREATE TABLE especialidades (
id_especialidade INT(40) NOT NULL,
nome_especialidade VARCHAR(40) NOT NULL,
descricao_especialidade VARCHAR(40) NOT NULL,
area_atuacao VARCHAR(40) NOT NULL,
valor_base DECIMAL(10,2) NOT NULL,
duracao_consulta TIME NOT NULL,
status VARCHAR(40) NOT NULL,
observacoes VARCHAR(100) NOT NULL,
PRIMARY KEY (id_especialidade)
);

# criação da tabela consultas:
CREATE TABLE consultas (
id_consulta INT(40) NOT NULL,
id_paciente INT(40) NOT NULL,
id_medico INT(40) NOT NULL,
id_especialidade INT(40) NOT NULL,
data_consulta DATE,
horario_consulta TIME NOT NULL,
status_consulta VARCHAR(50) NOT NULL,
valor_consulta DECIMAL(10,2) NOT NULL,
PRIMARY KEY(id_consulta),
FOREIGN KEY(id_paciente) REFERENCES pacientes
(id_paciente),
FOREIGN KEY(id_medico) REFERENCES medicos
(id_medico),
FOREIGN KEY(id_especialidade) REFERENCES especialidades(id_especialidade)
); 

# criação da tabela prontuários:
CREATE TABLE prontuarios (
id_prontuario INT(40) NOT NULL,
id_paciente INT(40) NOT NULL,
data_abertura DATE,
queixa_principal VARCHAR(100) NOT NULL,
diagnostico VARCHAR(50) NOT NULL,
historico VARCHAR(50) NOT NULL,
anotacoes VARCHAR(100) NOT NULL,
observacoes VARCHAR(100) NOT NULL,
PRIMARY KEY(id_prontuario),
FOREIGN KEY(id_paciente) REFERENCES pacientes(id_paciente)
);

#criação da tabela prescrições:
CREATE TABLE prescricoes (
id_prescricao INT(40) NOT NULL,
id_consulta INT(40) NOT NULL,
data_prescricao DATE,
hora_prescricao TIME NOT NULL,
medicamento VARCHAR(100) NOT NULL,
duracao VARCHAR(50) NOT NULL,
vezes_ao_dia INT(40) NOT NULL,
dosagem VARCHAR(40) NOT NULL,
instrucoes VARCHAR(100) NOT NULL,
PRIMARY KEY(id_prescricao),
FOREIGN KEY(id_consulta) REFERENCES consultas(id_consulta)
);

# criação da tabela pagamentos:
CREATE TABLE pagamentos (
id_pagamento INT(40) NOT NULL,
id_consulta INT(40) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
data_pagamento DATE,
metodo_pagamento VARCHAR(40) NOT NULL,
status_pagamento VARCHAR(40) NOT NULL,
numero_recibo INT(40) NOT NULL,
observacoes VARCHAR(100) NOT NULL,
PRIMARY KEY(id_pagamento),
FOREIGN KEY(id_consulta) REFERENCES consultas(id_consulta)
);

# criação da tabela associativa e_assoc1, ligada entre médico e especialidade:
CREATE TABLE e_assoc_1(
id_medico INT NOT NULL,
id_especialidade INT NOT NULL,
PRIMARY KEY(id_medico, id_especialidade),
FOREIGN KEY(id_medico) REFERENCES medicos(id_medico),
FOREIGN KEY(id_especialidade) REFERENCES especialidades(id_especialidade)
);


-- Inserção de 12 pacientes no banco de dados:

INSERT INTO pacientes
(id_paciente, nome_completo, cpf, data_nascimento, data_cadastro, sexo, endereco, telefone, email, tipo_plano, tipo_sanguineo)
VALUES
(1, 'Ana Carolina Souza', '123.456.789-01', '1992-03-15', '2026-08-01', 'Feminino', 'Rua das Flores, 120', '(11) 99821-4532', 'ana.souza@email.com', 'Unimed', 'O+'),

(2, 'Bruno Henrique Lima', '234.567.890-12', '1987-07-22', '2026-08-02', 'Masculino', 'Av. Brasil, 450', '(11) 99732-1845', 'bruno.lima@email.com', 'Bradesco Saúde', 'A+'),

(3, 'Camila Ferreira Santos', '345.678.901-23', '1998-11-09', '2026-08-03', 'Feminino', 'Rua das Palmeiras, 85', '(11) 99645-7321', 'camila.santos@email.com', 'Particular', 'B+'),

(4, 'Daniel Oliveira Costa', '456.789.012-34', '1975-05-30', '2026-08-04', 'Masculino', 'Rua São Paulo, 310', '(11) 99518-6427', 'daniel.costa@email.com', 'Amil', 'O-'),

(5, 'Eduarda Martins Alves', '567.890.123-45', '2001-01-18', '2026-08-05', 'Feminino', 'Rua do Comércio, 210', '(11) 99427-5318', 'eduarda.alves@email.com', 'Unimed', 'AB+'),

(6, 'Felipe Rodrigues Melo', '678.901.234-56', '1990-09-12', '2026-08-06', 'Masculino', 'Av. Central, 725', '(11) 99316-8245', 'felipe.melo@email.com', 'Particular', 'A-'),

(7, 'Gabriela Ribeiro Silva', '789.012.345-67', '1983-12-04', '2026-08-07', 'Feminino', 'Rua Bela Vista, 160', '(11) 99274-3165', 'gabriela.silva@email.com', 'SulAmérica', 'O+'),

(8, 'Gustavo Almeida Rocha', '890.123.456-78', '1995-06-27', '2026-08-08', 'Masculino', 'Rua Independência, 95', '(11) 99163-7428', 'gustavo.rocha@email.com', 'Bradesco Saúde', 'B-'),

(9, 'Helena Castro Mendes', '901.234.567-89', '1979-10-21', '2026-08-09', 'Feminino', 'Av. Paulista, 1020', '(11) 99052-6381', 'helena.mendes@email.com', 'Amil', 'A+'),

(10, 'Igor Fernandes Dias', '012.345.678-90', '1989-02-14', '2026-08-10', 'Masculino', 'Rua Liberdade, 340', '(11) 98941-5276', 'igor.dias@email.com', 'Particular', 'O+'),

(11, 'Juliana Barbosa Martins', '112.233.445-56', '1996-08-31', '2026-08-11', 'Feminino', 'Rua das Acácias, 280', '(11) 98835-4162', 'juliana.martins@email.com', 'Unimed', 'AB-'),

(12, 'Lucas Pereira Gomes', '223.344.556-67', '1972-04-06', '2026-08-12', 'Masculino', 'Av. das Nações, 510', '(11) 98724-3591', 'lucas.gomes@email.com', 'SulAmérica', 'A+');

-- Inserção de 12 médicos no banco de dados:

INSERT INTO medicos
(id_medico, nome_medico, cpf_medico, crm, endereco_medico, telefone_medico, email_medico, dias_trabalho)
VALUES
(1, 'Ricardo Almeida Santos', '321.456.789-01', 'CRM-SP 123456', 'Rua das Flores, 500', '(11) 99811-2233', 'ricardo.santos@clinica.com', 'Segunda a Sexta'),

(2, 'Mariana Costa Oliveira', '432.567.890-12', 'CRM-SP 234567', 'Av. Brasil, 820', '(11) 99722-3344', 'mariana.oliveira@clinica.com', 'Segunda, Quarta e Sexta'),

(3, 'Fernando Martins Rocha', '543.678.901-23', 'CRM-SP 345678', 'Rua Palmeiras, 310', '(11) 99633-4455', 'fernando.rocha@clinica.com', 'Terça e Quinta'),

(4, 'Patricia Gomes Ferreira', '654.789.012-34', 'CRM-SP 456789', 'Rua São Paulo, 450', '(11) 99544-5566', 'patricia.ferreira@clinica.com', 'Segunda a Sexta'),

(5, 'André Luiz Barbosa', '765.890.123-45', 'CRM-SP 567890', 'Av. Central, 900', '(11) 99455-6677', 'andre.barbosa@clinica.com', 'Terça, Quinta e Sábado'),

(6, 'Juliana Mendes Carvalho', '876.901.234-56', 'CRM-SP 678901', 'Rua Independência, 220', '(11) 99366-7788', 'juliana.carvalho@clinica.com', 'Segunda a Sexta'),

(7, 'Marcelo Ribeiro Costa', '987.012.345-67', 'CRM-SP 789012', 'Av. Paulista, 1500', '(11) 99277-8899', 'marcelo.costa@clinica.com', 'Segunda, Quarta e Sexta'),

(8, 'Renata Fernandes Lima', '098.123.456-78', 'CRM-SP 890123', 'Rua Liberdade, 180', '(11) 99188-9900', 'renata.lima@clinica.com', 'Terça e Quinta'),

(9, 'Eduardo Castro Mendes', '109.234.567-89', 'CRM-SP 901234', 'Rua das Acácias, 400', '(11) 99099-1122', 'eduardo.mendes@clinica.com', 'Segunda a Sexta'),

(10, 'Carolina Barbosa Dias', '210.345.678-90', 'CRM-SP 012345', 'Av. das Nações, 700', '(11) 98910-2233', 'carolina.dias@clinica.com', 'Segunda, Quarta e Sexta'),

(11, 'Gustavo Pereira Alves', '310.456.789-01', 'CRM-SP 112233', 'Rua Bela Vista, 350', '(11) 98821-3344', 'gustavo.alves@clinica.com', 'Terça, Quinta e Sábado'),

(12, 'Luciana Rodrigues Silva', '410.567.890-12', 'CRM-SP 223344', 'Rua do Comércio, 600', '(11) 98732-4455', 'luciana.silva@clinica.com', 'Segunda a Sexta');


-- Inserção de 12 especialidades no banco de dados:

INSERT INTO especialidades
(id_especialidade, nome_especialidade, descricao_especialidade, area_atuacao, valor_base, duracao_consulta, status, observacoes)
VALUES
(1, 'Cardiologia', 'Doencas do coracao', 'Cardiovascular', 300.00, '01:00:00', 'Ativa', 'Atendimento cardiologico'),

(2, 'Dermatologia', 'Cuidados com a pele', 'Dermatologica', 250.00, '00:50:00', 'Ativa', 'Consultas dermatologicas'),

(3, 'Pediatria', 'Saude de criancas', 'Infantil', 220.00, '00:45:00', 'Ativa', 'Atendimento pediatrico'),

(4, 'Ortopedia', 'Doencas musculoesqueleticas', 'Ortopedica', 280.00, '01:00:00', 'Ativa', 'Avaliacoes ortopedicas'),

(5, 'Ginecologia', 'Saude da mulher', 'Ginecologica', 260.00, '00:50:00', 'Ativa', 'Atendimento ginecologico'),

(6, 'Neurologia', 'Doencas neurologicas', 'Neurologica', 320.00, '01:00:00', 'Ativa', 'Avaliacoes neurologicas'),

(7, 'Oftalmologia', 'Saude dos olhos', 'Oftalmologica', 230.00, '00:45:00', 'Ativa', 'Exames oftalmologicos'),

(8, 'Endocrinologia', 'Doencas hormonais', 'Endocrina', 290.00, '00:50:00', 'Ativa', 'Acompanhamento hormonal'),

(9, 'Psiquiatria', 'Saude mental', 'Psiquiatrica', 350.00, '01:00:00', 'Ativa', 'Consultas psiquiatricas'),

(10, 'Gastroenterologia', 'Doencas digestivas', 'Gastrointestinal', 270.00, '00:50:00', 'Ativa', 'Avaliacoes digestivas'),

(11, 'Urologia', 'Saude urinaria', 'Urologica', 280.00, '00:50:00', 'Ativa', 'Atendimento urologico'),

(12, 'Clinica Geral', 'Atendimento geral', 'Clinica medica', 180.00, '00:40:00', 'Ativa', 'Consultas de rotina');


-- Associação entre médicos e especialidades no banco de dados:

INSERT INTO e_assoc_1
(id_medico, id_especialidade)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);
# inserção no banco de dados da tabela consultas:

INSERT INTO consultas (id_consulta, id_paciente, id_medico, id_especialidade, data_consulta, horario_consulta, status_consulta, valor_consulta)
VALUES
(1, 1, 1, 1, '2026-08-13', '08:00:00', 'Realizada', 300.00),

(2, 2, 2, 2, '2026-08-13', '09:00:00', 'Realizada', 250.00),

(3, 3, 3, 3, '2026-08-14', '10:00:00', 'Realizada', 220.00),

(4, 4, 4, 4, '2026-08-14', '14:00:00', 'Realizada', 280.00),

(5, 5, 5, 5, '2026-08-15', '08:30:00', 'Realizada', 260.00),

(6, 6, 6, 6, '2026-08-15', '10:00:00', 'Realizada', 320.00),

(7, 7, 7, 7, '2026-08-18', '09:00:00', 'Realizada', 230.00),

(8, 8, 8, 8, '2026-08-18', '11:00:00', 'Realizada', 290.00),

(9, 9, 9, 9, '2026-08-19', '15:00:00', 'Realizada', 350.00),

(10, 10, 10, 10, '2026-08-20', '08:00:00', 'Realizada', 270.00),

(11, 11, 11, 11, '2026-08-20', '10:00:00', 'Realizada', 280.00),

(12, 12, 12, 12, '2026-08-21', '14:00:00', 'Agendada', 180.00);


-- Inserção de 12 prontuários no banco de dados:

INSERT INTO prontuarios
(id_prontuario, id_paciente, data_abertura, queixa_principal, diagnostico, historico, anotacoes, observacoes)
VALUES
(1, 1, '2026-08-13', 'Dor no peito e palpitações', 'Arritmia cardíaca', 'Histórico de pressão alta', 'Solicitado eletrocardiograma', 'Retorno em 30 dias'),

(2, 2, '2026-08-13', 'Manchas e coceira na pele', 'Dermatite', 'Alergia a alguns produtos', 'Prescrito tratamento tópico', 'Evitar produtos irritantes'),

(3, 3, '2026-08-14', 'Febre e dor de garganta', 'Infecção de garganta', 'Sem doenças anteriores relevantes', 'Orientada hidratação e repouso', 'Retorno se houver piora'),

(4, 4, '2026-08-14', 'Dor no joelho', 'Inflamação articular', 'Lesão antiga no joelho direito', 'Solicitado exame de imagem', 'Evitar atividades de impacto'),

(5, 5, '2026-08-15', 'Dor abdominal', 'Cólicas menstruais', 'Ciclos menstruais regulares', 'Orientada acompanhamento ginecológico', 'Retorno após exames'),

(6, 6, '2026-08-15', 'Dor de cabeça frequente', 'Cefaleia tensional', 'Relata episódios recorrentes', 'Orientado controle do estresse', 'Acompanhar frequência das dores'),

(7, 7, '2026-08-18', 'Dificuldade para enxergar de longe', 'Miopia', 'Usa óculos há três anos', 'Solicitado exame oftalmológico', 'Avaliar necessidade de nova correção'),

(8, 8, '2026-08-18', 'Cansaço frequente', 'Alteração hormonal', 'Histórico familiar de diabetes', 'Solicitados exames laboratoriais', 'Retorno com resultados'),

(9, 9, '2026-08-19', 'Insônia e ansiedade', 'Transtorno de ansiedade', 'Sintomas há aproximadamente seis meses', 'Orientado acompanhamento médico', 'Retorno para avaliação'),

(10, 10, '2026-08-20', 'Dor abdominal e azia', 'Gastrite', 'Relata episódios após refeições', 'Orientada mudança alimentar', 'Acompanhar evolução dos sintomas'),

(11, 11, '2026-08-20', 'Dor ao urinar', 'Infecção urinária', 'Episódio anterior há um ano', 'Solicitado exame de urina', 'Aguardar resultado do exame'),

(12, 12, '2026-08-21', 'Consulta de rotina', 'Sem alterações relevantes', 'Sem histórico de doenças graves', 'Realizada avaliação clínica geral', 'Manter acompanhamento anual');

-- Inserção de 12 prescrições no banco de dados:

INSERT INTO prescricoes
(id_prescricao, id_consulta, data_prescricao, hora_prescricao, medicamento, duracao, vezes_ao_dia, dosagem, instrucoes)
VALUES
(1, 1, '2026-08-13', '08:30:00', 'Losartana', '30 dias', 1, '50 mg', 'Tomar pela manhã'),

(2, 2, '2026-08-13', '09:30:00', 'Loratadina', '10 dias', 1, '10 mg', 'Tomar à noite'),

(3, 3, '2026-08-14', '10:30:00', 'Amoxicilina', '7 dias', 3, '500 mg', 'Tomar a cada 8 horas'),

(4, 4, '2026-08-14', '14:30:00', 'Ibuprofeno', '5 dias', 2, '400 mg', 'Tomar após as refeições'),

(5, 5, '2026-08-15', '09:00:00', 'Dipirona', '3 dias', 3, '500 mg', 'Tomar em caso de dor'),

(6, 6, '2026-08-15', '10:30:00', 'Paracetamol', '5 dias', 2, '750 mg', 'Tomar a cada 12 horas'),

(7, 7, '2026-08-18', '09:30:00', 'Lágrimas artificiais', '30 dias', 3, '1 gota', 'Aplicar nos olhos conforme orientação'),

(8, 8, '2026-08-18', '11:30:00', 'Metformina', '60 dias', 2, '500 mg', 'Tomar junto às refeições'),

(9, 9, '2026-08-19', '15:30:00', 'Sertralina', '90 dias', 1, '50 mg', 'Tomar diariamente pela manhã'),

(10, 10, '2026-08-20', '08:30:00', 'Omeprazol', '30 dias', 1, '20 mg', 'Tomar antes do café da manhã'),

(11, 11, '2026-08-20', '10:30:00', 'Nitrofurantoína', '7 dias', 2, '100 mg', 'Tomar após as refeições'),

(12, 12, '2026-08-21', '14:30:00', 'Vitamina D', '60 dias', 1, '2000 UI', 'Tomar uma vez ao dia');


-- Inserção de 12 pagamentos no banco de dados:

INSERT INTO pagamentos
(id_pagamento, id_consulta, valor, data_pagamento, metodo_pagamento, status_pagamento, numero_recibo, observacoes)
VALUES
(1, 1, 300.00, '2026-08-13', 'Cartão de crédito', 'Pago', 10001, 'Pagamento realizado no dia da consulta'),

(2, 2, 250.00, '2026-08-13', 'Pix', 'Pago', 10002, 'Pagamento realizado via Pix'),

(3, 3, 220.00, '2026-08-14', 'Cartão de débito', 'Pago', 10003, 'Pagamento realizado no dia da consulta'),

(4, 4, 280.00, '2026-08-14', 'Dinheiro', 'Pago', 10004, 'Pagamento realizado em dinheiro'),

(5, 5, 260.00, '2026-08-15', 'Pix', 'Pago', 10005, 'Pagamento realizado via Pix'),

(6, 6, 320.00, '2026-08-15', 'Cartão de crédito', 'Pago', 10006, 'Pagamento realizado no dia da consulta'),

(7, 7, 230.00, '2026-08-18', 'Pix', 'Pago', 10007, 'Pagamento realizado via Pix'),

(8, 8, 290.00, '2026-08-18', 'Cartão de débito', 'Pago', 10008, 'Pagamento realizado no dia da consulta'),

(9, 9, 350.00, '2026-08-19', 'Cartão de crédito', 'Pago', 10009, 'Pagamento realizado no dia da consulta'),

(10, 10, 270.00, '2026-08-20', 'Pix', 'Pago', 10010, 'Pagamento realizado via Pix'),

(11, 11, 280.00, '2026-08-20', 'Cartão de débito', 'Pago', 10011, 'Pagamento realizado no dia da consulta'),

(12, 12, 180.00, '2026-08-21', 'Pix', 'Pendente', 10012, 'Pagamento pendente');

# adicionando updates 1: mudar o valor da consulta
UPDATE consultas
SET valor_consulta ='310.00'
WHERE id_consulta = 8;

# adicionando updates 2: mudando o tipo de plano de saúde
UPDATE pacientes
SET tipo_plano ='Unimed'
WHERE id_paciente = 12;

# adicionando updates 3: atualizando o status de pagamento para pendente
UPDATE pagamentos
SET status_pagamento = 'Pendente',
	observacoes = 'Pagamento pendente'
WHERE id_pagamento = 2;

# consulta de agregação 1: o valor de consulta mais cara
SELECT MAX(valor_consulta) FROM consultas as consulta_maiscara;

# consulta de agregação 2: o pagamento de menor valor
SELECT MIN(valor) FROM pagamentos as pagamento_minimo;


# consulta de agregação 3: contagem de pacientes em relação ao sexo e tipo sanguineo
SELECT sexo, tipo_sanguineo,COUNT(id_paciente)
FROM pacientes
GROUP BY tipo_sanguineo, sexo;


# consulta de agregação 4: média do valor de consultas por especialidade
SELECT id_especialidade, AVG(valor_consulta) as media_valor
FROM consultas GROUP BY id_especialidade;

# consulta de agregação 5: soma de pagamento via cartão de crédito
SELECT SUM(valor) as soma_porcartao 
FROM pagamentos
WHERE metodo_pagamento ='Cartão de crédito';

# adicionando join 
#1: juntando pacientes e consultas, mostrando o nome do paciente com o id da consulta
SELECT pacientes.nome_completo, consultas.id_consulta 
FROM pacientes INNER JOIN consultas ON pacientes.id_paciente = consultas.id_paciente;

#2: mostrando os medicamentos das prescrições e a consulta relacionada
SELECT prescricoes.medicamento, consultas.id_consulta 
FROM prescricoes LEFT JOIN consultas 
ON prescricoes.id_consulta = consultas.id_consulta;

#3: relacionando numa mesma tabela médicos com as consultas e os pacientes inseridos nela
SELECT medicos.nome_medico, pacientes.nome_completo 
FROM medicos RIGHT JOIN consultas ON medicos.id_medico = consultas.id_medico 
RIGHT JOIN pacientes ON consultas.id_paciente= pacientes.id_paciente;

#4:relacionando o diagnostico do prontuario ao nome do paciente
SELECT prontuarios.diagnostico, pacientes.nome_completo 
FROM prontuarios INNER JOIN pacientes ON prontuarios.id_paciente = pacientes.id_paciente;
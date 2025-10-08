-- 1. PAPÉIS DO SISTEMA
INSERT INTO papel (nome_papel, requer_vinculo_bombeiro) VALUES 
('Administrador', FALSE),
('Comandante', TRUE),
('Supervisor', TRUE),
('Bombeiro', TRUE),
('Analista', FALSE),
('Operador', FALSE);

-- 2. QUARTEIS POR CIDADE - RECIFE
INSERT INTO cidade (nome, endereco) VALUES 
-- RMR
('Quartel Central - Comando Geral', 'Rua do Imperador, 250 - Santo Antônio, Recife'),
-- ZONA DA MATA
('1ª Companhia Independente de Bombeiros Militar','Rua Comendador José Justino, 175 - Boa Vista, Garanhuns'),
-- SERTÃO
('4ª Companhia Independente de Bombeiros Militar', 'Avenida Cardoso Pimentel, 2500 - Centro, Petrolina'),
-- AGRESTE
('2ª Companhia Independente de Bombeiros Militar', 'Avenida Adjar da Silva Casé, 800 - Indianópolis, Caruaru'),

-- 3. BOMBEIROS
INSERT INTO bombeiro (nip, patente, nome, id_quartel) VALUES 
-- Comandantes
('LOBO-001', 'Coronel', 'Carlos Eduardo Silva', 1),
('LOBO-002', 'Tenente-Coronel', 'Ana Paula Oliveira', 2),
('LOBO-003', 'Major', 'Ricardo Almeida Santos', 3),
('LOBO-004', 'Capitão', 'Fernanda Costa Lima', 4),
('LOBO-005', 'Capitão', 'Roberto Mendes Pereira', 5),
-- Oficiais
('LOBO-006', 'Tenente', 'Juliana Andrade Rocha', 6),
('LOBO-007', 'Tenente', 'Marcos Vinicius Torres', 7),
('LOBO-008', 'Subtenente', 'Patrícia Nunes Dias', 8),
('LOBO-009', 'Subtenente', 'Bruno Carvalho Azevedo', 9),
-- Sargentos
('LOBO-010', '1º Sargento', 'Amanda Souza Castro', 10),
('LOBO-011', '2º Sargento', 'Thiago Henrique Moreira', 11),
('LOBO-012', '3º Sargento', 'Larissa Martins Ribeiro', 12),
-- Cabos e Soldados
('LOBO-013', 'Cabo', 'Diego Pereira Nascimento', 13),
('LOBO-014', 'Cabo', 'Camila Duarte Freitas', 14),
('LOBO-015', 'Soldado', 'Rafael Augusto Monteiro', 15),
('LOBO-016', 'Soldado', 'Isabela Cristina Alves', 1),
('LOBO-017', 'Soldado', 'Gabriel Toledo Martins', 2),
('LOBO-018', 'Soldado', 'Vanessa Lopes Cardoso', 3),
('LOBO-019', 'Soldado', 'Leonardo Pires Santana', 4),
('LOBO-020', 'Soldado', 'Mariana Queiroz Fonseca', 5);

-- 4. VIATURAS
INSERT INTO viatura (placa, tipo, status, id_quartel) VALUES 
-- Auto Tanques
('LOBO-AT01', 'Auto Tanque', 'Disponível', 1),
('LOBO-AT02', 'Auto Tanque', 'Em Missão', 2),
('LOBO-AT03', 'Auto Tanque', 'Disponível', 3),
('LOBO-AT04', 'Auto Tanque', 'Em Manutenção', 4),
('LOBO-AT05', 'Auto Tanque', 'Disponível', 5),
-- Ambulâncias
('LOBO-AM01', 'Ambulância', 'Disponível', 6),
('LOBO-AM02', 'Ambulância', 'Em Missão', 7),
('LOBO-AM03', 'Ambulância', 'Disponível', 8),
('LOBO-AM04', 'Ambulância', 'Disponível', 9),
-- Escadas Magirus
('LOBO-EM01', 'Escada Magirus', 'Disponível', 10),
('LOBO-EM02', 'Escada Magirus', 'Em Manutenção', 11),
-- Viaturas de Resgate
('LOBO-RS01', 'Viatura de Resgate', 'Disponível', 12),
('LOBO-RS02', 'Viatura de Resgate', 'Disponível', 13),
-- Viaturas de Comando
('LOBO-CM01', 'Viatura de Comando', 'Disponível', 14),
('LOBO-CM02', 'Viatura de Comando', 'Em Missão', 15),
-- Viaturas de Busca
('LOBO-BS01', 'Viatura de Busca', 'Disponível', 1),
('LOBO-BS02', 'Viatura de Busca', 'Disponível', 2);

-- 5. USUÁRIOS (senhas como números de 8 dígitos)
INSERT INTO usuario (email, senha, id_papel, id_bombeiro) VALUES 
('admin@sistemalobo.com', '12345678', 1, NULL),
('analista@sistemalobo.com', '87654321', 5, NULL),
('comandante.central@sistemalobo.com', '11111111', 2, 1),
('comandante.norte@sistemalobo.com', '22222222', 2, 2),
('supervisor.sul@sistemalobo.com', '33333333', 3, 4),
('supervisor.leste@sistemalobo.com', '44444444', 3, 6),
('bombeiro1@sistemalobo.com', '55555555', 4, 13),
('bombeiro2@sistemalobo.com', '66666666', 4, 14),
('bombeiro3@sistemalobo.com', '77777777', 4, 15);

-- 6. OCORRÊNCIAS DE EXEMPLO - RECIFE
INSERT INTO ocorrencia (status, tipo, tipo_ocorrencia, descricao, latitude, longitude, precisao_gps, data_hora) VALUES 
('Encerrada', 'Incêndio', 'Incêndio Residencial', 'Incêndio em sobrado na Rua da Aurora. 1 vítima resgatada com ferimentos leves.', -8.063170, -34.871140, 12.5, '2024-01-15 14:30:00'),
('Em Andamento', 'Acidente', 'Acidente de Trânsito', 'Colisão entre caminhão e automóvel na Av. Agamenon Magalhães. Múltiplas vítimas.', -8.057850, -34.882650, 8.2, '2024-01-15 10:15:00'),
('Aberta', 'Resgate', 'Resgate em Altura', 'Pessoa presa em elevador no 12º andar do Edifício Acaiaca no Recife Antigo.', -8.061650, -34.871180, 5.0, '2024-01-15 09:45:00'),
('Encerrada', 'Vazamento', 'Vazamento de Gás', 'Vazamento de gás em restaurante na Rua do Bom Jesus. Área isolada.', -8.061420, -34.870580, 12.8, '2024-01-14 18:20:00'),
('Aberta', 'Salvamento', 'Salvamento Aquático', 'Afogamento no Rio Capibaribe próximo à Ponte Duarte Coelho. Equipe de mergulho acionada.', -8.052780, -34.879170, 25.3, '2024-01-15 11:00:00'),
('Em Andamento', 'Incêndio', 'Incêndio Comercial', 'Incêndio em galpão industrial na Av. Caxangá. Grandes proporções.', -8.042500, -34.919440, 18.7, '2024-01-15 16:20:00'),
('Aberta', 'Resgate', 'Resgate Animal', 'Criança atacada por animal na Praça do Derby. Vítima em estado grave.', -8.064720, -34.894170, 7.3, '2024-01-15 13:10:00');

-- 7. BOMBEIROS NAS OCORRÊNCIAS
INSERT INTO bombeiro_ocorrencia (id_bombeiro, id_ocorrencia) VALUES 
(1, 1), (13, 1), (14, 1),
(2, 2), (15, 2), (16, 2),
(4, 3), (17, 3),
(5, 4), (18, 4), (19, 4),
(6, 5), (20, 5),
(3, 6), (13, 6), (14, 6),
(7, 7), (15, 7), (16, 7);

-- 8. VIATURAS NAS OCORRÊNCIAS
INSERT INTO viatura_ocorrencia (id_viatura, id_ocorrencia) VALUES 
(1, 1), (6, 1),
(2, 2), (7, 2),
(10, 3),
(4, 4), (8, 4),
(13, 5), (14, 5),
(3, 6), (9, 6),
(11, 7), (12, 7);

-- 9. LOGS DE AUDITORIA EXEMPLO
INSERT INTO log_auditoria (id_usuario, acao, entidade, id_entidade, detalhes) VALUES 
(1, 'LOGIN', 'usuario', 1, 'Login realizado com sucesso no sistema'),
(3, 'INSERT', 'ocorrencia', 1, 'Nova ocorrência de incêndio registrada na Rua da Aurora'),
(5, 'UPDATE', 'viatura', 2, 'Status da viatura LOBO-AT02 alterado para Em Missão'),
(2, 'CREATE', 'bombeiro', 15, 'Novo bombeiro cadastrado no sistema'),
(4, 'LOGIN', 'usuario', 4, 'Acesso do comandante da zona norte'),
(6, 'UPDATE', 'ocorrencia', 3, 'Ocorrência de resgate atualizada no Recife Antigo');

-- =============================================
-- MENSAGEM FINAL - RECIFE
-- =============================================
SELECT '🐺 DADOS DE TESTE INSERIDOS COM SUCESSO!' as Status;
SELECT '📍 BASEADO EM ENDEREÇOS REAIS DO RECIFE' as Localizacao;
SELECT '🔐 SENHAS SIMPLES: 12345678, 87654321, 11111111, etc.' as Seguranca;
SELECT '📊 RESUMO:' as Info;
SELECT '16 Quartéis | 20 Bombeiros | 17 Viaturas' as Dados;
SELECT '9 Usuários | 7 Ocorrências | 6 Logs' as Dados;
SELECT '✅ Sistema Lobo Recife pronto para testes!' as Finalizado;

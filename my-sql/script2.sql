use projeto_m3;
CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY,
  `email` varchar(255),
  `senha` varchar(255),
  `apelido` varchar(255),
  `cartao_id` int
);

CREATE TABLE `cartoes` (
  `id` int PRIMARY KEY,
  `numero_cartao` varchar(255),
  `vencimento` varchar(255)
);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`cartao_id`) REFERENCES `cartoes` (`id`);

INSERT INTO cartoes
    (`id`, `numero_cartao`, `vencimento`)
VALUES
    (1, '50208052671179410', '2023-11-30 07:14:32'),
    (2, '3529-0125-1870-6711', '2025-05-13 10:01:16'),
    (3, '4620-0960-1375-4078', '2025-10-13 19:12:12'),
    (4, '5361-6862-3699-0485', '2021-04-11 12:20:29'),
    (5, '3529-9987-9580-9475', '2025-10-20 08:39:07'),
    (6, '3528-0658-1738-3058', '2022-02-05 07:09:48'),
    (7, '6011-6193-6297-5749', '2023-10-04 17:55:18'),
    (8, '3725-104418-99430', '2021-03-02 20:39:48'),
    (9, '5324-6725-5680-9941', '2023-12-07 06:38:05'),
    (10, '4527-5893-8312-4514', '2023-10-18 11:02:17'),
    (11, '5018-2830-8850-7190', '2021-11-10 23:23:19'),
    (12, '6771-8986-5842-2301', '2025-02-04 21:23:10'),
    (13, '5474-2490-2596-9675', '2025-09-10 10:36:22'),
    (14, '6767-2180-3212-2020-65', '2025-12-26 18:38:39'),
    (15, '5893-5464-3520-9019', '2021-12-12 13:50:18'),
    (16, '4865-6850-4448-1069', '2025-02-24 13:06:04'),
    (17, '5595-6840-9863-9773', '2021-04-14 21:25:33'),
    (18, '6553-3775-9575-8893', '2023-07-27 12:55:04'),
    (19, '3719-470209-08449', '2025-12-01 08:04:20'),
    (20, '3543-6667-0527-5275', '2021-12-14 13:43:12'),
    (21, '6518-8441-2127-7961', '2023-07-14 10:57:23'),
    (22, '6759-0370-8644-3579', '2024-03-18 19:01:08'),
    (23, '6011-5054-1817-5192', '2026-01-05 22:06:52'),
    (24, '3461-399938-87949', '2022-03-24 09:12:24'),
    (25, '3789-115515-56725', '2025-11-12 19:51:11'),
    (26, '3529-6044-9824-6704', '2023-10-08 22:51:31'),
    (27, '5417-0509-0644-0804', '2022-05-27 11:43:29'),
    (28, '5444-7540-7754-8833', '2025-01-16 04:31:59'),
    (29, '3606-966698-1708', '2021-07-20 08:48:36'),
    (30, '6759279357203811', '2024-12-22 07:30:59'),
    (31, '6771-8967-8656-6839', '2022-12-11 19:17:27'),
    (32, '3479-483259-27741', '2021-09-06 22:12:37'),
    (33, '6304027813929560422', '2022-12-17 07:07:27'),
    (34, '6767-9001-8727-8798', '2025-08-02 16:26:44'),
    (35, '4269-2218-8006-3300', '2023-12-05 12:16:14'),
    (36, '6767-5820-0074-8009-97', '2022-11-09 16:35:27'),
    (37, '6767-2005-8782-1319', '2022-12-22 19:05:30'),
    (38, '6759-2914-7388-0709', '2026-01-05 06:33:54'),
    (39, '3548-0761-0309-0897', '2022-12-30 21:59:15'),
    (40, '6706631891491385016', '2025-03-13 07:28:39')
;

INSERT INTO usuarios
    (`id`, `email`, `senha`, `apelido`, `cartao_id`)
VALUES
    (1, 'rosinete.ramos@example.com', 'screwyou', 'smallostrich676', 1),
    (2, 'ivanoel.souza@example.com', 'tomato', 'sadbird413', 2),
    (3, 'romilda.silveira@example.com', 'batman', 'beautifuldog492', 3),
    (4, 'alcindo.nunes@example.com', 'respect', 'brownduck417', 4),
    (5, 'arlete.caldeira@example.com', 'jets', 'angryduck508', 5),
    (6, 'fausto.viana@example.com', 'real', 'angryrabbit652', 6),
    (7, 'adeci.nogueira@example.com', '1313', 'blackladybug794', 7),
    (8, 'dalvania.dacosta@example.com', 'ling', 'ticklishmouse831', 8),
    (9, 'evaristo.sales@example.com', 'celine', 'blackpanda995', 9),
    (10, 'pedrino.fogaca@example.com', 'puppies', 'happywolf768', 10),
    (11, 'teliano.gomes@example.com', 'magic32', 'orangefish948', 11),
    (12, 'estevao.vieira@example.com', 'delta', 'happylion675', 12),
    (13, 'luise.martins@example.com', 'butter', 'ticklishswan817', 13),
    (14, 'luize.carvalho@example.com', 'cosmo', 'bigmouse466', 14),
    (15, 'franciele.silveira@example.com', 'zeus', 'organiccat464', 15),
    (16, 'rosenei.rocha@example.com', 'zhui', 'blackkoala698', 16),
    (17, 'leonel.porto@example.com', 'babycake', 'purplefrog574', 17),
    (18, 'feliz.aragao@example.com', 'sterling', 'ticklishtiger268', 18),
    (19, 'mircia.sales@example.com', 'bessie', 'greencat168', 19),
    (20, 'firmo.monteiro@example.com', 'rodney', 'organictiger143', 20),
    (21, 'rose.fogaca@example.com', 'tardis', 'biglion172', 21),
    (22, 'heber.damota@example.com', 'liverpoo', 'lazybear664', 22),
    (23, 'nembrode.rodrigues@example.com', 'scrapper', 'beautifulsnake567', 23),
    (24, 'taimara.nascimento@example.com', 'carmex2', 'bigswan180', 24),
    (25, 'rivelino.pires@example.com', 'renee', 'lazyzebra324', 25),
    (26, 'ascenso.viana@example.com', 'dalton', 'yellowelephant178', 26),
    (27, 'aldonio.dacosta@example.com', 'volleyba', 'goldenwolf314', 27),
    (28, 'almiro.monteiro@example.com', 'head', 'ticklishgorilla391', 28),
    (29, 'cassiano.monteiro@example.com', 'thumper', 'angrylion480', 29),
    (30, 'gladimira.duarte@example.com', 'desert', 'smallostrich399', 30),
    (31, 'barbara.rocha@example.com', 'derf', 'angrybird549', 31),
    (32, 'marisa.rezende@example.com', 'sebring', 'orangebutterfly328', 32),
    (33, 'jadir.aragao@example.com', 'blanco', 'sadgorilla824', 33),
    (34, 'abraao.daconceicao@example.com', 'hawkeye', 'yellowgorilla298', 34),
    (35, 'nilde.carvalho@example.com', 'january', 'yellowbutterfly332', 35),
    (36, 'cleia.jesus@example.com', 'zhuan', 'goldengorilla581', 36);
    
    select * from cartoes;
    select * from usuarios;
    
    delete from usuarios where id = 1;
    delete from usuarios where id = 2;
    delete from usuarios where id = 3;
    delete from usuarios where id = 4;
    delete from usuarios where id = 5;
    delete from usuarios where id = 6;
    delete from usuarios where id = 7;
    delete from usuarios where id = 8;
    delete from usuarios where id = 9;
    delete from usuarios where id = 10;
    
    insert into usuarios values (1, 'rosinete.ramos@example.com', 'screwyou', 'smallostrich676', 1),
    (2, 'ivanoel.souza@example.com', 'tomato', 'sadbird413', 2),
    (3, 'romilda.silveira@example.com', 'batman', 'beautifuldog492', 3),
    (4, 'alcindo.nunes@example.com', 'respect', 'brownduck417', 4),
    (5, 'arlete.caldeira@example.com', 'jets', 'angryduck508', 5),
    (6, 'fausto.viana@example.com', 'real', 'angryrabbit652', 6),
    (7, 'adeci.nogueira@example.com', '1313', 'blackladybug794', 7),
    (8, 'dalvania.dacosta@example.com', 'ling', 'ticklishmouse831', 8),
    (9, 'evaristo.sales@example.com', 'celine', 'blackpanda995', 9),
    (10, 'pedrino.fogaca@example.com', 'puppies', 'happywolf768', 10);
    
    delete from usuarios where id between 1 and 10;
    
    select numero_cartao as NumeroCartao,
    vencimento as venc 
    from cartoes
    where not numero_cartao like "6%";
    ##exibe cartoes que não comecem com algo parecido com "6"
    
    
    update usuarios set email = 'email@invalido.com.br' , apelido = 'desativado' , senha = 'desativado' where id between 1 and 10;
    
    select email from usuarios where email  not like  'email@inv%';
    
    
    
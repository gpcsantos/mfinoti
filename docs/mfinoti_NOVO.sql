--
-- Estrutura da tabela `tb_acesso`
--

CREATE TABLE `tb_log_acesso` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `fk_usuario` int(11) NOT NULL,
  `dataHora` datetime DEFAULT NULL,
  `IP` varchar(16)  DEFAULT NULL,
  `navegador` varchar(300)  DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


CREATE TABLE `tb_acesso` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `fk_usuario` int(11) NOT NULL,
  `dataHora` datetime DEFAULT NULL,
  `IP` varchar(16)  DEFAULT NULL,
  `navegador` varchar(300)  DEFAULT NULL,
  `token` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


-- Estrutura da tabela `tb_menu`
--
CREATE TABLE `tb_menu` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `fk_pagina` int(11) NOT NULL,
  `label` varchar(50)  DEFAULT NULL,
  `apresentacao` smallint(6) NOT NULL,
  `habilita` tinyint(1) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


--
-- Estrutura da tabela `tb_perfil`
--
CREATE TABLE `tb_perfil` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `perfil` varchar(50)  DEFAULT NULL,
  `abreviado` varchar(10)  DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pagina`
--
CREATE TABLE `tb_pagina` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `arquivo` varchar(60)  DEFAULT NULL,
  `descricao` varchar(300)  DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Estrutura da tabela `tb_submenu`
--
CREATE TABLE `tb_submenu` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `label` varchar(40)  DEFAULT NULL,
  `apresentacao` smallint(6) DEFAULT NULL,
  `habilita` tinyint(1) DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_pagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Estrutura da tabela `tb_usuario`
--
CREATE TABLE `tb_usuario` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `login` varchar(30)  DEFAULT NULL,
  `senha` varchar(100)  DEFAULT NULL,
  `senha_temp` varchar(1)  DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL,
  `fk_colaborador` int(11) DEFAULT NULL,
  `fk_nivelAcesso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `tb_colaborador` (
  `pk_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50)  DEFAULT NULL,
  `telefone` varchar(16)  DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE tb_banco(
	pk_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	banco VARCHAR(30),
	num SMALLINT
);

CREATE TABLE rl_pagina_perfil(
	fk_perfil int,
	fk_pagina int,
	FOREIGN KEY (fk_perfil) REFERENCES tb_perfil(pk_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (fk_pagina) REFERENCES tb_pagina(pk_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


ALTER TABLE tb_submenu
ADD CONSTRAINT FOREIGN KEY (fk_menu) REFERENCES tb_menu(pk_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE tb_submenu
ADD CONSTRAINT FOREIGN KEY (fk_pagina) REFERENCES tb_pagina(pk_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE tb_usuario
ADD CONSTRAINT FOREIGN KEY (fk_perfil) REFERENCES tb_perfil(pk_id) ON DELETE RESTRICT ON UPDATE CASCADE;

## validação de acesso à página
SELECT pg.arquivo
FROM tb_usuario AS u
INNER JOIN tb_perfil AS p ON p.pk_id=u.fk_perfil
INNER JOIN rl_pagina_perfil AS rl ON p.pk_id=rl.fk_perfil
INNER JOIN tb_pagina AS pg ON rl.fk_pagina=pg.pk_id
WHERE (u.c = pg.c OR u.r = pg.r OR u.u = pg.u OR u.d = pg.d)
AND pg.pk_id=5 AND u.pk_id=1

## menu
SELECT m.label
FROM tb_usuario AS u
INNER JOIN tb_perfil AS p ON p.pk_id=u.fk_perfil
INNER JOIN rl_pagina_perfil AS rl ON p.pk_id=rl.fk_perfil
INNER JOIN tb_pagina AS pg ON rl.fk_pagina=pg.pk_id
INNER JOIN tb_submenu AS sub ON pg.pk_id=sub.fk_pagina
INNER JOIN tb_menu AS m ON sub.fk_menu=m.pk_id
WHERE u.pk_id=1

## submneu
SELECT pg.arquivo, sub.label
FROM tb_usuario AS u
INNER JOIN tb_perfil AS p ON p.pk_id=u.fk_perfil
INNER JOIN rl_pagina_perfil AS rl ON p.pk_id=rl.fk_perfil
INNER JOIN tb_pagina AS pg ON rl.fk_pagina=pg.pk_id
INNER JOIN tb_submenu AS sub ON pg.pk_id=sub.fk_pagina
WHERE u.pk_id=1



#89AA04
#5e7503

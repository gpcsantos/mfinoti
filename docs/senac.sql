-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Ago-2020 às 16:00
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `senac`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_nivelacessoassunto`
--

CREATE TABLE `rl_nivelacessoassunto` (
  `PK_ID` int(11) NOT NULL,
  `FK_nivelacesso` int(11) NOT NULL,
  `FK_assunto` int(11) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_paginaassunto`
--

CREATE TABLE `rl_paginaassunto` (
  `PK_ID` int(11) NOT NULL,
  `FK_pagina` int(11) DEFAULT NULL,
  `FK_assunto` int(11) DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_questionarioevento`
--

CREATE TABLE `rl_questionarioevento` (
  `PK_ID` int(11) NOT NULL,
  `FK_questionario` int(11) NOT NULL,
  `FK_evento` int(11) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_respondente_pergunta_resposta`
--

CREATE TABLE `rl_respondente_pergunta_resposta` (
  `PK_ID` int(11) NOT NULL,
  `FK_respondente` int(11) NOT NULL,
  `FK_pergunta` int(11) NOT NULL,
  `FK_resposta` int(11) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_acesso`
--

CREATE TABLE `tb_acesso` (
  `PK_ID` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `dataHora` datetime DEFAULT NULL,
  `IP` varchar(16) COLLATE latin1_bin DEFAULT NULL,
  `navegador` varchar(300) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_area`
--

CREATE TABLE `tb_area` (
  `PK_ID` int(11) NOT NULL,
  `area` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_assunto`
--

CREATE TABLE `tb_assunto` (
  `PK_ID` int(11) NOT NULL,
  `label` varchar(30) COLLATE latin1_bin DEFAULT NULL,
  `descricao` varchar(300) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cargofuncao`
--

CREATE TABLE `tb_cargofuncao` (
  `PK_ID` int(11) NOT NULL,
  `cargoFuncao` varchar(50) COLLATE latin1_bin NOT NULL,
  `avalia` tinyint(1) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso`
--

CREATE TABLE `tb_curso` (
  `PK_ID` int(11) NOT NULL,
  `FK_area` int(11) NOT NULL,
  `curso` varchar(80) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estado`
--

CREATE TABLE `tb_estado` (
  `PK_ID` int(11) NOT NULL,
  `estado` varchar(40) COLLATE latin1_bin NOT NULL,
  `UF` varchar(2) COLLATE latin1_bin NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estadocivil`
--

CREATE TABLE `tb_estadocivil` (
  `PK_ID` int(11) NOT NULL,
  `estadoCivil` varchar(40) COLLATE latin1_bin NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_evento`
--

CREATE TABLE `tb_evento` (
  `PK_ID` int(11) NOT NULL,
  `FK_funcionario` int(11) NOT NULL,
  `FK_modulo` int(11) NOT NULL,
  `evento` varchar(15) COLLATE latin1_bin DEFAULT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `alunoMax` smallint(6) DEFAULT NULL,
  `alunoResposta` smallint(6) DEFAULT NULL,
  `habilita` tinyint(1) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `PK_ID` int(11) NOT NULL,
  `FK_estado` int(11) NOT NULL,
  `FK_estadoCivil` int(11) NOT NULL,
  `FK_cargoFuncao` int(11) NOT NULL,
  `chapa` varchar(15) COLLATE latin1_bin NOT NULL,
  `nome` varchar(100) COLLATE latin1_bin NOT NULL,
  `nomeCurto` varchar(50) COLLATE latin1_bin NOT NULL,
  `nascimento` date NOT NULL,
  `ddd1` varchar(2) COLLATE latin1_bin NOT NULL,
  `fone1` varchar(10) COLLATE latin1_bin NOT NULL,
  `ddd2` varchar(2) COLLATE latin1_bin NOT NULL,
  `fone2` varchar(10) COLLATE latin1_bin NOT NULL,
  `email` varchar(100) COLLATE latin1_bin NOT NULL,
  `endereco` varchar(100) COLLATE latin1_bin NOT NULL,
  `numero` varchar(10) COLLATE latin1_bin NOT NULL,
  `complemento` varchar(50) COLLATE latin1_bin NOT NULL,
  `bairro` varchar(80) COLLATE latin1_bin NOT NULL,
  `cidade` varchar(60) COLLATE latin1_bin NOT NULL,
  `habilita` tinyint(1) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grupo_perguntas`
--

CREATE TABLE `tb_grupo_perguntas` (
  `PK_ID` int(11) NOT NULL,
  `grupo` varchar(80) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_menu`
--

CREATE TABLE `tb_menu` (
  `PK_ID` int(11) NOT NULL,
  `FK_pagina` int(11) NOT NULL,
  `label` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `apresentacao` smallint(6) NOT NULL,
  `habilita` tinyint(1) NOT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modulo`
--

CREATE TABLE `tb_modulo` (
  `PK_ID` int(11) NOT NULL,
  `FK_curso` int(11) NOT NULL,
  `modulo` varchar(80) COLLATE latin1_bin DEFAULT NULL,
  `cargaHoraria` smallint(6) DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nivelacesso`
--

CREATE TABLE `tb_nivelacesso` (
  `PK_ID` int(11) NOT NULL,
  `nivelAcesso` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `abreviado` varchar(10) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pagina`
--

CREATE TABLE `tb_pagina` (
  `PK_ID` int(11) NOT NULL,
  `arquivo` varchar(60) COLLATE latin1_bin DEFAULT NULL,
  `descricao` varchar(300) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pergunta`
--

CREATE TABLE `tb_pergunta` (
  `PK_ID` int(11) NOT NULL,
  `FK_grupo_pergunta` int(11) NOT NULL,
  `pergunta` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questionario`
--

CREATE TABLE `tb_questionario` (
  `PK_ID` int(11) NOT NULL,
  `nome` varchar(30) COLLATE latin1_bin DEFAULT NULL,
  `titulo` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `descricao` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `habilita` tinyint(1) DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_respondente`
--

CREATE TABLE `tb_respondente` (
  `PK_ID` int(11) NOT NULL,
  `FK_questionarioevento` int(11) NOT NULL,
  `ip` varchar(16) COLLATE latin1_bin DEFAULT NULL,
  `indice` int(11) NOT NULL,
  `iniciado` tinyint(1) DEFAULT NULL,
  `finalizado` tinyint(1) DEFAULT NULL,
  `atualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='Gera um índice para identificação das respostas dos alunos';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_respondente_complemento`
--

CREATE TABLE `tb_respondente_complemento` (
  `PK_ID` int(11) NOT NULL,
  `FK_respondente` int(11) NOT NULL,
  `Nome` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `sim_nao` char(3) COLLATE latin1_bin DEFAULT NULL,
  `descricao_sim_nao` blob DEFAULT NULL,
  `sugestao` blob DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_resposta`
--

CREATE TABLE `tb_resposta` (
  `PK_ID` int(11) NOT NULL,
  `resposta` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_submenu`
--

CREATE TABLE `tb_submenu` (
  `PK_ID` int(11) NOT NULL,
  `FK_menu` int(11) NOT NULL,
  `FK_pagina` int(11) NOT NULL,
  `label` varchar(40) COLLATE latin1_bin DEFAULT NULL,
  `apresentacao` smallint(6) DEFAULT NULL,
  `habilita` tinyint(1) DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidade`
--

CREATE TABLE `tb_unidade` (
  `PK_ID` int(11) NOT NULL,
  `nome` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `sigla` varchar(10) COLLATE latin1_bin DEFAULT NULL,
  `habilita` tinyint(1) DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `PK_ID` int(11) NOT NULL,
  `FK_funcionario` int(11) DEFAULT NULL,
  `FK_nivelAcesso` int(11) DEFAULT NULL,
  `login` varchar(30) COLLATE latin1_bin DEFAULT NULL,
  `senha` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `rl_nivelacessoassunto`
--
ALTER TABLE `rl_nivelacessoassunto`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `rl_paginaassunto`
--
ALTER TABLE `rl_paginaassunto`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `rl_questionarioevento`
--
ALTER TABLE `rl_questionarioevento`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `rl_respondente_pergunta_resposta`
--
ALTER TABLE `rl_respondente_pergunta_resposta`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_acesso`
--
ALTER TABLE `tb_acesso`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_area`
--
ALTER TABLE `tb_area`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_assunto`
--
ALTER TABLE `tb_assunto`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_cargofuncao`
--
ALTER TABLE `tb_cargofuncao`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_estadocivil`
--
ALTER TABLE `tb_estadocivil`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_evento`
--
ALTER TABLE `tb_evento`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`PK_ID`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `PK_ID` (`PK_ID`);

--
-- Índices para tabela `tb_grupo_perguntas`
--
ALTER TABLE `tb_grupo_perguntas`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_modulo`
--
ALTER TABLE `tb_modulo`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_nivelacesso`
--
ALTER TABLE `tb_nivelacesso`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_pagina`
--
ALTER TABLE `tb_pagina`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_pergunta`
--
ALTER TABLE `tb_pergunta`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_questionario`
--
ALTER TABLE `tb_questionario`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_respondente`
--
ALTER TABLE `tb_respondente`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_respondente_complemento`
--
ALTER TABLE `tb_respondente_complemento`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_resposta`
--
ALTER TABLE `tb_resposta`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_submenu`
--
ALTER TABLE `tb_submenu`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_unidade`
--
ALTER TABLE `tb_unidade`
  ADD PRIMARY KEY (`PK_ID`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`PK_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `rl_nivelacessoassunto`
--
ALTER TABLE `rl_nivelacessoassunto`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rl_paginaassunto`
--
ALTER TABLE `rl_paginaassunto`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rl_questionarioevento`
--
ALTER TABLE `rl_questionarioevento`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rl_respondente_pergunta_resposta`
--
ALTER TABLE `rl_respondente_pergunta_resposta`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_acesso`
--
ALTER TABLE `tb_acesso`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_area`
--
ALTER TABLE `tb_area`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_assunto`
--
ALTER TABLE `tb_assunto`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cargofuncao`
--
ALTER TABLE `tb_cargofuncao`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estadocivil`
--
ALTER TABLE `tb_estadocivil`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_evento`
--
ALTER TABLE `tb_evento`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_grupo_perguntas`
--
ALTER TABLE `tb_grupo_perguntas`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_modulo`
--
ALTER TABLE `tb_modulo`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_nivelacesso`
--
ALTER TABLE `tb_nivelacesso`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pagina`
--
ALTER TABLE `tb_pagina`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pergunta`
--
ALTER TABLE `tb_pergunta`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_questionario`
--
ALTER TABLE `tb_questionario`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_respondente`
--
ALTER TABLE `tb_respondente`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_respondente_complemento`
--
ALTER TABLE `tb_respondente_complemento`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_resposta`
--
ALTER TABLE `tb_resposta`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_submenu`
--
ALTER TABLE `tb_submenu`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_unidade`
--
ALTER TABLE `tb_unidade`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `PK_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jul-2016 às 00:10
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemasae`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bolsa`
--

CREATE TABLE `bolsa` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `carencia` varchar(45) NOT NULL,
  `edital_codEdital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bolsa`
--

INSERT INTO `bolsa` (`id`, `nome`, `tipo`, `carencia`, `edital_codEdital`) VALUES
(1, 'Transporte Locado', 'tipo2', 'Teste 2', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bolsistacontemplado`
--

CREATE TABLE `bolsistacontemplado` (
  `id` int(11) NOT NULL,
  `edital_codEdital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bolsistacontemplado`
--

INSERT INTO `bolsistacontemplado` (`id`, `edital_codEdital`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `idcandidatos` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `curso_idCurso` int(255) NOT NULL,
  `formulariosocioeconomico_id` int(11) NOT NULL,
  `bolsistacontemplado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(255) NOT NULL,
  `turno` varchar(45) NOT NULL,
  `curso` varchar(45) NOT NULL,
  `totalPeriodos` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`idCurso`, `turno`, `curso`, `totalPeriodos`) VALUES
(1, 'Noite', 'InformÃ¡tica', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `edital`
--

CREATE TABLE `edital` (
  `codEdital` int(11) NOT NULL,
  `prazo` int(45) NOT NULL,
  `Data` int(45) NOT NULL,
  `numero` int(45) NOT NULL,
  `publicacao` varchar(255) NOT NULL,
  `tipoBolsa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `edital`
--

INSERT INTO `edital` (`codEdital`, `prazo`, `Data`, `numero`, `publicacao`, `tipoBolsa`) VALUES
(1, 6, 20, 23, 'dsalkdsaj', 'Ensino'),
(2, 16, 33, 36, 'dsalkdsaj', 'Pesquisa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formulariosocioeconomico`
--

CREATE TABLE `formulariosocioeconomico` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nascimento` int(11) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `rg` int(8) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `complemento` varchar(200) NOT NULL,
  `bairro` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `numero` int(10) NOT NULL,
  `cep` int(10) NOT NULL,
  `rua1` varchar(200) NOT NULL,
  `complemento1` varchar(200) NOT NULL,
  `bairro1` varchar(200) NOT NULL,
  `estado1` varchar(200) NOT NULL,
  `cidade1` varchar(200) NOT NULL,
  `numero1` int(10) NOT NULL,
  `cep1` int(10) NOT NULL,
  `telefone1` int(15) NOT NULL,
  `celular1` int(15) NOT NULL,
  `curso` varchar(200) NOT NULL,
  `ensino` varchar(200) NOT NULL,
  `turno` varchar(200) NOT NULL,
  `periodo` int(10) NOT NULL,
  `matricula` int(10) NOT NULL,
  `anoT` int(10) NOT NULL,
  `anoI` int(10) NOT NULL,
  `questao1` varchar(200) DEFAULT NULL,
  `questao2` varchar(200) DEFAULT NULL,
  `questao3` varchar(200) DEFAULT NULL,
  `questao4` varchar(200) DEFAULT NULL,
  `questao5` varchar(200) DEFAULT NULL,
  `questao6` varchar(200) DEFAULT NULL,
  `questao7` varchar(200) DEFAULT NULL,
  `questao8` varchar(200) DEFAULT NULL,
  `questao9` varchar(200) DEFAULT NULL,
  `questao10` varchar(200) DEFAULT NULL,
  `questao11` varchar(200) DEFAULT NULL,
  `questao11a` varchar(200) DEFAULT NULL,
  `questao11b` varchar(200) DEFAULT NULL,
  `questao11c` varchar(200) DEFAULT NULL,
  `questao11d` varchar(200) DEFAULT NULL,
  `questao12` varchar(200) DEFAULT NULL,
  `questao13` varchar(200) DEFAULT NULL,
  `questao14` varchar(200) DEFAULT NULL,
  `questao15` varchar(200) DEFAULT NULL,
  `questao16a` int(10) NOT NULL,
  `questao16b` int(10) NOT NULL,
  `questao16c` int(10) NOT NULL,
  `questao16d` int(10) NOT NULL,
  `questao16e` int(10) NOT NULL,
  `questao16f` int(10) NOT NULL,
  `questao16g` int(10) NOT NULL,
  `questao16h` int(10) NOT NULL,
  `questao16i` int(10) NOT NULL,
  `questao16j` int(10) NOT NULL,
  `questao16k` int(10) NOT NULL,
  `questao17a` float NOT NULL,
  `questao17b` float NOT NULL,
  `questao17c` float NOT NULL,
  `questao17d` float NOT NULL,
  `questao17e` float NOT NULL,
  `questao17f` float NOT NULL,
  `questao17g` float NOT NULL,
  `questao17h` float NOT NULL,
  `questao17i` float NOT NULL,
  `questao17j` float NOT NULL,
  `questao17k` float NOT NULL,
  `questao17l` float NOT NULL,
  `questao18` float NOT NULL,
  `questao18a` float NOT NULL,
  `questao18b` float NOT NULL,
  `questao18c` float NOT NULL,
  `questao18d` float NOT NULL,
  `questao18e` float NOT NULL,
  `questao19` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `formulariosocioeconomico`
--

INSERT INTO `formulariosocioeconomico` (`id`, `nome`, `nascimento`, `sexo`, `rg`, `cpf`, `telefone`, `celular`, `email`, `rua`, `complemento`, `bairro`, `estado`, `cidade`, `numero`, `cep`, `rua1`, `complemento1`, `bairro1`, `estado1`, `cidade1`, `numero1`, `cep1`, `telefone1`, `celular1`, `curso`, `ensino`, `turno`, `periodo`, `matricula`, `anoT`, `anoI`, `questao1`, `questao2`, `questao3`, `questao4`, `questao5`, `questao6`, `questao7`, `questao8`, `questao9`, `questao10`, `questao11`, `questao11a`, `questao11b`, `questao11c`, `questao11d`, `questao12`, `questao13`, `questao14`, `questao15`, `questao16a`, `questao16b`, `questao16c`, `questao16d`, `questao16e`, `questao16f`, `questao16g`, `questao16h`, `questao16i`, `questao16j`, `questao16k`, `questao17a`, `questao17b`, `questao17c`, `questao17d`, `questao17e`, `questao17f`, `questao17g`, `questao17h`, `questao17i`, `questao17j`, `questao17k`, `questao17l`, `questao18`, `questao18a`, `questao18b`, `questao18c`, `questao18d`, `questao18e`, `questao19`) VALUES
(1, 'LuÃ?Â?Ã?Â­s RogÃ?Â?Ã?Â©rio Ventura Martins Filho', 14, 'Masculino', 19, 22, 19, 33, 'kdsaldjsak', 'sdakjjdasklj', 'djalsl', 'jklsdaadjsl', 'ac', 'Juiz de Fora', 16, 15, 'kdsalÃ?Â?Ã?Â§dslk', 'dsajladskj', 'dsakldsaj', 'ac', 'dsaldsakÃ?Â?Ã?Â§l', 12, 9, 22, 22, 'BSI', 'Superior', 'noite', 8, 33, 18, 16, 'nao', 'manutencao', 'carona', 'parte em particular, depois em publica', 'parte em publica, depois em particular', 'sim. EstÃ¡gio', 'sim', 'Sou sustentado pelos meus pais', 'Em casa de familiares', 'outros membros do grupo familiar', NULL, NULL, NULL, NULL, NULL, 'vila ou aglomerado', 'emprestado ou cedido', 'residÃªncia com acabamento', 'Sim', 2, 5, 2, 0, 2, 0, 3, 0, 0, 0, 0, 13, 8, 16, 36, 18, 21, 13, 19, 17, 12, 13, 11, 9, 11, 14, 12, 12, 16, 'dsadadsadas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `setor` varchar(45) DEFAULT NULL,
  `gerente` varchar(50) DEFAULT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idFuncionario`, `setor`, `gerente`, `pessoa_id`) VALUES
(1, 'ewwqeqweq', 'fsfsdewq', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupoacesso`
--

CREATE TABLE `grupoacesso` (
  `idgrupo` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `nascimento` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(60) DEFAULT NULL,
  `confirmasenha` varchar(45) DEFAULT NULL,
  `grupoacesso` int(11) DEFAULT NULL,
  `DTYPE` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `nascimento`, `logradouro`, `cidade`, `estado`, `matricula`, `login`, `senha`, `confirmasenha`, `grupoacesso`, `DTYPE`) VALUES
(1, 'Fofoca', '23', 'ytrytr', 'iuiuyi', 'oiutyre', '2', 'luis', '1233', '1233', NULL, 'Funcionario');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bolsa`
--
ALTER TABLE `bolsa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bolsa_edital1_idx` (`edital_codEdital`);

--
-- Indexes for table `bolsistacontemplado`
--
ALTER TABLE `bolsistacontemplado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bolsistacontemplado_edital1_idx` (`edital_codEdital`);

--
-- Indexes for table `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`idcandidatos`),
  ADD KEY `fk_candidato_pessoa_idx` (`pessoa_id`),
  ADD KEY `fk_candidato_curso1_idx` (`curso_idCurso`),
  ADD KEY `fk_candidato_formulariosocioeconomico1_idx` (`formulariosocioeconomico_id`),
  ADD KEY `fk_candidato_bolsistacontemplado1_idx` (`bolsistacontemplado_id`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indexes for table `edital`
--
ALTER TABLE `edital`
  ADD PRIMARY KEY (`codEdital`);

--
-- Indexes for table `formulariosocioeconomico`
--
ALTER TABLE `formulariosocioeconomico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `rg_2` (`rg`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`),
  ADD KEY `fk_funcionario_pessoa1_idx` (`pessoa_id`);

--
-- Indexes for table `grupoacesso`
--
ALTER TABLE `grupoacesso`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `fk_grupoacesso_pessoa1_idx` (`pessoa_id`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`nascimento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bolsa`
--
ALTER TABLE `bolsa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `candidato`
--
ALTER TABLE `candidato`
  MODIFY `idcandidatos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `bolsa`
--
ALTER TABLE `bolsa`
  ADD CONSTRAINT `fk_bolsa_edital1` FOREIGN KEY (`edital_codEdital`) REFERENCES `edital` (`codEdital`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `bolsistacontemplado`
--
ALTER TABLE `bolsistacontemplado`
  ADD CONSTRAINT `fk_bolsistacontemplado_edital1` FOREIGN KEY (`edital_codEdital`) REFERENCES `edital` (`codEdital`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `fk_candidato_bolsistacontemplado1` FOREIGN KEY (`bolsistacontemplado_id`) REFERENCES `bolsistacontemplado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidato_curso1` FOREIGN KEY (`curso_idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidato_formulariosocioeconomico1` FOREIGN KEY (`formulariosocioeconomico_id`) REFERENCES `formulariosocioeconomico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidato_pessoa` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `grupoacesso`
--
ALTER TABLE `grupoacesso`
  ADD CONSTRAINT `fk_grupoacesso_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

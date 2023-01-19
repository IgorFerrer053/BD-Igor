-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/01/2023 às 12:44
-- Versão do servidor: 10.4.8-MariaDB
-- Versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cursos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `Cod_Aluno` int(11) NOT NULL,
  `Matricula` int(11) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Endereco` varchar(150) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`Cod_Aluno`, `Matricula`, `Nome`, `Endereco`, `Tel`) VALUES
(1, 2100, 'Floriswaldo Menezes', 'Rua B lote 34', 20215423),
(2, 2101, 'Marivaldo Lins', 'Rua A lote 210', 25452132),
(3, 2102, 'Godofredo Marios', 'Rua C lote 540', 33339999);

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `Cod_Curso` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`Cod_Curso`, `Nome`, `Tipo`) VALUES
(1, 'JavaScript', 'Programação'),
(2, 'C#', 'Microsoft'),
(3, 'JAVAweb', 'JAVA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `Cod_disc` int(11) NOT NULL,
  `Ementa` varchar(150) DEFAULT NULL,
  `Cont_prog` varchar(300) DEFAULT NULL,
  `Cod_Prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`Cod_disc`, `Ementa`, `Cont_prog`, `Cod_Prof`) VALUES
(1, 'Criação de programação para WEB', 'Códigos, Registros, BD', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `Cod_prof` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `Especialidade` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`Cod_prof`, `Nome`, `sexo`, `Especialidade`) VALUES
(1, 'Astrogildo Franca', 'M', 'Técnologo ADM'),
(2, 'Carlos Lins', 'M', 'Ciência da Computação'),
(3, 'Célia Abrantes', 'F', 'Engenharia Mecânica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `Cod_Turma` int(11) NOT NULL,
  `Cod_Disc` int(11) DEFAULT NULL,
  `Cod_Curso` int(11) DEFAULT NULL,
  `Data_Inicio` date DEFAULT NULL,
  `Cod_Aluno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`Cod_Aluno`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`Cod_Curso`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`Cod_disc`),
  ADD KEY `Cod_Prof` (`Cod_Prof`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Cod_prof`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`Cod_Turma`),
  ADD KEY `Cod_Disc` (`Cod_Disc`),
  ADD KEY `Cod_Curso` (`Cod_Curso`),
  ADD KEY `Cod_Aluno` (`Cod_Aluno`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `Cod_Aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `Cod_Curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `Cod_disc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `Cod_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `Cod_Turma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`Cod_Prof`) REFERENCES `professor` (`Cod_prof`);

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`Cod_Disc`) REFERENCES `disciplina` (`Cod_disc`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`Cod_Aluno`) REFERENCES `aluno` (`Cod_Aluno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/02/2024 às 20:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id_transacoes` int(11) NOT NULL,
  `tipo_transacao` varchar(22) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `usuario_destinatario` int(11) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `limite` decimal(10,2) DEFAULT 500.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `cep`, `data_nascimento`, `senha`, `saldo`, `limite`) VALUES
(1, 'João Silva', '12345678901', '12345-678', '1990-01-15', 'senha123', 1000.00, 700.00),
(2, 'Maria Oliveira', '98765432101', '54321-876', '1985-05-22', 'senha456', 1500.50, 800.00),
(3, 'Carlos Santos', '11122233344', '67890-123', '1982-11-08', 'senha789', 2000.75, 1000.00),
(4, 'Pedro', '12345678978', '58065-03', '2011-01-05', '$argon2id$v=19$m=65536,t=4,p=1$RTdsbGZKb2hqU1o1bXFRTg$RaCL9F4OalKLOjpMQqTVJlJydW2/u8QeC34+MSIj9dw', 0.00, 500.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id_transacoes`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `usuario_destinatario` (`usuario_destinatario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id_transacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `transacoes_ibfk_2` FOREIGN KEY (`usuario_destinatario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

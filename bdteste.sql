-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bdteste
CREATE DATABASE IF NOT EXISTS `bdteste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bdteste`;

-- Copiando estrutura para tabela bdteste.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cidade` varchar(30) NOT NULL,
  `UF` varchar(2) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bdteste.pedidosgeral
CREATE TABLE IF NOT EXISTS `pedidosgeral` (
  `NumeroPedido` int(11) NOT NULL,
  `DiaPedido` date NOT NULL,
  `CodCliente` int(11) NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`NumeroPedido`),
  KEY `idxCodCliente` (`CodCliente`),
  CONSTRAINT `fkPedidoCliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bdteste.pedidosproduto
CREATE TABLE IF NOT EXISTS `pedidosproduto` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroPedido` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUni` decimal(10,2) NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `fkProdutoPedido_Pedido` (`NumeroPedido`),
  KEY `idxCodProdPedidos` (`CodProduto`),
  CONSTRAINT `fkProdutoPedido_Pedido` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidosgeral` (`NumeroPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bdteste.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `IdProduto` int(11) NOT NULL AUTO_INCREMENT,
  `CodProduto` int(11) NOT NULL,
  `Descricao` varchar(30) NOT NULL,
  `PrecoUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para procedure bdteste.pr_DeletarPedido
DELIMITER //
CREATE PROCEDURE `pr_DeletarPedido`(IN `IdPed` INT)
BEGIN

DELETE from pedidosproduto WHERE NumeroPedido=IdPed;
DELETE FROM pedidosgeral WHERE NumeroPedido=Idped;

END//
DELIMITER ;


--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO cliente (Codigo, Nome, Cidade, UF) VALUES
(1, 'Ana Silva', 'São Paulo', 'SP'),
(2, 'Bruno Costa', 'Rio de Janeiro', 'RJ'),
(3, 'Carla Souza', 'Belo Horizonte', 'MG'),
(4, 'Daniel Oliveira', 'Curitiba', 'PR'),
(5, 'Eduardo Lima', 'Porto Alegre', 'RS'),
(6, 'Fernanda Alves', 'Salvador', 'BA'),
(7, 'Gabriel Pereira', 'Fortaleza', 'CE'),
(8, 'Helena Rocha', 'Brasília', 'DF'),
(9, 'Igor Mendes', 'Manaus', 'AM'),
(10, 'Juliana Santos', 'Recife', 'PE'),
(11, 'Lucas Ferreira', 'Goiânia', 'GO'),
(12, 'Mariana Ribeiro', 'Belém', 'PA'),
(13, 'Nicolas Martins', 'Florianópolis', 'SC'),
(14, 'Olivia Cardoso', 'Vitória', 'ES'),
(15, 'Pedro Almeida', 'Campo Grande', 'MS'),
(16, 'Quintino Barbosa', 'Maceió', 'AL'),
(17, 'Rafaela Teixeira', 'João Pessoa', 'PB'),
(18, 'Samuel Nunes', 'Aracaju', 'SE'),
(19, 'Tatiana Lima', 'Natal', 'RN'),
(20, 'Ubirajara Fonseca', 'Teresina', 'PI'),
(21, 'Valentina Gomes', 'São Luís', 'MA'),
(22, 'Wagner Silva', 'Cuiabá', 'MT'),
(23, 'Xavier Costa', 'Palmas', 'TO'),
(24, 'Yasmin Araújo', 'Macapá', 'AP'),
(25, 'Zeca Vieira', 'Rio Branco', 'AC');

-- --------------------------------------------------------


--
-- Extraindo dados da tabela `pedidosgeral`
--
INSERT INTO pedidosgeral (NumeroPedido, DiaPedido, CodCliente, ValorTotal) VALUES
(1001, '2024-01-15', 1, 250.00),
(1002, '2024-04-16', 2, 150.00),
(1003, '2024-05-17', 3, 300.00),
(1004, '2024-06-18', 4, 450.00),
(1005, '2024-07-19', 5, 200.00),
(1006, '2024-08-20', 6, 350.00),
(1007, '2024-01-21', 7, 400.00),
(1008, '2024-02-22', 8, 500.00),
(1009, '2024-03-23', 9, 600.00),
(1010, '2024-04-24', 10, 700.00),
(1011, '2024-05-25', 11, 800.00),
(1012, '2024-06-26', 12, 900.00),
(1013, '2024-07-27', 13, 1000.00),
(1014, '2024-08-28', 14, 1100.00),
(1015, '2024-09-29', 15, 1200.00),
(1016, '2024-10-30', 16, 1300.00),
(1017, '2024-02-31', 17, 1400.00),
(1018, '2024-03-01', 18, 1500.00),
(1019, '2024-04-02', 19, 1600.00),
(1020, '2024-05-03', 20, 1700.00);
-- --------------------------------------------------------


--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO produtos (CodProduto, Descricao, PrecoUnitario) VALUES
(1, 'Bicicleta Mountain Bike', 1500.00),
(2, 'Bicicleta Speed', 2500.00),
(3, 'Bicicleta Infantil', 500.00),
(4, 'Capacete de Ciclismo', 150.00),
(5, 'Luva de Ciclismo', 50.00),
(6, 'Câmara de Ar', 20.00),
(7, 'Pneu de Bicicleta', 80.00),
(8, 'Selim Confortável', 120.00),
(9, 'Pedal Clip', 200.00),
(10, 'Farol de Bicicleta', 60.00),
(11, 'Lanterna Traseira', 40.00),
(12, 'Suporte para Caramanhola', 25.00),
(13, 'Caramanhola', 15.00),
(14, 'Bomba de Ar', 35.00),
(15, 'Kit de Ferramentas', 100.00),
(16, 'Cadeado de Segurança', 70.00),
(17, 'Ciclocomputador', 250.00),
(18, 'Rolo de Treinamento', 800.00),
(19, 'Óculos de Ciclismo', 120.00),
(20, 'Bermuda de Ciclismo', 90.00),
(21, 'Camiseta de Ciclismo', 80.00),
(22, 'Meia de Ciclismo', 20.00),
(23, 'Suporte para Celular', 50.00),
(24, 'Bagageiro', 150.00),
(25, 'Paralama', 30.00);



--
-- Extraindo dados da tabela `pedidosproduto`
--
INSERT INTO pedidosproduto (NumeroPedido, CodProduto, Quantidade, ValorUni, ValorTotal) VALUES
(1001, 1, 2, 50.00, 100.00),
(1001, 2, 1, 150.00, 150.00),
(1002, 3, 5, 20.00, 100.00),
(1002, 4, 3, 30.00, 90.00),
(1003, 5, 4, 25.00, 100.00),
(1003, 6, 2, 75.00, 150.00),
(1004, 7, 1, 200.00, 200.00),
(1004, 8, 6, 15.00, 90.00),
(1005, 9, 3, 40.00, 120.00),
(1005, 10, 2, 60.00, 120.00),
(1006, 11, 5, 10.00, 50.00),
(1006, 12, 4, 35.00, 140.00),
(1007, 13, 2, 80.00, 160.00),
(1007, 14, 1, 300.00, 300.00),
(1008, 15, 3, 45.00, 135.00),
(1008, 16, 2, 55.00, 110.00),
(1009, 17, 4, 22.50, 90.00),
(1009, 18, 5, 18.00, 90.00),
(1010, 19, 1, 500.00, 500.00),
(1010, 20, 2, 250.00, 500.00),
(1011, 21, 3, 33.33, 99.99),
(1011, 22, 4, 44.44, 177.76),
(1012, 23, 5, 55.55, 277.75),
(1012, 24, 6, 66.66, 399.96),
(1013, 25, 1, 100.00, 100.00);

COMMIT;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

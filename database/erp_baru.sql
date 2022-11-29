-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 09:41 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama`) VALUES
(1, 'Fakultas Ekonomi dan Bisnis'),
(2, 'Fakultas Teknik'),
(3, 'Fakultas Bahasa'),
(4, 'Fakultas Desain dan Komunikasi Visual'),
(5, 'Fakultas Ilmu Sosial dan Ilmu Politik');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_fakultas` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama`, `id_fakultas`) VALUES
(1, 'Akuntansi', 1),
(2, 'Manajemen', 1),
(3, 'Informatika', 2),
(4, 'Industri', 2),
(5, 'Sistem Informasi', 2),
(6, 'Elektro', 2),
(7, 'Mesin', 2),
(8, 'Sipil', 2),
(9, 'Bahasa Jepang', 3),
(10, 'Bahasa Inggris', 3),
(11, 'Desain Grafis', 4),
(12, 'Multimedia', 4),
(13, 'Perdagangan Internasional', 5),
(14, 'Perpustakaan dan Sains Informasi', 5),
(15, 'Produksi Film dan Televisi', 5);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-09-13-205845', 'App\\Database\\Migrations\\Users', 'default', 'App', 1668757386, 1),
(2, '2022-09-13-205910', 'App\\Database\\Migrations\\Moduls', 'default', 'App', 1668757386, 1),
(3, '2022-09-28-190649', 'App\\Database\\Migrations\\Roles', 'default', 'App', 1668757386, 1),
(4, '2022-10-21-082753', 'App\\Database\\Migrations\\Jurusans', 'default', 'App', 1668757386, 1),
(5, '2022-10-21-082821', 'App\\Database\\Migrations\\Fakultas', 'default', 'App', 1668757386, 1),
(7, '2022-11-09-161201', 'App\\Database\\Migrations\\Sertifikat', 'default', 'App', 1668757387, 1),
(8, '2022-11-09-161222', 'App\\Database\\Migrations\\NilaiSertifikat', 'default', 'App', 1668757387, 1),
(10, '2022-11-03-105541', 'App\\Database\\Migrations\\ShoppingCart', 'default', 'App', 1669018045, 2);

-- --------------------------------------------------------

--
-- Table structure for table `moduls`
--

CREATE TABLE `moduls` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama_modul` varchar(255) NOT NULL,
  `kode_modul` varchar(255) NOT NULL,
  `ketersediaan` int(100) UNSIGNED NOT NULL,
  `harga_modul` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moduls`
--

INSERT INTO `moduls` (`id`, `nama_modul`, `kode_modul`, `ketersediaan`, `harga_modul`) VALUES
(1, 'ABC1', 'ABC1', 26, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `moduls_in`
--

CREATE TABLE `moduls_in` (
  `id_in` int(11) NOT NULL,
  `id_moduls` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `moduls_in`
--
DELIMITER $$
CREATE TRIGGER `delete_moduls_in` AFTER DELETE ON `moduls_in` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan - OLD.qty
	WHERE moduls.id = OLD.id_moduls;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_moduls_in` AFTER INSERT ON `moduls_in` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan + NEW.qty
	WHERE moduls.id = NEW.id_moduls;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `moduls_out`
--

CREATE TABLE `moduls_out` (
  `id_out` int(11) NOT NULL,
  `id_moduls` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `moduls_out`
--
DELIMITER $$
CREATE TRIGGER `delete_moduls_out` AFTER DELETE ON `moduls_out` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan + OLD.qty
	WHERE moduls.id = OLD.id_moduls;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_moduls_out` AFTER INSERT ON `moduls_out` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan - NEW.qty
	WHERE moduls.id = NEW.id_moduls;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_sertifikat`
--

CREATE TABLE `nilai_sertifikat` (
  `id` int(5) UNSIGNED NOT NULL,
  `JP` varchar(255) DEFAULT NULL,
  `nilai` int(5) UNSIGNED DEFAULT NULL,
  `tanggal_ujian` date DEFAULT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `nim_user` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `reguler_user` varchar(255) DEFAULT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nama_dosen` varchar(255) DEFAULT NULL,
  `ruangan` varchar(255) DEFAULT NULL,
  `sertifikat_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nilai_sertifikat`
--

INSERT INTO `nilai_sertifikat` (`id`, `JP`, `nilai`, `tanggal_ujian`, `nama_user`, `nim_user`, `result`, `reguler_user`, `kelas`, `status`, `nama_dosen`, `ruangan`, `sertifikat_id`) VALUES
(1010, '01/S1', 83, '2020-04-20', 'ALYA TRINANDYA ROSHA BUN YANI', '0119101105', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1011, '01/S1', 85, '2020-04-21', 'DHONA SILVI FITRIANI', '0119101102', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1012, '01/S1', 95, '2020-04-22', 'VITA FATHIA LATIEF', '0119101086', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1013, '01/S1', 78, '2020-04-23', 'MUHAMMAD FARDIAZ IKHSAN', '0117101165', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1014, '01/S1', 93, '2020-04-24', 'FACHRI ADRIANSYAH', '0119101104', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1015, '01/S1', 93, '2020-04-25', 'RAGA AHLIL FIKRI', '0119101072', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1016, '01/S1', 95, '2020-04-26', 'AKBAR PRIANJAYA PRABOWO', '0119101116', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1017, '01/S1', 65, '2020-04-27', 'RAVEL ALMAY HARIRI', '0116101211', 'Failed', 'REG A', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1018, '01/S1', 85, '2020-04-28', 'RESMA NAMIRA ANJANI', '0119101099', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1019, '01/S1', 93, '2020-04-29', 'SHELYA FITRI', '0119101103', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1020, '01/S1', 88, '2020-04-30', 'MARISHA MANDHASARY ', '0115101538', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1021, '01/S1', 95, '2020-05-01', 'VINDA NURREZIVANKA RUDIANA', '0119101101', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1022, '01/S1', 95, '2020-05-02', 'RISKA MARTENIA', '0119101091', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1023, '01/S1', 93, '2020-05-03', 'RAMADHANI ZAFRAN', '0119101106', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1024, '01/S1', 83, '2020-05-04', 'PUPUNG PURNAMA ', '40121110034', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1025, '01/S1', 63, '2020-05-05', 'AQILLA FADIA HENDRI', '0119101089', 'Failed', 'REG A', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1026, '01/S1', 88, '2020-05-06', 'ALSYA PUTRI SALIHA', '0119101088', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1027, '01/S1', 90, '2020-05-07', 'GHEA CLARIZA SYUHADA', '0119101073', 'Passed', 'REG A', 'D', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1028, '01/S1', 43, '2020-05-08', 'ALFONSIUS CH ALEXANDRO RAMBA', '0116101114', 'Failed', 'REG A', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1029, '01/S1', 85, '2020-05-09', 'MESA ARMILA', '0119101136', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1030, '01/S1', 85, '2020-05-10', 'ASTRI WULANDARI', '0119101121', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1031, '01/S1', 88, '2020-05-11', 'AYU PUTRI FAUZIAH', '0119101114', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1032, '01/S1', 85, '2020-05-12', 'FATHIYA RAHMATIKA SUPRIYANTO', '0119101123', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1033, '01/S1', 98, '2020-05-13', 'ALFITRI MAULINA', '0119101113', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1034, '01/S1', 85, '2020-05-14', 'SHIRLEY MARTINI', '0119101130', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1035, '01/S1', 80, '2020-05-15', 'VERAWATI FEBRIANI SASMITA', '0119101115', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1036, '01/S1', 80, '2020-05-16', 'SALMA SHAFIRA', '0119101139', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1037, '01/S1', 85, '2020-05-17', 'JIHAN AYU LESTARI', '0119101129', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1038, '01/S1', 85, '2020-05-18', 'NAZIRA AGNIA INDRIYANI', '0119101111', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1039, '01/S1', 80, '2020-05-19', 'SENITA ARDIYA RAMADINI', '0119101137', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1040, '01/S1', 80, '2020-05-20', 'FARHAN RASYID ALFAREZA', '0119101108', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1041, '01/S1', 80, '2020-05-21', 'SANTI MITA NIAR', '0119101107', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1042, '01/S1', 78, '2020-05-22', 'MUTIARA NUR INSANI', '0119101124', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1043, '01/S1', 85, '2020-05-23', 'DIVA PUTRI SYIFANIA', '0119101009', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1044, '01/S1', 93, '2020-05-24', 'RADEN ARIEF NIZAM KAMIL', '0119101048', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1045, '01/S1', 83, '2020-05-25', 'SITI DEWISARI', '0119101164', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1046, '01/S1', 80, '2020-05-26', 'SINTYA AMELIA PUTRI', '0119101125', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1047, '01/S1', 80, '2020-05-27', 'SASKA SALSADILLA KURNIAWAN', '0119101126', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1048, '01/S1', 23, '2020-05-28', 'FINCY LASMARIA SITANGGANG', '0119101035', 'Failed', 'REG A', 'B', NULL, 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1049, '01/S1', 80, '2020-05-29', 'PINDONTA JEREMIA NICOLAS EDRO', '0119101154', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1050, '01/S1', 83, '2020-05-30', 'MIRA AMALIYAH', '0119101098', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1051, '01/S1', 85, '2020-05-31', 'SHAFA SALSABILA QATRUNNADA', '0119101171', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1052, '01/S1', 83, '2020-06-01', 'SUCI TRI WAHYUNI', '0119101085', 'Passed', 'REG A', 'B', 'Proses Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1053, '01/S1', 95, '2020-06-02', 'SHANIA TILAVANY GULTOM', '0119101061', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1054, '01/S1', 83, '2020-06-03', 'FADYA NOOR FADHILAH', '0119101069', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1055, '01/S1', 98, '2020-06-04', 'NISSA YUNIAR NUR ALIFAH', '0119101167', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1056, '01/S1', 88, '2020-06-05', 'SHANIA FITRIA AZIZA', '0119101070', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1057, '01/S1', 83, '2020-06-06', 'ANNISA NUR RAHIM', '0119101022', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1058, '01/S1', 85, '2020-06-07', 'FATHUR ARSIADJIENOVANTO', '0119101067', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1059, '01/S1', 75, '2020-06-08', 'HERLINA AYU PERMATASARI', '0119101092', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1060, '01/S1', 90, '2020-06-09', 'DWI SAHLA NURAINI', '0119101165', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1061, '01/S1', 80, '2020-06-10', 'MUHAMAD ADAM PALMALEO', '0119101024', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1062, '01/S1', 65, '2020-06-11', 'HAWA AZ-ZAHRA KIFAYAH', '0119101004', 'Failed', 'REG A', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1063, '01/S1', 60, '2020-06-12', 'SUCI FITRIA CISADANI', '0119101077', 'Failed', 'REG A', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1064, '01/S1', 83, '2020-06-13', 'YOELANDA ASRI SITOHANG', '0119101036', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1065, '01/S1', 93, '2020-06-14', 'MAYU JANNAH FIRDAUS', '0119101109', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1066, '01/S1', 88, '2020-06-15', 'GHINA KHAIRUNNISA', '0119101071', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1067, '01/S1', 85, '2020-06-16', 'RAIHAN ARYANTO', '0119101080', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1068, '01/S1', 75, '2020-06-17', 'DODI HERMAWAN', '0119101010', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1069, '01/S1', 93, '2020-06-18', 'ALDINI NURUL AIDHA', '0119101068', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1070, '01/S1', 98, '2020-06-19', 'BAYU KURNIA', '0119101060', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1071, '01/S1', 88, '2020-06-20', 'FIRDHA AMELIA PUTRI', '0119101169', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1072, '01/S1', 90, '2020-06-21', 'ELYSSA FIQRI FAUZIAH', '0119101177', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1073, '01/S1', 78, '2020-06-22', 'DIANA RESTU LESTARI', '0119101082', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1074, '01/S1', 85, '2020-06-23', 'LUTFI AJENG MULYANI', '0119101087', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1075, '01/S1', 83, '2020-06-24', 'RIZKA AMALIA', '0119101014', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1076, '01/S1', 78, '2020-06-25', 'ADITYA SIDIQ NURSYANI', '0119101027', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1077, '01/S1', 85, '2020-06-26', 'TEESY WULANDARI', '0119101074', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1078, '01/S1', 78, '2020-06-27', 'LENI MARLINA', '0119101031', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1079, '01/S1', 88, '2020-06-28', 'FIDYA ALFIANTI RANITA', '0119101043', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1080, '01/S1', 85, '2020-06-29', 'SUCI RAHMA WATI', '0119101037', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1081, '01/S1', 75, '2020-06-30', 'MIKE AYUNI LESTARI', '0119101019', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1082, '01/S1', 83, '2020-07-01', 'SYIFA FITRIYANI AZZAHRA', '0119101018', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1083, '01/S1', 73, '2020-07-02', 'ALLYA NADIA ITRA ARDANA PUTRI', '0119101162', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1084, '01/S1', 80, '2020-07-03', 'LUCI SEPTIANTI', '0119101012', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1085, '01/S1', 88, '2020-07-04', 'CHARISMA INDAH PRATIWI', '0119101075', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1086, '01/S1', 93, '2020-07-05', 'NANDITHA MYESA HAIDAR', '0119101046', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1087, '01/S1', 88, '2020-07-06', 'AZHAR FAUZI SUHERMAN', '0119101013', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1088, '01/S1', 90, '2020-07-07', 'VIONA SALSABILA AZIZ', '0119101078', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1089, '01/S1', 88, '2020-07-08', 'VIOLIETA WICAKSONO PUTRI', '0119101055', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1090, '01/S1', 90, '2020-07-09', 'RIFKI PUTRA PRATAMA', '0119101056', 'Passed', 'REG A', 'A', 'Proses Cetak', 'Niki Hadian, H., S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010'),
(1091, '01/S1', 90, '2020-07-10', 'ERINDA SRIULINA PURBA', '0119101050', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1092, '01/S1', 93, '2020-07-11', 'PUTRI NATASYA', '0119101047', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1093, '01/S1', 90, '2020-07-12', 'MEGA SIMANJORANG', '0119101054', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1094, '01/S1', 98, '2020-07-13', 'MITA APRILIYANI', '0119101045', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1095, '01/S1', 98, '2020-07-14', 'CIKA THALITA KESIA', '0119101131', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1096, '01/S1', 90, '2020-07-15', 'RUNY SUFHI ADAWIYAH', '0119101079', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1097, '01/S1', 58, '2020-07-16', 'NOVIKA DEA NABILA PUTRI', '0119101005', 'Failed', 'REG A', 'C', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1098, '01/S1', 83, '2020-07-17', 'MERY NUR MARYAMAH', '0119101083', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1099, '01/S1', 60, '2020-07-18', 'SHEIKA VILLYANTI MEILIA WIJAYA', '0119101003', 'Failed', 'REG A', 'C', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1100, '01/S1', 90, '2020-07-19', 'ELSA KRISTINA', '0119101094', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1101, '01/S1', 88, '2020-07-20', 'NADA HANA MAISA', '0119101095', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1102, '01/S1', 88, '2020-07-21', 'INDAH NURMALA SARI', '0119101093', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1103, '01/S1', 88, '2020-07-22', 'LISNAWATI DEWI APRIYANI', '0119101038', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1104, '01/S1', 78, '2020-07-23', 'ANDY DIPRAJA NUGRAHA', '0119101158', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1105, '01/S1', 88, '2020-07-24', 'SAYYID KEMAL FAZA', '0119101122', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1106, '01/S1', 88, '2020-07-25', 'SEVILA ANGGRAENI', '0119101119', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1107, '01/S1', 80, '2020-07-26', 'GEBY ELENA REFKA.S', '0119101173', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1108, '01/S1', 60, '2020-07-27', 'SISKA SILVIANI DESKA', '0119101029', 'Failed', 'REG A', 'C', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1109, '01/S1', 73, '2020-07-28', 'RISKA ALIPAH', '0119101163', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1110, '01/S1', 88, '2020-07-29', 'RAFI MOHAMAD RAMADHAN', '0119101118', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1111, '01/S1', 90, '2020-07-30', 'DINI RAHAYU', '0119101052', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1112, '01/S1', 90, '2020-07-31', 'ANISHA FERA WATI SIBURIAN', '0119101174', 'Passed', 'REG A', 'C', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1113, '01/S1', 88, '2020-08-01', 'TRISHA SHANIA LORENZA SIHOTANG ', '40121110003', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1114, '01/S1', 93, '2020-08-02', 'BELLA RADIANI RUSANDO ', '40121110027', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1115, '01/S1', 75, '2020-08-03', 'MUHAMMAD FAZA HADAYA PERMANA ', '40121110009', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1116, '01/S1', 93, '2020-08-04', 'SARAH RIFANI NURINSAN ', '40121110021', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1117, '01/S1', 85, '2020-08-05', 'MARTA ISABELLA PISTA', '0119103011', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1118, '01/S1', 88, '2020-08-06', 'SYARNA INTAN MAHRANI ', '40121110008', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1119, '01/S1', 45, '2020-08-07', 'FERRY PRASETYO NUGROHO ', '40121110035', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1120, '01/S1', 95, '2020-08-08', 'MICHSELLY MELVYANA SIDAURUK', '0119103050', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1121, '01/S1', 93, '2020-08-09', 'OLGA OKTA VERANTI RABILA', '0119103054', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1122, '01/S1', 85, '2020-08-10', 'DHIKA RAMDHANIA', '0119103005', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1123, '01/S1', 68, '2020-08-11', 'CATHLIN AMANDA', '0119103039', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1124, '01/S1', 85, '2020-08-12', 'TRYANI AUGUSTINE', '0119103010', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1125, '01/S1', 78, '2020-08-13', 'RISMAYA', '0119103028', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1126, '01/S1', 90, '2020-08-14', 'NISSA FADHILA JATI', '0118104012', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1127, '01/S1', 83, '2020-08-15', 'FITRIA FEBRIYANTI DEBORA TAMBUNAN', '0119103051', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1128, '01/S1', 83, '2020-08-16', 'ESYA KUSUMANING TYAS ', '40121110010', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1129, '01/S1', 88, '2020-08-17', 'EVY MUTIA SARI', '0119103048', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1130, '01/S1', 50, '2020-08-18', 'YULI YUANTIKA', '0119103044', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1131, '01/S1', 93, '2020-08-19', 'DILLA NUR FADILAH', '0119103056', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1132, '01/S1', 93, '2020-08-20', 'VICKY NADHIRATUL VUZZA ', '40121110007', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1133, '01/S1', 70, '2020-08-21', 'ARYA MAULANA ', '40121110031', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1134, '01/S1', 73, '2020-08-22', 'ENENG SITI NUR RIKA', '0119103052', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1135, '01/S1', 70, '2020-08-23', 'SITI HADIJAH', '0119103053', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1136, '01/S1', 73, '2020-08-24', 'FIRDA NOVIYANTI', '0119103037', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1137, '01/S1', 88, '2020-08-25', 'DESTIANA PUTRI JOANA SIFA', '0119103014', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1138, '01/S1', 63, '2020-08-26', 'YOLA SARTIKA', '0119103036', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1139, '01/S1', 80, '2020-08-27', 'MELATI PRATIVI AHMAD FADILLAH', '0119103045', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1140, '01/S1', 63, '2020-08-28', 'EVI NOVIYANTI ', '40121110005', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1141, '01/S1', 85, '2020-08-29', 'RIFALDI NABILLAH', '0119104045', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1142, '01/S1', 88, '2020-08-30', 'JONATHAN DARMAWAN LUMBAN GAOL ', '40121110002', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1143, '01/S1', 80, '2020-08-31', 'YUDITH MAGDALENA', '0119103016', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1144, '01/S1', 85, '2020-09-01', 'DIAN OKTAVIA', '0119103047', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1145, '01/S1', 23, '2020-09-02', 'YUSTIAN RACHMAN SURYA PRANATA ', '40121110026', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1146, '01/S1', 80, '2020-09-03', 'AMELIA ROSITA', '0119104046', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1147, '01/S1', 70, '2020-09-04', 'ANETHA NOVIRIANTY', '0119103055', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1148, '01/S1', 60, '2020-09-05', 'NURUL FAUZIYAH UTAMI ', '40121110020', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1149, '01/S1', 55, '2020-09-06', 'DINI NURADHANI ', '40121110032', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1150, '01/S1', 50, '2020-09-07', 'ZAKIA NUR AZIZAH ', '40121110030', 'Failed', 'REG B1', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1151, '01/S1', 85, '2020-09-08', 'ROS BUNGA BONDAR', '0119103031', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1152, '01/S1', 98, '2020-09-09', 'ELSA VIONA BUDIAR', '0119103026', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1153, '01/S1', 85, '2020-09-10', 'GINA ANITA', '0119103030', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1154, '01/S1', 100, '2020-09-11', 'RINI WAHYUNI', '0119103024', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1155, '01/S1', 93, '2020-09-12', 'SHAFIRA RAMADHANIA', '0119103025', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1156, '01/S1', 90, '2020-09-13', 'DEBORA KRISTINA HUTAPEA', '0119103007', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1157, '01/S1', 80, '2020-09-14', 'FEREN STEVIOLLA', '0119103012', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1158, '01/S1', 83, '2020-09-15', 'IRPAN', '0119103017', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1159, '01/S1', 83, '2020-09-16', 'SIMON RAJAGUKGUK', '0119103020', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1160, '01/S1', 95, '2020-09-17', 'ENJEL SAPANIA PASARIBU', '0119103021', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1161, '01/S1', 98, '2020-09-18', 'RHESMA PEBRINA WANDANI', '0119103034', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1162, '01/S1', 88, '2020-09-19', 'LINA NUR SUSILAWATI', '0119103029', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1163, '01/S1', 90, '2020-09-20', 'RIRIS MAYOHANA SIMANJORANG', '0119103032', 'Passed', 'REG B1', 'B', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1164, '01/S1', 83, '2020-09-21', 'VERA ASTRIA', '0120203009', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1165, '01/S1', 93, '2020-09-22', 'JEFFRY BAYU PUTRA DEWA', '0120203008', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1166, '01/S1', 85, '2020-09-23', 'LIA AFIATI', '0120203007', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1167, '01/S1', 90, '2020-09-24', 'HILMA INDRIANI', '0120203001', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1168, '01/S1', 80, '2020-09-25', 'ALYA TIARA NUGRAHA', '0120203005', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1169, '01/S1', 75, '2020-09-26', 'FRISKA LIANA PUTRI SIMBOLON', '0120203015', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1170, '01/S1', 98, '2020-09-27', 'ABIGAIL CHRISTIANTI', '0120203017', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1171, '01/S1', 95, '2020-09-28', 'MUHAMMAD SYAHRIYAL YUSUF', '0120203012', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1172, '01/S1', 80, '2020-09-29', 'RAMA RINATA', '0120203013', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1173, '01/S1', 93, '2020-09-30', 'CRISTIAN HERLINA', '0120203011', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1174, '01/S1', 88, '2020-10-01', 'RASI VELITA SARAGIH', '0120203010', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1175, '01/S1', 95, '2020-10-02', 'SITI NURSIDAH', '0120203006', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1176, '01/S1', 90, '2020-10-03', 'JENNY MARIA PURBA', '0120203002', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1177, '01/S1', 93, '2020-10-04', 'MAISAROH', '0120203003', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1178, '01/S1', 68, '2020-10-05', 'PUTRI FADILA', '0120204004', 'Failed', 'REG B2', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1179, '01/S1', 80, '2020-10-06', 'WIDI AMELIA PUTRI', '0120204008', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1180, '01/S1', 65, '2020-10-07', 'YENI APRIANI', '0120204002', 'Failed', 'REG B2', 'A', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1181, '01/S1', 85, '2020-10-08', 'NENG DEWI MARWIAH', '0120204001', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1182, '01/S1', 75, '2020-10-09', 'MOCHAMAD RIDWAN', '0120204005', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1183, '01/S1', 88, '2020-10-10', 'ERIKA PUTRI RENANDA', '0120204006', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1184, '01/S1', 78, '2020-10-11', 'SITI NURHALIZAH', '0120204007', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1185, '01/S1', 78, '2020-10-12', 'MAHSA FAIRA HIDAYAT', '0120204010', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1186, '01/S1', 75, '2020-10-13', 'AHMAD ARIF', '0120204003', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010'),
(1187, '01/S1', 75, '2020-10-14', 'CITRA RISMAWATI UTAMI ', '40121110029', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1188, '01/S1', 85, '2020-10-15', 'EA RIZKI GINANJAR', '0119104019', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1189, '01/S1', 85, '2020-10-16', 'YUNITA FATIMAH EKA NARIANTI', '0119104044', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1190, '01/S1', 90, '2020-10-17', 'MARWAA HANIIFAH', '0119104001', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1191, '01/S1', 95, '2020-10-18', 'SANTTY NURCHAERIANI', '0119103023', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1192, '01/S1', 100, '2020-10-19', 'INTAN RACHMAWATI', '0119104018', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1193, '01/S1', 93, '2020-10-20', 'TASHIA AMUDYA HARSONO', '0119104012', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1194, '01/S1', 95, '2020-10-21', 'PANISYA NURUL AFIFAH', '0119104029', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1195, '01/S1', 90, '2020-10-22', 'PIPIT SAPITRI', '0119104007', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1196, '01/S1', 93, '2020-10-23', 'SENDIE NUR HIDAYAT', '0119104050', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1197, '01/S1', 83, '2020-10-24', 'RIZA GARINI ', '40121110036', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1198, '01/S1', 98, '2020-10-25', 'ANISA RIZKY FITRIYANI', '0119104042', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1199, '01/S1', 88, '2020-10-26', 'ANDINI EKA PRATIWI', '0119104037', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1200, '01/S1', 95, '2020-10-27', 'ELI KRISMAYANTI', '0119104038', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1201, '01/S1', 85, '2020-10-28', 'ZAHRA NURUL FITRI RAMDHAN ', '40121110022', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1202, '01/S1', 98, '2020-10-29', 'FAUZIAH SALMA ', '40121110028', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1203, '01/S1', 85, '2020-10-30', 'ADI PRASANA ', '40121110004', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1204, '01/S1', 75, '2020-10-31', 'SISI MITRAYANI RAHAYU', '0119104032', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1205, '01/S1', 98, '2020-11-01', 'RIZKI FIDELA ', '40121110006', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1206, '01/S1', 98, '2020-11-02', 'TARISHA CHABELITA', '0119104002', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1207, '01/S1', 93, '2020-11-03', 'NURSELA TANIA', '0119104013', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1208, '01/S1', 95, '2020-11-04', 'EVA NURAZIZAH', '0119104025', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1209, '01/S1', 93, '2020-11-05', 'RIFA NOVIATI', '0119104024', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1210, '01/S1', 88, '2020-11-06', 'IKEU ERVINA PUTRI', '0119104026', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1211, '01/S1', 100, '2020-11-07', 'WINDA FAUZIAH', '0119104005', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1212, '01/S1', 90, '2020-11-08', 'ADI DANELY', '0119104014', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1213, '01/S1', 75, '2020-11-09', 'CITRA RAULINA GULTOM', '0119104043', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1214, '01/S1', 98, '2020-11-10', 'ANNA SISILIA GULTOM', '0119104027', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1215, '01/S1', 78, '2020-11-11', 'KAMILA SARIFUDIN', '0119104008', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1216, '01/S1', 93, '2020-11-12', 'DEPI APRIANI', '0119104011', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1217, '01/S1', 78, '2020-11-13', 'DENI DWIKI KURNIA PURNAMA', '0119104021', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1218, '01/S1', 98, '2020-11-14', 'FRIAS VALENTINO KANNA EWANAN', '0119104036', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1219, '01/S1', 85, '2020-11-15', 'NANDA LUTFIA NURIMANI', '0119104047', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1220, '01/S1', 83, '2020-11-16', 'RIZKA NURHASANAH', '0119104016', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1221, '01/S1', 83, '2020-11-17', 'MARGARETA STEFANI S', '0119104041', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1222, '01/S1', 90, '2020-11-18', 'RIZKI ARDIANSYAH', '0119104003', 'Passed', 'REG B2', 'A', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'AC010'),
(1223, '16/S2', 79, '2020-11-19', 'LITA TRIBUANA', '51621120008', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1224, '16/S2', 89, '2020-11-20', 'DESTA EKA ANASMUSA', '51621120028', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1225, '16/S2', 46, '2020-11-21', 'OSWALDUS ROMANUS MINGGU', '51621120006', 'Failed', 'REG B1', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1226, '16/S2', 81, '2020-11-22', 'DWI RAHMATANTI', '51621120032', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1227, '16/S2', 71, '2020-11-23', 'AVIV NUR AHDIANA', '51621120059', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1228, '16/S2', 80, '2020-11-24', 'KARINA NURMAYA, SE', '51621120005', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1229, '16/S2', 74, '2020-11-25', 'ADE RESTU RUKYAH', '51621120013', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1230, '16/S2', 83, '2020-11-26', 'NURUL RIZKI LESTARI', '51621120053', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1231, '16/S2', 71, '2020-11-27', 'RA SASQIA MAHARANI SURBAKTI', '51621120037', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1232, '16/S2', 71, '2020-11-28', 'GEDIZZAH FILLAH', '51621120004', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1233, '16/S2', 87, '2020-11-29', 'HADWIMANTORO', '51621120043', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1234, '16/S2', 51, '2020-11-30', 'SITI ZAINAB KUSUMAWATI', '51621120027', 'Failed', 'REG B1', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1235, '16/S2', 70, '2020-12-01', 'SISKA MAHARANI', '51621120065', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1236, '16/S2', 44, '2020-12-02', 'ENTIN TINI RUMSARI', '51621120014', 'Failed', 'REG B1', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1237, '16/S2', 81, '2020-12-03', 'RAHMA RIZKY MONETARY', '51621120023', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1238, '16/S2', 84, '2020-12-04', 'GUNTUR GUNTARA', '51621120030', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1239, '16/S2', 79, '2020-12-05', 'KURRATUL AINI', '51621120062', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1240, '16/S2', 70, '2020-12-06', 'RIVALDI RACHMAN', '51621120002', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1241, '16/S2', 84, '2020-12-07', 'RENDY FERDIANSYAH', '51621120057', 'Passed', 'REG B1', 'A', 'Proses Cetak', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA', 'ONLINE', 'SAP01'),
(1242, '15/PPAK', 60, '2020-12-08', 'ARIF TOPAN SANJAYA', '21521120011', 'Failed', 'REG B1', 'G', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1243, '15/PPAK', 74, '2020-12-09', 'ASEP TRIADI', '21521120008', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1244, '15/PPAK', 97, '2020-12-10', 'MADE DWI MAHA INDRA SUJANA PUTRA', '21521120021', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1245, '15/PPAK', 91, '2020-12-11', 'MICHAEL CHRISTIAN', '21521120012', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1246, '15/PPAK', 84, '2020-12-12', 'MARENI BETA BRIANI', '21521120029', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1247, '15/PPAK', 86, '2020-12-13', 'HERDIAN KUSUMAH', '21521120044', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1248, '15/PPAK', 76, '2020-12-14', 'NATHANIA ANGELA', '21521120015', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1249, '15/PPAK', 84, '2020-12-15', 'FACHRI GALIH HIBATULLOH', '21521120045', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1250, '15/PPAK', 94, '2020-12-16', 'ADE AGUSTINA FAHRIA', '21521120042', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1251, '15/PPAK', 87, '2020-12-17', 'YOEL CHRISTOPHER TJEN', '21521120001', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1252, '15/PPAK', 84, '2020-12-18', 'DIMAS EDWIN HIDAYAT', '21521120017', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1253, '15/PPAK', 96, '2020-12-19', 'DUKARLOS', '21521120048', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1254, '15/PPAK', 93, '2020-12-20', 'UFIYA IZMI ISTIGHFARIN', '21521120046', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1255, '15/PPAK', 87, '2020-12-21', 'MUHAMMAD ADAM FHASLI HANIFAN MAHA PUTRA', '21521120004', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1256, '15/PPAK', 87, '2020-12-22', 'DESRI ANITASARI', '21521120028', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1257, '15/PPAK', 77, '2020-12-23', 'JAMIAN HABEAHAN', '21521120030', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1258, '15/PPAK', 83, '2020-12-24', 'CENNIAWATI EFENDI', '21521120010', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1259, '15/PPAK', 86, '2020-12-25', 'DANI MARDIANSYAH', '21521120009', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1260, '15/PPAK', 91, '2020-12-26', 'JONI PRASETYO', '21521120035', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1261, '15/PPAK', 86, '2020-12-27', 'JEAN HZA HZA ANDREZA', '21521120043', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1262, '15/PPAK', 97, '2020-12-28', 'DIANA MARYANA', '21521120057', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1263, '15/PPAK', 93, '2020-12-29', 'HERYCSON', '21521120051', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1264, '15/PPAK', 70, '2020-12-30', 'RENI NURAENI', '21521120053', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1265, '15/PPAK', 81, '2020-12-31', 'DIANIKA RACHMADINI', '21521120039', 'Passed', 'REG B1', 'G', 'Proses Cetak', 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1266, '15/PPAK', 43, '2021-01-01', 'OCTARIO SANDY CHRYSANTHUS', '21521120007', 'Failed', 'REG B1', 'G', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.', 'ONLINE', 'SAP01'),
(1267, '16/S2', 73, '2021-01-02', 'EDY MUZIARDY', '51621120055', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1268, '16/S2', 81, '2021-01-03', 'LEO CALVIN', '51621120033', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1269, '16/S2', 71, '2021-01-04', 'ASEP RIAN SUHAELI', '51621120034', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1270, '16/S2', 70, '2021-01-05', 'MAILINDA UTAMI ANANDHARI', '51621120016', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1271, '16/S2', 69, '2021-01-06', 'TAUFIK BARKAH', '51621120011', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1272, '16/S2', 99, '2021-01-07', 'WEINBERG JANNE TRISNAWATY', '51621120010', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1273, '16/S2', 100, '2021-01-08', 'CHANDRA WIDIAWATI', '51621120054', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1274, '16/S2', 71, '2021-01-09', 'DEWI KURNIANINGSIH', '51621120058', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1275, '16/S2', 73, '2021-01-10', 'EKAVINA DUSTIRA BR TARIGAN', '51621120051', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1276, '16/S2', 33, '2021-01-11', 'SILVIA YUANDARI', '51621120015', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1277, '16/S2', 97, '2021-01-12', 'AGUS MISBAHUDIN', '51621120035', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1278, '16/S2', 50, '2021-01-13', 'RISA AULIA RANA', '51621120036', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1279, '16/S2', 76, '2021-01-14', 'TITIS FADILA', '51621120061', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1280, '16/S2', 73, '2021-01-15', 'REZHA DIVA KARUNIA DWI PUTRI', '51621120038', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1281, '16/S2', 64, '2021-01-16', 'SUPIA RAHMI', '51621120025', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1282, '16/S2', 61, '2021-01-17', 'IAN RIANA', '51621120042', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1283, '16/S2', 47, '2021-01-18', 'DEDE RAHMAT', '51621120052', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1284, '16/S2', 77, '2021-01-19', 'DIANTI WULAN SUCI', '51621120056', 'Passed', 'REG B2', 'B', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1285, '16/S2', 63, '2021-01-20', 'RISYE AYULIAWATI HERLINA', '51621120073', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1286, '16/S2', 51, '2021-01-21', 'SONI GUSTAMAN', '51621120047', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1287, '16/S2', 40, '2021-01-22', 'HENDARDI ARYOTAMA', '51621120060', 'Failed', 'REG B2', 'B', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1288, '16/S2', 76, '2021-01-23', 'ARUM ANGGGITA', '51621120049', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1289, '16/S2', 90, '2021-01-24', 'NINGSIH', '51621120040', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1290, '16/S2', 87, '2021-01-25', 'YULIYANI SARI', '51621120031', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1291, '16/S2', 89, '2021-01-26', 'HERDI SULAEMAN', '51621120070', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1292, '16/S2', 79, '2021-01-27', 'WANDA', '51621120029', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1293, '16/S2', 80, '2021-01-28', 'DEDI KHUMAEDI', '51621120026', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1294, '16/S2', 89, '2021-01-29', 'VERA MARDIANA', '51621120045', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1295, '16/S2', 87, '2021-01-30', 'ZAKIAH ANNISHA', '51621120041', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1296, '16/S2', 84, '2021-01-31', 'FITRA NUR RAHIMA', '51621120039', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1297, '16/S2', 71, '2021-02-01', 'DENIDA SYARAH ENDANI', '51621120024', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1298, '16/S2', 69, '2021-02-02', 'IRINE KATHARINA FERNAWATI', '51621120063', 'Failed', 'REG B2', 'C', NULL, 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1299, '16/S2', 71, '2021-02-03', 'HAULA NUR ARIFANI', '51621120009', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1300, '16/S2', 87, '2021-02-04', 'NURMAN NASRULLAH MA\'RUF, S.E.', '51621120019', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01');
INSERT INTO `nilai_sertifikat` (`id`, `JP`, `nilai`, `tanggal_ujian`, `nama_user`, `nim_user`, `result`, `reguler_user`, `kelas`, `status`, `nama_dosen`, `ruangan`, `sertifikat_id`) VALUES
(1301, '16/S2', 89, '2021-02-05', 'ASTRI FATMAWATI', '51621120007', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1302, '16/S2', 83, '2021-02-06', 'DWI SUWONDO', '51621120022', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1303, '16/S2', 84, '2021-02-07', 'NAUFAL ANIS HILMY', '51621120044', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1304, '16/S2', 89, '2021-02-08', 'WILDA MAYA SUSANTI, S.E., Ak', '51621120018', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1305, '16/S2', 89, '2021-02-09', 'RATNA KUSUMASTUTI, S.E', '51621120017', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1306, '16/S2', 71, '2021-02-10', 'WAHYUDI JAYA KUSUMA', '51621120066', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1307, '16/S2', 79, '2021-02-11', 'SARAH FELIA DWIAYUNI', '51621120064', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1308, '16/S2', 71, '2021-02-12', 'EDWIN GUNAWAN', '51621120020', 'Passed', 'REG B2', 'C', 'Proses Cetak', 'Rita Yuniarti, Dr.,  S.E., M.M., Ak., C.A.', 'ONLINE', 'SAP01'),
(1309, '15/PPAK', 86, '2021-02-13', 'ACEP KOMARA', '21521120056', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1310, '15/PPAK', 77, '2021-02-14', 'AGUNG ABDIRAHMAN', '21521120023', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1311, '15/PPAK', 89, '2021-02-15', 'ALDI RIVALDI', '21521120050', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1312, '15/PPAK', 87, '2021-02-16', 'ANDINA PUSPITA', '21521120025', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1313, '15/PPAK', 86, '2021-02-17', 'CITRA MARIANA', '21521120033', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1314, '15/PPAK', 81, '2021-02-18', 'DANI RESA', '21521120002', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1315, '15/PPAK', 100, '2021-02-19', 'EDWIN KHRISTIAN', '21521120024', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1316, '15/PPAK', 60, '2021-02-20', 'ELYASA FADL ABDILLAH', '21521120019', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1317, '15/PPAK', 79, '2021-02-21', 'GITA SUGIHARTI', '21521120047', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1318, '15/PPAK', 79, '2021-02-22', 'HARRY TUBAGUS ILYAS', '21521120018', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1319, '15/PPAK', 76, '2021-02-23', 'HARUN APRIANA', '21521120038', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1320, '15/PPAK', 43, '2021-02-24', 'HERMAN RUSTANDI', '21521120006', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1321, '15/PPAK', 80, '2021-02-25', 'HESTY JUNI TAMBUATI SUBING', '21521120034', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1322, '15/PPAK', 61, '2021-02-26', 'KHAERUL AMRI', '21521120040', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1323, '15/PPAK', 86, '2021-02-27', 'LANTAR PERMANA', '21521120031', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1324, '15/PPAK', 46, '2021-02-28', 'LUTHFI HARDIANSYAH', '21521120054', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1325, '15/PPAK', 70, '2021-03-01', 'MUHAMAD RIZKY', '21521120049', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1326, '15/PPAK', 51, '2021-03-02', 'MUHAMMAD IQBAL TAWAKAL', '21521120027', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1327, '15/PPAK', 67, '2021-03-03', 'PUGUH SURYA GUMILAR', '21521120016', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1328, '15/PPAK', 73, '2021-03-04', 'RADITYA FIRMANSYAH', '21521120055', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1329, '15/PPAK', 80, '2021-03-05', 'GEDE ARYA MAHENDRA GAUTAMA', '1520104022', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1330, '15/PPAK', 80, '2021-03-06', 'SITI MAULANI', '21521120005', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1331, '15/PPAK', 47, '2021-03-07', 'TAMRIN MEDA', '21521120052', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1332, '15/PPAK', 77, '2021-03-08', 'TEGUH IMAM SYAFI\'I', '21521120032', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1333, '15/PPAK', 77, '2021-03-09', 'YULIA SRI WAHYUNI', '21521120003', 'Passed', 'REG B2', 'H', 'Proses Cetak', 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1334, '15/PPAK', 46, '2021-03-10', 'ZULMEDIA', '21521120022', 'Failed', 'REG B2', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.', 'ONLINE', 'SAP01'),
(1335, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1336, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1337, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1338, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1339, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1340, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1341, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1342, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1343, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1344, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1345, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(1346, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama_sertifikat` varchar(255) NOT NULL,
  `kode_sertifikat` varchar(255) NOT NULL,
  `harga_sertifikat` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `nama_sertifikat`, `kode_sertifikat`, `harga_sertifikat`) VALUES
(1, 'AC010', 'ABC1', 100000),
(2, 'AC010', 'AC010', 1590000),
(3, 'SAP01', 'SAP01', 1234213);

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat_excel`
--

CREATE TABLE `sertifikat_excel` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `reguler` varchar(255) NOT NULL,
  `tanggal_ujian` varchar(255) NOT NULL,
  `ruangan` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nama_dosen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sertifikat_excel`
--

INSERT INTO `sertifikat_excel` (`id`, `kode`, `nim`, `nama`, `nilai`, `result`, `reguler`, `tanggal_ujian`, `ruangan`, `kelas`, `status`, `nama_dosen`) VALUES
(506, '16/S2', '51621120028', 'DESTA EKA ANASMUSA', '85', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(507, '16/S2', '51621120059', 'AVIV NUR AHDIANA', '90', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(508, '16/S2', '51621120032', 'DWI RAHMATANTI', '82.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(509, '16/S2', '51621120013', 'ADE RESTU RUKYAH', '55', 'Failed', 'REG B1', '7/6/2022', 'ONLINE', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(510, '16/S2', '51621120008', 'LITA TRIBUANA', '77.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(511, '16/S2', '51621120004', 'GEDIZZAH FILLAH', '92.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(512, '16/S2', '51621120014', 'ENTIN TINI RUMSARI', '67.5', 'Failed', 'REG B1', '7/6/2022', 'ONLINE', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(513, '16/S2', '51621120027', 'SITI ZAINAB KUSUMAWATI', '82.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(514, '16/S2', '51621120043', 'HADWIMANTORO', '87.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(515, '16/S2', '51621120053', 'NURUL RIZKI LESTARI', '87.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(516, '16/S2', '51621120030', 'GUNTUR GUNTARA', '85', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(517, '16/S2', '51621120065', 'SISKA MAHARANI', '77.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(518, '16/S2', '51621120057', 'RENDY FERDIANSYAH', '95', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(519, '16/S2', '51621120002', 'RIVALDI RACHMAN', '85', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(520, '16/S2', '51621120062', 'KURRATUL AINI', '92.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(521, '16/S2', '51621120023', 'RAHMA RIZKY MONETARY', '82.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(522, '16/S2', '51621120005', 'KARINA NURMAYA, SE', '87.5', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(523, '16/S2', '51621120006', 'OSWALDUS ROMANUS MINGGU', '67.5', 'Failed', 'REG B1', '7/6/2022', 'ONLINE', 'A', NULL, 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(524, '16/S2', '51621120037', 'RA SASQIA MAHARANI SURBAKTI', '70', 'Passed', 'REG B1', '7/6/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Achmad Fadjar, Dr., S.E., M.Si., Ak.,CA'),
(525, '15/PPAP', '21521120008', 'ASEP TRIADI', '87.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(526, '15/PPAP', '21521120046', 'UFIYA IZMI ISTIGHFARIN', '100', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(527, '15/PPAP', '21521120010', 'CENNIAWATI EFENDI', '87.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(528, '15/PPAP', '21521120015', 'NATHANIA ANGELA', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(529, '15/PPAP', '21521120012', 'MICHAEL CHRISTIAN', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(530, '15/PPAP', '21521120028', 'DESRI ANITASARI', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(531, '15/PPAP', '21521120017', 'DIMAS EDWIN HIDAYAT', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(532, '15/PPAP', '21521120029', 'MARENI BETA BRIANI', '100', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(533, '15/PPAP', '21521120035', 'JONI PRASETYO', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(534, '15/PPAP', '21521120051', 'HERYCSON', '100', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(535, '15/PPAP', '21521120030', 'JAMIAN HABEAHAN', '95', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(536, '15/PPAP', '21521120045', 'FACHRI GALIH HIBATULLOH', '90', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(537, '15/PPAP', '21521120009', 'DANI MARDIANSYAH', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(538, '15/PPAP', '21521120044', 'HERDIAN KUSUMAH', '90', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(539, '15/PPAP', '21521120039', 'DIANIKA RACHMADINI', '82.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(540, '15/PPAP', '21521120001', 'YOEL CHRISTOPHER TJEN', '95', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(541, '15/PPAP', '21521120021', 'MADE DWI MAHA INDRA SUJANA PUTRA', '90', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(542, '15/PPAP', '21521120011', 'ARIF TOPAN SANJAYA', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(543, '15/PPAP', '21521120042', 'ADE AGUSTINA FAHRIA', '95', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(544, '15/PPAP', '21521120004', 'MUHAMMAD ADAM FHASLI HANIFAN MAHA PUTRA', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(545, '15/PPAP', '21521120053', 'RENI NURAENI', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(546, '15/PPAP', '21521120043', 'JEAN HZA HZA ANDREZA', '85', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(547, '15/PPAP', '21521120048', 'DUKARLOS', '97.5', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(548, '15/PPAP', '21521120057', 'DIANA MARYANA', '85', 'Passed', 'REG B1', '7/7/2022', 'ONLINE', 'G', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(549, '15/PPAP', '21521120005', 'SITI MAULANI ', '77.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(550, '15/PPAP', '21521120002', 'DANI RESA ', '85', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(551, '15/PPAP', '21521120022', 'ZULMEDIA ', '47.5', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(552, '15/PPAP', '21521120018', 'HARRY TUBAGUS ILYAS ', '95', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(553, '15/PPAP', '1520104022', 'GEDE ARYA MAHENDRA GAUTAMA', '80', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(554, '15/PPAP', '21521120049', 'MUHAMAD RIZKY', '90', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(555, '15/PPAP', '21521120038', 'HARUN APRIANA', '62.5', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(556, '15/PPAP', '21521120047', 'GITA SUGIHARTI', '82.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(557, '15/PPAP', '21521120025', 'ANDINA PUSPITA', '87.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(558, '15/PPAP', '21521120034', 'HESTY JUNI TAMBUATI SUBING', '82.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(559, '15/PPAP', '21521120033', 'CITRA MARIANA', '85', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(560, '15/PPAP', '21521120003', 'YULIA SRI WAHYUNI', '87.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(561, '15/PPAP', '21521120032', 'TEGUH IMAM SYAFI\'I', '90', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(562, '15/PPAP', '21521120019', 'ELYASA FADL ABDILLAH', '45', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(563, '15/PPAP', '21521120023', 'AGUNG ABDIRAHMAN', '77.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(564, '15/PPAP', '21521120024', 'EDWIN KHRISTIAN', '100', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(565, '15/PPAP', '21521120055', 'RADITYA FIRMANSYAH', '80', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(566, '15/PPAP', '21521120050', 'ALDI RIVALDI', '75', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(567, '15/PPAP', '21521120052', 'TAMRIN MEDA', '75', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(568, '15/PPAP', '21521120054', 'LUTHFI HARDIANSYAH', '62.5', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(569, '15/PPAP', '21521120040', 'KHAERUL AMRI', '60', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(570, '15/PPAP', '21521120002', 'DANI RESA', '100', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(571, '15/PPAP', '21521120027', 'MUHAMMAD IQBAL TAWAKAL', '77.5', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(572, '15/PPAP', '21521120006', 'HERMAN RUSTANDI', '32.5', 'Failed', 'REG B2', '7/16/2022', 'ONLINE', 'H', NULL, 'Remon Gunanta, S.Pd., M.Si.'),
(573, '15/PPAP', '21521120056', 'ACEP KOMARA', '85', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(574, '15/PPAP', '21521120031', 'LANTAR PERMANA', '95', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(575, '15/PPAP', '21521120016', 'PUGUH SURYA GUMILAR', '90', 'Passed', 'REG B2', '7/16/2022', 'ONLINE', 'H', 'PROSES CETAK', 'Remon Gunanta, S.Pd., M.Si.'),
(576, '16/S2', '51621120011', 'TAUFIK BARKAH', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(577, '16/S2', '51621120036', 'RISA AULIA RANA', '72.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(578, '16/S2', '51621120034', 'ASEP RIAN SUHAELI', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(579, '16/S2', '51621120025', 'SUPIA RAHMI', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(580, '16/S2', '51621120033', 'LEO CALVIN', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(581, '16/S2', '51621120061', 'TITIS FADILA', '87.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(582, '16/S2', '51621120056', 'DIANTI WULAN SUCI', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(583, '16/S2', '51621120016', 'MAILINDA UTAMI ANANDHARI', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(584, '16/S2', '51621120015', 'SILVIA YUANDARI', '75', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(585, '16/S2', '51621120010', 'WEINBERG JANNE TRISNAWATY', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(586, '16/S2', '51621120038', 'REZHA DIVA KARUNIA DWI PUTRI', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(587, '16/S2', '51621120042', 'IAN RIANA', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(588, '16/S2', '51621120060', 'HENDARDI ARYOTAMA', '82.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(589, '16/S2', '51621120051', 'EKAVINA DUSTIRA BR TARIGAN', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(590, '16/S2', '51621120055', 'EDY MUZIARDY', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(591, '16/S2', '51621120054', 'CHANDRA WIDIAWATI', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(592, '16/S2', '51621120047', 'SONI GUSTAMAN', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(593, '16/S2', '51621120035', 'AGUS MISBAHUDIN', '77.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(594, '16/S2', '51621120073', 'RISYE AYULIAWATI HERLINA', '87.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(595, '16/S2', '51621120031', 'YULIYANI SARI', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(596, '16/S2', '51621120024', 'DENIDA SYARAH ENDANI', '82.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(597, '16/S2', '51621120029', 'WANDA', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(598, '16/S2', '51621120040', 'NINGSIH', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(599, '16/S2', '51621120039', 'FITRA NUR RAHIMA', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(600, '16/S2', '51621120041', 'ZAKIAH ANNISHA', '87.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(601, '16/S2', '51621120063', 'IRINE KATHARINA FERNAWATI', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(602, '16/S2', '51621120007', 'ASTRI FATMAWATI', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(603, '16/S2', '51621120070', 'HERDI SULAEMAN', '100', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(604, '16/S2', '51621120022', 'DWI SUWONDO', '82.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(605, '16/S2', '51621120026', 'DEDI KHUMAEDI', '90', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(606, '16/S2', '51621120009', 'HAULA NUR ARIFANI', '85', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(607, '16/S2', '51621120017', 'RATNA KUSUMASTUTI, S.E', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(608, '16/S2', '51621120064', 'SARAH FELIA DWIAYUNI', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(609, '16/S2', '51621120019', 'NURMAN NASRULLAH MA\'RUF, S.E.', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(610, '16/S2', '51621120018', 'WILDA MAYA SUSANTI, S.E., Ak', '95', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(611, '16/S2', '51621120049', 'ARUM ANGGGITA', '80', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(612, '16/S2', '51621120045', 'VERA MARDIANA', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(613, '16/S2', '51621120020', 'EDWIN GUNAWAN', '92.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(614, '16/S2', '51621120066', 'WAHYUDI JAYA KUSUMA', '82.5', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(615, '16/S2', '51621120044', 'NAUFAL ANIS HILMY', '80', 'Passed', 'REG B2', '7/23/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(616, '16/S2', '51621120058', 'DEWI KURNIANINGSIH', '75', 'Passed', 'REG B2', '7/26/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Rita Yuniarti, Dr., S.E., M.M., Ak., C.A.'),
(617, '19/S1', '1919101023', 'TAUFIK MUSTOPA GANI', '70', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(618, '19/S1', '1919101017', 'MARIYO RAMADHAN', '80', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(619, '19/S1', '1919101004', 'DISTY ZULCHUMAIROH NURHASANTI', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(620, '19/S1', '1919101008', 'KANDIGA ILMAN HUDA', '82.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(621, '19/S1', '1919101022', 'RENITA AYU KHASANAH', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(622, '19/S1', '1919101026', 'RAFLY FEBRIANSYAH PAATH', '95', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(623, '19/S1', '1919101005', 'YULIA MEGA PUSPITA DEWI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(624, '19/S1', '1919101019', 'AHMAD FAQIH ABDILLAH', '62.5', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Agatha Rinta Suhardi, S.Si., M.M.'),
(625, '19/S1', '1919101011', 'NICHOLAS NALDO NOVANTO', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(626, '19/S1', '1919101009', 'DEDE KURNIA', '60', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Agatha Rinta Suhardi, S.Si., M.M.'),
(627, '19/S1', '1919101012', 'DINDA NOURMA SURYANI', '77.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(628, '19/S1', '1919101006', 'REKSHA ANDARU PUTRI', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(629, '19/S1', '1919101010', 'CHANDRA TRYADI PUTRA', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(630, '19/S1', '1919101007', 'ANJAR MUHAMMAD BUDIMAN', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(631, '19/S1', '1919101013', 'BIBIT BOI BRILIAN', '77.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(632, '19/S1', '1919101029', 'MOHAMAD FAKHIRA HASAN', '72.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(633, '19/S1', '1919101014', 'MUHAMAD SYAHDAN AKBAR NUGRAHA', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(634, '19/S1', '1919101021', 'HAIDAR MEGAHENDI FATMANA', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Agatha Rinta Suhardi, S.Si., M.M.'),
(635, '05/S1', '0520101021', 'MONICA AGUSTINA SINAGA', '94.3', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(636, '05/S1', '0520101004', 'RIZKI ALIMAN NAZWA', '98.6', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(637, '05/S1', '0520101029', 'KHOERUL ANAM', '42.9', 'Failed', 'REG A', '7/4/2022', 'ONLINE', 'A', NULL, 'Asep Anwar, S.T., M.T.'),
(638, '05/S1', '0520101022', 'GALANG ANANTA BAHARI', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(639, '05/S1', '0520101025', 'MOCH ANDREA SAPUTERA RUKMANA', '81.4', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(640, '05/S1', '0520101034', 'LUCKY ANWAR RAMADHAN', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(641, '05/S1', '0520101035', 'PUGUH APRIAN PRAMARTHA', '95.7', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(642, '05/S1', '0520101032', 'SILVIA APRIANDANI', '97.1', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(643, '05/S1', '0520101028', 'SHONADA ARSY', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(644, '05/S1', '0520101009', 'SABIQUL CHOIR RIZKY RAMADHAN', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(645, '05/S1', '0520101023', 'MARSELO DELPIERO NAMOTEMO', '87.1', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(646, '05/S1', '0520101006', 'ALVIN FATURAHMAN', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(647, '05/S1', '0520101031', 'ZAKI FUADI', '87.1', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(648, '05/S1', '0520101002', 'TEGAR GAGAT DIWANGKORO', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(649, '05/S1', '0520101033', 'LUTHFI IBRAHIM', '70', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(650, '05/S1', '0520101011', 'FAZRI ILFI RAMDANSYAH', '91.4', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(651, '05/S1', '0520101019', 'GINA ISLAMAYA ARIYANTI', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(652, '05/S1', '0520101005', 'HENDRAWAN KUSUMAWARDANA', '78.6', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(653, '05/S1', '0520101008', 'MUHAMMAD MAHDAN IZZANUDDIN', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(654, '05/S1', '0520101036', 'RIZKY MOHAMAD HANIF', '28.6', 'Failed', 'REG A', '7/4/2022', 'ONLINE', 'A', NULL, 'Asep Anwar, S.T., M.T.'),
(655, '05/S1', '0520101026', 'SHIDQI MUHAMMAD ZAINI AMARDHAN', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(656, '05/S1', '0520101007', 'AGAN NAUF', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(657, '05/S1', '0520101014', 'ILHAM PANGESTU', '91.4', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(658, '05/S1', '0520101017', 'ADRIAN PRATHAMA SAPUTRA', '97.1', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(659, '05/S1', '0517101011', 'AGA PURWANA SAEPUDIN', '62.9', 'Failed', 'REG A', '7/4/2022', 'ONLINE', 'A', NULL, 'Asep Anwar, S.T., M.T.'),
(660, '05/S1', '0520101013', 'ADELIA RACHMAWATI', '100', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(661, '05/S1', '0520101010', 'ERLANGGA RAKA PRATAMA', '74.3', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(662, '05/S1', '0520101027', 'IHWAL RAMADHAN', '85.7', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(663, '05/S1', '0520101003', 'TIA SEPTIANI', '98.6', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(664, '05/S1', '0520101016', 'ARDI SUHAEDAR', '82.9', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(665, '05/S1', '0520101012', 'EGA TIRTANA', '95.7', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(666, '05/S1', '0519101026', 'HIKMAT VALIANTO GEA', '77.1', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(667, '05/S1', '0520101001', 'MAULANA YUSUF CHAELALLAH', '98.6', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(668, '05/S1', '0520101015', 'IRFAN ZAHRA MEDICHAFIAN', '95.7', 'Passed', 'REG A', '7/4/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Asep Anwar, S.T., M.T.'),
(669, '02/S1', '0219101052', 'ANIDA SITI NURHANIFAH', '97.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(670, '02/S1', '0219101144', 'NAUFAL LUTHFI SAPUTRA', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(671, '02/S1', '0219101147', 'NURUL HASNA ANINDA WARDHANI', '82.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(672, '02/S1', '0219101062', 'NURUL HOVIPAH', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(673, '02/S1', '0219101056', 'ANISAH AULIA', '100', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(674, '02/S1', '0219101149', 'AGIS TEGUH PRIBADI', '80', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(675, '02/S1', '0219101048', 'ALOYSIUS IVANKA SANTOSA', '92.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(676, '02/S1', '0219101047', 'EVANGELIUS HANS WIGUNA', '92.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(677, '02/S1', '0219101337', 'DELIMA PUTRI TARAKANITA', '92.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(678, '02/S1', '0219101148', 'MUHAMMAD FIRGY', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(679, '02/S1', '0219101152', 'GIO HADI UTAMA', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(680, '02/S1', '0219101146', 'ALDRIK RIFKY PRATAMA', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(681, '02/S1', '0218101146', 'RIZKI MUBARIK', '55', 'Failed', 'REG A', '7/14/2022', 'ONLINE', 'A', NULL, 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(682, '02/S1', '0219101132', 'DWIZHA KHAIRINISYA', '87.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(683, '02/S1', '0219101046', 'DANIEL EXAUDI CHRISTIAN', '92.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(684, '02/S1', '0219101145', 'AZIZA NABILA AMALIA', '82.5', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(685, '02/S1', '0219101445', 'ADISFI LAELA KURNIA', '85', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(686, '02/S1', '0215101315', 'ION PAHLEVI', '50', 'Failed', 'REG A', '7/14/2022', 'ONLINE', 'A', NULL, 'Ayuningtyas Yuli Hapsari, S.Ip., M.M.'),
(687, '01/S1', '0116101114', 'ALFONSIUS CH ALEXANDRO RAMBA', '62.5', 'Failed', 'REG A', '7/13/2022', 'ONLINE', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(688, '01/S1', '0119101088', 'ALSYA PUTRI SALIHA', '80', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(689, '01/S1', '0119101086', 'VITA FATHIA LATIEF', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(690, '01/S1', '0119101073', 'GHEA CLARIZA SYUHADA', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(691, '01/S1', '0117101104', 'FARELIN AVIANTI', '60', 'Failed', 'REG A', '7/13/2022', 'ONLINE', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(692, '01/S1', '0119101102', 'DHONA SILVI FITRIANI', '80', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(693, '01/S1', '0116101211', 'RAVEL ALMAY HARIRI', '85', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(694, '01/S1', '0117101165', 'MUHAMMAD FARDIAZ IKHSAN', '65', 'Failed', 'REG A', '7/13/2022', 'ONLINE', 'D', NULL, 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(695, '01/S1', '0119101105', 'ALYA TRINANDYA ROSHA BUN YANI', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(696, '01/S1', '0119101089', 'AQILLA FADIA HENDRI', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(697, '01/S1', '0119101072', 'RAGA AHLIL FIKRI', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(698, '01/S1', '0119101099', 'RESMA NAMIRA ANJANI', '80', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(699, '01/S1', '0119101101', 'VINDA NURREZIVANKA RUDIANA', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(700, '01/S1', '40121110034', 'PUPUNG PURNAMA ', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(701, '01/S1', '0119101091', 'RISKA MARTENIA', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(702, '01/S1', '0119101116', 'AKBAR PRIANJAYA PRABOWO', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(703, '01/S1', '0115101538', 'MARISHA MANDHASARY ', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(704, '01/S1', '0119101104', 'FACHRI ADRIANSYAH', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(705, '01/S1', '0119101106', 'RAMADHANI ZAFRAN', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(706, '01/S1', '0119101103', 'SHELYA FITRI', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.'),
(707, '19/S1', '1920101008', 'BAIQ NUZWELA TRIKUNI', '67.1', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(708, '19/S1', '1920101017', 'RIVA SADILA', '60', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(709, '19/S1', '1920101022', 'JASON VICENTE DE SOUSA PEREIRA', '51.4', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(710, '19/S1', '1920101001', 'TANTAN RUMANSYAH', '61.4', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(711, '19/S1', '1920101012', 'ILHAM AWALUDIN', '47.1', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(712, '19/S1', '1920101004', 'HAMZAH HIDAYATULLOH', '55.7', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(713, '19/S1', '1920101003', 'MILNA SAHARANI', '77.1', 'Passed', 'REG A', '7/12/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(714, '19/S1', '1920101007', 'JERI ARDIANSYAH SUTRA', '52.9', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(715, '19/S1', '1920101016', 'WELLY GUNAWAN INDRAWANSYAH', '52.9', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(716, '19/S1', '1920101006', 'MUHAMMAD TASLIM', '61.4', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(717, '19/S1', '1920101002', 'PRYANKA SHARMA WULAN', '64.3', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(718, '19/S1', '1920101009', 'ADIKA VICKY ARYULIANTO', '50', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(719, '19/S1', '1920101013', 'WILDAN ERDIANSYAH', '52.9', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(720, '11/S1', '1119101036', 'SABILLA REZA PANGESTIKA', '87.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(721, '11/S1', '1119101008', 'DANNY AULIA NUR MUHAMAD', '95', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(722, '11/S1', '1119101026', 'FARKHAN TAUFIQURRAHMAN', '85', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(723, '11/S1', '1119101031', 'TAZKIA HEMALIA JAYANTI', '90', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(724, '11/S1', '1119101024', 'SRI ENDAH WULANDARI', '90', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(725, '11/S1', '1119101018', 'TRIANDINI PRAMUDITA', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(726, '11/S1', '1119101034', 'DANDA MESY EKATALIA', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(727, '11/S1', '1119101001', 'VANESSA JESSLYN SUYANTO', '85', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(728, '11/S1', '1119101038', 'JHOEL ERICSON SIMAJUNTAK', '82.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(729, '11/S1', '1119101021', 'TEGUH DWI PUTRA SETIAWAN', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(730, '11/S1', '1119101039', 'FAIZAL ', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(731, '11/S1', '1119101037', 'RAMADHAN PERDANA', '77.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(732, '11/S1', '1119101006', 'JESICHA LESTARI HUTAHAEAN', '72.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(733, '11/S1', '1119101025', 'MUHAMMAD REZKI', '82.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(734, '11/S1', '1119101042', 'RAMDHI KHAIRUL RASYID', '90', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Muhammad Benny Chaniago, S.T., M.Kom.'),
(735, '01/S1', '0119101139', 'SALMA SHAFIRA', '95', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(736, '01/S1', '0119101085', 'SUCI TRI WAHYUNI', '92.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(737, '01/S1', '0119101114', 'AYU PUTRI FAUZIAH', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(738, '01/S1', '0119101111', 'NAZIRA AGNIA INDRIYANI', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(739, '01/S1', '0119101121', 'ASTRI WULANDARI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(740, '01/S1', '0119101108', 'FARHAN RASYID ALFAREZA', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(741, '01/S1', '0119101009', 'DIVA PUTRI SYIFANIA', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(742, '01/S1', '0119101115', 'VERAWATI FEBRIANI SASMITA', '92.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(743, '01/S1', '0119101136', 'MESA ARMILA', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(744, '01/S1', '0119101137', 'SENITA ARDIYA RAMADINI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(745, '01/S1', '0119101098', 'MIRA AMALIYAH', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(746, '01/S1', '0119101130', 'SHIRLEY MARTINI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(747, '01/S1', '0119101113', 'ALFITRI MAULINA', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(748, '01/S1', '0119101154', 'PINDONTA JEREMIA NICOLAS EDRO', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(749, '01/S1', '0119101123', 'FATHIYA RAHMATIKA SUPRIYANTO', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(750, '01/S1', '0119101129', 'JIHAN AYU LESTARI', '92.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(751, '01/S1', '0119101048', 'RADEN ARIEF NIZAM KAMIL', '92.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(752, '01/S1', '0119101126', 'SASKA SALSADILLA KURNIAWAN', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(753, '01/S1', '0119101124', 'MUTIARA NUR INSANI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(754, '01/S1', '0119101107', 'SANTI MITA NIAR', '82.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(755, '01/S1', '0119101166', 'RIZKY ADI AFRIAN', '82.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(756, '01/S1', '0119101125', 'SINTYA AMELIA PUTRI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(757, '01/S1', '0119101035', 'FINCY LASMARIA SITANGGANG', '25', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(758, '01/S1', '0119101171', 'SHAFA SALSABILA QATRUNNADA', '82.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(759, '01/S1', '0119101164', 'SITI DEWISARI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Mirna Dianita, S.E., M.M., Ak., Ca.'),
(760, '01/S1', '40121100026', 'IQBAL DWI JULIANTO ', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(761, '01/S1', '40121100003', 'HAFIZH DZULFIQAR SETIADI ', '72.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(762, '01/S1', '40121100138', 'SILMA APRELIA PUTRI ', '85.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(763, '01/S1', '40121100157', 'RADEN MUHAMMAD ADAM ', '85.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(764, '01/S1', '0118101305', 'DESI DEBORA', '71.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(765, '01/S1', '40121100147', 'DANIEL HALOMOAN SILAEN ', '52.9', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(766, '01/S1', '40121100009', 'ALIFIANI SUNKE SUMADI ', '87.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(767, '01/S1', '40121100169', 'MOCHAMMAD RAKHA PRIBADI ', '74.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(768, '01/S1', '40121100007', 'ALISHA PUTRI AULIA ', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(769, '01/S1', '40121100037', 'SYIFA SYAADAH ', '97.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(770, '01/S1', '40121100127', 'RESNA FERNANDES ', '92.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(771, '01/S1', '0118101303', 'DANIEL EDRIANTO SAGALA', '64.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(772, '01/S1', '0118101055', 'ISLAMIARTHA AFRAH', '48.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(773, '01/S1', '40121190005', 'SEPHIA PUTRI PERTIWI ', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(774, '01/S1', '40121100020', 'ADELLIA FITRI AMALLIA ', '68.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(775, '01/S1', '40121190001', 'NISA NUR AFIAT ', '38.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(776, '01/S1', '0118103020', 'AZIZ ASHARI', '81.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(777, '01/S1', '40121100119', 'MARIA YUNIKASTIKA SOMI PIRAN ', '48.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(778, '01/S1', '40121100004', 'NICKY PUTRA PAMUNGKAS ', '95.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(779, '01/S1', '40121100016', 'NATASYA AMELIA PUTRI ', '58.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(780, '01/S1', '40121100001', 'HIKARI PERMANA PUTRI ', '45.7', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(781, '01/S1', '40121100134', 'BAYU IRAWAN SATRIA ', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(782, '01/S1', '40121100162', 'ADINDA SINTYA MAHARANI ', '67.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(783, '01/S1', '40121100163', 'MUHAMMAD AFRIZAL ', '97.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(784, '01/S1', '40121100019', 'EKA AKBAR NUROHIM ', '75.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(785, '01/S1', '40121100143', 'KRIVAN MATHEUS SARAGI ', '84.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(786, '01/S1', '40121180005', 'TRI NOVIANDI ', '47.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(787, '01/S1', '40121100145', 'PUTRI RAISHA MAHARANI SUTRISNO ', '50', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(788, '01/S1', '40121100133', 'HALIMATUNISA AWALIYAH ADZHARI ', '88.6', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(789, '01/S1', '40121100008', 'CITRA NUR \\\'AENI ', '41.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(790, '01/S1', '40121190002', 'MUHAMMAD FAJAR RAMDAN ', '65.7', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(791, '01/S1', '40121100167', 'MOHAMMAD RADITYA WIBISANA ', '91.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(792, '01/S1', '40121100170', 'SALSA PUTRI SABILLA ', '35.7', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(793, '01/S1', '40121100156', 'AKHSAN HILMAN RAMDANI ', '41.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(794, '01/S1', '40121100215', 'NAJWAHAYU PUTRI SHALIHA ', '97.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(795, '01/S1', '40121100176', 'FAJAR PUTERA MAHARDIKA ', '55.7', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(796, '01/S1', '40121100095', 'LUTHFIANY SANDIKA PUTRI ', '42.9', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(797, '01/S1', '40121100052', 'NAZWA KANIA ALIANI ', '58.6', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(798, '01/S1', '40121100068', 'TRINITA NUR SALSABILA RUSTIADI ', '60', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(799, '01/S1', '40121100079', 'TAHSYA TAQIYYA TAJUDIN ', '67.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(800, '01/S1', '40121100057', 'DINA NURUL MADINAH ', '78.6', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(801, '01/S1', '40121100061', 'NABILLA PUTRILIANI ', '72.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(802, '01/S1', '40121100078', 'ZAHRA NUR AQILAH ', '61.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(803, '01/S1', '40121100085', 'INDY PISCESKA ', '74.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(804, '01/S1', '40121100104', 'SISKA WIDYA AYU TANIA ', '82.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(805, '01/S1', '40121100054', 'NAVELA NOOR IHSANI AZ-ZAHRA ', '74.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(806, '01/S1', '40121100024', 'FRISKA EKA YULIANA ', '67.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(807, '01/S1', '40121100012', 'ALMA AISHA SALSABILA ', '61.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(808, '01/S1', '40121100098', 'FATHARANI ALIYA ', '88.6', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(809, '01/S1', '40121100109', 'ALYA KHOIRUNNISA KUSUMA INDRA PUTRI ', '44.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(810, '01/S1', '40121100082', 'MAURA PUTRI HARDIANTI ', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(811, '01/S1', '40121100091', 'TRI WIDIA ', '64.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(812, '01/S1', '40121100073', 'ERVIRA ANJELIKA ', '71.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(813, '01/S1', '40121100077', 'YOLAN DITA PUTRI AMBALIKA ', '47.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(814, '01/S1', '0116101114', 'ALFONSIUS CH ALEXANDRO RAMBA', '51.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(815, '01/S1', '40121100081', 'ALETTA FADZALIKA NURIZA ', '81.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(816, '01/S1', '40121100116', 'CHERI NUR MEILINDA ', '80', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(817, '01/S1', '40121100067', 'RIMA NABILA SEPTIRYANI ', '78.6', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(818, '01/S1', '40121100058', 'THARADILLA AZZAHRA ', '42.9', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.');
INSERT INTO `sertifikat_excel` (`id`, `kode`, `nim`, `nama`, `nilai`, `result`, `reguler`, `tanggal_ujian`, `ruangan`, `kelas`, `status`, `nama_dosen`) VALUES
(819, '01/S1', '40121100022', 'DILA PUSPITASARI ', '54.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(820, '01/S1', '40121100120', 'RAHMANI WULANDARI ', '82.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(821, '01/S1', '40121100092', 'JACQUELINE ANTONIA FIRSTAN P ', '78.6', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(822, '01/S1', '40121100088', 'MUHAMMAD RIQFIE AULIA ', '81.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(823, '01/S1', '40121100094', 'BIRGITA RANI TRIANI SIHALOHO ', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(824, '01/S1', '40121100132', 'PUTRI ZAHRAH TARISHAH ', '51.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(825, '01/S1', '40121100010', 'PRATIWI WIDIANINGSIH ', '80', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(826, '01/S1', '40121100076', 'CHIKA SEYLA GADIS MULYANA ', '67.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(827, '01/S1', '40121100106', 'NAUFAL RAIHANA ', '42.9', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(828, '01/S1', '40121100074', 'CHELSEA YUNIAR RAHARJA ', '72.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(829, '01/S1', '0118101301', 'ALWAN DZAKI FADHILLAH HERMAN', '60', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(830, '01/S1', '40121100136', 'HAYKAL TRENGGONO PUTRO ', '40', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(831, '01/S1', '0119101061', 'SHANIA TILAVANY GULTOM', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(832, '01/S1', '0119101031', 'LENI MARLINA', '75', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(833, '01/S1', '0119101109', 'MAYU JANNAH FIRDAUS', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(834, '01/S1', '0119101024', 'MUHAMAD ADAM PALMALEO', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(835, '01/S1', '0119101069', 'FADYA NOOR FADHILAH', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(836, '01/S1', '0119101165', 'DWI SAHLA NURAINI', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(837, '01/S1', '0119101082', 'DIANA RESTU LESTARI', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(838, '01/S1', '0119101018', 'SYIFA FITRIYANI AZZAHRA', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(839, '01/S1', '0119101070', 'SHANIA FITRIA AZIZA', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(840, '01/S1', '0119101092', 'HERLINA AYU PERMATASARI', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(841, '01/S1', '0119101046', 'NANDITHA MYESA HAIDAR', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(842, '01/S1', '0119101022', 'ANNISA NUR RAHIM', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(843, '01/S1', '0119101012', 'LUCI SEPTIANTI', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(844, '01/S1', '0119101004', 'HAWA AZ-ZAHRA KIFAYAH', '75', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(845, '01/S1', '0119101071', 'GHINA KHAIRUNNISA', '77.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(846, '01/S1', '0119101177', 'ELYSSA FIQRI FAUZIAH', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(847, '01/S1', '0119101167', 'NISSA YUNIAR NUR ALIFAH', '85', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(848, '01/S1', '0119101068', 'ALDINI NURUL AIDHA', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(849, '01/S1', '0119101067', 'FATHUR ARSIADJIENOVANTO', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(850, '01/S1', '0119101010', 'DODI HERMAWAN', '82.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(851, '01/S1', '0119101074', 'TEESY WULANDARI', '100', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(852, '01/S1', '0119101043', 'FIDYA ALFIANTI RANITA', '100', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(853, '01/S1', '0119101078', 'VIONA SALSABILA AZIZ', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(854, '01/S1', '0119101037', 'SUCI RAHMA WATI', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(855, '01/S1', '0119101080', 'RAIHAN ARYANTO', '82.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(856, '01/S1', '0119101013', 'AZHAR FAUZI SUHERMAN', '100', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(857, '01/S1', '0119101075', 'CHARISMA INDAH PRATIWI', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(858, '01/S1', '0119101087', 'LUTFI AJENG MULYANI', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(859, '01/S1', '0119101014', 'RIZKA AMALIA', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(860, '01/S1', '0119101162', 'ALLYA NADIA ITRA ARDANA PUTRI', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(861, '01/S1', '0119101060', 'BAYU KURNIA', '90', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(862, '01/S1', '0119101019', 'MIKE AYUNI LESTARI', '95', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(863, '01/S1', '0119101169', 'FIRDHA AMELIA PUTRI', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(864, '01/S1', '0119101036', 'YOELANDA ASRI SITOHANG', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(865, '01/S1', '0119101055', 'VIOLIETA WICAKSONO PUTRI', '92.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(866, '01/S1', '0119101027', 'ADITYA SIDIQ NURSYANI', '87.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(867, '01/S1', '0119101077', 'SUCI FITRIA CISADANI', '97.5', 'Passed', 'REG A', '7/13/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(868, '01/S1', '0119101056', 'RIFKI PUTRA PRATAMA', '40', 'Failed', 'REG A', '7/13/2022', 'ONLINE', 'A', NULL, 'Niki Hadian, H., S.E., M.M., Ak., Ca.'),
(869, '01/S1', '0119101047', 'PUTRI NATASYA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(870, '01/S1', '0119101158', 'ANDY DIPRAJA NUGRAHA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(871, '01/S1', '0119101119', 'SEVILA ANGGRAENI', '87.50', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(872, '01/S1', '0119101163', 'RISKA ALIPAH', '97.50', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(873, '01/S1', '0119101131', 'CIKA THALITA KESIA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(874, '01/S1', '0119101045', 'MITA APRILIYANI', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(875, '01/S1', '0119101050', 'ERINDA SRIULINA PURBA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(876, '01/S1', '0119101054', 'MEGA SIMANJORANG', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(877, '01/S1', '0119101003', 'SHEIKA VILLYANTI MEILIA WIJAYA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(878, '01/S1', '0119101005', 'NOVIKA DEA NABILA PUTRI', '90.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(879, '01/S1', '0119101029', 'SISKA SILVIANI DESKA', '75.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(880, '01/S1', '0119101038', 'LISNAWATI DEWI APRIYANI', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(881, '01/S1', '0119101173', 'GEBY ELENA REFKA.S', '85.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(882, '01/S1', '0119101052', 'DINI RAHAYU', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(883, '01/S1', '0119101118', 'RAFI MOHAMAD RAMADHAN', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(884, '01/S1', '0119101122', 'SAYYID KEMAL FAZA', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(885, '01/S1', '0119101079', 'RUNY SUFHI ADAWIYAH', '95.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(886, '01/S1', '0119101095', 'NADA HANA MAISA', '95.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(887, '01/S1', '0119101083', 'MERY NUR MARYAMAH', '95.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(888, '01/S1', '0119101093', 'INDAH NURMALA SARI', '95.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(889, '01/S1', '0119101094', 'ELSA KRISTINA', '95.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(890, '01/S1', '0119101174', 'ANISHA FERA WATI SIBURIAN', '100.00', 'Passed', 'REG A', '7/6/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(891, '01/S1', '40121100017', 'PUTRI UTARI', '84.29', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(892, '01/S1', '40121100036', 'RAIHAN AHMAD YUNUS', '84.29', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(893, '01/S1', '40121100032', 'FARREL BRILLIANT', '80', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(894, '01/S1', '40121100021', 'SHENY SHABRYNAH LESMANA', '85.71', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(895, '01/S1', '40121100089', 'SITUMORANG CHRISTIAN RONALDO HASIAN', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(896, '01/S1', '40121100038', 'MUHAMMAD FAUZI', '75.71', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(897, '01/S1', '40121100083', 'FYRZA AULIA RAHMA', '84.29', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(898, '01/S1', '40121100086', 'CLAUDIUS AKRI SIMAR', '48.57', 'Failed', 'REG A', '7/14/2022', 'ONLINE', 'C', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.'),
(899, '01/S1', '40121100060', 'SALMA NABILLAH NUR FAJRINA', '90', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(900, '01/S1', '40121100039', 'INTAN JUWITA', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(901, '01/S1', '40121100062', 'DARIN JANUARY KHAIRUNNISA', '88.57', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(902, '01/S1', '40121100153', 'SARTIKA JEREMY AUDINE SITOMPUL', '82.86', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(903, '01/S1', '40121190004', 'PUTRI RAHAYU PUJIANINGSIH', '81.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(904, '01/S1', '40121100190', 'GHINA KHOIRUNNISA SAMMARY', '81.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(905, '01/S1', '40121100186', 'DIVA LINDIATRI BOSEREN', '34.29', 'Failed', 'REG A', '7/14/2022', 'ONLINE', 'C', NULL, 'Paulus Sugianto Yusuf, S.E., M.T.'),
(906, '01/S1', '40121100075', 'EVA NUR ASYIFA', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(907, '01/S1', '40121100018', 'NATALIA ROULINA SITOHANG', '81.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(908, '01/S1', '40121100064', 'DANG NIAR HASANAH', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(909, '01/S1', '40121100005', 'MEILA RAYU ANDINI', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(910, '01/S1', '40121100014', 'ANGELINA RESTI BAHY', '92.86', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(911, '01/S1', '40121100013', 'MOCH FAISAL UQBAH', '80', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(912, '01/S1', '40121100181', 'TRIA AMALIA MAULANI', '78.57', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(913, '01/S1', '40121100164', 'ZERLINA SABELA', '85.71', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(914, '01/S1', '40121100126', 'TIYO MUHAMAD AKMAL', '75.71', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(915, '01/S1', '40121100100', 'SYARIFUDIN', '91.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(916, '01/S1', '40121100084', 'AMELIA FAUZIYAH RAHMAH', '78.57', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(917, '01/S1', '40121100123', 'YENI NURLAELA', '77.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(918, '01/S1', '40121100023', 'REGINA ARIFANI HERMAWAN', '71.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(919, '01/S1', '40121100128', 'ROY GUNAWAN ABDINILLAH', '81.43', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(920, '01/S1', '40121100184', 'MALVA RADELLA ANDRIANI', '84.29', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(921, '01/S1', '40121100174', 'TIARA FEBRYANTI', '87.14', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'C', 'PROSES CETAK', 'Paulus Sugianto Yusuf, S.E., M.T.'),
(922, '11/S1', '1119101002', 'SANJAYA ', '77.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(923, '11/S1', '1119101016', 'HAIFA FAUZIYYAH', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(924, '11/S1', '1119101015', 'RICKY RAFI HERMEISAH', '85', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(925, '11/S1', '1119101003', 'SANDI YUSUF NURHUDA', '87.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(926, '11/S1', '1119101013', 'ULFATUL UYUN', '90', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(927, '11/S1', '1119101012', 'RIFIYAN AKBAR PRATAMA', '95', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(928, '11/S1', '1119101009', 'MUHAMMAD ALIEF MULYADIN', '85', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(929, '11/S1', '1119101005', 'RIZKY CHAERUNISSYA AJI', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(930, '11/S1', '1119101011', 'PUTRI RAHAYU FAUZI', '95', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(931, '11/S1', '1119101014', 'ALDI NURZAMAN', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(932, '11/S1', '1119101010', 'ANDANDI ', '92.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(933, '11/S1', '1119101017', 'INDAH MEGA UTAMI', '97.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(934, '11/S1', '1119101023', 'MARHAEN SALVATORE', '87.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(935, '11/S1', '1119101019', 'MUHAMAD APTA FADILLAH', '97.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(936, '11/S1', '1119101022', 'RIDHA MIFTAHUL FALAH', '87.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(937, '11/S1', '1119101030', 'BAGAS WICAKSONO', '77.5', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(938, '11/S1', '1119101029', 'DIMAS RIDHO AQSHAL', '100', 'Passed', 'REG A', '7/11/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sri Lestari, Ir.,M.T.'),
(939, '06/S1', '0619101047', 'MUTIARA NAFYSAH', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(940, '06/S1', '0619101033', 'VIANTY JULIA SURYANA PUTRI', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(941, '06/S1', '0619101035', 'SAFIRA MARDIYAH MUTAQIN', '90', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(942, '06/S1', '0619101043', 'MUHAMMAD NAUFAL FADLLUR ROHMAN', '100', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(943, '06/S1', '0619101040', 'RINALDY BUANA SAPUTRA', '100', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(944, '06/S1', '0619101022', 'REIHAN NAUFAL MUHADZDZIB', '97.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(945, '06/S1', '0619101047', 'MUTIARA NAFYSAH', '97.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(946, '06/S1', '0619101074', 'ROSYID ALRIDHO', '32.5', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'A', NULL, 'Sukenda, S.Kom., M.T.'),
(947, '06/S1', '0619101041', 'RIAN RISNANDAR HERWANDI', '87.5', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(948, '06/S1', '0619101052', 'ALIP TAUFIQ AKBAR', '57.5', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Sukenda, S.Kom., M.T.'),
(949, '06/S1', '0619101034', 'MUHAMAD YANDI', '62.5', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'B', NULL, 'Sukenda, S.Kom., M.T.'),
(950, '06/S1', '0619101050', 'MUHAMAD ADYAPUTRA YOSTIRA', '85', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'B', 'PROSES CETAK', 'Sukenda, S.Kom., M.T.'),
(951, '06/S1', '0619101078', 'MALIK ROSYDIN', '47.5', 'Failed', 'REG A', '7/13/2022', 'ONLINE', 'B', NULL, 'Sukenda, S.Kom., M.T.'),
(952, '20/S1', '2020101011', 'MUHAMAD ZAELANI', '81.47', 'Passed', 'REG A', '7/12/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Suryana, S.E., M.Ak.'),
(953, '20/S1', '2020101005', 'YAN PREDIMERI', '42.97', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Suryana, S.E., M.Ak.'),
(954, '20/S1', '2020101004', 'DZICKRY FAUZAN', '70.06', 'Passed', 'REG A', '7/12/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Suryana, S.E., M.Ak.'),
(955, '20/S1', '2020101007', 'ALFIQRI RAZAK FIRMANSYAH', '67.21', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Suryana, S.E., M.Ak.'),
(956, '20/S1', '2020101009', 'RAJA SUBAGJA', '62.32', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Suryana, S.E., M.Ak.'),
(957, '20/S1', '2020101006', 'EDO PERMADI', '47.25', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Suryana, S.E., M.Ak.'),
(958, '20/S1', '2020101008', 'FERRY ROHENDI', '80.04', 'Passed', 'REG A', '7/12/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Suryana, S.E., M.Ak.'),
(959, '20/S1', '2020101001', 'DANII NAUFAL NUR RIZKI', '78', 'Passed', 'REG A', '7/12/2022', 'ONLINE', 'A', 'PROSES CETAK', 'Suryana, S.E., M.Ak.'),
(960, '20/S1', '2020101003', 'RIZKY RAMADHAN', '32.79', 'Failed', 'REG A', '7/12/2022', 'ONLINE', 'A', NULL, 'Suryana, S.E., M.Ak.'),
(961, '01/S1', '40121100065', 'NASYWA JENIA PUTRI', '81.4', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(962, '01/S1', '40121100025', 'ANDINI CAHYA LIDYA', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(963, '01/S1', '40121100144', 'AMALIA SOLICHAH', '74.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(964, '01/S1', '40121100028', 'SYANIFA SYALMA NURHAKIM', '67.1', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'E', NULL, 'Yoga Tantular Rachman, S.E., M.Si.'),
(965, '01/S1', '40121100063', 'YESSIKA RIZKI AMELIA', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(966, '01/S1', '40121100040', 'FIKA TRESNASARI KUSNANDAR', '87.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(967, '01/S1', '40121100117', 'LUTHFIANI SUCI FEBRIANTI', '64.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'E', NULL, 'Yoga Tantular Rachman, S.E., M.Si.'),
(968, '01/S1', '40121100047', 'ADITYA WIN SEPRIZAL', '72.9', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(969, '01/S1', '40121100140', 'GHAITSAA TRI AHSANI TAQWIM', '64.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'E', NULL, 'Yoga Tantular Rachman, S.E., M.Si.'),
(970, '01/S1', '40121100044', 'SABRINA ERIKA PUTRI HIDAYAT', '77.1', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(971, '01/S1', '40121100139', 'BAIHAQI RIOFIANDI', '75.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(972, '01/S1', '40121100121', 'LISTA AYU FEBRIYANTI', '84.3', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(973, '01/S1', '40121100155', 'ALZENA ASHA ERWINDA', '41.4', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'E', NULL, 'Yoga Tantular Rachman, S.E., M.Si.'),
(974, '01/S1', '40121100093', 'MUHAMAD ZIDAN A. SAYUTI', '70', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(975, '01/S1', '40121100130', 'M. RAYHAN AULIA', '85.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(976, '01/S1', '40121100090', 'SANDYA YUDHA UTAMA', '75.7', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(977, '01/S1', '40121100113', 'KARINA TRINURMEIDIANI', '70', 'Passed', 'REG A', '7/7/2022', 'ONLINE', 'E', 'PROSES CETAK', 'Yoga Tantular Rachman, S.E., M.Si.'),
(978, '01/S1', '40121100125', 'DENI DAHYADI', '64.3', 'Failed', 'REG A', '7/7/2022', 'ONLINE', 'E', NULL, 'Yoga Tantular Rachman, S.E., M.Si.'),
(979, '01/S1', '0115101538', 'Marisha Mandhasary', '91.4', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Yogo Heru Prayitno, S.E., M.Si.'),
(980, '01/S1', '0119101120', 'Silfester Heriyanto Simarmata', '90', 'Passed', 'REG A', '7/14/2022', 'ONLINE', 'D', 'PROSES CETAK', 'Yogo Heru Prayitno, S.E., M.Si.');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_produk` varchar(255) DEFAULT NULL,
  `id_sertifikat` int(5) UNSIGNED DEFAULT NULL,
  `qty` int(5) UNSIGNED NOT NULL,
  `harga` int(100) NOT NULL,
  `konfirmasi` int(11) NOT NULL,
  `tanggal_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `id_jurusan` int(5) UNSIGNED NOT NULL,
  `reguler` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `nim`, `email`, `no_hp`, `id_jurusan`, `reguler`, `password`, `is_admin`) VALUES
(1, 'darth', '1234567890', 'darth@theempire.com', '08123456789', 1, 'A', '$2y$10$WQNTvWm/R.vcfuWQKZ1CNOxkeyLeqL2eNVi8KqZsRKB3igmnhXvjy', 1),
(3, 'dimas naufal', '0619101007', 'dimasf@gmail.com', '0895375455587', 10, '', '$2y$10$.CenNMaJXlTY4/LX9ifCjObxGDVYNaomM5C24uyeHccZAlu4N3d/y', 0),
(4, 'Gilang Pratama Putra', '0619101005', 'gipra33@gmail.com', '0895375455587', 1, '', '$2y$10$MHgKbZx3DkD8SCTHEvzjAup6.tdbd2zW4eS/G51Yeg23QvShe/zJC', 0),
(5, 'DESTA EKA ANASMUSA', '51621120028', 'destaeka123@gmail.com', '085221381402', 3, '', '$2y$10$JlWNEeGilZIQ9SaAJoKivOFalImiyBg22PYvmdHfaOG5CA7eYer7m', 0),
(6, 'VITA FATHIA LATIEF', '0119101086', 'vina@widyatama.ac.id', '085221381402', 10, '', '$2y$10$i0RqkDLZJ6pdTcIwGjInbeO7kCr2OgsGt7OuDgDdxWC7ndStiatY2', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id_fakultas_foreign` (`id_fakultas`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moduls`
--
ALTER TABLE `moduls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_modul` (`kode_modul`);

--
-- Indexes for table `moduls_in`
--
ALTER TABLE `moduls_in`
  ADD PRIMARY KEY (`id_in`),
  ADD KEY `id_moduls` (`id_moduls`);

--
-- Indexes for table `moduls_out`
--
ALTER TABLE `moduls_out`
  ADD PRIMARY KEY (`id_out`);

--
-- Indexes for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilai_sertifikat_sertifikat_id_foreign` (`sertifikat_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_sertifikat` (`kode_sertifikat`);

--
-- Indexes for table `sertifikat_excel`
--
ALTER TABLE `sertifikat_excel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopping_cart_id_user_foreign` (`id_user`),
  ADD KEY `shopping_cart_id_produk_foreign` (`id_produk`),
  ADD KEY `shopping_cart_id_sertifikat_foreign` (`id_sertifikat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD KEY `users_id_jurusan_foreign` (`id_jurusan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1347;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_id_fakultas_foreign` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id`);

--
-- Constraints for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  ADD CONSTRAINT `nilai_sertifikat_sertifikat_id_foreign` FOREIGN KEY (`sertifikat_id`) REFERENCES `sertifikat` (`kode_sertifikat`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `moduls` (`kode_modul`),
  ADD CONSTRAINT `shopping_cart_id_sertifikat_foreign` FOREIGN KEY (`id_sertifikat`) REFERENCES `nilai_sertifikat` (`id`),
  ADD CONSTRAINT `shopping_cart_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`nim`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_jurusan_foreign` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

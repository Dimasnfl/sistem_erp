-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 06:40 AM
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
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(5) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `judul`, `slug`, `body`, `img`) VALUES
(1, 'Contoh 15', 'contoh-15', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.<br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.<br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.<br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi porro modi at libero numquam eius est explicabo ex beatae, distinctio perferendis voluptatibus incidunt inventore quis rem nemo cum expedita reprehenderit pariatur. Dolorem beatae quisquam accusantium saepe dolorum sequi magni maxime sint aliquam, delectus, ipsam eos obcaecati illum. Id, enim harum.</div>', 'Screenshot (104).png'),
(2, 'lorem', 'lorem', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, itaque voluptates! Vero distinctio suscipit officiis odio pariatur eos, repudiandae laboriosam hic facere nam alias itaque mollitia voluptatum accusamus id repellat accusantium. Ipsam, dolore laborum nisi, voluptatibus sed, sequi aliquid perferendis minus officia harum iusto repudiandae? Assumenda molestias a atque rem nemo ab eaque ut, nihil officia quo tempora delectus vitae ullam laudantium obcaecati dicta perspiciatis necessitatibus eius tenetur ipsam velit, culpa neque excepturi expedita. Placeat quos aut hic perspiciatis reiciendis autem adipisci, sint dicta eos. Laudantium doloribus deleniti quasi nam. Laborum autem beatae culpa voluptate velit totam similique repudiandae eius, nobis ab vel voluptatem, aperiam sed magnam impedit hic, possimus atque illo nihil magni doloribus tempore. Fuga, ratione. Vel placeat minima laboriosam culpa quia explicabo unde! Ab voluptatibus vero at. Perferendis officiis rem maxime explicabo eligendi, aspernatur dignissimos deleniti ea nulla inventore praesentium dolorum officia? Optio quo maiores voluptates a.<br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, itaque voluptates! Vero distinctio suscipit officiis odio pariatur eos, repudiandae laboriosam hic facere nam alias itaque mollitia voluptatum accusamus id repellat accusantium. Ipsam, dolore laborum nisi, voluptatibus sed, sequi aliquid perferendis minus officia harum iusto repudiandae? Assumenda molestias a atque rem nemo ab eaque ut, nihil officia quo tempora delectus vitae ullam laudantium obcaecati dicta perspiciatis necessitatibus eius tenetur ipsam velit, culpa neque excepturi expedita. Placeat quos aut hic perspiciatis reiciendis autem adipisci, sint dicta eos. Laudantium doloribus deleniti quasi nam. Laborum autem beatae culpa voluptate velit totam similique repudiandae eius, nobis ab vel voluptatem, aperiam sed magnam impedit hic, possimus atque illo nihil magni doloribus tempore. Fuga, ratione. Vel placeat minima laboriosam culpa quia explicabo unde! Ab voluptatibus vero at. Perferendis officiis rem maxime explicabo eligendi, aspernatur dignissimos deleniti ea nulla inventore praesentium dolorum officia? Optio quo maiores voluptates a.<br><br></div><ol><li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, itaque voluptates! Vero distinctio suscipit officiis odio pariatur eos, repudiandae laboriosam hic facere nam alias itaque mollitia voluptatum accusamus id repellat accusantium. Ipsam, dolore laborum nisi, voluptatibus sed, sequi aliquid perferendis minus officia harum iusto repudiandae?&nbsp;</li><li>Assumenda molestias a atque rem nemo ab eaque ut, nihil officia quo tempora delectus vitae ullam laudantium obcaecati dicta perspiciatis necessitatibus eius tenetur ipsam velit, culpa neque excepturi expedita. Placeat quos aut hic perspiciatis reiciendis autem adipisci, sint dicta eos.&nbsp;</li><li>Laudantium doloribus deleniti quasi nam. Laborum autem beatae culpa voluptate velit totam similique repudiandae eius, nobis ab vel voluptatem, aperiam sed magnam impedit hic, possimus atque illo nihil magni doloribus tempore. Fuga, ratione. Vel placeat minima laboriosam culpa quia explicabo unde! Ab voluptatibus vero at.&nbsp;</li><li>Perferendis officiis rem maxime explicabo eligendi, aspernatur dignissimos deleniti ea nulla inventore praesentium dolorum officia? Optio quo maiores voluptates a.</li></ol>', 'Screenshot (265).png');

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
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_produk` varchar(255) DEFAULT NULL,
  `id_sertifikat` int(5) UNSIGNED DEFAULT NULL,
  `k_sertifikat` varchar(255) DEFAULT NULL,
  `k_jp` varchar(255) DEFAULT NULL,
  `qty` int(5) UNSIGNED NOT NULL,
  `harga` int(100) NOT NULL,
  `konfirmasi` int(11) NOT NULL,
  `tanggal_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(11, '2022-11-03-105541', 'App\\Database\\Migrations\\ShoppingCart', 'default', 'App', 1669270583, 2),
(12, '2022-11-09-161222', 'App\\Database\\Migrations\\NilaiSertifikat', 'default', 'App', 1669282209, 3),
(13, '2022-11-15-092028', 'App\\Database\\Migrations\\Artikels', 'default', 'App', 1670347416, 4),
(15, '2022-12-09-190835', 'App\\Database\\Migrations\\Notifications', 'default', 'App', 1670782996, 5),
(16, '2022-12-06-172009', 'App\\Database\\Migrations\\History', 'default', 'App', 1670867490, 6),
(17, '2022-12-12-162859', 'App\\Database\\Migrations\\NotifUser', 'default', 'App', 1670867503, 7);

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
(2, 'SAP-Fundamental', 'SAP01', 1, 50000),
(3, 'Business Processes in Management Accounting', 'AC040', 4, 65000),
(4, 'Business Processes in Financial Accounting', 'AC010', 12, 80000),
(5, 'Business Processes in Human Capital Management', 'HR050', 5, 85000),
(6, 'Introduction to the ABAP Workbench', 'BC400', 4, 65000),
(7, 'Business Processes in Sales Order', 'SCM600', 6, 60000),
(8, 'Business Processes in Procurement', 'SCM500', 5, 80000);

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
-- Dumping data for table `moduls_in`
--

INSERT INTO `moduls_in` (`id_in`, `id_moduls`, `qty`, `created_at`) VALUES
(1, 2, 10, '2022-11-24 13:36:19'),
(2, 3, 5, '2022-11-24 13:41:46'),
(3, 4, 70, '2022-11-24 15:30:12'),
(4, 4, 10, '2022-11-24 15:30:29'),
(5, 3, 4, '2022-12-13 12:26:39');

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
CREATE TRIGGER `insert_stok_modul` AFTER INSERT ON `moduls_in` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan + NEW.qty
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
  `jp` varchar(255) NOT NULL,
  `nilai` int(5) UNSIGNED NOT NULL,
  `tanggal_ujian` varchar(255) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `nim_user` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `reguler_user` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `ruangan` varchar(255) NOT NULL,
  `sertifikat_id` varchar(255) NOT NULL,
  `no_so` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `is_out` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nilai_sertifikat`
--

INSERT INTO `nilai_sertifikat` (`id`, `jp`, `nilai`, `tanggal_ujian`, `nama_user`, `nim_user`, `result`, `reguler_user`, `kelas`, `status`, `nama_dosen`, `ruangan`, `sertifikat_id`, `no_so`, `keterangan`, `is_out`) VALUES
(21, '01/S1', 83, '20 April 2022', 'ALYA TRINANDYA ROSHA BUN YANI', '0119101105', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(22, '01/S1', 85, '20 April 2022', 'DHONA SILVI FITRIANI', '0119101102', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(23, '01/S1', 95, '20 April 2022', 'VITA FATHIA LATIEF', '0119101086', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(24, '01/S1', 78, '20 April 2022', 'MUHAMMAD FARDIAZ IKHSAN', '0117101165', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(25, '01/S1', 93, '20 April 2022', 'FACHRI ADRIANSYAH', '0119101104', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(26, '01/S1', 93, '20 April 2022', 'RAGA AHLIL FIKRI', '0119101072', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(27, '01/S1', 95, '20 April 2022', 'AKBAR PRIANJAYA PRABOWO', '0119101116', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(28, '01/S1', 65, '20 April 2022', 'RAVEL ALMAY HARIRI', '0116101211', 'Failed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(29, '01/S1', 85, '20 April 2022', 'RESMA NAMIRA ANJANI', '0119101099', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(30, '01/S1', 93, '20 April 2022', 'SHELYA FITRI', '0119101103', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(31, '01/S1', 88, '20 April 2022', 'MARISHA MANDHASARY ', '0115101538', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(32, '01/S1', 95, '20 April 2022', 'VINDA NURREZIVANKA RUDIANA', '0119101101', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(33, '01/S1', 95, '20 April 2022', 'RISKA MARTENIA', '0119101091', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(34, '01/S1', 93, '20 April 2022', 'RAMADHANI ZAFRAN', '0119101106', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(35, '01/S1', 83, '20 April 2022', 'PUPUNG PURNAMA ', '40121110034', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(36, '01/S1', 63, '20 April 2022', 'AQILLA FADIA HENDRI', '0119101089', 'Failed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(37, '01/S1', 88, '20 April 2022', 'ALSYA PUTRI SALIHA', '0119101088', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(38, '01/S1', 90, '20 April 2022', 'GHEA CLARIZA SYUHADA', '0119101073', 'Passed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(39, '01/S1', 43, '20 April 2022', 'ALFONSIUS CH ALEXANDRO RAMBA', '0116101114', 'Failed', 'REG A', 'D', 'Belum Cetak', 'Ignatius Oki Dewa Brata, S.E., M.Si., Ak., C.A.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0),
(40, '01/S1', 85, '14 April 2022', 'MESA ARMILA', '0119101136', 'Passed', 'REG A', 'B', 'Belum Cetak', 'Mirna Dianita, S.E., M.M., Ak., Ca.', 'ONLINE', 'AC010', NULL, 'Ganjil', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(5) UNSIGNED NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notif_user`
--

CREATE TABLE `notif_user` (
  `id` int(5) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `kode_sertifikat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `nama_sertifikat`, `kode_sertifikat`) VALUES
(2, 'Business Processes in Financial Accounting', 'AC010'),
(3, 'SAP-Fundamental', 'SAP01'),
(4, 'Business Processes in Management Accounting', 'AC040'),
(5, 'Business Processes in Human Capital Management', 'HR050'),
(6, 'Introduction to the ABAP Workbench', 'BC400'),
(7, 'Business Processes in Sales Order', 'SCM600'),
(8, 'Business Processes in Procurement', 'SCM500');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_produk` varchar(255) DEFAULT NULL,
  `id_sertifikat` int(5) UNSIGNED DEFAULT NULL,
  `k_sertifikat` varchar(255) DEFAULT NULL,
  `k_jp` varchar(255) DEFAULT NULL,
  `qty` int(5) UNSIGNED NOT NULL,
  `harga` int(100) NOT NULL,
  `konfirmasi` int(11) NOT NULL,
  `tanggal_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `id_user`, `id_produk`, `id_sertifikat`, `k_sertifikat`, `k_jp`, `qty`, `harga`, `konfirmasi`, `tanggal_checkout`) VALUES
(2, '0619101024', 'AC010', NULL, NULL, NULL, 1, 80000, 1, '2022-12-12'),
(3, '0619101024', 'HR050', NULL, NULL, NULL, 2, 85000, 1, '2022-12-12'),
(4, '0619101024', 'SCM600', NULL, NULL, NULL, 4, 60000, 1, '2022-12-12'),
(7, '0619101024', 'SAP01', NULL, NULL, NULL, 1, 50000, 0, NULL),
(8, '0619101024', 'HR050', NULL, NULL, NULL, 3, 85000, 0, NULL);

--
-- Triggers `shopping_cart`
--
DELIMITER $$
CREATE TRIGGER `restore_stok_modul` AFTER DELETE ON `shopping_cart` FOR EACH ROW BEGIN
	UPDATE moduls SET ketersediaan = ketersediaan + OLD.qty
	WHERE moduls.kode_modul = OLD.id_produk;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sertifikat_cancel` AFTER DELETE ON `shopping_cart` FOR EACH ROW BEGIN
	UPDATE nilai_sertifikat SET status = "Belum Cetak", is_out = 0 
    WHERE nilai_sertifikat.id = OLD.id_sertifikat;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sertifikat_out` AFTER UPDATE ON `shopping_cart` FOR EACH ROW BEGIN
	UPDATE nilai_sertifikat SET status = "Sudah Diambil", is_out = 1  
    WHERE nilai_sertifikat.id = OLD.id_sertifikat;
END
$$
DELIMITER ;

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
(4, 'Gilang Pratama Putra', '0619101005', 'gipra33@gmail.com', '0895375455587', 1, '', '$2y$10$MHgKbZx3DkD8SCTHEvzjAup6.tdbd2zW4eS/G51Yeg23QvShe/zJC', 0),
(5, 'DESTA EKA ANASMUSA', '51621120028', 'destaeka123@gmail.com', '085221381402', 3, '', '$2y$10$JlWNEeGilZIQ9SaAJoKivOFalImiyBg22PYvmdHfaOG5CA7eYer7m', 0),
(6, 'VITA FATHIA LATIEF', '0119101086', 'vina@widyatama.ac.id', '085221381402', 10, '', '$2y$10$i0RqkDLZJ6pdTcIwGjInbeO7kCr2OgsGt7OuDgDdxWC7ndStiatY2', 0),
(7, 'mahasiswa', '0619101000', 'mahasiswa@gmail.com', '08192381239', 3, '', '$2y$10$75Qr1fX4VY5lgkREE5MrsuEfn2I2ykkypOsfkG8lcUaA3wJAddr1O', 0),
(8, 'FACHRI ADRIANSYAH', '0119101104', 'mahasiswa@gmail.com', '081231293123', 2, '', '$2y$10$/nYyHHsZ9xofVPKQedK7COaWCM9CJ6l.nvY/qy9GhWmgBN4NL8Eim', 0),
(9, 'RAGA AHLIL FIKRI', '0119101072', 'raga@gmail.com', '081239129311', 2, 'A', '$2y$10$FVNMxzltIm7ZaCIxIdVr6e4Yk.z4y6r5RGkukibZayozm.vaP4rEO', 0),
(10, 'Admin', '6666666666', 'admin@gmail.com', '0866666666666', 3, '', '$2y$10$5TEJVY5wyeu5DajwV0G2k.hdhDiLbAjQ6q4mFjWJcAjYj3foRYsPC', 1),
(11, 'Muhamad Agung Raharjo', '0619101024', 'agung.raharjo@widyatama.ac.id', '087775642178', 3, 'A', '$2y$10$iW54oLvCR117kmBxc9WRz.RrtQGAREzgoddmcLKh/BHcsu5XbS9BS', 0),
(12, 'agus mahmud', '1234567891', 'agusmahmud@widyatama.ac.id', '1234567889111', 3, 'A', '$2y$10$Nrg5lKrBUiosGObZziS0Z..Bt8tAPYj9F1wqBuP.x0LFfoYhP/Ype', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_id_user_foreign` (`id_user`),
  ADD KEY `history_id_produk_foreign` (`id_produk`),
  ADD KEY `history_id_sertifikat_foreign` (`id_sertifikat`);

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
-- Indexes for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilai_sertifikat_sertifikat_id_foreign` (`sertifikat_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notif_user`
--
ALTER TABLE `notif_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notif_user_user_foreign` (`user`);

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
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `moduls_in`
--
ALTER TABLE `moduls_in`
  MODIFY `id_in` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notif_user`
--
ALTER TABLE `notif_user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

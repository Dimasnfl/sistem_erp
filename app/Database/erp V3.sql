-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2022 at 11:19 AM
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
(13, '2022-11-09-161222', 'App\\Database\\Migrations\\NilaiSertifikat', 'default', 'App', 1669444695, 3),
(14, '2022-11-03-105541', 'App\\Database\\Migrations\\ShoppingCart', 'default', 'App', 1669457805, 4);

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
(2, 'SAP-Fundamental', 'SAP01', 5, 50000),
(3, 'Business Processes in Management Accounting', 'AC040', 8, 65000),
(4, 'Business Processes in Financial Accounting', 'AC010', 70, 70000),
(5, 'Business Processes in Human Capital Management', 'HR050', 10, 85000),
(6, 'Introduction to the ABAP Workbench', 'BC400', 20, 65000),
(7, 'Business Processes in Sales Order', 'SCM600', 5, 60000),
(8, 'Business Processes in Procurement', 'SCM500', 10, 80000);

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
(5, 6, 20, '2022-11-24 23:57:07');

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
-- Table structure for table `nilai_sertifikat`
--

CREATE TABLE `nilai_sertifikat` (
  `id` int(5) UNSIGNED NOT NULL,
  `jp` varchar(255) NOT NULL,
  `nilai` int(5) UNSIGNED NOT NULL,
  `tanggal_ujian` date NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `nim_user` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `reguler_user` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `ruangan` varchar(255) NOT NULL,
  `sertifikat_id` varchar(255) NOT NULL,
  `no_so` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `is_out` tinyint(1) NOT NULL
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
(1, 'AC010', 'ABC1'),
(2, 'AC010', 'AC010'),
(3, 'SAP01', 'SAP01');

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
(6, 'VITA FATHIA LATIEF', '0119101086', 'vina@widyatama.ac.id', '085221381402', 10, '', '$2y$10$i0RqkDLZJ6pdTcIwGjInbeO7kCr2OgsGt7OuDgDdxWC7ndStiatY2', 0),
(7, 'mahasiswa', '0619101000', 'mahasiswa@gmail.com', '08192381239', 3, '', '$2y$10$75Qr1fX4VY5lgkREE5MrsuEfn2I2ykkypOsfkG8lcUaA3wJAddr1O', 0),
(8, 'FACHRI ADRIANSYAH', '0119101104', 'mahasiswa@gmail.com', '081231293123', 2, '', '$2y$10$/nYyHHsZ9xofVPKQedK7COaWCM9CJ6l.nvY/qy9GhWmgBN4NL8Eim', 0),
(9, 'RAGA AHLIL FIKRI', '0119101072', 'raga@gmail.com', '081239129311', 2, '', '$2y$10$FVNMxzltIm7ZaCIxIdVr6e4Yk.z4y6r5RGkukibZayozm.vaP4rEO', 0),
(12, 'AgusA', '1234567891', 'agusmahmud@widyatama.ac.id', '123456788911', 2, 'B2', '$2y$10$lBeKXPaz7pyGN3l6gVMccu13wQwrTzksXTmmcu49x6Qjpe0yho7Va', 0);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `moduls_in`
--
ALTER TABLE `moduls_in`
  MODIFY `id_in` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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

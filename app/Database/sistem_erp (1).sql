-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2022 pada 10.22
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_erp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama`) VALUES
(1, 'Fakultas Ekonomi dan Bisnis'),
(2, 'Fakultas Teknik'),
(3, 'Fakultas Bahasa'),
(4, 'Fakultas Desain dan Komunikasi Visual'),
(5, 'Fakultas Ilmu Sosial dan Ilmu Politik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_fakultas` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
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
-- Struktur dari tabel `list_modul`
--

CREATE TABLE `list_modul` (
  `id_list` int(111) NOT NULL,
  `id_modul` int(111) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `list_modul`
--

INSERT INTO `list_modul` (`id_list`, `id_modul`, `updated_at`, `deleted_at`) VALUES
(36, 1, '2022-11-13 02:38:47', NULL),
(38, 1, NULL, NULL),
(39, 1, '2022-11-13 02:38:36', NULL),
(42, 2, '2022-11-13 02:59:19', NULL),
(44, 1, '2022-11-13 02:35:09', NULL),
(45, 1, '2022-11-13 02:32:08', NULL),
(47, 3, '2022-11-12 23:19:17', NULL),
(48, 3, NULL, NULL),
(49, 3, NULL, NULL),
(50, 3, NULL, NULL),
(52, 1, '2022-11-13 02:38:44', NULL),
(55, 3, '2022-11-12 23:08:43', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
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
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(376, '2022-09-13-205845', 'App\\Database\\Migrations\\Users', 'default', 'App', 1668150921, 1),
(377, '2022-09-13-205910', 'App\\Database\\Migrations\\Moduls', 'default', 'App', 1668150921, 1),
(378, '2022-09-28-190649', 'App\\Database\\Migrations\\Roles', 'default', 'App', 1668150922, 1),
(379, '2022-10-21-082753', 'App\\Database\\Migrations\\Jurusans', 'default', 'App', 1668150922, 1),
(380, '2022-10-21-082821', 'App\\Database\\Migrations\\Fakultas', 'default', 'App', 1668150922, 1),
(381, '2022-11-03-105541', 'App\\Database\\Migrations\\ShoppingCart', 'default', 'App', 1668150923, 1),
(382, '2022-11-09-161201', 'App\\Database\\Migrations\\Sertifikat', 'default', 'App', 1668150923, 1),
(383, '2022-11-09-161222', 'App\\Database\\Migrations\\NilaiSertifikat', 'default', 'App', 1668150923, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls`
--

CREATE TABLE `moduls` (
  `id` int(5) NOT NULL,
  `nama_modul` varchar(255) NOT NULL,
  `kode_modul` varchar(255) NOT NULL,
  `ketersediaan` int(11) NOT NULL,
  `harga_modul` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `moduls`
--

INSERT INTO `moduls` (`id`, `nama_modul`, `kode_modul`, `ketersediaan`, `harga_modul`) VALUES
(1, 'SAP Fundamental', 'SAP01', 68, 30000),
(2, 'Business Processes in Management Accounting', 'AC040', 12, 66000),
(3, 'SAP Basic', 'SAP02', 40, 70000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls_in`
--

CREATE TABLE `moduls_in` (
  `id_in` int(11) NOT NULL,
  `id_moduls` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `moduls_in`
--

INSERT INTO `moduls_in` (`id_in`, `id_moduls`, `qty`, `created_at`) VALUES
(6, 2, 2, '2022-11-17 13:05:47'),
(7, 2, 2, '2022-11-17 13:05:54'),
(8, 1066, 100, '2022-11-17 13:07:32'),
(9, 1042, 20, '2022-11-17 14:27:04');

--
-- Trigger `moduls_in`
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
-- Struktur dari tabel `moduls_out`
--

CREATE TABLE `moduls_out` (
  `id_out` int(11) NOT NULL,
  `id_moduls` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `moduls_out`
--

INSERT INTO `moduls_out` (`id_out`, `id_moduls`, `qty`, `deleted_at`) VALUES
(12, 2, 2, '2022-11-17 16:04:32'),
(13, 1, 2, '2022-11-17 16:04:32');

--
-- Trigger `moduls_out`
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
-- Struktur dari tabel `nilai_sertifikat`
--

CREATE TABLE `nilai_sertifikat` (
  `id` int(5) NOT NULL,
  `nilai` int(5) NOT NULL,
  `tanggal_ujian` date NOT NULL,
  `nim` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `reguler` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `sertifikat_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `nilai_sertifikat`
--

INSERT INTO `nilai_sertifikat` (`id`, `nilai`, `tanggal_ujian`, `nim`, `result`, `reguler`, `kelas`, `status`, `nama_dosen`, `user_id`, `sertifikat_id`) VALUES
(1, 90, '2022-11-15', '06191010', 'passed', 'reg b', 'a', 'proses cetak', 'aiman s.kom', '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` int(5) NOT NULL,
  `nama_sertifikat` varchar(255) NOT NULL,
  `kode_sertifikat` varchar(255) NOT NULL,
  `harga_sertifikat` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `nama_sertifikat`, `kode_sertifikat`, `harga_sertifikat`) VALUES
(1, 'SAP Fundamental', '0123', 90000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikat_excel`
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
-- Dumping data untuk tabel `sertifikat_excel`
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
-- Struktur dari tabel `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_produk` varchar(255) DEFAULT NULL,
  `id_sertifikat` int(5) UNSIGNED DEFAULT NULL,
  `qty` int(5) UNSIGNED NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `nim`, `email`, `no_hp`, `id_jurusan`, `reguler`, `password`, `is_admin`) VALUES
(1, 'darth', '1234567890', 'darth@theempire.com', '08123456789', 1, 'A', '$2y$10$Pg8Ktbh1NxGmtd3rL5W1Feh7b6e6O2mMf.OFAZ5nj43C8.nTIcUwS', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id_fakultas_foreign` (`id_fakultas`);

--
-- Indeks untuk tabel `list_modul`
--
ALTER TABLE `list_modul`
  ADD PRIMARY KEY (`id_list`),
  ADD KEY `id_modul` (`id_modul`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `moduls`
--
ALTER TABLE `moduls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode_modul`);

--
-- Indeks untuk tabel `moduls_in`
--
ALTER TABLE `moduls_in`
  ADD PRIMARY KEY (`id_in`),
  ADD KEY `id_moduls` (`id_moduls`);

--
-- Indeks untuk tabel `moduls_out`
--
ALTER TABLE `moduls_out`
  ADD PRIMARY KEY (`id_out`);

--
-- Indeks untuk tabel `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilai_sertifikat_sertifikat_id_foreign` (`sertifikat_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sertifikat_excel`
--
ALTER TABLE `sertifikat_excel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopping_cart_id_user_foreign` (`id_user`),
  ADD KEY `shopping_cart_id_produk_foreign` (`id_produk`),
  ADD KEY `shopping_cart_id_sertifikat_foreign` (`id_sertifikat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD KEY `users_id_jurusan_foreign` (`id_jurusan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `list_modul`
--
ALTER TABLE `list_modul`
  MODIFY `id_list` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT untuk tabel `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1067;

--
-- AUTO_INCREMENT untuk tabel `moduls_in`
--
ALTER TABLE `moduls_in`
  MODIFY `id_in` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `moduls_out`
--
ALTER TABLE `moduls_out`
  MODIFY `id_out` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `nilai_sertifikat`
--
ALTER TABLE `nilai_sertifikat`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sertifikat_excel`
--
ALTER TABLE `sertifikat_excel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=981;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `list_modul`
--
ALTER TABLE `list_modul`
  ADD CONSTRAINT `list_modul_ibfk_1` FOREIGN KEY (`id_modul`) REFERENCES `moduls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2020 at 01:29 PM
-- Server version: 10.3.25-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tigrisfi_tigrisfire`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(7, 3, 4, 1, 1800000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'fire-suppression', 'FIRE SUPPRESSION'),
(2, 'fire-track', 'FIRE TRACK'),
(3, 'kebakaran-hutan', 'KEBAKARAN HUTAN'),
(4, 'apar-refill', 'APAR REFILL'),
(5, 'fire-hose-system', 'FIRE HOSE SYSTEM'),
(6, 'hydrant-box', 'HYDRANT BOX'),
(7, 'fire-pump', 'FIRE PUMP'),
(8, 'fire-technology', 'FIRE TECHNOLOGY'),
(9, 'fire-extinguisher', 'FIRE EXTINGUISHER');

-- --------------------------------------------------------

--
-- Table structure for table `catserv`
--

CREATE TABLE `catserv` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catserv`
--

INSERT INTO `catserv` (`id`, `slug`, `title`) VALUES
(1, 'industrial', 'INDUSTRIAL'),
(2, 'power-plant', 'POWER PLANT'),
(3, 'marine', 'MARINE'),
(4, 'maintenance-fire-suppression', 'MAINTENANCE FIRE'),
(5, 'fire-training', 'FIRE TRAINING');

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tgl` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `exp` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`id`, `name`, `tgl`, `from`, `exp`, `link`, `image`) VALUES
(1, 'NFPA', '2014-09-23', 'NATIONAL FIRE PROTECTION ASSOCIATION', '2024-09-23', '', '-20201027091540.jpeg'),
(2, 'OHSAS 18001 : 2007', '2017-09-28', 'QS ZURICH AG', '2018-09-27', '', '-20201027092634.jpg'),
(3, 'ISO 9001 : 2005', '2017-02-28', 'QS ZURICH AG', '2018-09-27', '', '-20201027092541.jpg'),
(4, 'ISO 14001 : 2015', '2017-09-28', 'QS ZURICH AG', '2018-09-27', '', '-20201027093152.jpg'),
(5, 'UJI LAB', '2015-11-27', 'UNIT PELAKSANAAN TEKNIS LABORATORIUM KEBAKARAN DAN PENYELAMATAN', '2025-11-26', '', '-20201027094832.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(4, 'MARGARITA MONETTI', 'monettimargarita@hotmail.com', '2067222311', 'I have questions about logging in. there is a customer that I need to report kitchen exhaust system cleaning. Please call me back asap. Thank you, Margarita');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 1, '2020-10-15', '120201015052017', 3200000, 'Nashiruddien Sadid Mustaqim', 'Dupak Bandarejo Gg.1 No.21', '081385259169', 'paid'),
(2, 1, '2020-10-15', '120201015052342', 1600000, 'Nashiruddien Sadid Mustaqim', 'Dupak Bandarejo Gg.I No.21, Surabaya, Indonesia', '081385259169', 'waiting'),
(3, 1, '2020-10-15', '120201015052552', 1800000, 'Nashiruddien Sadid Mustaqim', 'Dupak Bandarejo Gg.I No.21, Surabaya, Indonesia', '081385259169', 'waiting'),
(4, 1, '2020-10-15', '120201015052757', 1600000, 'Nashiruddien Sadid Mustaqim', 'Dupak Bandarejo Gg.I No.21 Surabaya', '081385259169', 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 1, 1800000),
(2, 1, 2, 1, 1400000),
(3, 2, 3, 1, 1600000),
(4, 3, 4, 1, 1800000),
(5, 4, 3, 1, 1600000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `writer` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `intro`, `description`, `price`, `writer`, `is_available`, `image`) VALUES
(1, 9, 'apar-dry-chemical-powder-1-kg', 'APAR DRY CHEMICAL POWDER 1 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.', 'Deskripsi APAR 1 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 1 Kg<br>\r\nBerat Kotor : 2.01 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^', 'Rp 409.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-dry-chemical-powder-1-kg-20201023154743.jpg'),
(2, 9, 'apar-dry-chemical-powder-2-kg', 'APAR DRY CHEMICAL POWDER 2 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.', 'Deskripsi APAR 2 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 2 Kg<br>\r\nBerat Kotor : 3.06 Kg\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^', 'Rp 568.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-2-kg-20201014204944.jpg'),
(3, 9, 'apar-dry-chemical-powder-3-kg', 'APAR DRY CHEMICAL POWDER 3 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.', 'Deskripsi APAR 3 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 3 Kg<br>\r\nBerat Kotor : 4.97 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^', 'Rp 728.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-3-kg-20201014205048.jpg'),
(4, 9, 'apar-dry-chemical-powder-4-kg', 'APAR DRY CHEMICAL POWDER 4 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.', 'Deskripsi APAR 4 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 4 Kg<br>\r\nBerat Kotor : 6.43 Kg\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^', 'Rp 868.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-4-kg-20201014205331.jpg'),
(6, 9, 'apar-dry-chemical-powder-5-kg', 'APAR DRY CHEMICAL POWDER 5 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n', 'Deskripsi APAR 5 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 5 Kg<br>\r\nBerat Kotor : 2.92 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^\r\n', 'Rp 1.047.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-dry-chemical-powder-5-kg-20201023154819.jpg'),
(7, 9, 'apar-dry-chemical-powder-6-kg', 'APAR DRY CHEMICAL POWDER 6 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n', 'Deskripsi APAR 6 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 6 Kg<br>\r\nBerat Kotor : 9.39 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^\r\n', 'Rp 1.225.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-dry-chemical-powder-6-kg-20201023155301.jpg'),
(8, 9, 'apar-dry-chemical-powder-9-kg', 'APAR DRY CHEMICAL POWDER 9 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n', 'Deskripsi APAR 9 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 9 Kg<br>\r\nBerat Kotor : 13.2 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^\r\n', 'Rp 1.647.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-dry-chemical-powder-9-kg-20201023160131.jpg'),
(9, 9, 'apar-dry-chemical-powder-12-kg', 'APAR DRY CHEMICAL POWDER 12 KG', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n', 'Deskripsi APAR 12 Kg<br>\r\nAlat Pemadam Api Ringan ( APAR )\r\n<br><br>\r\nAPAR yang telah LULUS UJI Lab Dinas Pemadam Kebakaran dan Bersertifikat\r\n<br><br>\r\nAPAR Merk Tigris Fire<br>\r\nJenis : Dry Chemical Powder<br>\r\nBerat isi : 12 Kg<br>\r\nBerat Kotor : 17.8 KG\r\n<br><br>\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.<br>\r\nKelengkapan : 1 unit tabung dengan pressure gauge, pin, nozzle, dan 1 buah bracket gantung / hanger<br>\r\nUkuran nya yang Mini Apar ini banyak digunakan di dalam Kendaraan.<br>\r\nJaminan Produk dan Tekanan Turun selama 1 ( Satu ) Tahun.\r\n<br><br>\r\nLokasi<br>\r\nRumah Api<br>\r\nJl. RA Kartini No.61<br>\r\nMargahayu- Bekasi Timur 17113\r\n<br><br>\r\nSmart Buyer & Happy Shopping^.^\r\n', 'Rp 2.313.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-dry-chemical-powder-12-kg-20201023161606.jpg'),
(10, 6, 'hydrant-box-type-a1-polos', 'HYDRANT BOX TYPE A1 POLOS', 'Type : A1\r\nMaterial : Mild Steel\r\nDimension : 660 x 520 x 150 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Type : A1\r\nMaterial : Mild Steel\r\nDimension : 660 x 520 x 150 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Rp 900.000;', 'Nashiruddien Sadid Mustaqim', 1, 'hydrant-box-type-a1-polos-20201023164229.jpg'),
(11, 6, 'hydrant-box-type-a1-kaca', 'HYDRANT BOX TYPE A1 KACA', 'Type : A1\r\nMaterial : Mild Steel\r\nDimension : 660 x 520 x 150 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Type : A1\r\nMaterial : Mild Steel\r\nDimension : 660 x 520 x 150 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Rp 1.338.479;', 'Nashiruddien Sadid Mustaqim', 1, 'hydrant-box-type-a1-kaca-20201030165509.jpg'),
(12, 6, 'hydrant-box-type-b1-polos', 'HYDRANT BOX TYPE B1 POLOS', 'Type : A2\r\nMaterial : Mild Steel\r\nDimension : 1000 x 800 x 180 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Type : A2\r\nMaterial : Mild Steel\r\nDimension : 1000 x 800 x 180 mm\r\nThickness: 1.2 mm; 1.5 mm or 2 mm\r\nProduction Process: Dust Remover, Phospating & Zincromate Primer\r\nPaintin Finish: Top Coat Powder Coating Red Signal\r\n', 'Rp 1.125.000;', 'Nashiruddien Sadid Mustaqim', 1, 'hydrant-box-type-b1-polos-20201023164928.jpg'),
(13, 5, 'hydrant-pillar-one-way', 'HYDRANT PILLAR ONE WAY', 'Hydrant Pillar One Way\r\nType: H-13\r\nSize: 3 x 2.5\"', 'Hydrant Pillar One Way\r\nType: H-13\r\nSize: 3 x 2.5\"', 'Rp 4.050.000;', 'Nashiruddien Sadid Mustaqim', 1, 'hydrant-pillar-one-way-20201028215257.png'),
(14, 5, 'hydrant-pillar-two-way', 'HYDRANT PILLAR TWO WAY', 'Hydrant Pillar Two Way\r\nType: H-14 AP\r\nSize: 4\" x 2.5\" x 2.5\"', 'Hydrant Pillar Two Way\r\nType: H-14 AP\r\nSize: 4\" x 2.5\" x 2.5\"', 'Rp 5.849.998;', 'Nashiruddien Sadid Mustaqim', 1, 'hydrant-pillar-two-way-20201028215540.png'),
(15, 5, 'siamese-connection-s.7', 'SIAMESE CONNECTION S.7', 'Siamese Connection \r\nType: S.7\r\nSize: 4\" x 2.5\" x 2.5\"', 'Siamese Connection \r\nType: S.7\r\nSize: 4\" x 2.5\" x 2.5\"', 'RP 4.500.000;', 'Nashiruddien Sadid Mustaqim', 1, 'siamese-connection-s7-20201028215951.png'),
(16, 5, 'siamese-connection-s.11', 'SIAMESE CONNECTION S.11', 'Siamese Connection \r\nType: S.11\r\nSize: 4\" x 2.5\" x 2.5\"', 'Siamese Connection \r\nType: S.11\r\nSize: 4\" x 2.5\" x 2.5\"', 'Rp 5.775.000;', 'Tigris Fire', 1, 'siamese-connection-s11-20201113094216.png'),
(17, 5, 'hydrant-valve-1.5\"', 'HYDRANT VALVE  1.5\"', 'Hydrant Valve 1.5\"\r\n', 'Hydrant Valve 1.5\"', 'Rp 525.000;', 'Tigris Fire', 1, 'hydrant-valve-15-20201113094118.png'),
(18, 5, 'fire-hose-1.5-x-20-m', 'FIRE HOSE 1.5 x 20 M', 'Fire Hose 1.5 x 20 meter', 'Fire Hose 1.5 x 20 meter', 'Rp 1.210.000;', 'Tigris Fire', 1, 'fire-hose-15-x-20-m-20201113094005.png'),
(19, 5, 'fire-hose-1.5-30-m', 'FIRE HOSE 1.5 x 30 M', ' 1 Roll Fire Hose 1.5 x 30 meter', '1 Roll Fire Hose 1.5 x 30 meter', 'Rp 1.425.000;', 'Tigris Fire', 1, 'fire-hose-15-x-30-m-20201113093927.png'),
(20, 5, 'fire-hose-2.5-x-30-m', 'FIRE HOSE 2.5 x 30 M', '1 Roll Fire Hose 2.5\" x 30 meter', '1 Roll Fire Hose 2.5\" x 30 meter', 'Rp 2.075.000;', 'Tigris Fire', 1, 'fire-hose-25-x-30-m-20201113093847.png'),
(21, 5, 'hydrant-valve-2.5\"', 'HYDRANT VALVE 2.5\"', 'Hydrant Valve 2.5\"', 'Hydrant Valve 2.5\"', 'Rp 1.150.000;', 'Tigris Fire', 1, 'hydrant-valve-25-20201113093745.png'),
(22, 5, 'hose-rack-1.5\"', 'HOSE RACK 1.5\"', 'Hose Rack 1.5\"', 'Hose Rack 1.5\"', 'Rp 375.000;', 'Tigris Fire', 1, 'hose-rack-15-20201113093703.png'),
(23, 6, 'box-apar-3.5-kg', 'BOX APAR 3.5 KG', 'Box Apar 3.5 Kg\r\nSize: 30 x 55 x 20', 'Box Apar 3.5 Kg\r\nSize: 30 x 55 x 20', 'Rp 525.000;', 'Tigris Fire', 1, 'box-apar-35-kg-20201113093615.png'),
(24, 6, 'hydrant-box-a2-polos', 'HYDRANT BOX A2 POLOS', 'Type: A2\r\nMaterial: Mild Steel\r\nDimension: 100 x 80 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Type: A2\r\nMaterial: Mild Steel\r\nDimension: 100 x 80 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Rp 1.125.000;', 'Tigris Fire', 1, 'hydrant-box-a2-polos-20201113093524.png'),
(25, 6, 'hydrant-box-a2-kaca', 'HYDRANT BOX A2 KACA', 'Type: A2\r\nMaterial: Mild Steel\r\nDimension: 100 x 80 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Type: A2\r\nMaterial: Mild Steel\r\nDimension: 100 x 80 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Rp 1.956.240;', 'Tigris Fire', 1, 'hydrant-box-a2-kaca-20201113093424.jpg'),
(26, 6, 'hydrant-box-b-kaca', 'HYDRANT BOX B KACA', 'Type: B\r\nMaterial: Mild Steel\r\nDimension: 125 x 55 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Type: B\r\nMaterial: Mild Steel\r\nDimension: 125 x 55 x 18\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Rp 1.956.240', 'Tigris Fire', 1, 'hydrant-box-b-kaca-20201113093311.jpg'),
(27, 6, 'hydrant-box-c-polos', 'HYDRANT BOX C POLOS', 'Type: C\r\nMaterial: Mild Steel\r\nDimension: 96 x 66 x 20\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Type: C\r\nMaterial: Mild Steel\r\nDimension: 96 x 66 x 20\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Rp 1.425.000;', 'Tigris Fire', 1, 'hydrant-box-c-polos-20201113093147.png'),
(28, 6, 'hydrant-box-c-kaca', 'HYDRANT BOX C KACA', 'Type: C\r\nMaterial: Mild Steel\r\nDimension: 96 x 66 x 20\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal\r\n', 'Type: C\r\nMaterial: Mild Steel\r\nDimension: 96 x 66 x 20\r\nThickness: 1.2 mm ; 1.5 mm or 2 mm\r\nProducton Process: Dust Remove, Phospating & Zincromate Primer\r\nPainting Finish: Top Coat Powder Coating Red Signal', 'Rp 1.956.240;', 'Tigris Fire', 1, 'hydrant-box-c-kaca-20201113092917.jpg'),
(29, 6, 'box-apar-4.5-kg', 'BOX APAR 4.5 KG', 'BOX APAR 4.5 KG\r\nSize: 30 x 60x 20', 'BOX APAR 4.5 KG\r\nSize: 30 x 60x 20', 'Rp 675.000;', 'Tigris Fire', 1, 'box-apar-45-kg-20201113092755.png'),
(30, 6, 'box-apar-6-kg', 'BOX APAR 6 KG', 'BOX APAR 6 KG\r\nSize: 35 x 65 x 20', 'BOX APAR 6 KG\r\nSize: 35 x 65 x 20', 'Rp 700.000;', 'Tigris Fire', 1, 'box-apar-6-kg-20201113092627.png'),
(31, 6, 'box-apar-9-kg', 'BOX APAR 9 KG', 'BOX APAR 9 KG\r\nSize: 35 x 70 x 22', 'BOX APAR 9 KG\r\nSize: 35 x 70 x 22', 'Rp 950.000;', 'Tigris Fire', 1, 'box-apar-9-kg-20201113092548.png'),
(32, 6, 'local-box-combination', 'LOCAL BOX COMBINATION', 'LOCAL BOX COMBINATION\r\nSize: 50 x 25 x 10', 'LOCAL BOX COMBINATION\r\nSize: 50 x 25 x 10', 'Rp 425.000;', 'Tigris Fire', 1, 'local-box-combination-20201113092502.jpg'),
(33, 6, 'terminal-box-12-pairs', 'TERMINAL BOX 12 PAIRS', 'TERMINAL BOX 12 PAIRS\r\nsize: 20 x 30 x 8', 'TERMINAL BOX 12 PAIRS\r\nsize: 20 x 30 x 8', 'Rp 500.000;', 'Tigris Fire', 1, 'terminal-box-12-pairs-20201113092415.jpg'),
(34, 6, 'hydrant-box-type-c-stainless', 'HYDRANT BOX TYPE C STAINLESS', 'HYDRANT BOX TYPE C STAINLESS\r\nSize: 66 x 96 x 20', 'HYDRANT BOX TYPE C STAINLESS\r\nSize: 66 x 96 x 20', 'Rp 2.500.000;', 'Tigris Fire', 1, 'hydrant-box-type-c-stainless-20201113092254.jpg'),
(35, 6, 'fire-cabinet', 'FIRE CABINET', 'FIRE CABINET\r\nSize: 120 (W) x 180 (H) x 40 (D)', 'FIRE CABINET\r\nSize: 120 (W) x 180 (H) x 40 (D)', 'Rp 8.250.000;', 'Tigris Fire', 1, 'fire-cabinet-20201113091951.jpg'),
(36, 6, 'fire-trolley', 'FIRE TROLLEY', 'FIRE TROLLEY (SWING DOOR X 3)\r\nSize: 100 (W) x 90 (H) x 60 (D)', 'FIRE TROLLEY (SWING DOOR X 3)\r\nSize: 100 (W) x 90 (H) x 60 (D)', 'Rp 8.750.000;', 'Tigris Fire', 1, 'fire-trolley-20201113091907.jpg'),
(37, 3, 'ministriker-pump-gxh-50', 'MINISTRIKER PUMP GXH 50', 'The WATERAX MINI-STRIKER® pump pairs a reliable single stage pump end with the Honda 4-stroke 2.5 HP engine to achieve pressures of up to 85 PSI (5.9 BAR) and offer volume supply of up to 80 GPM (303 L/Min). Extremely portable and lightweight, this mini powerhouse performs well when used by itself or in tandem with other pumps, and is a very popular choice for entry level slip-on applications. It is also particularly suited to some of the latest fire control techniques where small, lightweight equipment is a requirement. The widely-available Honda 4-stroke 2.5 HP engine makes for ease of operation and engine parts sourcing.', 'Engine Specifications\r\nModel & Type Honda, GXH50 Series 4-stroke,\r\n horizontal shaft, single cylinder, OHV\r\nNet Power Output 2.1 HP (1.6 kW) @ 7000 RPM\r\nNet Torque 2.0 lb-ft (2.7 Nm) @ 4500 RPM\r\nBore & Stroke 1.65 x 1.42 inches (41.8 x 36 mm)\r\nDisplacement 3.01 cubic inches (49.4 cc)\r\nStarting System Recoil\r\nIgnition Transistorized Magneto\r\nGovernor Centrifugal Mechanical\r\nAir Cleaner Semi-dry\r\nCooling Air Cooled\r\nLubrication Forced Splash\r\nOil Capacity 0.26 quarts (0.25 liters)\r\nCarburetor Float Type\r\nEmissions Meets current CARB, EPA, and CE\r\n requirements.\r\nExhaust US Forestry Service Approved Spark\r\n Arrestor\r\nFuel Type Gasoline [unleaded, 86 minimum\r\n octane or higher, 10% maximum\r\n ethanol]\r\nFuel Tank: Integral 0.81 quarts (0.77 liters)\r\nFuel Consumption 0.17 US gal/hr (0.65 L/hr)', 'Rp 43.020.000;', 'Tigris Fire', 1, 'ministriker-pump-gxh-50-20201113091813.png'),
(38, 5, 'suction-hose', 'SUCTION HOSE', 'features :\r\n- resistant to weather and abrasion\r\n- resistant to UV and ozone\r\n- temperature range\r\n- from –20 °C up to +60 °C\r\n- resistant to waste- and\r\n  seawater from 5 to 10 pH\r\n', 'applications :\r\n- municipal fire brigades\r\n- industry\r\n- agriculture\r\n- building industry\r\n- cleaning industry', 'Rp 1.584.000', 'Tigris Fire', 1, 'suction-hose-20201107090603.png'),
(39, 5, 'hose-weeping-type-1', 'HOSE WEEPING TYPE 1', 'HOSE WEEPING TYPE 1 WX-187-IWP\r\nSpek : 30 M 1.5\"', 'HOSE WEEPING TYPE 1 WX-187-IWP\r\nSpek : 30 M 1.5\"', 'Rp 5.256.000', 'Tigris Fire', 1, 'hose-weeping-type-1-20201107090653.jpg'),
(40, 3, 'pompa-punggung-jufa', 'POMPA PUNGGUNG JUFA', 'Pompa Punggung Jufa\r\nMerk: TIGRIS FIRE\r\nModel: TIGRIS- BACKPACK PUMP\r\nKapasitas Kantong Air: 15 Liter\r\nDaya Semprot: 10 Meter\r\nPanjang Pompa Kuningan: 50-51 cm\r\nBerat Pompa (Kosong): 2-2.5 kg', 'Pompa Punggung Jufa\r\nMerk: TIGRIS FIRE\r\nModel: TIGRIS- BACKPACK PUMP\r\nKapasitas Kantong Air: 15 Liter\r\nDaya Semprot: 10 Meter\r\nPanjang Pompa Kuningan: 50-51 cm\r\nBerat Pompa (Kosong): 2-2.5 kg', 'Rp 4.500.000;', 'Tigris Fire', 1, 'pompa-punggung-jufa-20201113091716.jpg'),
(41, 3, 'portable-fire-pump-20-hp', 'PORTABLE FIRE PUMP 20 HP', 'Portable Fire Pump 20 HP With Honda Engine\r\nEngine Specification:\r\n- GX630 Honda Air Cooled Engine\r\n- V-Twin Cylender, 4-Stroke Gasoline Engine\r\n- Electric Start\r\n- 6 Gallon (221) Detachable Fuel Tank', 'Portable Fire Pump 20 HP With Honda Engine\r\nEngine Specification:\r\n- GX630 Honda Air Cooled Engine\r\n- V-Twin Cylender, 4-Stroke Gasoline Engine\r\n- Electric Start\r\n- 6 Gallon (221) Detachable Fuel Tank', 'Rp 45.000.000;', 'Tigris Fire', 1, 'portable-fire-pump-20-hp-20201113091626.png'),
(42, 3, 'portable-fire-pump-13-hp', 'PORTABLE FIRE PUMP 13 HP', 'PORTABLE FIRE PUMP 13 HP WITH HONDA ENGINE\r\nEngine Specification:\r\n- Honda 13 hp at 3600 RPM, Air Cooled Engine\r\n- Single Cylinder Gasoline Engine\r\n- Electric Start\r\n- 6 Quarts (6.5 L) Intergreted Fuel Tank', 'PORTABLE FIRE PUMP 13 HP WITH HONDA ENGINE\r\nEngine Specification:\r\n- Honda 13 hp at 3600 RPM, Air Cooled Engine\r\n- Single Cylinder Gasoline Engine\r\n- Electric Start\r\n- 6 Quarts (6.5 L) Intergreted Fuel Tank', 'Rp 25.000.000;', 'Tigris Fire', 1, 'portable-fire-pump-13-hp-20201113091452.png'),
(43, 3, 'floating-pump-with-honda-engine-gxv-160', 'FLOATING PUMP WITH HONDA ENGINE GXV 160', 'FLOATING PUMP WITH HONDA ENGINE GXV 160\r\nProduct Name: Floating Pump\r\nModel: FTQ3.0/8\r\nPump Seat: Fiber Reinforced Plastics\r\nStyle: Air-Cooled, 4-Stroke, Single Stage\r\nModel Engine: 5.5 HP (3.2 KW) GXV 160', 'FLOATING PUMP WITH HONDA ENGINE GXV 160\r\nProduct Name: Floating Pump\r\nModel: FTQ3.0/8\r\nPump Seat: Fiber Reinforced Plastics\r\nStyle: Air-Cooled, 4-Stroke, Single Stage\r\nModel Engine: 5.5 HP (3.2 KW) GXV 160\r\nIgnition: Transistor\r\nStarting way: Recoil\r\nRated Capacity: 480L/M\r\nOutput Pressure: ≥ 0.3 Mpa\r\nPump Head: 40m\r\nInlet Dia: 65mm\r\nOutlet Dia: 65mm\r\nNet Weight: 28 Kg\r\nNet Dimension: 695x550x450', 'Rp 35.000.000;', 'Tigris Fire', 1, 'floating-pump-with-honda-engine-gxv-160-20201113091253.png'),
(44, 3, 'floating-pump-with-honda-engine-gxv-390', 'FLOATING PUMP WITH HONDA ENGINE GXV 390', 'FLOATING PUMP WITH HONDA ENGINE GXV 390\r\nEngine Specification:\r\n- GXV390 Honda Gasoline Engine\r\n- Honda 13 HP at 3600 RPM\r\n- 4 Stroke water cooled gasoline engine\r\n- One Cylinder\r\n- Manual Recoil Start', 'Pump Specification:\r\nTF Single stage impeller pump with open impeller type, Pump Body made from high resistance alumunium alloy\r\nBronze impeller\r\nMechanical shaft seal\r\nMaximum Pump Capacity 1500/Lpm\r\nOne 2-1/2\" (65 mm) delivery outlet\r\nTotal weight: 61 Kg', 'Rp 45.000.000;', 'Tigris Fire', 1, 'floating-pump-with-honda-engine-gxv-390-20201113091154.png'),
(45, 3, 'floating-pump-with-honda-engine-gxv-340', 'FLOATING PUMP WITH HONDA ENGINE GXV 340', 'FLOATING PUMP WITH HONDA ENGINE GXV 390\r\nEngine Specification:\r\n- GXV340 Honda Gasoline Engine\r\n- Honda 11 HP at 3600 RPM\r\n- 4 Stroke water cooled gasoline engine\r\n- One Cylinder\r\n- Manual Recoil Start\r\n', 'Pump Specification:\r\nTF Single stage impeller pump with open impeller type, Pump Body made from high resistance alumunium alloy\r\nBronze impeller\r\nMechanical shaft seal\r\nMaximum Pump Capacity 1300/Lpm\r\nOne 2-1/2\" (65 mm) delivery outlet\r\nTotal weight: 54 Kg\r\n', 'Rp 39.000.000;', 'Tigris Fire', 1, 'floating-pump-with-honda-engine-gxv-340-20201113091057.png'),
(46, 3, 'water-tank-portable-quick', 'WATER TANK PORTABLE QUICK', 'Water Tank Portable Quick is an open liquid storage tank with a rigid aluminum frame that is designed for quick and easy assembly. A choice of fabrics and capacities ranging from 500 gal / 1.89 cu. m to 8,000 gal / 30 cu. m are available. Custom sizes are available on request.', 'Water Tank Portable Quick is a complete portable storage facility developed for rapid deployment and temporary storage of liquids. It has a supporting aluminum frame with a liner that is constructed of oil resistant, high-strength materials. All of our QuickTanks are portable and come with a carrying case and instructions.', 'Rp 42.000.000;', 'Tigris Fire', 1, 'water-tank-portable-quick-20201113090939.jpg'),
(47, 5, 'nozzle-1.5\"', 'NOZZLE 1.5\"', 'Nozzle 1.5\"', 'Nozzle 1.5\"', 'Rp 750.000;', 'Tigris Fire', 1, 'nozzle-15-20201113090647.jpg'),
(48, 5, 'nozzle-2.5\"', 'NOZZLE 2.5\"', 'NOZZLE 2.5\"', 'NOZZLE 2.5\"', 'Rp 850.000;', 'Nashiruddien Sadid Mustaqim', 1, 'nozzle-25-20201031112036.jpg'),
(49, 5, 'nozzle-1.5\"-protek', 'NOZZLE 1.5\" Protek', 'NOZZLE 1.5\" Protek', 'NOZZLE 1.5\" Protek', 'Rp 10.000.000;', 'Nashiruddien Sadid Mustaqim', 1, 'nozzle-15-protek-20201031112142.jpg'),
(50, 5, 'nozzle-2.5\"-protek', 'NOZZLE 2.5\" Protek', 'NOZZLE 2.5\" Protek', 'NOZZLE 2.5\" Protek', 'Rp 12.000.000;', 'Nashiruddien Sadid Mustaqim', 1, 'nozzle-25-protek-20201031112541.jpg'),
(51, 5, 'coupling-machino-1.5\"', 'COUPLING MACHINO 1.5\"', 'COUPLING MACHINO 1.5\"', 'COUPLING MACHINO 1.5\"', 'Rp 850.000;', 'Nashiruddien Sadid Mustaqim', 1, 'coupling-machino-15-20201031113508.jpg'),
(52, 5, 'coupling-machino-2.5\"', 'COUPLING MACHINO 2.5\"', 'COUPLING MACHINO 2.5\"', 'COUPLING MACHINO 2.5\"', 'Rp 950.000;', 'Nashiruddien Sadid Mustaqim', 1, 'coupling-machino-25-20201031113601.jpg'),
(53, 5, 'y-connection', ' Y CONNECTION', ' Y CONNECTION', ' Y CONNECTION', 'Rp 3.250.000;', 'Nashiruddien Sadid Mustaqim', 1, 'y-connection-20201031114510.jpg'),
(54, 9, 'apar-carbondioxide-2-kg', 'APAR CARBONDIOXIDE 2 KG', 'APAR CARBONDIOXIDE 2 KG\r\nAlat pemadam api ringan Tigris Fire yang sudah lulus uji damkar\r\nEfektif memadamkan api untuk kelas kebakaran B dan C\r\nDilapisi dengan Polyester Powder Coated tahan terhadap sinar matahari\r\nDapat digunakan dalam ruangan peralatan elektrikal hingga 1000 V\r\nAPAR Portable dapat digunakan dengan baik dalam Bangunan Komersial, Industri, Workshop dan Lain-lain.', 'Tipe Propellant: Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi pada suhu: 20 Derajat Celsius to 60 Derajat  Celcius\r\nJarak Penyemprotan yang aman: 2 Meter\r\nModel: TEFCO-2\r\nCapacity: 2 Kg\r\nWorking Pressure: 60 Bar\r\nSize: Dia 114 x 492 (H) mm\r\nWeight Empty: 5.41 Kg\r\nWeight Full: 7.41 Kg\r\nMinimal Discharger: 9.8 (sec) 2 (m)', 'Rp 1.238.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-carbondioxide-2-kg-20201031120934.png'),
(55, 9, 'apar-carbondioxide-3-kg', 'APAR CARBONDIOXIDE 3 KG', 'APAR CARBONDIOXIDE 3 KG\r\nAlat pemadam api ringan Tigris Fire yang sudah lulus uji damkar\r\nEfektif memadamkan api untuk kelas kebakaran B dan C\r\nDilapisi dengan Polyester Powder Coated tahan terhadap sinar matahari\r\nDapat digunakan dalam ruangan peralatan elektrikal hingga 1000 V\r\nAPAR Portable dapat digunakan dengan baik dalam Bangunan Komersial, Industri, Workshop dan Lain-lain.\r\nTipe Propellant: Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi pada suhu: 20 Derajat Celsius to 60 Derajat  Celcius\r\nJarak Penyemprotan yang aman: 2 Meter\r\n', 'Model: TEFCO-3\r\nCapacity: 3 Kg\r\nWorking Pressure: 60 Bar\r\nSize: Dia 108 x 525 (H) mm\r\nWeight Empty: 8 Kg\r\nWeight Full: 13 Kg\r\nMinimal Discharger: 10 (sec) 2 (m)\r\n', 'Rp 1.647.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-carbondioxide-3-kg-20201031131634.png'),
(56, 9, 'apar-carbondioxide-5-kg', 'APAR CARBONDIOXIDE 5 KG', 'APAR CARBONDIOXIDE 5 KG\r\nAlat pemadam api ringan Tigris Fire yang sudah lulus uji damkar\r\nEfektif memadamkan api untuk kelas kebakaran B dan C\r\nDilapisi dengan Polyester Powder Coated tahan terhadap sinar matahari\r\nDapat digunakan dalam ruangan peralatan elektrikal hingga 1000 V\r\nAPAR Portable dapat digunakan dengan baik dalam Bangunan Komersial, Industri, Workshop dan Lain-lain.\r\nTipe Propellant: Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi pada suhu: 20 Derajat Celsius to 60 Derajat  Celcius\r\nJarak Penyemprotan yang aman: 2 Meter\r\n', 'Model: TEFCO-5\r\nCapacity: 5 Kg\r\nWorking Pressure: 60 Bar\r\nSize: Dia 165 x 655(H) mm\r\nWeight Empty: 12.05 Kg\r\nWeight Full: 17.05 Kg\r\nMinimal Discharger: 13 (sec) 2 (m)\r\n', 'Rp 2.540.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-carbondioxide-5-kg-20201031131608.png'),
(57, 9, 'apar-carbondioxide-7-kg', 'APAR CARBONDIOXIDE 7 KG', 'APAR CARBONDIOXIDE 7 KG\r\nAlat pemadam api ringan Tigris Fire yang sudah lulus uji damkar\r\nEfektif memadamkan api untuk kelas kebakaran B dan C\r\nDilapisi dengan Polyester Powder Coated tahan terhadap sinar matahari\r\nDapat digunakan dalam ruangan peralatan elektrikal hingga 1000 V\r\nAPAR Portable dapat digunakan dengan baik dalam Bangunan Komersial, Industri, Workshop dan Lain-lain.\r\nTipe Propellant: Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi pada suhu: 20 Derajat Celsius to 60 Derajat  Celcius\r\nJarak Penyemprotan yang aman: 2 Meter\r\n', 'Model: TEFCO-7\r\nCapacity: 7 Kg\r\nWorking Pressure: 60 Bar\r\nSize: Dia 152 x 1025 (H) mm\r\nWeight Empty: 15.5 Kg\r\nWeight Full: 22 Kg\r\nMinimal Discharger: 20 (sec) 6 (m)\r\n', 'Rp 3.127.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-carbondioxide-7-kg-20201031131531.png'),
(58, 9, 'apar-carbondioxide-9-kg', 'APAR CARBONDIOXIDE 9 KG', 'APAR CARBONDIOXIDE 9 KG\r\nAlat pemadam api ringan Tigris Fire yang sudah lulus uji damkar\r\nEfektif memadamkan api untuk kelas kebakaran B dan C\r\nDilapisi dengan Polyester Powder Coated tahan terhadap sinar matahari\r\nDapat digunakan dalam ruangan peralatan elektrikal hingga 1000 V\r\nAPAR Portable dapat digunakan dengan baik dalam Bangunan Komersial, Industri, Workshop dan Lain-lain.\r\nTipe Propellant: Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi pada suhu: 20 Derajat Celsius to 60 Derajat  Celcius\r\nJarak Penyemprotan yang aman: 2 Meter\r\n', 'Model: TEFCO-9\r\nCapacity: 9 Kg\r\nWorking Pressure: 60 Bar\r\nSize: Dia 165 x 919 (H) mm\r\nWeight Empty: 36 Kg\r\nWeight Full: 45 Kg\r\nMinimal Discharger: 24 (sec) 7 (m)\r\n', 'Rp 4.020.000;', 'Nashiruddien Sadid Mustaqim', 1, 'apar-carbondioxide-9-kg-20201031131924.png'),
(59, 5, 'hose-rack-2.5\"', 'HOSE RACK 2.5\"', 'Hose rack 2.5\"', 'Hose rack 2.5\"', 'Rp 562.500;', 'Nashiruddien Sadid Mustaqim', 1, 'hose-rack-25-20201105154408.png'),
(60, 7, 'electric-hydrant-pump', 'Electric Hydrant Pump', 'Electric Hydrant Pump Type: Centrifugal\r\nEnd Section Model: 80 x 65 FSJA\r\nMerk: Tigris Fire\r\nHead: 80 Meter', 'Electric Hydrant Pump Type: Centrifugal\r\nEnd Section Model: 80 x 65 FSJA\r\nMerk: Tigris Fire\r\nHead: 80 Meter\r\nCapasitas: 10 Ltr\r\nShaft Pump: stainless steel\r\nDaya: 22 kw 60 HP/380 V 50Hz/3 Phase/2950 RPM\r\nMotor: Teco\r\nC/W: Motor Coupling, Base Plate Pompa and Engine Disel Tercouple On Base Frame\r\n\r\n\r\n*Tidak Termasuk Accessories', 'Rp 40.000.000;', 'Nashiruddien Sadid Mustaqim', 1, 'electric-hydrant-pump-20201105160431.png'),
(61, 7, 'ground-water-tank-pump', 'Ground Water Tank Pump', 'Ground Water Tank Pump Centrifugal Pump Brand : Ebara\r\nType: 65,50 FSJA\r\nCapacity: 200-600 LPM\r\nHead: 42-85 Meter\r\nPower: 5.5 Kw/2900 RPM, 3 Phase 50Hz\r\n', 'Ground Water Tank Pump Centrifugal Pump Brand : Ebara\r\nType: 65,50 FSJA\r\nCapacity: 200-600 LPM\r\nHead: 42-85 Meter\r\nPower: 5.5 Kw/2900 RPM, 3 Phase 50Hz\r\n\r\n\r\n*Tidak termasuk Accessories', 'Rp 17.000.000;', 'Nashiruddien Sadid Mustaqim', 1, 'ground-water-tank-pump-20201105161210.jpeg'),
(62, 4, 'refill-apar-powder', 'Reffil Apar Powder', 'Refill apar powder per KG\r\nEfektif Memadamkan Api untuk Kelas Kebakaran A, B, C.', 'Efektif Memadamkan Api untuk Kelas Kebakaran A, B, C.\r\n', 'Rp 45.000;', 'Nashiruddien Sadid Mustaqim', 1, 'reffil-apar-powder-20201105162158.jpg'),
(63, 2, 'tfs-co2', 'TFS CO2', 'Carbon Dioxide extinguishes fire by reducing the oxygen content of the\r\nprotected space and/or local flame front to a point where it will not support\r\ncombustion. Oxygen reduction below 16% by volume will extinguish', 'FEATURES :\r\n• UL Listed High Pressure Carbon Dioxide System\r\n• In accordance to ANSI/NFPA 12\r\n• Strong Alloy Steel Cylinders\r\n• Protection for large variety of hazards\r\n• Electronically operated master valves\r\n• Pressure actuated slave valves\r\n• Available for Total Flooding or Local Fire Protection\r\n• Lower Overall Maintenance Costs\r\n• Continuous Monitoring of Pressure & Weight Loss\r\n• Non-Corrosive & Non-conductive and leaves No Residue\r\n• Suitable for Class A, B and C hazards', 'Hubungi Kami', 'Tigris Fire', 1, 'tfs-co2-20201106120911.png'),
(65, 1, 'fm200', 'FM200', 'FM200 System', 'FM200 System', 'Hubungi Kami', 'Tigris Fire', 1, 'fm200-20201106154212.jpg'),
(66, 7, 'electric-fire-pump-teco', 'Electric Fire Fighting Pump Teco', 'The TECO Motor\r\nTigris Fire Pump are Brand New 100%\r\nHve CO, CQ, Entry For Customs\r\n80 x 65 FSHA 11 KW', 'Power (KW/HP/RPM) : 11/15/2900\r\nL X W X H (MM) : 608 X 317 X 400.\r\nVoltage V : 380\r\nEfficiency (%) : 87.6\r\nPump Tigris Fire: 80x65 FHSA\r\nFlow (m3/H) : 24-86/4\r\nPresssure (m) : 51.3-23.9\r\nSuction Side (mm) : 80\r\nDischarge Side (mm) : 65\r\nDimensions (LxWxH) (mm): 1100x420x550', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-fighting-pump-teco-20201107103026.png'),
(67, 7, 'electric-fire-pump-att', 'Electric Fire Pump ATT', 'The Electric Motor\r\nTigris Fire Pump are Brand New 100%\r\nThe Motor Imported From Electric Motor Corporation, Singapore.\r\nHave CO,CQ, Entry For Customs', 'MOTOR ATT : WY 100-280 M\r\nPower (KW/HP/RPM) : 90/125/2900\r\nL X W X H (MM) : 978 X 635 X 845.\r\nVoltage V : 380\r\nEfficiency (%) : 93.8\r\nPump Tigris Fire: 150x100 FHSA\r\nFlow (m3/H) : 200\r\nPresssure (m) : 95\r\nDiameter Nozzle (mm): 150\r\nDiameter Pipe Pushing (mm) : 100\r\nDimensions (LxWxH) (mm): -\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-pump-att-20201107103820.png'),
(68, 7, 'electric-water-pump-electric', 'Electric Water Pump Electrim', 'The Electric Motor\r\nTigris Fire Pump are Brand New 100%\r\nThe Motor Imported From Electric Motor Corporation, Singapore.\r\nHave CO,CQ, Entry For Customs\r\nMOTOR ELECTRIM : EM200LB-2', 'MOTOR ELECTRIM : EM200LB-2\r\nPower (KW/HP/RPM) : 37/50/2900\r\nL X W X H (MM) : 768.5 X 393 X 500.\r\nVoltage V : 380\r\nEfficiency (%) : 92\r\nPump Tigris Fire: 100x65 FSKA\r\nFlow (m3/H) : 45-147\r\nPresssure (m) : 103.1-70.5\r\nSuction Side (mm) : 100\r\nDischarge Side (mm) : 65\r\nDimensions (LxWxH) (mm): 1280x500x720', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-water-pump-electrim-20201107104521.png'),
(69, 7, 'fire-fighting-diesel-pump-deadong-3a165lws', 'Fire Fighting Diesel Pump Deadong 3A165LWS', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.', 'Engine: 3A165LWSS\r\nDisplacement: 1647 cc\r\nBore x Stroke: 87 x 92.4 mm\r\nMaximum Power: 25.5 HP / 2.800 RPM\r\nMaximum Torque: 10.5 Kg.m/ 1.700 RPM\r\nDimenssion (LxWxH): 615x495x628\r\nWeight in dry: 178 Kg\r\nNo.of cylinder: 4\r\nPump: 80 x 65 FSJA\r\nPower (KW/HP): 22/30\r\nFlow (M2/gio): 24-93.9\r\nPressure (m): 94.9-54.1\r\nDimenssions DxRxC (mm): 1400 x 650 x 1100', 'Hubungi Kami', 'Tigris Fire', 1, 'fire-fighting-diesel-pump-deadong-3a165lws-20201107111114.png'),
(70, 7, 'fire-fighting-diesel-pump-deadong-3c100lws', 'Fire Fighting Diesel Pump Deadong 3C100LWS', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n', 'Engine: 3C100LWSS\r\nDisplacement: 1007 cc\r\nBore x Stroke: 75 x 76 mm\r\nMaximum Power: 16.4 HP 22/300 RPM\r\nMaximum Torque: 64 Kg.m/ 1.900 RPM\r\nDimenssion (LxWxH): 505x482x553\r\nWeight in dry: 101 Kg\r\nNo.of cylinder: 3\r\nPump: 80 x 65 FSHA\r\nPower (KW/HP): 22/30\r\nFlow (M2/gio): 24-91.2\r\nPressure (m): 63.1-34.4\r\nDimenssions DxRxC (mm): 1200 x 600 x 1000\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'fire-fighting-diesel-pump-deadong-3c100lws-20201107111807.png'),
(71, 7, 'fire-fighting-pump-hyundai-d4db-100-hp-/-75-kw', 'Fire Fighting Pump Hyundai D4DB 100 HP / 75 KW', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.\r\n \r\n', 'Engine: D4DB\r\nDisplacement: 3907 cc\r\nBore x Stroke: 104 x 105 mm\r\nMaximum Power: 130 HP / 2.900 RPM\r\nMaximum Torque: 37 Kg.m/ 1.600 RPM\r\nDimenssion (LxWxH): 815x695x765.5\r\nWeight in dry: 350 Kg\r\nNo.of cylinder: 4\r\nPump: 125 x 100 FSJCA\r\nPower (KW/HP): 100/75\r\nFlow (M2/gio): 120-327\r\nPressure (m): 91-61.8\r\nDimenssions DxRxC (mm): 1.700 x 800 x 1.200\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'fire-fighting-pump-hyundai-d4db-100-hp-75-kw-20201107112411.png'),
(72, 7, 'fire-fighting-pump-hyundai-d4bb-60-hp-/-45-kw', 'Fire Fighting Pump Hyundai D4BB 60 HP / 45 KW', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.\r\n', 'Engine: D4BB\r\nDisplacement:2607 cc\r\nBore x Stroke: 91.1 x 100 mm\r\nMaximum Power: 130 HP / 2.900 RPM\r\nMaximum Torque: 17 Kg.m/ 2.200 RPM\r\nDimenssion (LxWxH): 710x673.4x641\r\nWeight in dry: 200.8 Kg\r\nNo.of cylinder: 4\r\nPump: 100 x 80 FSJA\r\nPower (KW/HP): 45/60\r\nFlow (M2/gio): 48-180\r\nPressure (m): 98.9-55\r\nDimenssions DxRxC (mm): 1500 x 760 x 900\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'fire-fighting-pump-hyundai-d4bb-60-hp-45-kw-20201107113035.png'),
(73, 7, 'booster-pump-cvm-b25', 'Booster Pump CVM B25', 'Booster Pump: CVM B/25 IE3\r\nPower (KW): 1.85 \r\nFlow(m3/h): 30-120\r\nPressure (m) : 41-105', 'Booster Pump: CVM B/25 IE3\r\nPower (KW): 1.85 \r\nFlow(m3/h): 30-120\r\nPressure (m) : 41-105', 'Hubungi Kami', 'Tigris Fire', 1, 'booster-pump-cvm-b25-20201107113409.png'),
(74, 7, 'booster-pump-evmsg10-11n5q', 'Booster Pump EVMSG10 11N5Q', 'Booster Pump: EVMSG10 11N5Q\r\nPower (KW): 4\r\nFlow(m3/h): 75-250\r\nPressure (m) : 54-120\r\n', 'Booster Pump: EVMSG10 11N5Q\r\nPower (KW): 4\r\nFlow(m3/h): 75-250\r\nPressure (m) : 54-120', 'Hubungi Kami', 'Tigris Fire', 1, 'booster-pump-evmsg10-11n5q-20201107113701.png'),
(75, 7, 'diesel-fire-pump-hyundai-d4al', 'Diesel Fire Pump Hyundai D4AL', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.\r\n', 'Engine: D4AL\r\nDisplacement: 3.298 cc\r\nBore x Stroke: 100 x 105 mm\r\nMaximum Power: 90 HP 120/3.400 RPM\r\nMaximum Torque: 30 Kg.m/ 2.000 RPM\r\nDimenssion (LxWxH): 815x695x765.5\r\nWeight in dry: 350 Kg\r\nNo.of cylinder: 4\r\nPump: 150 x 100 FSKA\r\nPower (KW/HP): 90/120\r\nFlow (M2/gio): 200\r\nPressure (m): 95\r\n\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'diesel-fire-pump-hyundai-d4al-20201107114151.png'),
(76, 7, 'electric-fire-pump-att-125-x-100-fsjca-55-kw', 'Electric Fire Pump ATT 125 x 100 FSJCA 55 KW', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.\r\n', 'Motor ATT : WY 100-250 M\r\nPower (KW/HP/RPM) : 55/75/2900\r\nL X W X H (MM) : 825 X 490 X 615\r\nVoltage V : 380\r\nEfficiency (%) : 92\r\nPump Tigris Fire: 125 x 100 FSJCA\r\nFlow (m3/H) : 120-327\r\nPresssure (m) : 91-618\r\nDiameter Nozzle (mm) : 125\r\nDiameter Pipe Pushing (mm): 100\r\nDimensions (LxWxH) (mm): 1350 x 640 x 760', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-pump-att-125-x-100-fsjca-55-kw-20201107120521.png'),
(77, 7, 'electric-fire-pump-att-125-x-100-fsjca-75-kw', 'Electric Fire Pump ATT 125 x 100 FSJCA 75 KW', 'It was combined between the leading manufacture Deadong diesel engine and the leading manufacture EBARA Pump to make the fire fighting water pump with exceptional reliability, durability and high quality.\r\nThe fire fighting pump Deadong have a large operational range of the flow and pressure will be fit any fire fighting project. it is easy to install, operate, ready spare parts, that are reasons help the customers will be feel secure when choose the product.\r\n\r\nBeside, they are also applied in irrigation, waste water treatment, industrial water pump field.\r\n', 'Motor ATT : WY 100-355-B3 IP55 ATT\r\nPower (KW/HP/RPM) : 75/100/2970\r\nL X W X H (MM) : 1010x550x685\r\nVoltage V : 380\r\nEfficiency (%) : 93.9\r\nPump Tigris Fire: 125 x 100 FSJCA\r\nFlow (m3/H) : 120 - 327\r\nPresssure (m) : 91 - 61.8\r\nDiameter Nozzle (mm): 125\r\nDiameter Pipe Pushing (mm): 100\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-pump-att-125-x-100-fsjca-75-kw-20201107121039.png'),
(78, 7, 'electric-fire-fighting-pump-electrim-80x60-fsja-18.5-kw', 'Electric Fire Fighting Pump Electrim 80x60 FSJA 18.5 KW', 'The Electric Motor\r\nTigris Fire Pump are Brand New 100%\r\nThe Motor Imported From Electric Motor Corporation, Singapore.\r\nHave CO,CQ, Entry For Customs\r\n', 'Motor Electrim : EM160L-2\r\nPower (KW/HP/RPM) : 18.5/25/2930\r\nL X W X H (MM) : 580x320x420\r\nVoltage V : 380\r\nEfficiency (%) : 92\r\nPump Tigris Fire: 80 x 60 FSJA\r\nFlow (m3/H) : 24 - 93.9\r\nPresssure (m) : 94.9-54.1\r\nDiameter Nozzle (mm): 80\r\nDiameter Pipe Pushing (mm): 65\r\nDimenssions LxWxH (mm): 1100 x 450 x 550', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-fighting-pump-electrim-80x60-fsja-185-kw-20201107121718.png'),
(79, 7, 'electric-fire-fighting-pump-electrim-125x100-fsjca-75-kw', 'Electric Fire Fighting Pump Electrim 125x100 FSJCA 75 KW', 'The Electric Motor\r\nTigris Fire Pump are Brand New 100%\r\nThe Motor Imported From Electric Motor Corporation, Singapore.\r\nHave CO,CQ, Entry For Customs\r\n', 'Motor Electrim : EM280S-2\r\nPower (KW/HP/RPM) : 75/100/2900\r\nL X W X H (MM) : 984x560x675\r\nVoltage V : 380\r\nEfficiency (%) : 93.9\r\nPump Tigris Fire: 125 x 100 FSJCA\r\nFlow (m3/H) : 120 - 327\r\nPresssure (m) : 91 - 61.8\r\nDiameter Nozzle (mm): 125\r\nDiameter Pipe Pushing (mm): 100\r\n', 'Hubungi Kami', 'Tigris Fire', 1, 'electric-fire-fighting-pump-electrim-125x100-fsjca-75-kw-20201107122113.png'),
(80, 7, 'fire-fighting-water-divider', 'Fire Fighting Water Divider', 'Motor : 125 x 100 FSJCA 75 KW\r\nWork Pressure : 10 - 16 Bar\r\nMaterial : Alumunium, Brass\r\n', 'Motor : 125 x 100 FSJCA 75 KW\r\nWork Pressure : 10 - 16 Bar\r\nMaterial : Alumunium, Brass', 'Hubungi Kami', 'Nashiruddien Sadid Mustaqim', 1, 'fire-fighting-water-divider-20201107122547.png'),
(81, 9, 'bracket', 'Bracket', 'Fire Extinguiser Bracket Feature:\r\n1. Wall mounting bracket\r\n2. Suitable for all fire extinguisher\r\n3. Easy to install', 'Fire Extinguiser Bracket Feature:\r\n1. Wall mounting bracket\r\n2. Suitable for all fire extinguisher\r\n3. Easy to install', 'Rp 35.000;', 'Tigris Fire', 1, 'bracket-20201109133526.png'),
(82, 4, 'refill-co2', 'Refill Co2', 'Harga untuk Refill per KG\r\nEfektif Memadamkan Api untuk Kelas Kebakaran  B dan C\r\n', 'Tipe Propollant : Karbondioksida\r\nUji Tekanan: 25 Bar\r\nBeroperasi Pada Suhu: 20 - 60 derajat celcius\r\nJarak Penyemprotan yang aman: 2 meter', 'Rp 80.000;', 'Tigris Fire', 1, 'refill-co2-20201109134307.png'),
(83, 4, 'refill-foam-6 KG', 'Refill Foam 6 KG', 'Efektif Memadamkan api untuk kelas kebakaran A dan B\r\nRefill per kg : Rp 30.000\r\nTersedia untuk ukuran:\r\n6 kg\r\n9 kg\r\n25 kg\r\n30 kg\r\n50 kg', 'Tipe Propellant : Nitrogen\r\nUji Tekanan : 25 Bar\r\nBeroperasi pada suhu : 20-60 derajat celcius\r\nJarak penyemprotan yang aman : 2 meter', 'Rp 175.000;', 'Tigris Fire', 1, 'refill-foam-6-kg-20201109135459.png');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `id_catserv` int(11) NOT NULL,
  `id_subserv` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `writer` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `id_catserv`, `id_subserv`, `slug`, `title`, `intro`, `description`, `price`, `writer`, `is_available`, `image`) VALUES
(1, 4, 1, 'fire-maintenance-fm-200', 'Fire Maintenance FM 200', 'Maintenance Contract Fire Suppression FM200\r\n1 Year With Preventive Maintenance, Visit per 3 Month \r\nPayment Pervisit', 'Maintenance Contract Fire Suppression FM200\r\n1 Year With Preventive Maintenance, Visit per 3 Month \r\nPayment Pervisit', 'Hubungi Kami', 'Nashiruddien Sadid Mustaqim', 1, 'fire-maintenance-fm-200-20201113094956.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

CREATE TABLE `sub` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub`
--

INSERT INTO `sub` (`id`, `id_category`, `slug`, `title`) VALUES
(2, 4, 'co2', 'CO2'),
(3, 4, 'foam-afff', 'FOAM AFFF'),
(8, 3, 'pompa-portable', 'POMPA PORTABLE'),
(9, 8, 'fire-techno', 'FIRE TECHNO'),
(10, 8, 'robot', 'ROBOT'),
(11, 8, 'dust-suppression', 'DUST SUPPRESSION'),
(12, 8, 'drone', 'DRONE'),
(13, 5, 'selang', 'SELANG'),
(14, 5, 'hydrant', 'HYDRANT'),
(15, 5, 'coupling', 'COUPLING'),
(16, 9, 'dry-chemical-powder', 'DRY CHEMICAL POWDER'),
(17, 9, 'carbon-dioxide-co2', 'CARBON DIOXIDE CO2'),
(18, 9, 'foam', 'FOAM'),
(19, 9, 'tf-11-es', 'TF-11-ES'),
(20, 9, 'tf-11-es-x', 'TF-11-ES-X'),
(21, 1, 'fm-200', 'FM 200'),
(22, 7, 'panel', 'PANEL'),
(23, 7, 'fire-pump', 'FIRE PUMP'),
(24, 7, 'deluge', 'DELUGE'),
(25, 5, 'fire-hose', 'FIRE HOSE'),
(26, 1, 'co2-system', 'CO2 SYSTEM'),
(27, 2, 'tfs-227', 'TFS 227'),
(28, 2, 'tfs-co2', 'TFS CO2'),
(29, 6, 'apar-box', 'APAR BOX');

-- --------------------------------------------------------

--
-- Table structure for table `subserv`
--

CREATE TABLE `subserv` (
  `id` int(11) NOT NULL,
  `id_catserv` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subserv`
--

INSERT INTO `subserv` (`id`, `id_catserv`, `slug`, `title`) VALUES
(1, 4, 'fm-200', 'FM 200'),
(2, 4, 'novec', 'NOVEC'),
(3, 4, 'tf-11', 'TF 11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT 'avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(1, 'Nashiruddien Sadid Mustaqim', 'diditsadidnsm180818@gmail.com', '$2y$10$gXpwBhB0SOmFioIs2cumB.EVfPh5v8OIDHuLxzOI6jF79802M2xEm', 'admin', 1, 'avatar.png'),
(2, 'Tigris Fire', 'tigrisfire123@gmail.com', '$2y$10$BAYJhZsoOH7GPzdsJawlGOanFxfEa9DHA6e9C8/ie3ps6oc6lLXby', 'admin', 1, 'avatar.png'),
(3, 'test`', 'tererfdfh@gmail.com', '$2y$10$RBAg2xK8PA84zUeYmlIxdeDpAZNHw8FXhvXno8pHW3FQUpwfmOazO', 'member', 1, 'avatar.png'),
(4, 'HydraFum', 'frist.hydra.rumwer@mail.ru', '$2y$10$eZ8xkEBAQrBeHpoWNxf4NuOA9wb3i7PQnWHadWwczD3aRZA.pA86e', 'member', 1, 'avatar.png'),
(5, 'Lorie Corrado', 'lorie@reliant-pm.com', '$2y$10$/mFFpTDTN408A6n2VO2xi.0SCq.3RcJPKfBjjfJ9fww/ShOXK9lmW', 'member', 1, 'avatar.png'),
(6, 'Didit Sadid', 'diditsadidnsm199@gmail.com', '$2y$10$.c4L0JMaVl2gmi8iWFEeq.lfLA.9GcmdNHR2E7xsIZ3KB1diqNgZq', 'member', 1, 'avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` int(255) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(1, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `ip` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `online` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`ip`, `date`, `hits`, `online`, `time`) VALUES
('::1', '2020-10-14', 67, '1602688733', '2020-10-14 15:50:14'),
('::1', '2020-10-15', 221, '1602724800', '2020-10-15 02:32:42'),
('110.138.150.165', '2020-10-15', 32, '1602774707', '2020-10-15 08:29:06'),
('116.179.32.217', '2020-10-15', 1, '1602725589', '2020-10-15 08:33:09'),
('103.134.152.245', '2020-10-15', 2, '1602734334', '2020-10-15 08:35:40'),
('36.69.126.68', '2020-10-15', 5, '1602736231', '2020-10-15 08:53:13'),
('91.213.50.99', '2020-10-15', 2, '1602732827', '2020-10-15 10:33:44'),
('103.3.222.51', '2020-10-15', 9, '1602746070', '2020-10-15 10:40:35'),
('66.249.82.72', '2020-10-15', 1, '1602733290', '2020-10-15 10:41:30'),
('66.249.82.74', '2020-10-15', 3, '1602733293', '2020-10-15 10:41:30'),
('157.167.34.180', '2020-10-15', 1, '1602734265', '2020-10-15 10:57:45'),
('131.220.6.152', '2020-10-15', 2, '1602744394', '2020-10-15 10:59:03'),
('110.138.150.248', '2020-10-15', 3, '1602748667', '2020-10-15 11:15:33'),
('173.252.111.2', '2020-10-15', 1, '1602735901', '2020-10-15 11:25:01'),
('66.249.81.78', '2020-10-15', 3, '1602736957', '2020-10-15 11:42:20'),
('66.249.81.74', '2020-10-15', 1, '1602736956', '2020-10-15 11:42:36'),
('64.233.172.92', '2020-10-15', 1, '1602738066', '2020-10-15 12:01:06'),
('157.55.39.216', '2020-10-15', 1, '1602744445', '2020-10-15 13:47:25'),
('31.13.127.24', '2020-10-15', 1, '1602745609', '2020-10-15 14:06:49'),
('31.13.127.4', '2020-10-15', 1, '1602745636', '2020-10-15 14:07:16'),
('182.2.136.56', '2020-10-15', 3, '1602748954', '2020-10-15 15:01:09'),
('180.252.124.193', '2020-10-15', 1, '1602750277', '2020-10-15 15:24:37'),
('130.204.86.54', '2020-10-15', 1, '1602752856', '2020-10-15 16:07:36'),
('8.210.38.217', '2020-10-15', 1, '1602753357', '2020-10-15 16:15:57'),
('31.13.103.5', '2020-10-15', 1, '1602757035', '2020-10-15 17:17:15'),
('31.13.103.21', '2020-10-15', 1, '1602757038', '2020-10-15 17:17:18'),
('49.7.20.114', '2020-10-15', 1, '1602764439', '2020-10-15 19:20:39'),
('121.122.48.61', '2020-10-15', 1, '1602764573', '2020-10-15 19:22:53'),
('66.249.79.128', '2020-10-15', 1, '1602767909', '2020-10-15 20:18:29'),
('114.119.131.112', '2020-10-15', 1, '1602773504', '2020-10-15 21:51:44'),
('66.249.68.53', '2020-10-15', 1, '1602776564', '2020-10-15 22:42:44'),
('66.249.79.159', '2020-10-15', 1, '1602776639', '2020-10-15 22:43:59'),
('66.249.68.51', '2020-10-15', 1, '1602776833', '2020-10-15 22:47:13'),
('35.197.76.98', '2020-10-15', 1, '1602781188', '2020-10-15 23:59:48'),
('123.183.224.3', '2020-10-16', 1, '1602785026', '2020-10-16 01:03:46'),
('64.233.172.94', '2020-10-16', 2, '1602831775', '2020-10-16 01:25:57'),
('64.233.172.92', '2020-10-16', 1, '1602786358', '2020-10-16 01:25:58'),
('66.220.149.15', '2020-10-16', 1, '1602787205', '2020-10-16 01:40:05'),
('66.220.149.4', '2020-10-16', 1, '1602787207', '2020-10-16 01:40:07'),
('66.220.149.12', '2020-10-16', 1, '1602787213', '2020-10-16 01:40:13'),
('173.252.87.11', '2020-10-16', 1, '1602787266', '2020-10-16 01:41:06'),
('31.13.115.11', '2020-10-16', 1, '1602787303', '2020-10-16 01:41:43'),
('31.13.103.10', '2020-10-16', 1, '1602787338', '2020-10-16 01:42:18'),
('31.13.115.17', '2020-10-16', 1, '1602787359', '2020-10-16 01:42:39'),
('173.252.111.11', '2020-10-16', 1, '1602787389', '2020-10-16 01:43:09'),
('173.252.87.5', '2020-10-16', 1, '1602787661', '2020-10-16 01:47:41'),
('173.252.83.3', '2020-10-16', 1, '1602787695', '2020-10-16 01:48:15'),
('66.249.93.82', '2020-10-16', 1, '1602789771', '2020-10-16 02:22:51'),
('66.42.104.124', '2020-10-16', 2, '1602790051', '2020-10-16 02:26:29'),
('66.249.68.51', '2020-10-16', 3, '1602830472', '2020-10-16 02:56:27'),
('51.75.144.43', '2020-10-16', 1, '1602793426', '2020-10-16 03:23:46'),
('35.196.233.112', '2020-10-16', 2, '1602793555', '2020-10-16 03:23:54'),
('66.220.149.119', '2020-10-16', 1, '1602795545', '2020-10-16 03:59:05'),
('66.249.68.53', '2020-10-16', 2, '1602830470', '2020-10-16 04:21:31'),
('188.166.246.22', '2020-10-16', 1, '1602798821', '2020-10-16 04:53:41'),
('123.183.224.142', '2020-10-16', 1, '1602807181', '2020-10-16 07:13:01'),
('42.236.10.76', '2020-10-16', 1, '1602808395', '2020-10-16 07:33:15'),
('42.236.10.74', '2020-10-16', 1, '1602808395', '2020-10-16 07:33:15'),
('42.236.10.120', '2020-10-16', 1, '1602808845', '2020-10-16 07:40:45'),
('42.236.10.122', '2020-10-16', 1, '1602808845', '2020-10-16 07:40:45'),
('34.83.8.78', '2020-10-16', 1, '1602811421', '2020-10-16 08:23:41'),
('54.174.55.129', '2020-10-16', 1, '1602812584', '2020-10-16 08:43:04'),
('116.203.89.95', '2020-10-16', 5, '1602814848', '2020-10-16 09:20:29'),
('116.203.36.105', '2020-10-16', 1, '1602814836', '2020-10-16 09:20:36'),
('180.246.149.101', '2020-10-16', 1, '1602816937', '2020-10-16 09:55:37'),
('66.249.79.128', '2020-10-16', 1, '1602819829', '2020-10-16 10:43:49'),
('131.220.6.152', '2020-10-16', 2, '1602830865', '2020-10-16 10:58:50'),
('182.2.167.196', '2020-10-16', 1, '1602821587', '2020-10-16 11:13:07'),
('173.252.127.30', '2020-10-16', 1, '1602824033', '2020-10-16 11:53:53'),
('34.82.40.54', '2020-10-16', 1, '1602829424', '2020-10-16 13:23:44'),
('66.249.79.158', '2020-10-16', 1, '1602830470', '2020-10-16 13:41:10'),
('157.55.39.216', '2020-10-16', 1, '1602830943', '2020-10-16 13:49:03'),
('36.70.49.77', '2020-10-16', 1, '1602831144', '2020-10-16 13:52:24'),
('40.88.21.235', '2020-10-16', 2, '1602831856', '2020-10-16 13:58:24'),
('180.252.16.141', '2020-10-16', 1, '1602832983', '2020-10-16 14:23:03'),
('49.7.21.67', '2020-10-16', 1, '1602834858', '2020-10-16 14:54:18'),
('111.94.36.34', '2020-10-16', 1, '1602835062', '2020-10-16 14:57:42'),
('66.220.149.3', '2020-10-16', 1, '1602839062', '2020-10-16 16:04:22'),
('182.2.167.220', '2020-10-16', 4, '1602846761', '2020-10-16 16:28:52'),
('66.246.224.12', '2020-10-16', 1, '1602844202', '2020-10-16 17:30:02'),
('123.183.224.4', '2020-10-16', 1, '1602849645', '2020-10-16 19:00:45'),
('138.246.253.15', '2020-10-16', 1, '1602850275', '2020-10-16 19:11:15'),
('123.183.224.137', '2020-10-16', 1, '1602850917', '2020-10-16 19:21:57'),
('114.119.137.8', '2020-10-16', 1, '1602852231', '2020-10-16 19:43:51'),
('209.17.96.114', '2020-10-16', 1, '1602852468', '2020-10-16 19:47:48'),
('114.119.145.210', '2020-10-16', 1, '1602857480', '2020-10-16 21:11:20'),
('114.119.140.175', '2020-10-16', 1, '1602865558', '2020-10-16 23:25:58'),
('66.249.68.51', '2020-10-17', 2, '1602933839', '2020-10-17 00:10:35'),
('35.247.61.32', '2020-10-17', 1, '1602870787', '2020-10-17 00:53:07'),
('38.93.172.26', '2020-10-17', 1, '1602876278', '2020-10-17 02:24:38'),
('157.55.39.216', '2020-10-17', 2, '1602917490', '2020-10-17 02:31:51'),
('34.82.88.199', '2020-10-17', 1, '1602880279', '2020-10-17 03:31:19'),
('149.100.187.85', '2020-10-17', 1, '1602880284', '2020-10-17 03:31:24'),
('66.249.68.53', '2020-10-17', 6, '1602936456', '2020-10-17 03:32:03'),
('110.138.150.165', '2020-10-17', 34, '1602944308', '2020-10-17 03:45:42'),
('54.82.67.88', '2020-10-17', 23, '1602886091', '2020-10-17 03:46:25'),
('52.90.49.207', '2020-10-17', 1, '1602881189', '2020-10-17 03:46:29'),
('54.174.157.206', '2020-10-17', 5, '1602882906', '2020-10-17 03:46:29'),
('34.228.226.4', '2020-10-17', 22, '1602886091', '2020-10-17 03:46:29'),
('66.102.6.154', '2020-10-17', 1, '1602881206', '2020-10-17 03:46:46'),
('103.134.152.245', '2020-10-17', 7, '1602903536', '2020-10-17 03:46:59'),
('54.163.216.30', '2020-10-17', 21, '1602886099', '2020-10-17 03:55:49'),
('49.7.21.66', '2020-10-17', 1, '1602881857', '2020-10-17 03:57:37'),
('54.237.230.22', '2020-10-17', 2, '1602882906', '2020-10-17 03:58:39'),
('66.249.79.128', '2020-10-17', 1, '1602882142', '2020-10-17 04:02:22'),
('3.83.239.70', '2020-10-17', 1, '1602882525', '2020-10-17 04:08:45'),
('173.252.79.6', '2020-10-17', 1, '1602884312', '2020-10-17 04:38:32'),
('173.252.79.14', '2020-10-17', 1, '1602884314', '2020-10-17 04:38:34'),
('173.252.95.25', '2020-10-17', 1, '1602884315', '2020-10-17 04:38:35'),
('173.252.95.26', '2020-10-17', 2, '1602884315', '2020-10-17 04:38:35'),
('173.252.95.21', '2020-10-17', 1, '1602884315', '2020-10-17 04:38:35'),
('173.252.95.12', '2020-10-17', 1, '1602884315', '2020-10-17 04:38:35'),
('173.252.95.23', '2020-10-17', 1, '1602884315', '2020-10-17 04:38:35'),
('173.252.95.3', '2020-10-17', 2, '1602884315', '2020-10-17 04:38:35'),
('66.249.82.72', '2020-10-17', 4, '1602886302', '2020-10-17 05:09:00'),
('66.249.82.70', '2020-10-17', 2, '1602886295', '2020-10-17 05:09:01'),
('66.249.82.74', '2020-10-17', 2, '1602886294', '2020-10-17 05:09:07'),
('62.102.148.68', '2020-10-17', 1, '1602886283', '2020-10-17 05:11:23'),
('116.203.89.95', '2020-10-17', 8, '1602887082', '2020-10-17 05:12:57'),
('35.196.134.248', '2020-10-17', 2, '1602893619', '2020-10-17 07:11:47'),
('131.220.6.152', '2020-10-17', 2, '1602904687', '2020-10-17 07:32:03'),
('103.3.222.51', '2020-10-17', 3, '1602902863', '2020-10-17 08:48:24'),
('114.142.172.24', '2020-10-17', 1, '1602901528', '2020-10-17 09:25:28'),
('36.70.49.77', '2020-10-17', 2, '1602901952', '2020-10-17 09:31:41'),
('114.119.139.84', '2020-10-17', 1, '1602905541', '2020-10-17 10:32:21'),
('34.204.10.141', '2020-10-17', 3, '1602906479', '2020-10-17 10:47:56'),
('110.138.148.77', '2020-10-17', 1, '1602910603', '2020-10-17 11:56:43'),
('138.246.253.15', '2020-10-17', 2, '1602948449', '2020-10-17 12:17:17'),
('114.119.131.112', '2020-10-17', 1, '1602911921', '2020-10-17 12:18:41'),
('114.119.134.9', '2020-10-17', 1, '1602916712', '2020-10-17 13:38:32'),
('3.238.52.108', '2020-10-17', 3, '1602918402', '2020-10-17 14:06:40'),
('35.230.43.147', '2020-10-17', 1, '1602919425', '2020-10-17 14:23:45'),
('106.38.241.112', '2020-10-17', 1, '1602926544', '2020-10-17 16:22:24'),
('34.78.67.134', '2020-10-17', 1, '1602929920', '2020-10-17 17:18:40'),
('192.99.2.71', '2020-10-17', 2, '1602930386', '2020-10-17 17:26:23'),
('123.183.224.143', '2020-10-17', 1, '1602936026', '2020-10-17 19:00:26'),
('66.249.68.49', '2020-10-17', 1, '1602936172', '2020-10-17 19:02:52'),
('66.249.79.158', '2020-10-17', 1, '1602936871', '2020-10-17 19:14:31'),
('54.152.241.251', '2020-10-17', 1, '1602938198', '2020-10-17 19:36:38'),
('23.105.0.11', '2020-10-17', 1, '1602943024', '2020-10-17 20:57:04'),
('64.233.172.94', '2020-10-17', 1, '1602945808', '2020-10-17 21:43:28'),
('168.91.76.150', '2020-10-17', 1, '1602948787', '2020-10-17 22:33:07'),
('123.183.224.132', '2020-10-17', 1, '1602950044', '2020-10-17 22:54:04'),
('194.76.138.199', '2020-10-17', 1, '1602951146', '2020-10-17 23:12:26'),
('209.17.96.234', '2020-10-17', 1, '1602951454', '2020-10-17 23:17:34'),
('66.249.68.49', '2020-10-18', 4, '1602997756', '2020-10-18 00:30:30'),
('106.38.241.102', '2020-10-18', 1, '1602956014', '2020-10-18 00:33:34'),
('195.201.57.164', '2020-10-18', 1, '1602963654', '2020-10-18 02:40:54'),
('209.17.97.18', '2020-10-18', 1, '1602966069', '2020-10-18 03:21:09'),
('114.119.150.22', '2020-10-18', 1, '1602967289', '2020-10-18 03:41:29'),
('114.119.155.121', '2020-10-18', 1, '1602980019', '2020-10-18 07:13:39'),
('42.236.10.74', '2020-10-18', 1, '1602980997', '2020-10-18 07:29:57'),
('42.236.10.83', '2020-10-18', 1, '1602980997', '2020-10-18 07:29:57'),
('190.162.111.96', '2020-10-18', 1, '1602984278', '2020-10-18 08:24:38'),
('103.3.222.51', '2020-10-18', 1, '1602988592', '2020-10-18 09:36:32'),
('114.119.154.186', '2020-10-18', 2, '1602999716', '2020-10-18 09:36:42'),
('81.17.16.149', '2020-10-18', 1, '1602989039', '2020-10-18 09:43:59'),
('66.249.68.53', '2020-10-18', 3, '1602997758', '2020-10-18 09:44:36'),
('106.38.241.113', '2020-10-18', 1, '1602989202', '2020-10-18 09:46:42'),
('35.237.77.231', '2020-10-18', 2, '1602992731', '2020-10-18 10:43:36'),
('131.220.6.152', '2020-10-18', 2, '1603003563', '2020-10-18 10:59:34'),
('110.138.150.165', '2020-10-18', 2, '1602995154', '2020-10-18 11:11:14'),
('110.138.150.165', '2020-10-18', 2, '1602995154', '2020-10-18 11:11:14'),
('66.249.68.51', '2020-10-18', 1, '1602998958', '2020-10-18 12:29:18'),
('188.166.246.22', '2020-10-18', 1, '1603000046', '2020-10-18 12:47:26'),
('157.55.39.216', '2020-10-18', 1, '1603003961', '2020-10-18 13:52:41'),
('182.2.171.94', '2020-10-18', 3, '1603004119', '2020-10-18 13:53:07'),
('49.7.21.66', '2020-10-18', 2, '1603036680', '2020-10-18 14:47:50'),
('139.59.239.193', '2020-10-18', 1, '1603007852', '2020-10-18 14:57:32'),
('119.29.121.220', '2020-10-18', 1, '1603011538', '2020-10-18 15:58:58'),
('185.195.24.52', '2020-10-18', 1, '1603016297', '2020-10-18 17:18:17'),
('172.86.75.138', '2020-10-18', 1, '1603022874', '2020-10-18 19:07:54'),
('106.38.241.182', '2020-10-18', 1, '1603023599', '2020-10-18 19:19:59'),
('194.153.113.101', '2020-10-18', 2, '1603026275', '2020-10-18 20:04:23'),
('106.38.241.115', '2020-10-18', 1, '1603029870', '2020-10-18 21:04:30'),
('140.213.188.245', '2020-10-18', 1, '1603031661', '2020-10-18 21:34:21'),
('207.46.13.41', '2020-10-18', 1, '1603038611', '2020-10-18 23:30:11'),
('54.36.149.15', '2020-10-19', 1, '1603045283', '2020-10-19 01:21:23'),
('195.154.122.111', '2020-10-19', 1, '1603045284', '2020-10-19 01:21:24'),
('66.249.79.128', '2020-10-19', 3, '1603124033', '2020-10-19 01:48:59'),
('66.249.79.158', '2020-10-19', 1, '1603049645', '2020-10-19 02:34:05'),
('66.249.68.51', '2020-10-19', 4, '1603121142', '2020-10-19 03:48:43'),
('35.197.50.88', '2020-10-19', 1, '1603056473', '2020-10-19 04:27:53'),
('35.233.231.62', '2020-10-19', 1, '1603056499', '2020-10-19 04:28:19'),
('114.119.137.8', '2020-10-19', 1, '1603059908', '2020-10-19 05:25:08'),
('73.19.66.242', '2020-10-19', 1, '1603061647', '2020-10-19 05:54:07'),
('89.254.134.115', '2020-10-19', 1, '1603061657', '2020-10-19 05:54:17'),
('66.249.68.49', '2020-10-19', 2, '1603121147', '2020-10-19 06:20:35'),
('158.46.185.91', '2020-10-19', 1, '1603064571', '2020-10-19 06:42:51'),
('52.148.137.35', '2020-10-19', 1, '1603065228', '2020-10-19 06:53:48'),
('123.183.224.143', '2020-10-19', 2, '1603108216', '2020-10-19 07:47:50'),
('175.158.54.161', '2020-10-19', 3, '1603074111', '2020-10-19 09:20:47'),
('131.220.6.152', '2020-10-19', 2, '1603090105', '2020-10-19 11:00:22'),
('36.70.49.77', '2020-10-19', 9, '1603090288', '2020-10-19 11:02:38'),
('78.46.81.158', '2020-10-19', 1, '1603080717', '2020-10-19 11:11:57'),
('119.29.121.220', '2020-10-19', 1, '1603082479', '2020-10-19 11:41:19'),
('64.233.172.94', '2020-10-19', 1, '1603083025', '2020-10-19 11:50:25'),
('35.233.158.106', '2020-10-19', 1, '1603085024', '2020-10-19 12:23:44'),
('49.7.21.66', '2020-10-19', 1, '1603086834', '2020-10-19 12:53:54'),
('182.30.46.77', '2020-10-19', 4, '1603091246', '2020-10-19 13:50:07'),
('157.55.39.216', '2020-10-19', 3, '1603120686', '2020-10-19 13:53:02'),
('114.119.140.175', '2020-10-19', 1, '1603094731', '2020-10-19 15:05:31'),
('153.122.64.132', '2020-10-19', 3, '1603096154', '2020-10-19 15:28:21'),
('173.252.111.19', '2020-10-19', 1, '1603096420', '2020-10-19 15:33:40'),
('173.252.111.9', '2020-10-19', 1, '1603096526', '2020-10-19 15:35:26'),
('66.249.68.53', '2020-10-19', 3, '1603124164', '2020-10-19 17:15:38'),
('51.222.44.145', '2020-10-19', 4, '1603104058', '2020-10-19 17:40:32'),
('51.77.246.206', '2020-10-19', 1, '1603104085', '2020-10-19 17:41:25'),
('173.252.127.26', '2020-10-19', 1, '1603104376', '2020-10-19 17:46:16'),
('42.236.10.112', '2020-10-19', 1, '1603106836', '2020-10-19 18:27:16'),
('42.236.10.116', '2020-10-19', 1, '1603106837', '2020-10-19 18:27:17'),
('42.236.10.90', '2020-10-19', 1, '1603107158', '2020-10-19 18:32:38'),
('42.236.10.77', '2020-10-19', 1, '1603107158', '2020-10-19 18:32:38'),
('207.46.13.41', '2020-10-19', 1, '1603109941', '2020-10-19 19:19:01'),
('140.213.188.245', '2020-10-19', 5, '1603118857', '2020-10-19 19:39:18'),
('183.36.115.105', '2020-10-19', 1, '1603112148', '2020-10-19 19:55:48'),
('118.136.85.46', '2020-10-19', 1, '1603114300', '2020-10-19 20:31:40'),
('64.233.173.56', '2020-10-19', 3, '1603119199', '2020-10-19 21:51:50'),
('64.233.173.54', '2020-10-19', 3, '1603119120', '2020-10-19 21:51:50'),
('185.164.56.223', '2020-10-19', 1, '1603119960', '2020-10-19 22:06:00'),
('66.249.79.159', '2020-10-19', 1, '1603120504', '2020-10-19 22:15:04'),
('173.252.95.19', '2020-10-19', 1, '1603124218', '2020-10-19 23:16:58'),
('209.17.97.58', '2020-10-20', 1, '1603129750', '2020-10-20 00:49:10'),
('35.190.142.20', '2020-10-20', 2, '1603130150', '2020-10-20 00:54:03'),
('34.75.185.140', '2020-10-20', 2, '1603131292', '2020-10-20 01:13:05'),
('173.252.127.117', '2020-10-20', 1, '1603131982', '2020-10-20 01:26:22'),
('40.79.79.129', '2020-10-20', 1, '1603132510', '2020-10-20 01:35:10'),
('123.183.224.4', '2020-10-20', 2, '1603144751', '2020-10-20 01:53:19'),
('35.196.189.147', '2020-10-20', 2, '1603136570', '2020-10-20 02:40:55'),
('35.230.10.42', '2020-10-20', 1, '1603146219', '2020-10-20 05:23:39'),
('35.230.67.52', '2020-10-20', 1, '1603146225', '2020-10-20 05:23:45'),
('209.17.96.178', '2020-10-20', 1, '1603149534', '2020-10-20 06:18:54'),
('121.244.91.31', '2020-10-20', 2, '1603151192', '2020-10-20 06:46:31'),
('119.29.121.220', '2020-10-20', 1, '1603153572', '2020-10-20 07:26:12'),
('66.249.79.128', '2020-10-20', 1, '1603155489', '2020-10-20 07:58:09'),
('114.119.131.112', '2020-10-20', 1, '1603156992', '2020-10-20 08:23:12'),
('66.249.68.53', '2020-10-20', 1, '1603157097', '2020-10-20 08:24:57'),
('54.174.53.25', '2020-10-20', 1, '1603158186', '2020-10-20 08:43:06'),
('103.134.152.245', '2020-10-20', 1, '1603163160', '2020-10-20 10:06:00'),
('114.119.140.175', '2020-10-20', 1, '1603163749', '2020-10-20 10:15:49'),
('64.233.172.94', '2020-10-20', 1, '1603163783', '2020-10-20 10:16:23'),
('77.75.77.101', '2020-10-20', 1, '1603165686', '2020-10-20 10:48:06'),
('131.220.6.152', '2020-10-20', 2, '1603176344', '2020-10-20 10:59:28'),
('180.242.203.25', '2020-10-20', 2, '1603168509', '2020-10-20 11:35:09'),
('49.7.21.66', '2020-10-20', 1, '1603169600', '2020-10-20 11:53:20'),
('64.233.172.90', '2020-10-20', 1, '1603170413', '2020-10-20 12:06:53'),
('66.246.224.12', '2020-10-20', 1, '1603172991', '2020-10-20 12:49:51'),
('125.162.49.0', '2020-10-20', 1, '1603173255', '2020-10-20 12:54:15'),
('66.220.149.28', '2020-10-20', 1, '1603175999', '2020-10-20 13:39:59'),
('66.249.68.49', '2020-10-20', 1, '1603176990', '2020-10-20 13:56:30'),
('110.138.151.13', '2020-10-20', 1, '1603181233', '2020-10-20 15:07:13'),
('36.70.132.72', '2020-10-20', 1, '1603188759', '2020-10-20 17:12:39'),
('35.230.41.177', '2020-10-20', 1, '1603189423', '2020-10-20 17:23:43'),
('34.82.211.39', '2020-10-20', 1, '1603189423', '2020-10-20 17:23:43'),
('136.143.190.44', '2020-10-20', 2, '1603190615', '2020-10-20 17:43:33'),
('123.183.224.174', '2020-10-20', 1, '1603197157', '2020-10-20 19:32:37'),
('66.249.66.43', '2020-10-20', 1, '1603198055', '2020-10-20 19:47:35'),
('35.247.68.154', '2020-10-20', 1, '1603200880', '2020-10-20 20:34:40'),
('209.17.96.66', '2020-10-20', 1, '1603202038', '2020-10-20 20:53:58'),
('123.183.224.143', '2020-10-20', 1, '1603205655', '2020-10-20 21:54:15'),
('49.7.21.66', '2020-10-21', 1, '1603226889', '2020-10-21 03:48:09'),
('159.203.99.55', '2020-10-21', 2, '1603228263', '2020-10-21 04:10:57'),
('40.88.21.235', '2020-10-21', 2, '1603263846', '2020-10-21 04:54:22'),
('180.242.203.25', '2020-10-21', 8, '1603232037', '2020-10-21 04:57:58'),
('103.134.152.245', '2020-10-21', 4, '1603293299', '2020-10-21 05:01:04'),
('66.102.6.152', '2020-10-21', 1, '1603232100', '2020-10-21 05:15:00'),
('66.249.82.70', '2020-10-21', 2, '1603232193', '2020-10-21 05:16:33'),
('66.249.82.72', '2020-10-21', 1, '1603232198', '2020-10-21 05:16:38'),
('66.249.82.74', '2020-10-21', 1, '1603232200', '2020-10-21 05:16:40'),
('34.83.33.9', '2020-10-21', 1, '1603237200', '2020-10-21 06:40:00'),
('123.183.224.143', '2020-10-21', 3, '1603294588', '2020-10-21 06:46:11'),
('180.244.25.225', '2020-10-21', 3, '1603238248', '2020-10-21 06:55:04'),
('34.210.230.84', '2020-10-21', 1, '1603238148', '2020-10-21 06:55:48'),
('66.249.79.128', '2020-10-21', 2, '1603239909', '2020-10-21 07:22:03'),
('66.249.68.49', '2020-10-21', 1, '1603239948', '2020-10-21 07:25:48'),
('192.81.131.94', '2020-10-21', 2, '1603241047', '2020-10-21 07:43:27'),
('66.249.68.51', '2020-10-21', 1, '1603241446', '2020-10-21 07:50:46'),
('14.17.3.65', '2020-10-21', 1, '1603243262', '2020-10-21 08:21:02'),
('61.154.51.94', '2020-10-21', 2, '1603248977', '2020-10-21 09:54:22'),
('180.163.220.68', '2020-10-21', 1, '1603249116', '2020-10-21 09:58:36'),
('180.163.220.67', '2020-10-21', 1, '1603249182', '2020-10-21 09:59:42'),
('106.38.241.102', '2020-10-21', 1, '1603252671', '2020-10-21 10:57:51'),
('131.220.6.152', '2020-10-21', 2, '1603263073', '2020-10-21 10:59:48'),
('114.119.134.9', '2020-10-21', 1, '1603253099', '2020-10-21 11:04:59'),
('113.13.157.202', '2020-10-21', 1, '1603253213', '2020-10-21 11:06:53'),
('203.184.131.178', '2020-10-21', 2, '1603258728', '2020-10-21 12:37:26'),
('42.236.10.71', '2020-10-21', 1, '1603259755', '2020-10-21 12:55:55'),
('42.236.10.72', '2020-10-21', 1, '1603259755', '2020-10-21 12:55:55'),
('157.55.39.216', '2020-10-21', 1, '1603260675', '2020-10-21 13:11:15'),
('183.141.75.186', '2020-10-21', 5, '1603260968', '2020-10-21 13:13:03'),
('149.28.195.100', '2020-10-21', 1, '1603260843', '2020-10-21 13:14:03'),
('66.246.224.12', '2020-10-21', 1, '1603260890', '2020-10-21 13:14:50'),
('42.236.10.114', '2020-10-21', 1, '1603263550', '2020-10-21 13:59:10'),
('42.236.10.125', '2020-10-21', 2, '1603263591', '2020-10-21 13:59:48'),
('34.227.242.121', '2020-10-21', 2, '1603266940', '2020-10-21 14:03:01'),
('5.255.253.108', '2020-10-21', 1, '1603263813', '2020-10-21 14:03:33'),
('114.119.155.121', '2020-10-21', 1, '1603264871', '2020-10-21 14:21:11'),
('18.234.87.121', '2020-10-21', 1, '1603265256', '2020-10-21 14:27:36'),
('54.36.148.8', '2020-10-21', 1, '1603266675', '2020-10-21 14:51:15'),
('195.154.122.85', '2020-10-21', 1, '1603266676', '2020-10-21 14:51:16'),
('180.252.141.160', '2020-10-21', 1, '1603269142', '2020-10-21 15:32:22'),
('222.237.222.29', '2020-10-21', 1, '1603269154', '2020-10-21 15:32:34'),
('104.196.30.166', '2020-10-21', 2, '1603271035', '2020-10-21 16:02:02'),
('140.213.188.245', '2020-10-21', 2, '1603277256', '2020-10-21 17:33:44'),
('64.233.172.92', '2020-10-21', 1, '1603277290', '2020-10-21 17:48:10'),
('58.250.125.130', '2020-10-21', 1, '1603284697', '2020-10-21 19:51:37'),
('35.164.229.61', '2020-10-21', 1, '1603286481', '2020-10-21 20:21:21'),
('206.189.91.215', '2020-10-21', 1, '1603291521', '2020-10-21 21:45:21'),
('173.252.87.117', '2020-10-21', 1, '1603293317', '2020-10-21 22:15:17'),
('114.119.154.186', '2020-10-22', 1, '1603305415', '2020-10-22 01:36:55'),
('31.197.21.102', '2020-10-22', 1, '1603310773', '2020-10-22 03:06:13'),
('54.36.149.52', '2020-10-22', 1, '1603312843', '2020-10-22 03:40:43'),
('195.154.122.77', '2020-10-22', 1, '1603312845', '2020-10-22 03:40:45'),
('66.249.79.150', '2020-10-22', 1, '1603313832', '2020-10-22 03:57:12'),
('123.183.224.4', '2020-10-22', 1, '1603320703', '2020-10-22 05:51:43'),
('66.249.68.53', '2020-10-22', 1, '1603320846', '2020-10-22 05:54:06'),
('66.249.68.51', '2020-10-22', 1, '1603320849', '2020-10-22 05:54:09'),
('66.249.68.49', '2020-10-22', 1, '1603320853', '2020-10-22 05:54:13'),
('209.17.97.90', '2020-10-22', 1, '1603325810', '2020-10-22 07:16:50'),
('34.105.89.179', '2020-10-22', 1, '1603329820', '2020-10-22 08:23:40'),
('136.143.190.44', '2020-10-22', 2, '1603333762', '2020-10-22 09:29:20'),
('125.131.31.26', '2020-10-22', 1, '1603337178', '2020-10-22 10:26:18'),
('77.75.78.165', '2020-10-22', 1, '1603337672', '2020-10-22 10:34:32'),
('49.7.21.66', '2020-10-22', 2, '1603368505', '2020-10-22 10:48:42'),
('54.36.148.8', '2020-10-22', 1, '1603338992', '2020-10-22 10:56:32'),
('195.154.122.110', '2020-10-22', 1, '1603338994', '2020-10-22 10:56:34'),
('131.220.6.152', '2020-10-22', 2, '1603348992', '2020-10-22 10:59:05'),
('13.90.95.239', '2020-10-22', 1, '1603339845', '2020-10-22 11:10:45'),
('122.242.232.131', '2020-10-22', 1, '1603341519', '2020-10-22 11:38:39'),
('114.119.139.84', '2020-10-22', 1, '1603344264', '2020-10-22 12:24:24'),
('173.231.59.200', '2020-10-22', 1, '1603344405', '2020-10-22 12:26:45'),
('173.252.83.15', '2020-10-22', 4, '1603344780', '2020-10-22 12:32:59'),
('36.70.49.77', '2020-10-22', 10, '1603357625', '2020-10-22 12:34:09'),
('157.55.39.216', '2020-10-22', 1, '1603346860', '2020-10-22 13:07:40'),
('139.193.175.212', '2020-10-22', 1, '1603347027', '2020-10-22 13:10:27'),
('40.88.21.235', '2020-10-22', 1, '1603352984', '2020-10-22 14:49:44'),
('66.246.224.12', '2020-10-22', 1, '1603357094', '2020-10-22 15:58:14'),
('103.134.152.245', '2020-10-22', 2, '1603357382', '2020-10-22 16:02:35'),
('173.252.79.112', '2020-10-22', 1, '1603357586', '2020-10-22 16:06:26'),
('54.36.149.85', '2020-10-22', 1, '1603358403', '2020-10-22 16:20:03'),
('195.154.122.85', '2020-10-22', 1, '1603358405', '2020-10-22 16:20:05'),
('180.242.182.24', '2020-10-22', 3, '1603360606', '2020-10-22 16:42:45'),
('39.101.1.61', '2020-10-22', 1, '1603362722', '2020-10-22 17:32:02'),
('64.233.172.90', '2020-10-22', 1, '1603363898', '2020-10-22 17:51:38'),
('64.233.172.92', '2020-10-22', 1, '1603363904', '2020-10-22 17:51:44'),
('114.5.209.100', '2020-10-22', 2, '1603365409', '2020-10-22 18:09:19'),
('180.242.180.105', '2020-10-22', 3, '1603365570', '2020-10-22 18:15:43'),
('180.242.182.34', '2020-10-22', 1, '1603365372', '2020-10-22 18:16:12'),
('173.252.87.11', '2020-10-22', 1, '1603365600', '2020-10-22 18:20:00'),
('62.210.92.175', '2020-10-22', 1, '1603368036', '2020-10-22 19:00:36'),
('111.202.101.109', '2020-10-22', 1, '1603369145', '2020-10-22 19:19:05'),
('79.111.214.250', '2020-10-22', 9, '1603370482', '2020-10-22 19:40:55'),
('114.119.134.9', '2020-10-22', 1, '1603373021', '2020-10-22 20:23:41'),
('140.213.188.245', '2020-10-22', 4, '1603375917', '2020-10-22 20:24:37'),
('34.83.204.221', '2020-10-22', 1, '1603373416', '2020-10-22 20:30:16'),
('114.119.138.130', '2020-10-22', 1, '1603377714', '2020-10-22 21:41:54'),
('139.59.239.193', '2020-10-22', 1, '1603378901', '2020-10-22 22:01:41'),
('103.78.98.126', '2020-10-22', 2, '1603379525', '2020-10-22 22:11:32'),
('35.196.150.168', '2020-10-22', 2, '1603383277', '2020-10-22 23:12:33'),
('54.36.148.8', '2020-10-23', 2, '1603451293', '2020-10-23 00:48:58'),
('195.154.122.85', '2020-10-23', 1, '1603388940', '2020-10-23 00:49:00'),
('106.38.241.102', '2020-10-23', 1, '1603392217', '2020-10-23 01:43:37'),
('66.249.79.143', '2020-10-23', 1, '1603403034', '2020-10-23 04:43:54'),
('173.252.87.5', '2020-10-23', 2, '1603432371', '2020-10-23 04:52:26'),
('114.119.131.112', '2020-10-23', 1, '1603412462', '2020-10-23 07:21:02'),
('209.17.96.186', '2020-10-23', 1, '1603412607', '2020-10-23 07:23:27'),
('49.7.21.66', '2020-10-23', 1, '1603414426', '2020-10-23 07:53:46'),
('114.84.247.29', '2020-10-23', 2, '1603417115', '2020-10-23 08:36:34'),
('35.230.15.105', '2020-10-23', 1, '1603419820', '2020-10-23 09:23:40'),
('125.131.31.26', '2020-10-23', 4, '1603442738', '2020-10-23 10:21:13'),
('148.251.121.91', '2020-10-23', 2, '1603424321', '2020-10-23 10:38:40'),
('54.36.149.52', '2020-10-23', 1, '1603425410', '2020-10-23 10:56:50'),
('195.154.122.194', '2020-10-23', 2, '1603451294', '2020-10-23 10:56:51'),
('131.220.6.152', '2020-10-23', 2, '1603435356', '2020-10-23 10:58:06'),
('110.138.131.37', '2020-10-23', 13, '1603446958', '2020-10-23 11:14:25'),
('42.236.10.121', '2020-10-23', 2, '1603427719', '2020-10-23 11:35:15'),
('42.236.10.110', '2020-10-23', 2, '1603428093', '2020-10-23 11:41:33'),
('140.213.188.245', '2020-10-23', 13, '1603462194', '2020-10-23 12:16:06'),
('123.183.224.143', '2020-10-23', 2, '1603471123', '2020-10-23 12:46:49'),
('173.252.87.113', '2020-10-23', 1, '1603432361', '2020-10-23 12:52:41'),
('69.171.251.19', '2020-10-23', 1, '1603432363', '2020-10-23 12:52:43'),
('69.171.251.7', '2020-10-23', 1, '1603432372', '2020-10-23 12:52:52'),
('69.171.251.15', '2020-10-23', 2, '1603451597', '2020-10-23 12:52:52'),
('207.46.13.116', '2020-10-23', 1, '1603433347', '2020-10-23 13:09:07'),
('103.134.152.245', '2020-10-23', 8, '1603446943', '2020-10-23 13:55:26'),
('180.244.132.157', '2020-10-23', 16, '1603442544', '2020-10-23 13:58:24'),
('66.220.149.111', '2020-10-23', 1, '1603436376', '2020-10-23 13:59:36'),
('173.252.95.117', '2020-10-23', 1, '1603440706', '2020-10-23 15:11:46'),
('173.252.95.19', '2020-10-23', 1, '1603440708', '2020-10-23 15:11:48'),
('173.252.95.4', '2020-10-23', 1, '1603440709', '2020-10-23 15:11:49'),
('54.36.148.35', '2020-10-23', 2, '1603441487', '2020-10-23 15:24:03'),
('54.36.149.22', '2020-10-23', 1, '1603441455', '2020-10-23 15:24:15'),
('104.248.53.169', '2020-10-23', 1, '1603441460', '2020-10-23 15:24:20'),
('54.36.149.29', '2020-10-23', 1, '1603441478', '2020-10-23 15:24:38'),
('220.160.72.113', '2020-10-23', 1, '1603444073', '2020-10-23 16:07:53'),
('69.171.251.116', '2020-10-23', 1, '1603451595', '2020-10-23 18:13:15'),
('69.171.251.118', '2020-10-23', 1, '1603451599', '2020-10-23 18:13:19'),
('66.246.224.12', '2020-10-23', 1, '1603452317', '2020-10-23 18:25:17'),
('123.183.224.4', '2020-10-23', 1, '1603452478', '2020-10-23 18:27:58'),
('49.7.20.86', '2020-10-23', 1, '1603455920', '2020-10-23 19:25:20'),
('157.55.39.168', '2020-10-23', 1, '1603463208', '2020-10-23 21:26:48'),
('167.99.56.129', '2020-10-23', 1, '1603463522', '2020-10-23 21:32:02'),
('36.110.147.83', '2020-10-23', 2, '1603469506', '2020-10-23 22:37:21'),
('35.197.118.111', '2020-10-23', 1, '1603467638', '2020-10-23 22:40:38'),
('35.197.118.111', '2020-10-23', 1, '1603467638', '2020-10-23 22:40:38'),
('36.110.147.83', '2020-10-24', 1, '1603472497', '2020-10-24 00:01:37'),
('66.249.79.249', '2020-10-24', 1, '1603474701', '2020-10-24 00:38:21'),
('186.226.162.81', '2020-10-24', 1, '1603477909', '2020-10-24 01:31:49'),
('104.196.176.192', '2020-10-24', 2, '1603482261', '2020-10-24 02:42:24'),
('46.246.3.254', '2020-10-24', 1, '1603492622', '2020-10-24 05:37:02'),
('66.249.68.49', '2020-10-24', 4, '1603533615', '2020-10-24 06:02:11'),
('66.249.79.128', '2020-10-24', 2, '1603533604', '2020-10-24 06:02:30'),
('66.249.79.159', '2020-10-24', 1, '1603494169', '2020-10-24 06:02:49'),
('54.36.148.202', '2020-10-24', 1, '1603496245', '2020-10-24 06:37:25'),
('195.154.122.208', '2020-10-24', 1, '1603496247', '2020-10-24 06:37:27'),
('106.38.241.102', '2020-10-24', 2, '1603537459', '2020-10-24 06:44:59'),
('110.138.131.37', '2020-10-24', 5, '1603520168', '2020-10-24 08:31:28'),
('110.138.148.176', '2020-10-24', 5, '1603525336', '2020-10-24 08:59:44'),
('103.134.152.245', '2020-10-24', 3, '1603504890', '2020-10-24 09:01:08'),
('173.252.107.111', '2020-10-24', 1, '1603506146', '2020-10-24 09:22:26'),
('3.104.55.112', '2020-10-24', 1, '1603507761', '2020-10-24 09:49:21'),
('114.119.131.112', '2020-10-24', 1, '1603509559', '2020-10-24 10:19:19'),
('35.230.69.189', '2020-10-24', 1, '1603509826', '2020-10-24 10:23:46'),
('131.220.6.152', '2020-10-24', 2, '1603521771', '2020-10-24 10:59:34'),
('86.178.49.124', '2020-10-24', 1, '1603518211', '2020-10-24 12:43:31'),
('157.55.39.168', '2020-10-24', 1, '1603519708', '2020-10-24 13:08:28'),
('35.170.202.219', '2020-10-24', 3, '1603519994', '2020-10-24 13:13:12'),
('123.183.224.4', '2020-10-24', 1, '1603522321', '2020-10-24 13:52:01'),
('40.83.99.11', '2020-10-24', 1, '1603527827', '2020-10-24 15:23:47'),
('66.249.79.158', '2020-10-24', 1, '1603533612', '2020-10-24 17:00:12'),
('54.36.149.52', '2020-10-24', 1, '1603534412', '2020-10-24 17:13:32'),
('195.154.122.138', '2020-10-24', 1, '1603534414', '2020-10-24 17:13:34'),
('196.245.251.99', '2020-10-24', 2, '1603537757', '2020-10-24 18:09:14'),
('64.233.172.92', '2020-10-24', 1, '1603540314', '2020-10-24 18:51:54'),
('49.7.20.67', '2020-10-24', 1, '1603541894', '2020-10-24 19:18:14'),
('54.36.148.114', '2020-10-24', 1, '1603542940', '2020-10-24 19:35:40'),
('195.154.122.55', '2020-10-24', 1, '1603542942', '2020-10-24 19:35:42'),
('5.255.253.108', '2020-10-24', 1, '1603550417', '2020-10-24 21:40:17'),
('34.105.65.69', '2020-10-24', 1, '1603557766', '2020-10-24 23:42:46'),
('209.17.97.106', '2020-10-25', 1, '1603562481', '2020-10-25 01:01:21'),
('114.119.131.112', '2020-10-25', 1, '1603564926', '2020-10-25 01:42:06'),
('54.36.148.8', '2020-10-25', 2, '1603639361', '2020-10-25 02:41:10'),
('195.154.122.77', '2020-10-25', 1, '1603568472', '2020-10-25 02:41:12'),
('123.183.224.143', '2020-10-25', 1, '1603572441', '2020-10-25 03:47:21'),
('138.246.253.15', '2020-10-25', 3, '1603584172', '2020-10-25 05:05:45'),
('39.101.1.61', '2020-10-25', 1, '1603579175', '2020-10-25 05:39:35'),
('106.38.241.102', '2020-10-25', 3, '1603638720', '2020-10-25 06:00:12'),
('45.84.81.225', '2020-10-25', 1, '1603585737', '2020-10-25 07:28:57'),
('66.249.68.51', '2020-10-25', 2, '1603607000', '2020-10-25 10:34:03'),
('66.249.68.53', '2020-10-25', 1, '1603597947', '2020-10-25 10:52:27'),
('66.249.68.49', '2020-10-25', 1, '1603599800', '2020-10-25 11:23:20'),
('34.83.43.253', '2020-10-25', 1, '1603599818', '2020-10-25 11:23:38'),
('131.220.6.152', '2020-10-25', 2, '1603611896', '2020-10-25 11:59:11'),
('54.36.149.52', '2020-10-25', 1, '1603605863', '2020-10-25 13:04:23'),
('195.154.122.208', '2020-10-25', 2, '1603639362', '2020-10-25 13:04:24'),
('40.113.16.216', '2020-10-25', 1, '1603606864', '2020-10-25 13:21:04'),
('52.252.105.88', '2020-10-25', 1, '1603608397', '2020-10-25 13:46:37'),
('173.252.95.24', '2020-10-25', 1, '1603609827', '2020-10-25 14:10:27'),
('173.252.95.5', '2020-10-25', 1, '1603609827', '2020-10-25 14:10:27'),
('173.252.95.9', '2020-10-25', 1, '1603609827', '2020-10-25 14:10:27'),
('173.252.95.3', '2020-10-25', 1, '1603609827', '2020-10-25 14:10:27'),
('66.220.149.32', '2020-10-25', 1, '1603609831', '2020-10-25 14:10:31'),
('66.249.79.159', '2020-10-25', 1, '1603614337', '2020-10-25 15:25:37'),
('66.249.79.158', '2020-10-25', 1, '1603614341', '2020-10-25 15:25:41'),
('52.62.76.100', '2020-10-25', 1, '1603614381', '2020-10-25 15:26:21'),
('34.82.211.39', '2020-10-25', 1, '1603617820', '2020-10-25 16:23:40'),
('205.169.39.51', '2020-10-25', 1, '1603623320', '2020-10-25 17:55:20'),
('182.2.167.201', '2020-10-25', 1, '1603625739', '2020-10-25 18:35:39'),
('114.119.134.9', '2020-10-25', 1, '1603626833', '2020-10-25 18:53:53'),
('52.149.213.1', '2020-10-25', 1, '1603628177', '2020-10-25 19:16:17'),
('58.250.125.149', '2020-10-25', 1, '1603628869', '2020-10-25 19:27:49'),
('220.116.44.228', '2020-10-25', 1, '1603630560', '2020-10-25 19:56:00'),
('1.244.69.233', '2020-10-25', 1, '1603630586', '2020-10-25 19:56:26'),
('34.83.203.175', '2020-10-25', 1, '1603643950', '2020-10-25 23:39:10'),
('123.183.224.4', '2020-10-26', 1, '1603659577', '2020-10-26 03:59:37'),
('66.249.68.51', '2020-10-26', 4, '1603722980', '2020-10-26 06:17:08'),
('18.237.31.198', '2020-10-26', 1, '1603668389', '2020-10-26 06:26:29'),
('66.249.68.53', '2020-10-26', 2, '1603683871', '2020-10-26 07:32:54'),
('54.36.149.52', '2020-10-26', 3, '1603706892', '2020-10-26 07:50:17'),
('195.154.122.77', '2020-10-26', 1, '1603673418', '2020-10-26 07:50:18'),
('110.138.149.138', '2020-10-26', 10, '1603702981', '2020-10-26 08:36:01'),
('125.131.31.26', '2020-10-26', 5, '1603716052', '2020-10-26 08:48:38'),
('49.7.21.66', '2020-10-26', 1, '1603677670', '2020-10-26 09:01:10'),
('66.42.104.124', '2020-10-26', 1, '1603679171', '2020-10-26 09:26:11'),
('194.61.24.94', '2020-10-26', 2, '1603681880', '2020-10-26 10:11:19'),
('64.233.172.90', '2020-10-26', 1, '1603683568', '2020-10-26 10:39:28'),
('180.242.135.8', '2020-10-26', 82, '1603702512', '2020-10-26 11:36:34'),
('103.134.152.245', '2020-10-26', 7, '1603703171', '2020-10-26 11:36:45'),
('131.220.6.152', '2020-10-26', 2, '1603698205', '2020-10-26 11:57:41'),
('35.197.105.157', '2020-10-26', 1, '1603689820', '2020-10-26 12:23:40'),
('104.151.25.133', '2020-10-26', 1, '1603689853', '2020-10-26 12:24:13'),
('104.203.101.225', '2020-10-26', 1, '1603691795', '2020-10-26 12:56:35'),
('103.228.117.42', '2020-10-26', 1, '1603694603', '2020-10-26 13:43:23'),
('114.119.155.121', '2020-10-26', 1, '1603694949', '2020-10-26 13:49:09'),
('111.92.162.132', '2020-10-26', 1, '1603696237', '2020-10-26 14:10:37'),
('35.195.96.170', '2020-10-26', 1, '1603697215', '2020-10-26 14:26:55'),
('123.183.224.143', '2020-10-26', 1, '1603698878', '2020-10-26 14:54:38'),
('115.178.209.129', '2020-10-26', 1, '1603699263', '2020-10-26 15:01:03'),
('195.154.122.55', '2020-10-26', 1, '1603699517', '2020-10-26 15:05:17'),
('180.242.180.117', '2020-10-26', 1, '1603700252', '2020-10-26 15:17:32'),
('192.81.131.94', '2020-10-26', 7, '1603700759', '2020-10-26 15:19:54'),
('114.4.4.197', '2020-10-26', 1, '1603700571', '2020-10-26 15:22:51'),
('149.224.68.139', '2020-10-26', 1, '1603702407', '2020-10-26 15:53:27'),
('17.58.98.181', '2020-10-26', 1, '1603705221', '2020-10-26 16:40:21'),
('34.74.229.138', '2020-10-26', 2, '1603706036', '2020-10-26 16:51:41'),
('195.154.122.194', '2020-10-26', 1, '1603706893', '2020-10-26 17:08:13'),
('62.4.14.206', '2020-10-26', 3, '1603709479', '2020-10-26 17:16:13'),
('200.25.61.6', '2020-10-26', 2, '1603713592', '2020-10-26 18:59:43'),
('111.95.215.191', '2020-10-26', 1, '1603714398', '2020-10-26 19:13:18'),
('123.183.224.131', '2020-10-26', 1, '1603714459', '2020-10-26 19:14:19'),
('42.236.10.107', '2020-10-26', 1, '1603719115', '2020-10-26 20:31:55'),
('42.236.10.120', '2020-10-26', 1, '1603719120', '2020-10-26 20:32:00'),
('106.38.241.102', '2020-10-26', 2, '1603727628', '2020-10-26 21:03:53'),
('202.138.242.8', '2020-10-26', 1, '1603721042', '2020-10-26 21:04:02'),
('42.236.10.112', '2020-10-26', 1, '1603721987', '2020-10-26 21:19:47'),
('42.236.10.122', '2020-10-26', 1, '1603721987', '2020-10-26 21:19:47'),
('207.46.13.84', '2020-10-26', 1, '1603725469', '2020-10-26 22:17:49'),
('66.249.79.158', '2020-10-26', 2, '1603729935', '2020-10-26 23:32:12'),
('192.99.5.225', '2020-10-26', 1, '1603730300', '2020-10-26 23:38:20'),
('23.254.36.47', '2020-10-26', 1, '1603730909', '2020-10-26 23:48:29'),
('66.249.68.53', '2020-10-27', 3, '1603810865', '2020-10-27 01:01:27'),
('54.36.148.8', '2020-10-27', 3, '1603810304', '2020-10-27 02:35:52'),
('195.154.122.77', '2020-10-27', 1, '1603740955', '2020-10-27 02:35:55'),
('89.232.37.81', '2020-10-27', 1, '1603746305', '2020-10-27 04:05:05'),
('67.165.217.35', '2020-10-27', 5, '1603747072', '2020-10-27 04:11:39'),
('64.233.172.126', '2020-10-27', 2, '1603791553', '2020-10-27 04:15:48'),
('123.183.224.4', '2020-10-27', 2, '1603813527', '2020-10-27 06:47:36'),
('66.249.79.159', '2020-10-27', 3, '1603810868', '2020-10-27 07:26:55'),
('116.206.14.10', '2020-10-27', 1, '1603759393', '2020-10-27 07:43:13'),
('173.252.111.17', '2020-10-27', 1, '1603761853', '2020-10-27 08:24:13'),
('54.174.53.202', '2020-10-27', 1, '1603762988', '2020-10-27 08:43:08'),
('110.138.149.138', '2020-10-27', 8, '1603786501', '2020-10-27 08:47:52'),
('5.255.231.169', '2020-10-27', 1, '1603764123', '2020-10-27 09:02:03'),
('125.131.31.26', '2020-10-27', 6, '1603790101', '2020-10-27 10:12:54'),
('182.30.46.77', '2020-10-27', 2, '1603768679', '2020-10-27 10:17:56'),
('49.7.21.66', '2020-10-27', 1, '1603769816', '2020-10-27 10:36:56'),
('66.249.68.49', '2020-10-27', 2, '1603810923', '2020-10-27 10:53:44'),
('115.164.168.194', '2020-10-27', 1, '1603772308', '2020-10-27 11:18:28'),
('195.154.122.194', '2020-10-27', 1, '1603772967', '2020-10-27 11:29:27'),
('131.220.6.152', '2020-10-27', 2, '1603784376', '2020-10-27 11:57:06'),
('149.28.72.206', '2020-10-27', 1, '1603776049', '2020-10-27 12:20:49'),
('45.32.90.205', '2020-10-27', 1, '1603777126', '2020-10-27 12:38:46'),
('66.246.224.12', '2020-10-27', 1, '1603778278', '2020-10-27 12:57:58'),
('114.124.143.243', '2020-10-27', 3, '1603779126', '2020-10-27 13:06:07'),
('140.213.190.153', '2020-10-27', 1, '1603778834', '2020-10-27 13:07:14'),
('110.138.148.68', '2020-10-27', 61, '1603793799', '2020-10-27 13:39:58'),
('103.134.152.245', '2020-10-27', 3, '1603780891', '2020-10-27 13:40:04'),
('42.236.10.117', '2020-10-27', 1, '1603783931', '2020-10-27 14:32:11'),
('27.115.124.6', '2020-10-27', 1, '1603783951', '2020-10-27 14:32:31'),
('1.85.5.146', '2020-10-27', 2, '1603785279', '2020-10-27 14:50:42'),
('66.220.149.8', '2020-10-27', 1, '1603785348', '2020-10-27 14:55:48'),
('120.92.72.88', '2020-10-27', 1, '1603785661', '2020-10-27 15:01:01'),
('120.92.72.144', '2020-10-27', 1, '1603785665', '2020-10-27 15:01:05'),
('186.178.4.190', '2020-10-27', 1, '1603786328', '2020-10-27 15:12:08'),
('64.233.172.96', '2020-10-27', 1, '1603791553', '2020-10-27 16:39:13'),
('54.174.157.206', '2020-10-27', 10, '1603791572', '2020-10-27 16:39:19'),
('3.95.206.141', '2020-10-27', 1, '1603791562', '2020-10-27 16:39:22'),
('54.209.221.176', '2020-10-27', 1, '1603791562', '2020-10-27 16:39:22'),
('180.252.197.232', '2020-10-27', 1, '1603799254', '2020-10-27 18:47:34'),
('173.252.111.120', '2020-10-27', 1, '1603799492', '2020-10-27 18:51:32'),
('140.213.188.245', '2020-10-27', 1, '1603800076', '2020-10-27 19:01:16'),
('183.36.115.82', '2020-10-27', 1, '1603802628', '2020-10-27 19:43:48'),
('138.201.184.38', '2020-10-27', 1, '1603807779', '2020-10-27 21:09:39'),
('173.252.111.11', '2020-10-27', 1, '1603809102', '2020-10-27 21:31:42'),
('34.83.96.80', '2020-10-27', 1, '1603809201', '2020-10-27 21:33:21'),
('35.233.152.44', '2020-10-27', 1, '1603809217', '2020-10-27 21:33:37'),
('195.154.122.85', '2020-10-27', 1, '1603810305', '2020-10-27 21:51:45'),
('66.249.79.128', '2020-10-27', 1, '1603810743', '2020-10-27 21:59:03'),
('106.38.241.102', '2020-10-27', 1, '1603811102', '2020-10-27 22:05:02'),
('157.55.39.223', '2020-10-27', 1, '1603811772', '2020-10-27 22:16:12'),
('103.10.66.74', '2020-10-27', 3, '1603813951', '2020-10-27 22:50:59'),
('125.131.31.26', '2020-10-28', 6, '1603882140', '2020-10-28 00:15:45'),
('174.127.146.2', '2020-10-28', 1, '1603822478', '2020-10-28 01:14:38'),
('66.249.68.53', '2020-10-28', 3, '1603855666', '2020-10-28 01:20:58'),
('45.77.0.219', '2020-10-28', 1, '1603823156', '2020-10-28 01:25:56'),
('35.203.139.96', '2020-10-28', 1, '1603823549', '2020-10-28 01:32:29'),
('194.61.24.94', '2020-10-28', 2, '1603826450', '2020-10-28 02:20:49'),
('66.249.68.51', '2020-10-28', 1, '1603828406', '2020-10-28 02:53:26'),
('64.146.129.18', '2020-10-28', 1, '1603840906', '2020-10-28 06:21:46'),
('110.138.148.68', '2020-10-28', 12, '1603904136', '2020-10-28 07:07:22'),
('139.59.239.193', '2020-10-28', 1, '1603843737', '2020-10-28 07:08:57'),
('54.36.148.5', '2020-10-28', 1, '1603843922', '2020-10-28 07:12:02'),
('195.154.122.138', '2020-10-28', 1, '1603843924', '2020-10-28 07:12:04'),
('103.134.152.245', '2020-10-28', 4, '1603844748', '2020-10-28 07:17:46'),
('173.252.95.3', '2020-10-28', 1, '1603846025', '2020-10-28 07:47:05'),
('173.252.95.23', '2020-10-28', 2, '1603846025', '2020-10-28 07:47:05'),
('173.252.95.113', '2020-10-28', 1, '1603846025', '2020-10-28 07:47:05'),
('173.252.95.19', '2020-10-28', 2, '1603846025', '2020-10-28 07:47:05'),
('173.252.95.15', '2020-10-28', 1, '1603846025', '2020-10-28 07:47:05'),
('173.252.95.11', '2020-10-28', 1, '1603846025', '2020-10-28 07:47:05'),
('123.183.224.4', '2020-10-28', 2, '1603864055', '2020-10-28 08:57:55'),
('66.249.68.49', '2020-10-28', 2, '1603851612', '2020-10-28 08:59:21'),
('34.83.91.180', '2020-10-28', 1, '1603855425', '2020-10-28 10:23:45'),
('54.151.99.6', '2020-10-28', 1, '1603855790', '2020-10-28 10:29:50'),
('140.213.5.21', '2020-10-28', 1, '1603860614', '2020-10-28 11:50:14'),
('131.220.6.152', '2020-10-28', 2, '1603871253', '2020-10-28 11:59:55'),
('110.137.162.41', '2020-10-28', 1, '1603861610', '2020-10-28 12:06:50'),
('34.82.187.236', '2020-10-28', 1, '1603869819', '2020-10-28 14:23:39'),
('34.105.4.160', '2020-10-28', 1, '1603869822', '2020-10-28 14:23:42'),
('54.36.148.129', '2020-10-28', 1, '1603874653', '2020-10-28 15:44:13'),
('195.154.122.110', '2020-10-28', 1, '1603874654', '2020-10-28 15:44:14'),
('140.213.7.85', '2020-10-28', 3, '1603894923', '2020-10-28 16:02:11'),
('42.236.10.77', '2020-10-28', 1, '1603876676', '2020-10-28 16:17:56'),
('42.236.10.72', '2020-10-28', 1, '1603876677', '2020-10-28 16:17:57'),
('42.236.10.121', '2020-10-28', 1, '1603876810', '2020-10-28 16:20:10'),
('42.236.10.120', '2020-10-28', 1, '1603876810', '2020-10-28 16:20:10'),
('54.36.149.49', '2020-10-28', 2, '1603898259', '2020-10-28 16:33:10'),
('195.154.122.194', '2020-10-28', 1, '1603877592', '2020-10-28 16:33:12'),
('123.183.224.143', '2020-10-28', 1, '1603882296', '2020-10-28 17:51:36'),
('8.210.210.51', '2020-10-28', 1, '1603887453', '2020-10-28 19:17:33'),
('49.7.20.143', '2020-10-28', 1, '1603888773', '2020-10-28 19:39:33'),
('66.249.79.159', '2020-10-28', 2, '1603889521', '2020-10-28 19:51:50'),
('34.221.207.92', '2020-10-28', 1, '1603889688', '2020-10-28 19:54:48'),
('176.9.47.122', '2020-10-28', 1, '1603897452', '2020-10-28 22:04:12'),
('195.154.122.85', '2020-10-28', 1, '1603898260', '2020-10-28 22:17:40'),
('66.249.82.72', '2020-10-28', 3, '1603903555', '2020-10-28 23:45:47'),
('66.249.82.68', '2020-10-28', 1, '1603903547', '2020-10-28 23:45:47'),
('35.229.44.255', '2020-10-28', 2, '1603904383', '2020-10-28 23:57:49'),
('110.138.148.68', '2020-10-29', 2, '1603905366', '2020-10-29 00:06:23'),
('123.183.224.143', '2020-10-29', 3, '1603976967', '2020-10-29 00:31:54'),
('5.45.207.134', '2020-10-29', 1, '1603907150', '2020-10-29 00:45:50'),
('209.17.97.58', '2020-10-29', 1, '1603907185', '2020-10-29 00:46:25'),
('31.13.103.15', '2020-10-29', 2, '1603959567', '2020-10-29 00:48:31'),
('89.163.128.80', '2020-10-29', 5, '1603988828', '2020-10-29 02:15:31'),
('54.36.149.49', '2020-10-29', 2, '1603942498', '2020-10-29 02:54:20'),
('195.154.122.138', '2020-10-29', 1, '1603914861', '2020-10-29 02:54:21'),
('34.82.245.135', '2020-10-29', 1, '1603916620', '2020-10-29 03:23:40'),
('34.83.64.180', '2020-10-29', 1, '1603916622', '2020-10-29 03:23:42'),
('36.71.136.198', '2020-10-29', 1, '1603922195', '2020-10-29 04:56:35'),
('126.21.11.225', '2020-10-29', 1, '1603922200', '2020-10-29 04:56:40'),
('66.249.79.158', '2020-10-29', 3, '1603931012', '2020-10-29 07:02:27'),
('66.249.79.245', '2020-10-29', 2, '1603930269', '2020-10-29 07:11:04'),
('52.249.182.44', '2020-10-29', 1, '1603933655', '2020-10-29 08:07:35'),
('172.104.52.127', '2020-10-29', 1, '1603933712', '2020-10-29 08:08:32'),
('125.131.31.26', '2020-10-29', 3, '1603946840', '2020-10-29 09:01:04'),
('31.13.115.16', '2020-10-29', 1, '1603937815', '2020-10-29 09:16:55'),
('31.13.115.6', '2020-10-29', 1, '1603937816', '2020-10-29 09:16:56'),
('5.255.253.108', '2020-10-29', 1, '1603937831', '2020-10-29 09:17:11'),
('18.136.67.242', '2020-10-29', 1, '1603940022', '2020-10-29 09:53:42'),
('195.154.122.194', '2020-10-29', 1, '1603942499', '2020-10-29 10:34:59'),
('47.100.107.131', '2020-10-29', 1, '1603945667', '2020-10-29 11:27:47'),
('54.161.115.234', '2020-10-29', 1, '1603945773', '2020-10-29 11:29:33'),
('49.7.21.66', '2020-10-29', 1, '1603946059', '2020-10-29 11:34:19'),
('131.220.6.152', '2020-10-29', 2, '1603957452', '2020-10-29 11:59:39'),
('31.13.103.10', '2020-10-29', 1, '1603948478', '2020-10-29 12:14:38'),
('213.180.203.61', '2020-10-29', 1, '1603948531', '2020-10-29 12:15:31'),
('5.45.207.140', '2020-10-29', 1, '1603948585', '2020-10-29 12:16:25'),
('69.171.249.117', '2020-10-29', 1, '1603957153', '2020-10-29 14:39:13'),
('66.249.83.214', '2020-10-29', 1, '1603958506', '2020-10-29 15:01:46'),
('61.174.25.42', '2020-10-29', 2, '1603960151', '2020-10-29 15:22:23'),
('35.233.206.84', '2020-10-29', 1, '1603959821', '2020-10-29 15:23:41'),
('116.206.29.106', '2020-10-29', 1, '1603970636', '2020-10-29 18:23:56'),
('140.213.188.245', '2020-10-29', 1, '1603973888', '2020-10-29 19:18:08'),
('111.202.101.172', '2020-10-29', 1, '1603974042', '2020-10-29 19:20:42'),
('138.197.103.239', '2020-10-29', 2, '1603975404', '2020-10-29 19:43:18'),
('69.171.249.48', '2020-10-29', 1, '1603976574', '2020-10-29 20:02:54'),
('66.220.149.116', '2020-10-29', 1, '1603977644', '2020-10-29 20:20:44'),
('182.2.134.65', '2020-10-29', 1, '1603979566', '2020-10-29 20:52:46'),
('54.36.148.181', '2020-10-29', 1, '1603984156', '2020-10-29 22:09:16'),
('195.154.122.208', '2020-10-29', 1, '1603984157', '2020-10-29 22:09:17'),
('123.183.224.4', '2020-10-30', 1, '1603993154', '2020-10-30 00:39:14'),
('5.45.207.134', '2020-10-30', 1, '1603996489', '2020-10-30 01:34:49'),
('139.59.239.193', '2020-10-30', 1, '1604000751', '2020-10-30 02:45:51'),
('34.82.132.46', '2020-10-30', 1, '1604007766', '2020-10-30 04:42:46'),
('97.126.38.6', '2020-10-30', 3, '1604010231', '2020-10-30 04:52:06'),
('66.249.79.158', '2020-10-30', 1, '1604008623', '2020-10-30 04:57:03'),
('114.119.134.9', '2020-10-30', 1, '1604017264', '2020-10-30 07:21:04'),
('106.38.241.102', '2020-10-30', 1, '1604018730', '2020-10-30 07:45:30'),
('8.210.38.217', '2020-10-30', 1, '1604018950', '2020-10-30 07:49:10'),
('54.36.148.5', '2020-10-30', 1, '1604019700', '2020-10-30 08:01:40'),
('195.154.122.85', '2020-10-30', 2, '1604041238', '2020-10-30 08:01:42'),
('35.196.54.126', '2020-10-30', 2, '1604022653', '2020-10-30 08:48:39'),
('54.36.148.189', '2020-10-30', 1, '1604033733', '2020-10-30 11:55:33'),
('195.154.122.186', '2020-10-30', 1, '1604033735', '2020-10-30 11:55:35'),
('131.220.6.152', '2020-10-30', 2, '1604044050', '2020-10-30 11:59:35'),
('140.213.188.245', '2020-10-30', 3, '1604064338', '2020-10-30 12:24:25'),
('183.250.162.101', '2020-10-30', 1, '1604038094', '2020-10-30 13:08:14'),
('54.36.148.241', '2020-10-30', 1, '1604041236', '2020-10-30 14:00:36'),
('54.36.148.82', '2020-10-30', 1, '1604044989', '2020-10-30 15:03:09'),
('54.36.148.103', '2020-10-30', 1, '1604045002', '2020-10-30 15:03:22'),
('54.36.148.133', '2020-10-30', 1, '1604045010', '2020-10-30 15:03:30'),
('123.183.224.143', '2020-10-30', 3, '1604072846', '2020-10-30 15:45:54'),
('35.230.86.131', '2020-10-30', 1, '1604049826', '2020-10-30 16:23:46'),
('112.215.238.199', '2020-10-30', 2, '1604050434', '2020-10-30 16:33:53'),
('54.36.149.49', '2020-10-30', 1, '1604052811', '2020-10-30 17:13:31'),
('195.154.122.208', '2020-10-30', 1, '1604052813', '2020-10-30 17:13:33'),
('138.246.253.15', '2020-10-30', 2, '1604074593', '2020-10-30 18:44:49'),
('118.99.107.64', '2020-10-30', 1, '1604058979', '2020-10-30 18:56:19'),
('123.183.224.29', '2020-10-30', 1, '1604060465', '2020-10-30 19:21:05'),
('173.252.127.22', '2020-10-30', 1, '1604062776', '2020-10-30 19:59:36'),
('103.134.152.245', '2020-10-30', 2, '1604064357', '2020-10-30 20:25:44'),
('77.75.78.161', '2020-10-30', 1, '1604068791', '2020-10-30 21:39:51'),
('91.144.130.24', '2020-10-30', 2, '1604072637', '2020-10-30 22:30:41'),
('207.46.13.35', '2020-10-30', 1, '1604072150', '2020-10-30 22:35:50'),
('54.36.148.230', '2020-10-30', 1, '1604073994', '2020-10-30 23:06:34'),
('195.154.122.77', '2020-10-30', 1, '1604073995', '2020-10-30 23:06:35'),
('173.252.95.15', '2020-10-30', 1, '1604076164', '2020-10-30 23:42:44'),
('173.252.95.11', '2020-10-30', 2, '1604076168', '2020-10-30 23:42:46'),
('66.220.149.41', '2020-10-30', 1, '1604076393', '2020-10-30 23:46:33'),
('91.121.79.16', '2020-10-31', 1, '1604082710', '2020-10-31 01:31:50'),
('5.45.207.134', '2020-10-31', 2, '1604162703', '2020-10-31 02:04:04'),
('116.203.223.195', '2020-10-31', 1, '1604091648', '2020-10-31 04:00:48');
INSERT INTO `visitor` (`ip`, `date`, `hits`, `online`, `time`) VALUES
('199.244.88.132', '2020-10-31', 1, '1604092912', '2020-10-31 04:21:52'),
('35.233.204.198', '2020-10-31', 1, '1604096622', '2020-10-31 05:23:42'),
('140.213.5.235', '2020-10-31', 1, '1604097081', '2020-10-31 05:31:21'),
('173.252.83.12', '2020-10-31', 1, '1604100653', '2020-10-31 06:30:53'),
('49.7.21.66', '2020-10-31', 1, '1604100984', '2020-10-31 06:36:24'),
('184.94.240.92', '2020-10-31', 2, '1604105641', '2020-10-31 07:53:56'),
('8.210.38.217', '2020-10-31', 1, '1604106311', '2020-10-31 08:05:11'),
('110.138.151.241', '2020-10-31', 3, '1604108965', '2020-10-31 08:48:55'),
('202.80.213.168', '2020-10-31', 3, '1604109690', '2020-10-31 08:58:53'),
('54.36.149.49', '2020-10-31', 1, '1604110625', '2020-10-31 09:17:05'),
('195.154.122.194', '2020-10-31', 2, '1604149476', '2020-10-31 09:17:07'),
('66.220.149.6', '2020-10-31', 1, '1604112766', '2020-10-31 09:52:46'),
('66.220.149.22', '2020-10-31', 1, '1604112766', '2020-10-31 09:52:46'),
('66.102.6.249', '2020-10-31', 1, '1604118215', '2020-10-31 11:23:35'),
('69.171.251.15', '2020-10-31', 1, '1604120038', '2020-10-31 11:53:58'),
('131.220.6.152', '2020-10-31', 2, '1604130374', '2020-10-31 11:59:16'),
('106.38.241.102', '2020-10-31', 1, '1604123619', '2020-10-31 12:53:39'),
('3.234.242.233', '2020-10-31', 3, '1604125071', '2020-10-31 13:17:49'),
('35.206.171.218', '2020-10-31', 1, '1604126672', '2020-10-31 13:44:32'),
('35.206.147.48', '2020-10-31', 1, '1604126696', '2020-10-31 13:44:56'),
('35.230.69.207', '2020-10-31', 1, '1604129023', '2020-10-31 14:23:43'),
('114.119.134.9', '2020-10-31', 1, '1604130734', '2020-10-31 14:52:14'),
('114.119.150.22', '2020-10-31', 1, '1604131824', '2020-10-31 15:10:24'),
('116.179.32.162', '2020-10-31', 1, '1604135460', '2020-10-31 16:11:00'),
('138.246.253.15', '2020-10-31', 1, '1604137953', '2020-10-31 16:52:33'),
('35.230.59.83', '2020-10-31', 1, '1604139822', '2020-10-31 17:23:42'),
('116.179.32.207', '2020-10-31', 1, '1604139917', '2020-10-31 17:25:17'),
('173.252.127.120', '2020-10-31', 1, '1604139996', '2020-10-31 17:26:36'),
('54.36.121.9', '2020-10-31', 1, '1604141428', '2020-10-31 17:50:28'),
('123.183.224.4', '2020-10-31', 1, '1604146601', '2020-10-31 19:16:41'),
('49.7.21.88', '2020-10-31', 1, '1604147209', '2020-10-31 19:26:49'),
('66.249.79.150', '2020-10-31', 1, '1604147951', '2020-10-31 19:39:11'),
('54.36.148.5', '2020-10-31', 1, '1604149474', '2020-10-31 20:04:34'),
('140.213.15.177', '2020-10-31', 1, '1604151112', '2020-10-31 20:31:52'),
('66.220.149.111', '2020-10-31', 1, '1604155904', '2020-10-31 21:51:44'),
('66.220.149.14', '2020-10-31', 1, '1604155905', '2020-10-31 21:51:45'),
('140.213.188.245', '2020-10-31', 2, '1604156277', '2020-10-31 21:57:56'),
('77.74.177.114', '2020-10-31', 1, '1604158530', '2020-10-31 22:35:30'),
('106.38.241.102', '2020-11-01', 3, '1604242573', '2020-11-01 01:47:18'),
('114.124.174.196', '2020-11-01', 1, '1604170318', '2020-11-01 01:51:58'),
('121.244.91.31', '2020-11-01', 2, '1604175767', '2020-11-01 03:22:47'),
('54.36.149.49', '2020-11-01', 2, '1604239981', '2020-11-01 04:11:01'),
('195.154.122.77', '2020-11-01', 1, '1604178662', '2020-11-01 04:11:02'),
('66.249.68.51', '2020-11-01', 1, '1604181745', '2020-11-01 05:02:25'),
('66.249.79.128', '2020-11-01', 2, '1604204341', '2020-11-01 05:05:56'),
('66.249.68.49', '2020-11-01', 1, '1604181965', '2020-11-01 05:06:05'),
('35.230.10.1', '2020-11-01', 1, '1604186624', '2020-11-01 06:23:44'),
('64.119.213.61', '2020-11-01', 1, '1604193897', '2020-11-01 08:24:57'),
('42.236.10.74', '2020-11-01', 1, '1604195084', '2020-11-01 08:44:44'),
('42.236.10.122', '2020-11-01', 1, '1604195087', '2020-11-01 08:44:47'),
('42.236.10.69', '2020-11-01', 1, '1604195312', '2020-11-01 08:48:32'),
('42.236.10.77', '2020-11-01', 1, '1604195313', '2020-11-01 08:48:33'),
('42.236.10.109', '2020-11-01', 1, '1604195314', '2020-11-01 08:48:34'),
('36.71.237.154', '2020-11-01', 1, '1604195869', '2020-11-01 08:57:49'),
('173.252.83.1', '2020-11-01', 1, '1604197457', '2020-11-01 09:24:17'),
('173.252.83.24', '2020-11-01', 1, '1604197457', '2020-11-01 09:24:17'),
('131.220.6.152', '2020-11-01', 2, '1604216481', '2020-11-01 11:57:36'),
('173.252.95.118', '2020-11-01', 1, '1604208585', '2020-11-01 12:29:45'),
('173.252.95.116', '2020-11-01', 1, '1604208589', '2020-11-01 12:29:49'),
('51.103.25.70', '2020-11-01', 2, '1604208603', '2020-11-01 12:30:01'),
('3.238.122.77', '2020-11-01', 1, '1604212445', '2020-11-01 13:34:05'),
('49.7.21.66', '2020-11-01', 2, '1604245290', '2020-11-01 13:55:04'),
('34.238.162.157', '2020-11-01', 1, '1604216199', '2020-11-01 14:36:39'),
('54.36.148.37', '2020-11-01', 1, '1604217899', '2020-11-01 15:04:59'),
('195.154.122.138', '2020-11-01', 1, '1604217900', '2020-11-01 15:05:00'),
('66.220.149.21', '2020-11-01', 1, '1604220595', '2020-11-01 15:49:55'),
('195.201.25.106', '2020-11-01', 1, '1604220852', '2020-11-01 15:54:12'),
('173.252.127.14', '2020-11-01', 1, '1604224995', '2020-11-01 17:03:15'),
('173.252.127.120', '2020-11-01', 1, '1604224995', '2020-11-01 17:03:15'),
('111.202.100.89', '2020-11-01', 1, '1604233833', '2020-11-01 19:30:33'),
('23.108.16.174', '2020-11-01', 1, '1604239638', '2020-11-01 21:07:18'),
('173.234.194.127', '2020-11-01', 1, '1604239638', '2020-11-01 21:07:18'),
('173.252.87.5', '2020-11-01', 1, '1604239807', '2020-11-01 21:10:07'),
('173.252.87.12', '2020-11-01', 1, '1604239807', '2020-11-01 21:10:07'),
('195.154.122.194', '2020-11-01', 1, '1604239982', '2020-11-01 21:13:02'),
('161.117.186.203', '2020-11-01', 2, '1604247218', '2020-11-01 21:28:03'),
('194.153.113.101', '2020-11-02', 2, '1604253631', '2020-11-02 01:00:11'),
('157.55.39.107', '2020-11-02', 1, '1604256481', '2020-11-02 01:48:01'),
('5.45.207.134', '2020-11-02', 3, '1604279475', '2020-11-02 01:54:01'),
('5.255.231.76', '2020-11-02', 1, '1604256853', '2020-11-02 01:54:13'),
('66.249.79.129', '2020-11-02', 1, '1604270597', '2020-11-02 05:43:17'),
('66.249.79.249', '2020-11-02', 1, '1604270606', '2020-11-02 05:43:26'),
('110.138.148.28', '2020-11-02', 13, '1604282463', '2020-11-02 05:52:53'),
('103.134.152.245', '2020-11-02', 2, '1604271193', '2020-11-02 05:53:09'),
('66.249.79.247', '2020-11-02', 1, '1604271190', '2020-11-02 05:53:10'),
('49.7.21.66', '2020-11-02', 1, '1604271507', '2020-11-02 05:58:27'),
('66.249.82.68', '2020-11-02', 1, '1604272073', '2020-11-02 06:07:53'),
('66.249.82.72', '2020-11-02', 1, '1604272073', '2020-11-02 06:07:53'),
('66.249.82.70', '2020-11-02', 2, '1604272080', '2020-11-02 06:07:59'),
('34.83.130.148', '2020-11-02', 1, '1604276622', '2020-11-02 07:23:42'),
('35.199.145.106', '2020-11-02', 1, '1604276626', '2020-11-02 07:23:46'),
('54.36.148.52', '2020-11-02', 1, '1604277474', '2020-11-02 07:37:54'),
('195.154.122.77', '2020-11-02', 2, '1604318370', '2020-11-02 07:37:56'),
('66.220.149.116', '2020-11-02', 1, '1604278822', '2020-11-02 08:00:22'),
('139.193.208.26', '2020-11-02', 1, '1604280021', '2020-11-02 08:20:21'),
('110.138.150.116', '2020-11-02', 3, '1604280961', '2020-11-02 08:34:27'),
('66.220.149.120', '2020-11-02', 1, '1604283180', '2020-11-02 09:13:00'),
('66.220.149.27', '2020-11-02', 1, '1604283180', '2020-11-02 09:13:00'),
('118.99.102.137', '2020-11-02', 1, '1604283257', '2020-11-02 09:14:17'),
('96.127.158.234', '2020-11-02', 1, '1604284152', '2020-11-02 09:29:12'),
('36.92.37.106', '2020-11-02', 1, '1604292597', '2020-11-02 11:49:57'),
('131.220.6.152', '2020-11-02', 2, '1604302879', '2020-11-02 11:59:14'),
('185.126.65.18', '2020-11-02', 1, '1604294817', '2020-11-02 12:26:57'),
('45.130.255.224', '2020-11-02', 1, '1604294822', '2020-11-02 12:27:02'),
('180.253.167.12', '2020-11-02', 1, '1604295561', '2020-11-02 12:39:21'),
('35.229.73.121', '2020-11-02', 2, '1604298367', '2020-11-02 13:23:57'),
('77.75.78.171', '2020-11-02', 1, '1604302348', '2020-11-02 14:32:28'),
('191.101.108.78', '2020-11-02', 1, '1604306780', '2020-11-02 15:46:20'),
('66.42.104.124', '2020-11-02', 1, '1604307404', '2020-11-02 15:56:44'),
('66.246.224.12', '2020-11-02', 1, '1604309415', '2020-11-02 16:30:15'),
('77.75.77.32', '2020-11-02', 1, '1604310187', '2020-11-02 16:43:07'),
('35.237.55.226', '2020-11-02', 2, '1604311677', '2020-11-02 17:05:58'),
('54.36.149.106', '2020-11-02', 1, '1604318369', '2020-11-02 18:59:29'),
('34.82.189.237', '2020-11-02', 1, '1604319824', '2020-11-02 19:23:44'),
('123.183.224.77', '2020-11-02', 1, '1604320318', '2020-11-02 19:31:58'),
('54.36.149.99', '2020-11-02', 1, '1604321742', '2020-11-02 19:55:42'),
('195.154.122.55', '2020-11-02', 1, '1604321743', '2020-11-02 19:55:43'),
('42.236.10.112', '2020-11-02', 1, '1604324115', '2020-11-02 20:35:15'),
('42.236.10.74', '2020-11-02', 1, '1604324550', '2020-11-02 20:42:30'),
('42.236.10.73', '2020-11-02', 1, '1604324562', '2020-11-02 20:42:42'),
('42.236.10.72', '2020-11-02', 1, '1604324566', '2020-11-02 20:42:46'),
('139.0.241.199', '2020-11-02', 2, '1604327465', '2020-11-02 21:29:33'),
('106.38.241.102', '2020-11-02', 1, '1604328530', '2020-11-02 21:48:50'),
('108.174.5.112', '2020-11-03', 1, '1604347272', '2020-11-03 03:01:12'),
('66.249.79.158', '2020-11-03', 2, '1604367701', '2020-11-03 03:19:58'),
('123.183.224.143', '2020-11-03', 2, '1604418696', '2020-11-03 03:56:37'),
('97.126.38.6', '2020-11-03', 3, '1604353825', '2020-11-03 04:49:49'),
('54.36.148.5', '2020-11-03', 1, '1604354723', '2020-11-03 05:05:23'),
('195.154.122.208', '2020-11-03', 2, '1604380833', '2020-11-03 05:05:25'),
('35.199.190.87', '2020-11-03', 1, '1604363024', '2020-11-03 07:23:44'),
('110.138.150.116', '2020-11-03', 1, '1604366895', '2020-11-03 08:28:15'),
('54.174.56.72', '2020-11-03', 1, '1604367784', '2020-11-03 08:43:04'),
('106.38.241.102', '2020-11-03', 2, '1604396095', '2020-11-03 08:47:14'),
('34.83.232.19', '2020-11-03', 1, '1604369912', '2020-11-03 09:18:32'),
('66.249.82.72', '2020-11-03', 4, '1604402843', '2020-11-03 11:16:20'),
('66.249.82.70', '2020-11-03', 4, '1604402843', '2020-11-03 11:16:20'),
('131.220.6.152', '2020-11-03', 2, '1604389440', '2020-11-03 11:58:09'),
('54.36.148.123', '2020-11-03', 1, '1604380831', '2020-11-03 12:20:31'),
('123.183.224.1', '2020-11-03', 1, '1604381437', '2020-11-03 12:30:37'),
('36.92.37.106', '2020-11-03', 3, '1604383954', '2020-11-03 13:09:22'),
('103.134.152.245', '2020-11-03', 2, '1604387039', '2020-11-03 14:03:52'),
('107.172.146.11', '2020-11-03', 1, '1604387943', '2020-11-03 14:19:03'),
('107.175.237.188', '2020-11-03', 1, '1604387954', '2020-11-03 14:19:14'),
('110.138.148.80', '2020-11-03', 1, '1604389178', '2020-11-03 14:39:38'),
('203.184.131.167', '2020-11-03', 4, '1604393051', '2020-11-03 15:40:07'),
('66.249.79.159', '2020-11-03', 1, '1604393967', '2020-11-03 15:59:27'),
('66.249.79.247', '2020-11-03', 1, '1604393972', '2020-11-03 15:59:32'),
('66.249.79.245', '2020-11-03', 1, '1604393979', '2020-11-03 15:59:39'),
('66.249.79.129', '2020-11-03', 1, '1604405693', '2020-11-03 19:14:53'),
('183.36.115.13', '2020-11-03', 1, '1604406897', '2020-11-03 19:34:57'),
('35.230.12.124', '2020-11-03', 1, '1604409883', '2020-11-03 20:24:43'),
('52.183.60.91', '2020-11-03', 2, '1604413813', '2020-11-03 20:35:43'),
('66.246.224.12', '2020-11-03', 1, '1604410595', '2020-11-03 20:36:35'),
('220.181.108.120', '2020-11-03', 1, '1604410635', '2020-11-03 20:37:15'),
('35.185.19.233', '2020-11-03', 2, '1604413837', '2020-11-03 21:28:06'),
('157.55.39.235', '2020-11-03', 1, '1604417670', '2020-11-03 22:34:30'),
('54.36.148.128', '2020-11-03', 1, '1604417974', '2020-11-03 22:39:34'),
('195.154.122.194', '2020-11-03', 1, '1604417976', '2020-11-03 22:39:36'),
('5.45.207.134', '2020-11-04', 2, '1604455799', '2020-11-04 03:00:13'),
('49.7.21.66', '2020-11-04', 1, '1604439490', '2020-11-04 04:38:10'),
('207.46.13.175', '2020-11-04', 1, '1604441399', '2020-11-04 05:09:59'),
('66.249.79.159', '2020-11-04', 1, '1604446906', '2020-11-04 06:41:46'),
('66.249.79.158', '2020-11-04', 4, '1604501737', '2020-11-04 06:41:48'),
('192.110.161.10', '2020-11-04', 2, '1604456189', '2020-11-04 09:16:27'),
('66.249.82.72', '2020-11-04', 1, '1604457779', '2020-11-04 09:42:59'),
('66.249.82.68', '2020-11-04', 3, '1604457786', '2020-11-04 09:43:00'),
('188.40.110.183', '2020-11-04', 1, '1604461606', '2020-11-04 10:46:46'),
('162.221.207.106', '2020-11-04', 1, '1604465671', '2020-11-04 11:54:31'),
('131.220.6.152', '2020-11-04', 2, '1604475613', '2020-11-04 11:57:08'),
('66.249.79.245', '2020-11-04', 1, '1604471079', '2020-11-04 13:24:39'),
('66.220.149.32', '2020-11-04', 1, '1604471804', '2020-11-04 13:36:44'),
('66.220.149.31', '2020-11-04', 1, '1604471812', '2020-11-04 13:36:52'),
('66.220.149.111', '2020-11-04', 1, '1604471813', '2020-11-04 13:36:53'),
('110.138.149.123', '2020-11-04', 1, '1604472048', '2020-11-04 13:40:48'),
('66.246.224.12', '2020-11-04', 1, '1604472552', '2020-11-04 13:49:12'),
('42.236.10.121', '2020-11-04', 1, '1604473255', '2020-11-04 14:00:55'),
('42.236.10.89', '2020-11-04', 1, '1604473251', '2020-11-04 14:00:51'),
('54.36.148.125', '2020-11-04', 1, '1604473302', '2020-11-04 14:01:42'),
('195.154.122.55', '2020-11-04', 1, '1604473306', '2020-11-04 14:01:46'),
('42.236.10.79', '2020-11-04', 1, '1604473460', '2020-11-04 14:04:20'),
('110.138.150.116', '2020-11-04', 2, '1604473867', '2020-11-04 14:11:01'),
('213.136.71.25', '2020-11-04', 1, '1604474292', '2020-11-04 14:18:12'),
('13.66.139.2', '2020-11-04', 1, '1604475060', '2020-11-04 14:31:00'),
('182.0.133.227', '2020-11-04', 1, '1604477226', '2020-11-04 15:07:06'),
('66.249.79.247', '2020-11-04', 1, '1604478307', '2020-11-04 15:25:07'),
('123.183.224.143', '2020-11-04', 2, '1604497637', '2020-11-04 15:57:24'),
('180.244.157.165', '2020-11-04', 2, '1604481577', '2020-11-04 16:12:08'),
('173.252.107.9', '2020-11-04', 1, '1604488917', '2020-11-04 18:21:57'),
('49.7.20.112', '2020-11-04', 1, '1604492398', '2020-11-04 19:19:58'),
('54.36.148.5', '2020-11-04', 1, '1604498430', '2020-11-04 21:00:30'),
('195.154.122.77', '2020-11-04', 1, '1604498432', '2020-11-04 21:00:32'),
('35.199.175.238', '2020-11-04', 1, '1604500169', '2020-11-04 21:29:29'),
('35.237.229.226', '2020-11-04', 2, '1604500366', '2020-11-04 21:30:31'),
('207.46.13.51', '2020-11-04', 1, '1604504069', '2020-11-04 22:34:29'),
('66.102.6.253', '2020-11-04', 1, '1604506772', '2020-11-04 23:19:32'),
('110.138.149.123', '2020-11-05', 1, '1604509851', '2020-11-05 00:10:51'),
('49.7.21.66', '2020-11-05', 1, '1604511153', '2020-11-05 00:32:33'),
('66.249.79.249', '2020-11-05', 1, '1604519730', '2020-11-05 02:55:30'),
('66.249.79.129', '2020-11-05', 1, '1604519810', '2020-11-05 02:56:50'),
('34.223.42.23', '2020-11-05', 1, '1604525416', '2020-11-05 04:30:16'),
('123.183.224.3', '2020-11-05', 1, '1604525902', '2020-11-05 04:38:22'),
('95.163.255.141', '2020-11-05', 1, '1604529928', '2020-11-05 05:45:28'),
('77.75.78.171', '2020-11-05', 1, '1604541060', '2020-11-05 08:51:00'),
('66.249.79.159', '2020-11-05', 2, '1604568095', '2020-11-05 08:59:35'),
('116.197.132.18', '2020-11-05', 3, '1604541916', '2020-11-05 09:01:32'),
('35.197.63.137', '2020-11-05', 1, '1604543022', '2020-11-05 09:23:42'),
('34.83.222.219', '2020-11-05', 1, '1604543022', '2020-11-05 09:23:42'),
('52.165.158.48', '2020-11-05', 1, '1604543261', '2020-11-05 09:27:41'),
('62.210.92.175', '2020-11-05', 1, '1604543639', '2020-11-05 09:33:59'),
('36.72.122.68', '2020-11-05', 5, '1604553127', '2020-11-05 10:47:27'),
('110.138.150.70', '2020-11-05', 3, '1604564117', '2020-11-05 11:01:54'),
('54.36.149.49', '2020-11-05', 1, '1604549138', '2020-11-05 11:05:38'),
('195.154.122.74', '2020-11-05', 1, '1604549139', '2020-11-05 11:05:39'),
('123.183.224.143', '2020-11-05', 2, '1604580510', '2020-11-05 13:56:52'),
('66.220.149.3', '2020-11-05', 1, '1604561481', '2020-11-05 14:31:21'),
('131.220.6.152', '2020-11-05', 1, '1604562358', '2020-11-05 14:45:58'),
('66.249.79.245', '2020-11-05', 1, '1604563740', '2020-11-05 15:09:00'),
('54.36.148.24', '2020-11-05', 1, '1604565404', '2020-11-05 15:36:44'),
('195.154.122.194', '2020-11-05', 1, '1604565406', '2020-11-05 15:36:46'),
('51.77.142.166', '2020-11-05', 2, '1604569540', '2020-11-05 16:45:06'),
('199.244.88.132', '2020-11-05', 1, '1604572404', '2020-11-05 17:33:24'),
('183.36.115.9', '2020-11-05', 1, '1604579878', '2020-11-05 19:37:58'),
('66.246.224.12', '2020-11-05', 1, '1604579929', '2020-11-05 19:38:49'),
('167.114.175.39', '2020-11-05', 2, '1604586106', '2020-11-05 21:21:40'),
('66.249.68.53', '2020-11-05', 1, '1604587818', '2020-11-05 21:50:18'),
('192.241.150.153', '2020-11-05', 1, '1604588406', '2020-11-05 22:00:06'),
('159.69.189.227', '2020-11-05', 2, '1604588975', '2020-11-05 22:09:33'),
('66.220.149.120', '2020-11-05', 1, '1604589398', '2020-11-05 22:16:38'),
('66.220.149.21', '2020-11-05', 1, '1604589398', '2020-11-05 22:16:38'),
('66.249.68.49', '2020-11-05', 2, '1604595485', '2020-11-05 22:25:28'),
('207.46.13.51', '2020-11-05', 1, '1604590465', '2020-11-05 22:34:25'),
('35.247.116.137', '2020-11-05', 1, '1604590609', '2020-11-05 22:36:49'),
('5.45.207.134', '2020-11-05', 1, '1604593863', '2020-11-05 23:31:03'),
('66.42.104.124', '2020-11-05', 1, '1604595084', '2020-11-05 23:51:24'),
('106.38.241.102', '2020-11-06', 2, '1604620690', '2020-11-06 00:51:02'),
('5.44.174.37', '2020-11-06', 1, '1604599078', '2020-11-06 00:57:58'),
('34.73.217.49', '2020-11-06', 2, '1604600056', '2020-11-06 01:12:19'),
('54.36.149.30', '2020-11-06', 1, '1604604464', '2020-11-06 02:27:44'),
('195.154.122.85', '2020-11-06', 2, '1604663570', '2020-11-06 02:27:45'),
('5.45.207.134', '2020-11-06', 1, '1604614491', '2020-11-06 05:14:51'),
('42.236.10.110', '2020-11-06', 1, '1604620721', '2020-11-06 06:58:41'),
('42.236.10.122', '2020-11-06', 1, '1604620723', '2020-11-06 06:58:43'),
('42.236.10.77', '2020-11-06', 1, '1604620728', '2020-11-06 06:58:48'),
('42.236.10.81', '2020-11-06', 1, '1604620729', '2020-11-06 06:58:49'),
('120.92.72.246', '2020-11-06', 1, '1604625486', '2020-11-06 08:18:06'),
('120.92.72.88', '2020-11-06', 1, '1604625494', '2020-11-06 08:18:14'),
('36.72.215.16', '2020-11-06', 2, '1604627113', '2020-11-06 08:45:11'),
('110.138.150.70', '2020-11-06', 6, '1604639243', '2020-11-06 08:52:22'),
('180.251.135.184', '2020-11-06', 1, '1604630558', '2020-11-06 09:42:38'),
('66.102.6.18', '2020-11-06', 1, '1604634914', '2020-11-06 10:55:14'),
('110.138.149.224', '2020-11-06', 6, '1604653525', '2020-11-06 11:12:51'),
('103.134.152.245', '2020-11-06', 7, '1604652885', '2020-11-06 11:15:19'),
('180.245.25.166', '2020-11-06', 2, '1604644978', '2020-11-06 11:34:18'),
('49.7.21.67', '2020-11-06', 1, '1604638227', '2020-11-06 11:50:27'),
('131.220.6.152', '2020-11-06', 2, '1604648374', '2020-11-06 11:56:38'),
('54.36.149.49', '2020-11-06', 2, '1604663568', '2020-11-06 12:08:22'),
('195.154.122.138', '2020-11-06', 1, '1604639304', '2020-11-06 12:08:24'),
('180.244.8.54', '2020-11-06', 1, '1604641512', '2020-11-06 12:45:12'),
('113.194.140.208', '2020-11-06', 1, '1604643465', '2020-11-06 13:17:45'),
('180.197.209.245', '2020-11-06', 1, '1604643479', '2020-11-06 13:17:59'),
('40.88.21.235', '2020-11-06', 1, '1604644310', '2020-11-06 13:31:50'),
('66.246.224.12', '2020-11-06', 2, '1604647600', '2020-11-06 14:26:30'),
('54.36.149.87', '2020-11-06', 1, '1604649804', '2020-11-06 15:03:24'),
('54.36.149.47', '2020-11-06', 1, '1604649817', '2020-11-06 15:03:37'),
('54.36.149.14', '2020-11-06', 1, '1604649825', '2020-11-06 15:03:45'),
('66.249.79.159', '2020-11-06', 1, '1604651036', '2020-11-06 15:23:56'),
('209.17.96.82', '2020-11-06', 1, '1604651730', '2020-11-06 15:35:30'),
('66.220.149.27', '2020-11-06', 1, '1604653035', '2020-11-06 15:57:15'),
('114.124.150.100', '2020-11-06', 1, '1604659597', '2020-11-06 17:46:37'),
('5.248.11.40', '2020-11-06', 1, '1604661884', '2020-11-06 18:24:44'),
('49.7.21.64', '2020-11-06', 1, '1604662957', '2020-11-06 18:42:37'),
('106.38.241.113', '2020-11-06', 1, '1604664801', '2020-11-06 19:13:21'),
('66.249.79.247', '2020-11-06', 1, '1604666573', '2020-11-06 19:42:53'),
('138.246.253.15', '2020-11-06', 1, '1604668269', '2020-11-06 20:11:09'),
('66.249.79.158', '2020-11-06', 1, '1604668615', '2020-11-06 20:16:55'),
('207.46.13.51', '2020-11-06', 1, '1604676744', '2020-11-06 22:32:24'),
('66.249.79.249', '2020-11-06', 1, '1604678969', '2020-11-06 23:09:29'),
('5.255.231.169', '2020-11-07', 1, '1604682748', '2020-11-07 00:12:28'),
('66.249.79.129', '2020-11-07', 1, '1604686793', '2020-11-07 01:19:53'),
('123.183.224.2', '2020-11-07', 1, '1604689174', '2020-11-07 01:59:34'),
('34.105.74.254', '2020-11-07', 1, '1604691122', '2020-11-07 02:32:02'),
('123.183.224.4', '2020-11-07', 1, '1604699134', '2020-11-07 04:45:34'),
('104.131.54.175', '2020-11-07', 1, '1604706945', '2020-11-07 06:55:45'),
('54.36.148.177', '2020-11-07', 1, '1604707602', '2020-11-07 07:06:42'),
('195.154.122.85', '2020-11-07', 1, '1604707603', '2020-11-07 07:06:43'),
('34.74.157.10', '2020-11-07', 2, '1604708530', '2020-11-07 07:19:43'),
('35.185.19.233', '2020-11-07', 2, '1604709768', '2020-11-07 07:40:31'),
('66.249.79.159', '2020-11-07', 2, '1604761643', '2020-11-07 07:45:55'),
('138.246.253.15', '2020-11-07', 2, '1604714461', '2020-11-07 08:10:31'),
('110.138.150.70', '2020-11-07', 2, '1604714245', '2020-11-07 08:56:47'),
('144.76.4.41', '2020-11-07', 1, '1604716540', '2020-11-07 09:35:40'),
('37.49.225.167', '2020-11-07', 1, '1604717028', '2020-11-07 09:43:48'),
('66.249.79.158', '2020-11-07', 4, '1604759705', '2020-11-07 09:45:15'),
('173.252.83.120', '2020-11-07', 1, '1604719544', '2020-11-07 10:25:44'),
('49.7.21.64', '2020-11-07', 2, '1604749017', '2020-11-07 10:59:59'),
('104.198.8.168', '2020-11-07', 2, '1604723024', '2020-11-07 11:23:43'),
('66.102.6.251', '2020-11-07', 1, '1604724671', '2020-11-07 11:51:11'),
('131.220.6.152', '2020-11-07', 2, '1604734965', '2020-11-07 12:00:13'),
('54.90.4.161', '2020-11-07', 3, '1604731585', '2020-11-07 13:46:23'),
('220.181.108.165', '2020-11-07', 1, '1604735353', '2020-11-07 14:49:13'),
('5.255.231.14', '2020-11-07', 1, '1604735608', '2020-11-07 14:53:28'),
('66.246.224.12', '2020-11-07', 1, '1604736068', '2020-11-07 15:01:08'),
('36.72.219.205', '2020-11-07', 1, '1604736559', '2020-11-07 15:09:19'),
('66.249.79.128', '2020-11-07', 1, '1604737194', '2020-11-07 15:19:54'),
('69.171.249.120', '2020-11-07', 1, '1604737306', '2020-11-07 15:21:46'),
('69.171.249.117', '2020-11-07', 1, '1604737306', '2020-11-07 15:21:46'),
('213.180.203.82', '2020-11-07', 1, '1604738954', '2020-11-07 15:49:14'),
('5.255.231.171', '2020-11-07', 1, '1604741942', '2020-11-07 16:39:02'),
('121.89.204.243', '2020-11-07', 2, '1604744768', '2020-11-07 17:25:59'),
('5.255.253.88', '2020-11-07', 1, '1604750569', '2020-11-07 19:02:49'),
('159.203.96.193', '2020-11-07', 2, '1604750718', '2020-11-07 19:05:12'),
('106.38.241.166', '2020-11-07', 1, '1604751317', '2020-11-07 19:15:17'),
('13.66.139.16', '2020-11-07', 1, '1604761351', '2020-11-07 22:02:31'),
('207.46.13.68', '2020-11-07', 1, '1604763130', '2020-11-07 22:32:10'),
('54.36.148.24', '2020-11-08', 1, '1604770047', '2020-11-08 00:27:27'),
('195.154.122.208', '2020-11-08', 1, '1604770049', '2020-11-08 00:27:29'),
('66.249.68.53', '2020-11-08', 1, '1604771119', '2020-11-08 00:45:19'),
('35.247.108.114', '2020-11-08', 1, '1604772711', '2020-11-08 01:11:51'),
('123.183.224.142', '2020-11-08', 1, '1604774930', '2020-11-08 01:48:50'),
('13.66.139.16', '2020-11-08', 2, '1604816419', '2020-11-08 03:00:40'),
('66.220.149.24', '2020-11-08', 1, '1604783331', '2020-11-08 04:08:51'),
('89.22.103.107', '2020-11-08', 1, '1604793725', '2020-11-08 07:02:05'),
('44.238.183.142', '2020-11-08', 1, '1604793804', '2020-11-08 07:03:24'),
('42.236.10.69', '2020-11-08', 1, '1604796403', '2020-11-08 07:46:43'),
('42.236.10.83', '2020-11-08', 1, '1604796408', '2020-11-08 07:46:48'),
('213.168.249.115', '2020-11-08', 1, '1604796580', '2020-11-08 07:49:40'),
('42.236.10.77', '2020-11-08', 1, '1604796611', '2020-11-08 07:50:11'),
('66.249.68.51', '2020-11-08', 2, '1604845219', '2020-11-08 08:40:09'),
('49.7.21.64', '2020-11-08', 2, '1604838791', '2020-11-08 08:48:06'),
('31.13.127.21', '2020-11-08', 1, '1604809120', '2020-11-08 11:18:40'),
('13.82.68.71', '2020-11-08', 2, '1604811628', '2020-11-08 12:00:15'),
('131.220.6.152', '2020-11-08', 2, '1604822561', '2020-11-08 12:14:51'),
('123.183.224.4', '2020-11-08', 2, '1604850610', '2020-11-08 14:57:01'),
('66.220.149.27', '2020-11-08', 1, '1604831853', '2020-11-08 17:37:33'),
('66.220.149.113', '2020-11-08', 2, '1604831858', '2020-11-08 17:37:37'),
('66.220.149.13', '2020-11-08', 1, '1604831858', '2020-11-08 17:37:38'),
('66.220.149.2', '2020-11-08', 1, '1604831858', '2020-11-08 17:37:38'),
('66.220.149.3', '2020-11-08', 1, '1604831858', '2020-11-08 17:37:38'),
('66.220.149.11', '2020-11-08', 1, '1604831858', '2020-11-08 17:37:38'),
('108.177.213.234', '2020-11-08', 1, '1604832417', '2020-11-08 17:46:57'),
('13.66.139.104', '2020-11-08', 1, '1604832663', '2020-11-08 17:51:03'),
('5.45.207.134', '2020-11-08', 2, '1604839480', '2020-11-08 18:24:27'),
('188.40.110.183', '2020-11-08', 1, '1604835499', '2020-11-08 18:38:19'),
('66.249.79.158', '2020-11-08', 1, '1604837263', '2020-11-08 19:07:43'),
('111.202.101.117', '2020-11-08', 1, '1604837839', '2020-11-08 19:17:19'),
('110.138.150.118', '2020-11-08', 2, '1604839222', '2020-11-08 19:37:12'),
('110.138.129.35', '2020-11-08', 4, '1604839883', '2020-11-08 19:47:15'),
('52.186.11.118', '2020-11-08', 2, '1604842279', '2020-11-08 20:31:15'),
('207.46.13.68', '2020-11-08', 1, '1604849475', '2020-11-08 22:31:15'),
('54.36.149.68', '2020-11-08', 1, '1604852559', '2020-11-08 23:22:39'),
('195.154.122.194', '2020-11-08', 1, '1604852564', '2020-11-08 23:22:44'),
('34.75.144.50', '2020-11-08', 2, '1604853368', '2020-11-08 23:34:02'),
('13.66.139.104', '2020-11-09', 1, '1604862862', '2020-11-09 02:14:22'),
('66.249.79.158', '2020-11-09', 3, '1604924700', '2020-11-09 02:18:51'),
('35.233.204.198', '2020-11-09', 1, '1604863427', '2020-11-09 02:23:47'),
('157.245.85.70', '2020-11-09', 1, '1604864109', '2020-11-09 02:35:09'),
('5.45.207.134', '2020-11-09', 4, '1604897978', '2020-11-09 02:37:31'),
('213.168.249.115', '2020-11-09', 1, '1604864625', '2020-11-09 02:43:45'),
('107.173.124.1', '2020-11-09', 1, '1604870115', '2020-11-09 04:15:15'),
('66.249.79.159', '2020-11-09', 1, '1604882628', '2020-11-09 07:43:48'),
('123.183.224.4', '2020-11-09', 2, '1604926145', '2020-11-09 08:41:34'),
('110.138.150.64', '2020-11-09', 5, '1604914173', '2020-11-09 10:11:07'),
('114.119.138.130', '2020-11-09', 1, '1604892172', '2020-11-09 10:22:52'),
('69.171.251.21', '2020-11-09', 1, '1604895579', '2020-11-09 11:19:39'),
('123.183.224.145', '2020-11-09', 2, '1604897915', '2020-11-09 11:55:14'),
('131.220.6.152', '2020-11-09', 2, '1604907824', '2020-11-09 11:56:49'),
('118.137.229.250', '2020-11-09', 2, '1604898231', '2020-11-09 12:03:28'),
('54.36.148.12', '2020-11-09', 1, '1604900187', '2020-11-09 12:36:27'),
('195.154.122.77', '2020-11-09', 1, '1604900188', '2020-11-09 12:36:28'),
('183.160.5.40', '2020-11-09', 1, '1604901990', '2020-11-09 13:06:30'),
('67.198.228.84', '2020-11-09', 1, '1604902002', '2020-11-09 13:06:42'),
('173.252.107.4', '2020-11-09', 1, '1604903912', '2020-11-09 13:38:32'),
('173.252.107.19', '2020-11-09', 1, '1604903912', '2020-11-09 13:38:32'),
('66.249.79.245', '2020-11-09', 1, '1604904156', '2020-11-09 13:42:36'),
('103.119.145.170', '2020-11-09', 1, '1604905479', '2020-11-09 14:04:39'),
('35.230.91.210', '2020-11-09', 1, '1604906625', '2020-11-09 14:23:45'),
('34.83.222.219', '2020-11-09', 1, '1604906625', '2020-11-09 14:23:45'),
('66.102.6.253', '2020-11-09', 1, '1604914425', '2020-11-09 16:33:45'),
('72.14.199.249', '2020-11-09', 1, '1604921581', '2020-11-09 18:33:01'),
('66.249.79.247', '2020-11-09', 1, '1604924506', '2020-11-09 19:21:46'),
('58.250.125.7', '2020-11-09', 1, '1604924704', '2020-11-09 19:25:04'),
('144.48.112.126', '2020-11-09', 1, '1604927607', '2020-11-09 20:13:27'),
('42.236.10.81', '2020-11-09', 1, '1604930559', '2020-11-09 21:02:39'),
('42.236.10.69', '2020-11-09', 1, '1604930595', '2020-11-09 21:03:15'),
('207.46.13.68', '2020-11-09', 1, '1604935834', '2020-11-09 22:30:34'),
('35.196.189.147', '2020-11-09', 2, '1604936704', '2020-11-09 22:42:50'),
('34.67.181.17', '2020-11-09', 3, '1604938326', '2020-11-09 23:11:58'),
('54.36.149.49', '2020-11-10', 2, '1604981437', '2020-11-10 00:06:20'),
('195.154.122.208', '2020-11-10', 2, '1604981438', '2020-11-10 00:06:22'),
('72.13.46.3', '2020-11-10', 1, '1604942635', '2020-11-10 00:23:55'),
('13.231.24.28', '2020-11-10', 1, '1604948806', '2020-11-10 02:06:46'),
('123.183.224.145', '2020-11-10', 1, '1604951320', '2020-11-10 02:48:40'),
('34.74.147.12', '2020-11-10', 2, '1604953992', '2020-11-10 03:33:09'),
('110.138.151.73', '2020-11-10', 1, '1604962736', '2020-11-10 05:58:56'),
('52.188.126.79', '2020-11-10', 2, '1604995746', '2020-11-10 07:45:49'),
('54.174.56.204', '2020-11-10', 1, '1604972579', '2020-11-10 08:42:59'),
('123.183.224.4', '2020-11-10', 2, '1605005400', '2020-11-10 08:49:12'),
('103.134.152.245', '2020-11-10', 5, '1604978437', '2020-11-10 09:06:33'),
('140.213.186.0', '2020-11-10', 6, '1604976449', '2020-11-10 09:41:00'),
('66.249.82.68', '2020-11-10', 2, '1604976187', '2020-11-10 09:42:21'),
('66.249.82.72', '2020-11-10', 5, '1604976186', '2020-11-10 09:42:22'),
('66.249.82.70', '2020-11-10', 1, '1604976149', '2020-11-10 09:42:29'),
('116.15.145.219', '2020-11-10', 1, '1604976426', '2020-11-10 09:47:06'),
('180.252.121.47', '2020-11-10', 1, '1604976430', '2020-11-10 09:47:10'),
('206.189.117.9', '2020-11-10', 4, '1604977580', '2020-11-10 10:06:07'),
('5.45.207.134', '2020-11-10', 1, '1604978024', '2020-11-10 10:13:44'),
('110.138.148.23', '2020-11-10', 5, '1604979730', '2020-11-10 10:20:20'),
('66.102.6.251', '2020-11-10', 1, '1604981831', '2020-11-10 11:17:11'),
('66.249.79.159', '2020-11-10', 2, '1605025169', '2020-11-10 11:38:32'),
('131.220.6.152', '2020-11-10', 2, '1604994484', '2020-11-10 11:59:37'),
('66.249.79.158', '2020-11-10', 1, '1604985412', '2020-11-10 12:16:52'),
('36.79.164.158', '2020-11-10', 1, '1604985625', '2020-11-10 12:20:25'),
('106.38.241.115', '2020-11-10', 1, '1604986872', '2020-11-10 12:41:12'),
('67.227.3.111', '2020-11-10', 1, '1604988785', '2020-11-10 13:13:05'),
('35.247.1.92', '2020-11-10', 1, '1605000223', '2020-11-10 16:23:43'),
('60.166.102.154', '2020-11-10', 1, '1605003208', '2020-11-10 17:13:28'),
('66.246.224.12', '2020-11-10', 1, '1605003894', '2020-11-10 17:24:54'),
('52.251.114.233', '2020-11-10', 2, '1605004779', '2020-11-10 17:39:39'),
('138.197.111.103', '2020-11-10', 1, '1605008787', '2020-11-10 18:46:27'),
('66.249.79.245', '2020-11-10', 1, '1605009166', '2020-11-10 18:52:46'),
('209.17.96.210', '2020-11-10', 1, '1605009201', '2020-11-10 18:53:21'),
('66.249.79.129', '2020-11-10', 1, '1605010936', '2020-11-10 19:22:16'),
('66.249.79.247', '2020-11-10', 1, '1605011103', '2020-11-10 19:25:03'),
('49.7.20.158', '2020-11-10', 1, '1605011948', '2020-11-10 19:39:08'),
('54.36.148.196', '2020-11-10', 1, '1605014499', '2020-11-10 20:21:39'),
('195.154.122.194', '2020-11-10', 1, '1605014506', '2020-11-10 20:21:46'),
('207.46.13.171', '2020-11-10', 1, '1605023153', '2020-11-10 22:45:53'),
('54.36.148.246', '2020-11-11', 1, '1605027775', '2020-11-11 00:02:55'),
('195.154.122.77', '2020-11-11', 1, '1605027776', '2020-11-11 00:02:56'),
('35.196.157.247', '2020-11-11', 2, '1605032001', '2020-11-11 01:10:49'),
('49.7.21.64', '2020-11-11', 2, '1605102272', '2020-11-11 01:33:47'),
('66.249.79.245', '2020-11-11', 1, '1605039894', '2020-11-11 03:24:54'),
('5.45.207.134', '2020-11-11', 3, '1605063005', '2020-11-11 05:11:51'),
('34.105.68.134', '2020-11-11', 1, '1605047021', '2020-11-11 05:23:41'),
('123.183.224.145', '2020-11-11', 1, '1605048422', '2020-11-11 05:47:02'),
('54.36.149.49', '2020-11-11', 2, '1605067487', '2020-11-11 07:39:57'),
('195.154.122.111', '2020-11-11', 1, '1605055202', '2020-11-11 07:40:02'),
('123.125.67.157', '2020-11-11', 1, '1605057424', '2020-11-11 08:17:04'),
('140.213.186.0', '2020-11-11', 2, '1605063818', '2020-11-11 10:00:51'),
('110.138.148.52', '2020-11-11', 9, '1605087648', '2020-11-11 10:03:54'),
('42.236.10.108', '2020-11-11', 1, '1605066573', '2020-11-11 10:49:33'),
('42.236.10.123', '2020-11-11', 1, '1605066589', '2020-11-11 10:49:49'),
('42.236.10.82', '2020-11-11', 1, '1605066677', '2020-11-11 10:51:17'),
('195.154.122.85', '2020-11-11', 1, '1605067489', '2020-11-11 11:04:49'),
('35.197.94.176', '2020-11-11', 1, '1605068623', '2020-11-11 11:23:43'),
('131.220.6.152', '2020-11-11', 2, '1605080654', '2020-11-11 11:58:11'),
('46.231.106.50', '2020-11-11', 1, '1605072248', '2020-11-11 12:24:08'),
('54.176.152.198', '2020-11-11', 1, '1605073280', '2020-11-11 12:41:20'),
('18.144.74.19', '2020-11-11', 1, '1605073284', '2020-11-11 12:41:24'),
('13.56.163.25', '2020-11-11', 6, '1605073295', '2020-11-11 12:41:25'),
('106.38.241.115', '2020-11-11', 1, '1605084542', '2020-11-11 15:49:02'),
('113.116.185.31', '2020-11-11', 3, '1605085158', '2020-11-11 15:58:59'),
('149.28.94.127', '2020-11-11', 1, '1605085664', '2020-11-11 16:07:44'),
('35.199.147.77', '2020-11-11', 1, '1605090223', '2020-11-11 17:23:43'),
('34.82.182.147', '2020-11-11', 1, '1605090225', '2020-11-11 17:23:45'),
('180.242.182.146', '2020-11-11', 1, '1605094270', '2020-11-11 18:31:10'),
('123.183.224.67', '2020-11-11', 1, '1605097181', '2020-11-11 19:19:41'),
('54.245.10.208', '2020-11-11', 1, '1605098291', '2020-11-11 19:38:11'),
('207.46.13.171', '2020-11-11', 1, '1605110026', '2020-11-11 22:53:46'),
('129.226.49.27', '2020-11-11', 1, '1605113599', '2020-11-11 23:53:19'),
('129.226.49.27', '2020-11-12', 1, '1605114507', '2020-11-12 00:08:27'),
('49.7.21.64', '2020-11-12', 1, '1605115968', '2020-11-12 00:32:48'),
('54.36.148.5', '2020-11-12', 2, '1605166863', '2020-11-12 00:37:12'),
('195.154.122.138', '2020-11-12', 1, '1605116234', '2020-11-12 00:37:14'),
('207.46.13.171', '2020-11-12', 1, '1605118749', '2020-11-12 01:19:09'),
('167.172.179.56', '2020-11-12', 5, '1605123180', '2020-11-12 02:32:56'),
('66.249.79.159', '2020-11-12', 1, '1605124881', '2020-11-12 03:01:21'),
('66.249.79.158', '2020-11-12', 2, '1605179891', '2020-11-12 03:01:53'),
('27.115.124.70', '2020-11-12', 1, '1605129701', '2020-11-12 04:21:41'),
('180.163.220.66', '2020-11-12', 1, '1605129740', '2020-11-12 04:22:20'),
('123.183.224.4', '2020-11-12', 1, '1605131574', '2020-11-12 04:52:54'),
('116.179.32.240', '2020-11-12', 1, '1605134467', '2020-11-12 05:41:07'),
('81.69.2.119', '2020-11-12', 1, '1605143937', '2020-11-12 08:18:57'),
('110.138.148.52', '2020-11-12', 3, '1605157865', '2020-11-12 08:27:47'),
('103.130.192.242', '2020-11-12', 1, '1605145145', '2020-11-12 08:39:05'),
('5.255.231.169', '2020-11-12', 1, '1605147522', '2020-11-12 09:18:42'),
('5.45.207.134', '2020-11-12', 1, '1605147524', '2020-11-12 09:18:44'),
('66.249.79.249', '2020-11-12', 1, '1605147588', '2020-11-12 09:19:48'),
('66.249.79.245', '2020-11-12', 1, '1605147621', '2020-11-12 09:20:21'),
('176.121.14.223', '2020-11-12', 1, '1605147787', '2020-11-12 09:23:07'),
('95.163.255.129', '2020-11-12', 1, '1605150633', '2020-11-12 10:10:33'),
('123.183.224.145', '2020-11-12', 1, '1605153346', '2020-11-12 10:55:46'),
('131.220.6.152', '2020-11-12', 2, '1605167301', '2020-11-12 12:01:28'),
('182.2.168.132', '2020-11-12', 3, '1605158156', '2020-11-12 12:07:12'),
('34.83.97.104', '2020-11-12', 1, '1605162223', '2020-11-12 13:23:43'),
('42.236.10.108', '2020-11-12', 1, '1605163198', '2020-11-12 13:39:58'),
('195.154.122.77', '2020-11-12', 1, '1605166866', '2020-11-12 14:41:06'),
('66.220.149.119', '2020-11-12', 2, '1605167552', '2020-11-12 14:52:31'),
('66.220.149.10', '2020-11-12', 1, '1605167551', '2020-11-12 14:52:31'),
('180.244.57.145', '2020-11-12', 2, '1605168720', '2020-11-12 15:11:46'),
('138.246.253.15', '2020-11-12', 1, '1605168964', '2020-11-12 15:16:04'),
('67.198.228.83', '2020-11-12', 1, '1605170580', '2020-11-12 15:43:00'),
('149.28.94.127', '2020-11-12', 1, '1605172354', '2020-11-12 16:12:34'),
('180.241.23.115', '2020-11-12', 1, '1605176113', '2020-11-12 17:15:13'),
('66.102.8.12', '2020-11-12', 1, '1605180669', '2020-11-12 18:31:09'),
('66.102.8.10', '2020-11-12', 2, '1605180690', '2020-11-12 18:31:14'),
('66.102.8.14', '2020-11-12', 1, '1605180686', '2020-11-12 18:31:26'),
('51.254.204.117', '2020-11-12', 1, '1605182857', '2020-11-12 19:07:37'),
('72.14.199.247', '2020-11-12', 1, '1605183668', '2020-11-12 19:21:08'),
('35.233.143.184', '2020-11-12', 1, '1605183824', '2020-11-12 19:23:44'),
('66.249.79.129', '2020-11-12', 1, '1605184024', '2020-11-12 19:27:04'),
('5.255.253.108', '2020-11-12', 2, '1605184278', '2020-11-12 19:31:12'),
('66.246.224.12', '2020-11-12', 1, '1605184805', '2020-11-12 19:40:05'),
('58.250.125.82', '2020-11-12', 1, '1605188721', '2020-11-12 20:45:21'),
('138.197.7.134', '2020-11-12', 3, '1605188973', '2020-11-12 20:48:47'),
('106.38.241.115', '2020-11-12', 1, '1605189520', '2020-11-12 20:58:40'),
('39.104.207.247', '2020-11-13', 1, '1605206060', '2020-11-13 01:34:20'),
('42.236.10.114', '2020-11-13', 1, '1605207554', '2020-11-13 01:59:14'),
('180.241.23.115', '2020-11-13', 11, '1605267729', '2020-11-13 02:16:03'),
('54.36.149.49', '2020-11-13', 2, '1605280698', '2020-11-13 02:35:33'),
('195.154.122.77', '2020-11-13', 2, '1605280700', '2020-11-13 02:35:35'),
('213.180.203.141', '2020-11-13', 1, '1605213247', '2020-11-13 03:34:07'),
('123.183.224.145', '2020-11-13', 2, '1605242014', '2020-11-13 03:54:05'),
('18.212.106.62', '2020-11-13', 1, '1605214694', '2020-11-13 03:58:14'),
('5.255.231.169', '2020-11-13', 1, '1605215267', '2020-11-13 04:07:47'),
('66.249.79.158', '2020-11-13', 2, '1605277314', '2020-11-13 05:24:40'),
('180.163.220.67', '2020-11-13', 1, '1605220033', '2020-11-13 05:27:13'),
('104.196.106.26', '2020-11-13', 2, '1605220324', '2020-11-13 05:29:48'),
('116.179.32.99', '2020-11-13', 1, '1605220751', '2020-11-13 05:39:11'),
('54.187.141.149', '2020-11-13', 1, '1605221553', '2020-11-13 05:52:33'),
('104.168.158.207', '2020-11-13', 1, '1605222469', '2020-11-13 06:07:49'),
('54.36.149.20', '2020-11-13', 1, '1605224045', '2020-11-13 06:34:05'),
('195.154.122.55', '2020-11-13', 1, '1605224046', '2020-11-13 06:34:06'),
('159.203.197.247', '2020-11-13', 1, '1605229702', '2020-11-13 08:08:22'),
('35.197.84.178', '2020-11-13', 1, '1605231125', '2020-11-13 08:32:05'),
('110.138.148.52', '2020-11-13', 19, '1605256211', '2020-11-13 08:43:15'),
('112.215.171.112', '2020-11-13', 2, '1605232478', '2020-11-13 08:54:07'),
('66.102.6.251', '2020-11-13', 1, '1605232819', '2020-11-13 09:00:19'),
('66.249.79.129', '2020-11-13', 2, '1605235379', '2020-11-13 09:37:28'),
('54.36.148.5', '2020-11-13', 1, '1605235546', '2020-11-13 09:45:46'),
('195.154.122.194', '2020-11-13', 1, '1605235548', '2020-11-13 09:45:48'),
('123.183.224.4', '2020-11-13', 2, '1605282805', '2020-11-13 09:48:31'),
('66.249.79.159', '2020-11-13', 4, '1605278041', '2020-11-13 09:54:22'),
('5.255.253.108', '2020-11-13', 3, '1605257829', '2020-11-13 10:57:15'),
('103.119.50.52', '2020-11-13', 2, '1605244434', '2020-11-13 11:39:15'),
('209.17.96.146', '2020-11-13', 1, '1605243421', '2020-11-13 11:57:01'),
('131.220.6.152', '2020-11-13', 2, '1605253535', '2020-11-13 12:02:34'),
('5.45.207.134', '2020-11-13', 9, '1605279151', '2020-11-13 12:05:07'),
('35.227.166.137', '2020-11-13', 1, '1605245024', '2020-11-13 12:23:44'),
('188.213.26.61', '2020-11-13', 1, '1605247367', '2020-11-13 13:02:47'),
('77.75.77.36', '2020-11-13', 1, '1605249371', '2020-11-13 13:36:11'),
('125.160.67.50', '2020-11-13', 3, '1605254005', '2020-11-13 13:42:33'),
('66.246.224.12', '2020-11-13', 1, '1605252592', '2020-11-13 14:29:52'),
('173.252.87.21', '2020-11-13', 1, '1605252594', '2020-11-13 14:29:54'),
('173.252.87.9', '2020-11-13', 1, '1605252594', '2020-11-13 14:29:54'),
('173.252.87.1', '2020-11-13', 1, '1605252595', '2020-11-13 14:29:55'),
('54.36.148.51', '2020-11-13', 1, '1605254597', '2020-11-13 15:03:17'),
('54.36.148.70', '2020-11-13', 1, '1605254611', '2020-11-13 15:03:31'),
('54.36.148.139', '2020-11-13', 1, '1605254619', '2020-11-13 15:03:39'),
('182.0.204.208', '2020-11-13', 2, '1605261332', '2020-11-13 16:55:31'),
('103.134.152.245', '2020-11-13', 4, '1605267642', '2020-11-13 18:03:47'),
('129.205.124.161', '2020-11-13', 1, '1605267358', '2020-11-13 18:35:58'),
('13.66.139.90', '2020-11-13', 1, '1605269242', '2020-11-13 19:07:22'),
('49.7.20.144', '2020-11-13', 1, '1605270052', '2020-11-13 19:20:52'),
('138.246.253.15', '2020-11-13', 1, '1605270122', '2020-11-13 19:22:02'),
('66.249.79.245', '2020-11-13', 2, '1605275291', '2020-11-13 19:37:27'),
('66.249.79.247', '2020-11-13', 1, '1605271081', '2020-11-13 19:38:01'),
('104.198.189.67', '2020-11-13', 1, '1605273336', '2020-11-13 20:15:36'),
('13.66.139.104', '2020-11-13', 2, '1605277561', '2020-11-13 20:20:55'),
('106.38.241.115', '2020-11-13', 1, '1605275242', '2020-11-13 20:47:22'),
('207.46.13.171', '2020-11-13', 1, '1605282512', '2020-11-13 22:48:32'),
('66.249.79.158', '2020-11-14', 1, '1605289093', '2020-11-14 00:38:13'),
('104.227.66.131', '2020-11-14', 1, '1605297415', '2020-11-14 02:56:55'),
('104.198.189.67', '2020-11-14', 2, '1605300378', '2020-11-14 03:46:15'),
('66.249.79.159', '2020-11-14', 1, '1605304186', '2020-11-14 04:49:46'),
('54.36.149.49', '2020-11-14', 1, '1605306471', '2020-11-14 05:27:51'),
('195.154.122.208', '2020-11-14', 1, '1605306473', '2020-11-14 05:27:53'),
('47.242.9.54', '2020-11-14', 2, '1605311488', '2020-11-14 06:47:41'),
('66.249.79.247', '2020-11-14', 1, '1605316676', '2020-11-14 08:17:56'),
('106.38.241.115', '2020-11-14', 1, '1605318102', '2020-11-14 08:41:42'),
('34.105.22.174', '2020-11-14', 1, '1605320621', '2020-11-14 09:23:41'),
('5.45.207.134', '2020-11-14', 1, '1605320819', '2020-11-14 09:26:59'),
('72.14.199.95', '2020-11-14', 1, '1605321682', '2020-11-14 09:41:22'),
('49.7.21.64', '2020-11-14', 1, '1605329594', '2020-11-14 11:53:14'),
('131.220.6.152', '2020-11-14', 1, '1605329773', '2020-11-14 11:56:13'),
('180.241.23.115', '2020-11-14', 3, '1605330155', '2020-11-14 11:57:24'),
('103.134.152.245', '2020-11-14', 4, '1605330298', '2020-11-14 12:04:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catserv`
--
ALTER TABLE `catserv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub`
--
ALTER TABLE `sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subserv`
--
ALTER TABLE `subserv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `catserv`
--
ALTER TABLE `catserv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `subserv`
--
ALTER TABLE `subserv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

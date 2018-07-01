-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2018 at 01:36 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simatrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` double NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_penjualan`, `id_produk`, `jumlah`, `total_harga`, `tanggal`) VALUES
(10, 9, 137, 1925000, '2018-05-24'),
(11, 8, 119, 2500000, '2018-04-24'),
(12, 8, 137, 1250000, '2018-05-24'),
(13, 8, 114, 2750000, '2018-03-24'),
(14, 8, 120, 3000000, '2018-02-24'),
(15, 8, 115, 2875000, '2018-01-24'),
(18, 10, 50, 750000, '2018-05-26'),
(18, 9, 50, 1750000, '2018-05-26'),
(19, 9, 100, 3500000, '2018-05-31'),
(19, 10, 50, 750000, '2018-05-31'),
(20, 10, 100, 1500000, '2018-05-31'),
(21, 9, 100, 3500000, '2018-07-02'),
(22, 9, 50, 1750000, '2018-07-02'),
(23, 9, 120, 4200000, '2018-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `harga` double NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_user`, `nama_produk`, `jumlah_stok`, `harga`, `foto_produk`, `deskripsi`) VALUES
(8, 2, 'Keripik lele', 105, 25000, '24052018030711keripik_orig.jpg', 'Keripik lele enak sekali'),
(9, 2, 'Nugget lele', 150, 35000, '24052018030748nugget_orig.jpg', 'Nugget lele sangat enak'),
(10, 2, 'Pastel lele', 1300, 15000, '24052018030815pastel-kering_orig.jpg', 'Pastel lele ori dan enak'),
(11, 2, 'Abon lele', 1000, 15000, '26052018052032abon_orig.jpg', 'enak');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'belum bayar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `id_user`, `tanggal`, `status`) VALUES
(10, 3, '2018-05-24', 'lunas'),
(11, 6, '2018-04-24', 'lunas'),
(12, 3, '2018-05-24', 'lunas'),
(13, 3, '2018-03-24', 'lunas'),
(14, 6, '2018-02-24', 'lunas'),
(15, 3, '2018-01-24', 'lunas'),
(16, 3, '2018-05-25', 'lunas'),
(18, 3, '2018-05-26', 'lunas'),
(19, 3, '2018-05-31', 'lunas'),
(20, 3, '2018-05-31', 'lunas'),
(21, 3, '2018-07-02', 'lunas'),
(22, 6, '2018-07-02', 'lunas'),
(23, 6, '2018-06-01', 'lunas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `no_telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `password`, `email`, `level`, `no_telepon`) VALUES
(1, 'admin kasir', 'adminkasir', 'adminkasir', 'adminkasir@gmail.com', 1, '0987654321'),
(2, 'admin gudang', 'admingudang', 'admingudang', 'admingudang@gmail.com', 2, '09876545678'),
(3, 'Distributor 1', 'Distributor1', 'Distributor1', 'Distributor1@gmail.com', 3, '987656733'),
(6, 'Distributor 2', 'Distributor2', 'Distributor2', 'Distributor2@gmail.com', 3, '08978390660');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `id_order` (`id_penjualan`,`id_produk`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

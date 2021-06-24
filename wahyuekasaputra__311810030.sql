-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2021 pada 19.24
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wahyuekasaputra__311810030`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keuangan`
--

CREATE TABLE `keuangan` (
  `no_invoice` varchar(15) NOT NULL,
  `no_sparepart` varchar(20) DEFAULT NULL,
  `tanggal_transaksi` varchar(20) DEFAULT NULL,
  `sisa_bayar` int(50) DEFAULT NULL,
  `discount` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keuangan`
--

INSERT INTO `keuangan` (`no_invoice`, `no_sparepart`, `tanggal_transaksi`, `sisa_bayar`, `discount`) VALUES
('INV2001012', '3C1-123', '08 MEI 2020', 120000, 0),
('INV2001013', '3C1-124', '01 MARET 2020', 150000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `no_polisi` varchar(10) NOT NULL,
  `tipe_motor` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`no_polisi`, `tipe_motor`, `alamat`, `foto`) VALUES
('B 3411 FGV', 'YAMAHA VIXION', 'CIBITUNG', 'vixion.png'),
('B 3561 GFG', 'Supra', 'CIKARANG BARAT', 'supra.jpg'),
('B 4312 FCF', 'YAMAHA MIO', 'CIKARANG TIMUR', 'mio.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `yss_code` int(11) NOT NULL,
  `no_polisi` varchar(10) DEFAULT NULL,
  `nama_technician` varchar(30) DEFAULT NULL,
  `jenis_service` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`yss_code`, `no_polisi`, `nama_technician`, `jenis_service`) VALUES
(2991, 'B 4312 FCF', 'YOGA', 'SERVICE RINGAN'),
(2992, 'B 3411 FGV', 'WAHYU', 'SERVICE RINGAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE `sparepart` (
  `no_sparepart` varchar(20) NOT NULL,
  `yss_code` int(11) DEFAULT NULL,
  `nama_sparepart` varchar(50) DEFAULT NULL,
  `qty` int(30) DEFAULT NULL,
  `harga_sparepart` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sparepart`
--

INSERT INTO `sparepart` (`no_sparepart`, `yss_code`, `nama_sparepart`, `qty`, `harga_sparepart`) VALUES
('3C1-123', 2992, 'BRAKE PAD KIT', 1, 60000),
('3C1-124', 2991, 'YAMALUBE SPORT', 1, 80000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(10) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` enum('Administrator','Sekretaris') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Wahyu Eka Saputra', 'admin', '1', 'Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(15) NOT NULL,
  `nama_profil` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `bidang` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `nama_profil`, `alamat`, `bidang`) VALUES
(1, '311810030 Service', 'Bekasi', 'Service');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`no_invoice`),
  ADD KEY `no_sparepart` (`no_sparepart`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`no_polisi`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`yss_code`),
  ADD KEY `no_polisi` (`no_polisi`);

--
-- Indeks untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`no_sparepart`),
  ADD KEY `yss_code` (`yss_code`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD CONSTRAINT `no_sparepart` FOREIGN KEY (`no_sparepart`) REFERENCES `sparepart` (`no_sparepart`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `no_polisi` FOREIGN KEY (`no_polisi`) REFERENCES `pelanggan` (`no_polisi`);

--
-- Ketidakleluasaan untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD CONSTRAINT `yss_code` FOREIGN KEY (`yss_code`) REFERENCES `service` (`yss_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

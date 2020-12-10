-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Apr 2020 pada 10.15
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anlisa`
--

CREATE TABLE `anlisa` (
  `id_anlisa` int(10) UNSIGNED NOT NULL,
  `id_pendaftaran` int(10) UNSIGNED NOT NULL,
  `analisa` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id_diagnosa` int(10) UNSIGNED NOT NULL,
  `id_pendaftaran` int(10) UNSIGNED NOT NULL,
  `diagnosa` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_user`
--

CREATE TABLE `ms_user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ms_user`
--

INSERT INTO `ms_user` (`id_user`, `username`, `pass`, `level`) VALUES
(1, 'andri', '202cb962ac59075b964b07152d234b70', 'Admin'),
(2, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Admin'),
(3, 'bidan', '202cb962ac59075b964b07152d234b70', 'Bidan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(10) UNSIGNED NOT NULL,
  `id_pendaftaran` int(10) UNSIGNED NOT NULL,
  `resep` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anlisa`
--
ALTER TABLE `anlisa`
  ADD PRIMARY KEY (`id_anlisa`),
  ADD KEY `anlisa_FKIndex1` (`id_pendaftaran`);

--
-- Indeks untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`),
  ADD KEY `diagnosa_FKIndex1` (`id_pendaftaran`);

--
-- Indeks untuk tabel `ms_user`
--
ALTER TABLE `ms_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `pendaftaran_FKIndex1` (`id_user`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `resep_FKIndex1` (`id_pendaftaran`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anlisa`
--
ALTER TABLE `anlisa`
  MODIFY `id_anlisa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id_diagnosa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ms_user`
--
ALTER TABLE `ms_user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anlisa`
--
ALTER TABLE `anlisa`
  ADD CONSTRAINT `anlisa_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD CONSTRAINT `diagnosa_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `ms_user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

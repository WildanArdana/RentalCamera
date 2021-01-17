-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jan 2021 pada 12.08
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talcam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` char(5) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama`) VALUES
('K0001', 'Kamera'),
('K0002', 'Lensa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_merek`
--

CREATE TABLE `tbl_merek` (
  `id_merek` char(5) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_merek`
--

INSERT INTO `tbl_merek` (`id_merek`, `nama`) VALUES
('M0001', 'Canon'),
('M0002', 'Nikon'),
('M0003', 'Sony'),
('M0004', 'Fujifilm');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `status_order` char(1) DEFAULT NULL,
  `id_produk` char(5) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `id_session` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `status_order`, `id_produk`, `jumlah`, `harga`, `id_session`) VALUES
(10, 'P', 'P0001', 3, 50000, '0or3vuh9bjklmvd3k2pp6n1sme'),
(11, 'P', 'P0001', 1, 50000, 'ebv3ven374qv9dgm403v4lo6i4'),
(12, 'P', 'P0001', 1, 50000, '3h4fbgr5lr2uc8537qj0h6nlit'),
(13, 'P', 'P0001', 1, 50000, '7d235pt9am4klgc3ph3i6q05t7'),
(14, 'P', 'P0001', 2, 50000, '299cbs969a5ffbf15e222rjdgh'),
(16, 'P', 'P0001', 1, 50000, 'a0dmthrb0366o765plf1h1tu21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `id_order_detail` char(5) NOT NULL,
  `id_session` varchar(255) DEFAULT NULL,
  `id_pelanggan` char(5) DEFAULT NULL,
  `qtytotal` int(11) DEFAULT NULL,
  `grandtotal` int(11) DEFAULT NULL,
  `tgl_ambil` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id_user` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`id_order_detail`, `id_session`, `id_pelanggan`, `qtytotal`, `grandtotal`, `tgl_ambil`, `tgl_kembali`, `status`, `id_user`) VALUES
('O0001', '7d235pt9am4klgc3ph3i6q05t7', 'C0001', 1, 50000, '2020-07-22', '2020-07-24', 'Sudah Kembali', 'U0001'),
('O0002', '299cbs969a5ffbf15e222rjdgh', 'C0002', 2, 100000, '2020-07-22', '2020-07-23', 'Belum Kembali', 'U0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` char(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `jaminan` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `nama`, `jenis_kelamin`, `pekerjaan`, `alamat`, `nohp`, `jaminan`) VALUES
('C0001', 'Wildan', 'L', 'Kuliah', 'jogja', '081328281644', 'KTM'),
('C0002', 'Alvian', 'L', 'Kuliah', 'Kulonprogo', '0813281644222', 'SIM'),
('C0003', 'Adhiel', 'L', 'Sekolah', 'Klaten', '085628033728', 'KTP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` char(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `id_kategori` char(5) NOT NULL,
  `id_merek` char(5) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `nama`, `id_kategori`, `id_merek`, `harga`, `gambar`, `deskripsi`, `stok`) VALUES
('P0001', 'Canon EOS 600D', 'K0001', 'M0001', 50000, '1595373335_canon-eos-600d.jpg', 'Bagus', 2),
('P0002', 'Sony Lensa', 'K0002', 'M0003', 600000, '1596037504_download.jpeg', 'Keren', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` char(5) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(15) DEFAULT 'Karyawan',
  `email` varchar(100) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT '-',
  `twitter` varchar(255) DEFAULT '-',
  `instagram` varchar(255) DEFAULT '-',
  `gaji` int(11) DEFAULT NULL,
  `tgl_gabung` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama`, `level`, `email`, `gambar`, `tgl_lahir`, `no_hp`, `jenis_kelamin`, `alamat`, `facebook`, `twitter`, `instagram`, `gaji`, `tgl_gabung`) VALUES
('U0001', 'admin', 'admin', 'Wildan Muhmmad Ardana', 'Administrator', 'wildan1999muhammad@gmail.com', '1610881633_WhatsApp Image 2020-06-23 at 13.51.20 (1).jpeg', '1999-10-10', '085156191497', 'L', 'Sleman', 'fb.com/WildanArdana', 'twitter.com/', 'instagram.com/wildan.ard_', 53235246, '2020-07-19 20:38:08'),
('U0002', 'mascandra', 'candra', 'Candra Pangestu', 'Karyawan', 'candra@mail.com', '1595236916_candra.png', '2000-04-18', '081328281644', 'L', 'Joho', 'fb.com/mascandra', '-', '-', 3200000, '2020-07-20 09:21:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tbl_merek`
--
ALTER TABLE `tbl_merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indeks untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_session` (`id_session`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_session` (`id_session`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_merek` (`id_merek`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `tbl_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `tbl_order_detail_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tbl_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_order_detail_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `tbl_order` (`id_session`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_order_detail_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD CONSTRAINT `tbl_produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_produk_ibfk_2` FOREIGN KEY (`id_merek`) REFERENCES `tbl_merek` (`id_merek`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php
	include "koneksi.php";
	$id_karyawan=$_GET['id_karyawan'];
	$hapus=mysqli_query($koneksi,"DELETE FROM karyawan WHERE id_karyawan=$id_karyawan");
	if ($hapus) {
		header('location:tampil.php');
		}
?>
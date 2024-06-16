<?php
	include "koneksi.php";
	$id_gaji=$_GET['id_gaji'];
	$hapus=mysqli_query($koneksi,"DELETE FROM gaji WHERE id_gaji=$id_gaji");
	if ($hapus) {
		header('location:gaji.php');
	}
?>
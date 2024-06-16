<?php
	include 'koneksi.php';

	$id_karyawan = $_POST['id_karyawan']; 
	$nama_lengkap = $_POST['nama_lengkap'];
	$jenis_kelamin = $_POST['jenis_kelamin'];
	$tanggal_lahir = $_POST['tanggal_lahir'];
	$id_departemen = $_POST['id_departemen'];
	$email = $_POST['email'];
	$nomor_telepon = $_POST['nomor_telepon'];
	$alamat = $_POST['alamat'];
	$id_jabatan = $_POST['id_jabatan'];

	$sql = "INSERT INTO karyawan (id_karyawan, nama_lengkap, jenis_kelamin, tanggal_lahir, id_departemen, email, nomor_telepon, alamat, id_jabatan) 
					VALUES ('$id_karyawan', '$nama_lengkap', '$jenis_kelamin', '$tanggal_lahir', '$id_departemen', '$email', '$nomor_telepon', '$alamat', '$id_jabatan')";
	$result = mysqli_query($koneksi, $sql);

	if ($result) {
		echo "<script>alert('Data karyawan berhasil disimpan');</script>";
		echo "<script>window.location='tampil.php';</script>"; 
	} else {
		echo "<script>alert('Gagal menyimpan data karyawan');</script>";
		echo "<script>window.history.back();</script>";
	}

	mysqli_close($koneksi);
?>

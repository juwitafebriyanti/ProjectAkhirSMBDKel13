<?php
include 'koneksi.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_karyawan = $_POST['id_karyawan'];
    $nama_lengkap = $_POST['nama_lengkap'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $tanggal_lahir = $_POST['tanggal_lahir'];
    $id_departemen = $_POST['id_departemen'];
    $email = $_POST['email'];
    $nomor_telepon = $_POST['nomor_telepon'];
    $alamat = $_POST['alamat'];

    // Panggil prosedur untuk update data karyawan dan kontak
    $sql = "CALL update_karyawan_dan_kontak(?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($koneksi, $sql);
    mysqli_stmt_bind_param($stmt, "isssssss", $id_karyawan, $nama_lengkap, $jenis_kelamin, $tanggal_lahir, $id_departemen, $email, $nomor_telepon, $alamat);

    if (mysqli_stmt_execute($stmt)) {
        header('Location: tampil.php');
    } else {
        echo "Error: " . mysqli_error($koneksi);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($koneksi);
}
?>

<?php
    include "koneksi.php";

    $id_karyawan = $_POST['id_karyawan'];
    $tanggal_mulai = $_POST['tanggal_mulai'];
    $tanggal_selesai = $_POST['tanggal_selesai'];
    $id_jabatan = $_POST['id_jabatan'];
    $id_departemen = $_POST['id_departemen'];

    $query = "INSERT INTO riwayat_pekerjaan (id_karyawan, tanggal_mulai, tanggal_selesai, id_jabatan, id_departemen) 
            VALUES ('$id_karyawan', '$tanggal_mulai', '$tanggal_selesai', '$id_jabatan', '$id_departemen')";
    $result = mysqli_query($koneksi, $query);

    if ($result) {
        echo "<script>window.location='riwayatPekerjaan.php';</script>"; 
    } else {
        echo "<script>alert('Gagal menyimpan data riwayat pekerjaan');</script>";
        echo "<script>window.history.back();</script>";
    }
?>

<?php
    $id_jabatan = $_POST['id_jabatan'];
    $nama_jabatan = $_POST['nama_jabatan'];

    include "koneksi.php";

    $query = "INSERT INTO jabatan (id_jabatan, nama_jabatan) VALUES ('$id_jabatan', '$nama_jabatan')";
    $result = mysqli_query($koneksi, $query);

    if ($result) {
        echo "<script>alert('Data jabatan berhasil disimpan');</script>";
        echo "<script>window.location='jabatan.php';</script>"; 
    } else {
        echo "<script>alert('Gagal menyimpan data jabatan');</script>";
        echo "<script>window.history.back();</script>";
    }
?>
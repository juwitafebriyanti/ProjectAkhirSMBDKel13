<?php
    $id_departemen = $_POST['id_departemen'];
    $nama_departemen = $_POST['nama_departemen'];

    include "koneksi.php";

    $query = "INSERT INTO departemen (id_departemen, nama_departemen) VALUES ('$id_departemen', '$nama_departemen')";
    $result = mysqli_query($koneksi, $query);

    if ($result) {
        echo "<script>alert('Data departemen berhasil disimpan');</script>";
        echo "<script>window.location='departemen.php';</script>"; 
    } else {
        echo "<script>alert('Gagal menyimpan data departemen');</script>";
        echo "<script>window.history.back();</script>";
    }
?>
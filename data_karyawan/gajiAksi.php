<?php
    include 'koneksi.php';

    $id_karyawan = $_POST['id_karyawan'];
    $jumlah_gaji = $_POST['jumlah_gaji'];

    $sql = "INSERT INTO gaji (id_karyawan, jumlah_gaji) VALUES ('$id_karyawan', '$jumlah_gaji')";
    $result = mysqli_query($koneksi, $sql); 

    if ($result) {
        echo "<script>alert('Data gaji berhasil disimpan');</script>";
        echo "<script>window.location='gaji.php';</script>"; 
    } else {
        echo "<script>alert('Gagal menyimpan data gaji');</script>";
        echo "<script>window.history.back();</script>"; 
    }

    mysqli_close($koneksi);
?>

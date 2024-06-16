<?php
    include_once("koneksi.php");

    $id_karyawan = mysqli_real_escape_string($koneksi, $_POST['id_karyawan']);
    $nama_lengkap = mysqli_real_escape_string($koneksi, $_POST['nama_lengkap']);
    $jenis_kelamin = mysqli_real_escape_string($koneksi, $_POST['jenis_kelamin']);
    $tanggal_lahir = mysqli_real_escape_string($koneksi, $_POST['tanggal_lahir']);
    $id_departemen = mysqli_real_escape_string($koneksi, $_POST['id_departemen']);
    $email = mysqli_real_escape_string($koneksi, $_POST['email']);
    $nomor_telepon = mysqli_real_escape_string($koneksi, $_POST['nomor_telepon']);
    $alamat = mysqli_real_escape_string($koneksi, $_POST['alamat']);

    $query_update = "CALL update_karyawan(
        '$id_karyawan', 
        '$nama_lengkap', 
        '$jenis_kelamin', 
        '$tanggal_lahir', 
        '$id_departemen', 
        '$email', 
        '$nomor_telepon', 
        '$alamat')";

    if (mysqli_query($koneksi, $query_update)) {
        header("Location: tampil.php");
    } else {
        echo "Error updating record: " . mysqli_error($koneksi) . " - Query: " . $query_update;
    }

    mysqli_close($koneksi);
?>

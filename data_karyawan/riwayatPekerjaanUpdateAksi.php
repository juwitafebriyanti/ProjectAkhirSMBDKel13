<?php
    include_once("koneksi.php");

    $nama_lengkap = $_POST['nama_lengkap'];
    $tanggal_mulai = $_POST['tanggal_mulai'];
    $tanggal_selesai = $_POST['tanggal_selesai'];
    $nama_jabatan = $_POST['nama_jabatan'];
    $nama_departemen = $_POST['nama_departemen'];

    $query_update = "CALL update_tampil_riwayat(
        '$nama_lengkap', 
        '$tanggal_mulai', 
        '$tanggal_selesai',
        '$nama_jabatan',
        '$nama_departemen'
    )";

    if (mysqli_query($koneksi, $query_update)) {
        header("Location: riwayatPekerjaan.php");
    } else {
        echo "Error updating record: " . mysqli_error($koneksi) . " - Query: " . $query_update;
    }

    mysqli_close($koneksi);
?>

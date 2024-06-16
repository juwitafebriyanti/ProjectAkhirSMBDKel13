<?php
    include "koneksi.php";

    $nama_lengkap = mysqli_real_escape_string($koneksi, $_GET['nama_lengkap']);

    $query_karyawan = "SELECT id_karyawan FROM karyawan WHERE nama_lengkap='$nama_lengkap'";
    $result_karyawan = mysqli_query($koneksi, $query_karyawan);

    if (mysqli_num_rows($result_karyawan) > 0) {
        $row_karyawan = mysqli_fetch_assoc($result_karyawan);
        $id_karyawan = $row_karyawan['id_karyawan'];

        $hapus = mysqli_query($koneksi, "DELETE FROM riwayat_pekerjaan WHERE id_karyawan=$id_karyawan");

        if ($hapus) {
            header('Location: riwayatPekerjaan.php');
        } else {
            echo "Error deleting record: " . mysqli_error($koneksi);
        }
    } else {
        echo "Employee not found.";
    }

    mysqli_close($koneksi);
?>

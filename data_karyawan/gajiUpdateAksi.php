<?php
    include_once("koneksi.php");

    $id_karyawan = mysqli_real_escape_string($koneksi, $_POST['id_karyawan']);
    $jumlah_gaji = mysqli_real_escape_string($koneksi, $_POST['jumlah_gaji']);

    $query_update = "CALL update_gaji_karyawan('$id_karyawan', '$jumlah_gaji')";

    if (mysqli_query($koneksi, $query_update)) {
        header("Location: gaji.php");
    } else {
        echo "Error updating record: " . mysqli_error($koneksi) . " - Query: " . $query_update;
    }

    mysqli_close($koneksi);
?>

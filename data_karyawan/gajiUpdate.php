<?php
  include_once("koneksi.php");

  $id_gaji = $_GET['id_gaji'];
  $result = mysqli_query($koneksi, "SELECT * FROM view_gaji WHERE id_gaji = '$id_gaji'");

  while($res = mysqli_fetch_array($result)) { 
    $id_gaji = $res['id_gaji'];
    $nama_lengkap = $res['jumlah_gaji'];
  }

  $query_karyawan = "SELECT * FROM karyawan";
  $result_karyawan= mysqli_query($koneksi, $query_karyawan);
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Input Data Karyawan </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style type="text/css">
       @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: 'Poppins', sans-serif;
        }
        body {
          height: 100vh;
          background: linear-gradient(150deg, #7FFFD4, #20B2AA);
        }
        a {
          color: inherit;
          text-decoration: none;
        }
        .container {
          width: 80%;
          margin: 0 auto;
        }
        .container:after {
          content: '';
          display: block;
          clear: both;
        }
        header h1 {
          float: left;
          padding: 15px 0;
          color: #000000;
        }
        header ul {
          float: right;
          list-style: none;
        }
        header ul li {
          display: inline-block;
          position: relative;
        }
        header ul li a {
          padding: 25px 20px;
          display: inline-block;
        }
        header ul li a:hover {
          background-color: #000000;
          color: #fff;
        }
        header ul li:hover .dropdown {
          display: block;
        }
        .dropdown {
          display: none;
          position: absolute;
          background-color: #fff;
          box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
          z-index: 1;
        }
        .dropdown a {
          color: black;
          padding: 12px 16px;
          text-decoration: none;
          display: block;
        }
        .dropdown a:hover {
          background-color: #090909;
        }
        .active {
          background-color: #696969;
          color: #fff;
        }
        .form {
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 50px 0;
        }
        .containera {
          width: 100%;
          max-width: 800px;
          padding: 25px;
          background-color: #fff;
          border-radius: 5px;
          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }
        .containera .title {
          font-size: 25px;
          font-weight: 500;
          position: relative;
        }
        .containera .title::before {
          content: "";
          position: absolute;
          left: 0;
          bottom: 0;
          height: 3px;
          width: 300px;
          border-radius: 5px;
          background: linear-gradient(150deg, #7FFFD4, #20B2AA);
        }
        .content form .user-details {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
          margin: 20px 0;
        }
        form .user-details .input-box {
          margin-bottom: 20px;
          width: calc(50% - 20px);
        }
        form .input-box span.details {
          display: block;
          font-weight: 500;
          margin-bottom: 10px;
        }
        .user-details .input-box input,
        select {
          height: 45px;
          width: 100%;
          outline: none;
          font-size: 16px;
          border-radius: 5px;
          padding-left: 15px;
          border: 1px solid #ccc;
          border-bottom-width: 2px;
          transition: all 0.3s ease;
        }
        .user-details .input-box input,
        select:focus,
        .user-details .input-box input,
        select:valid {
          border-color: #20B2AA;
        }
        form .button {
          margin-top: 25px;
          display: flex;
          justify-content: space-between;
        }
        form .button input,
        .button a {
          height: 45px;
          width: 48%;
          border-radius: 5px;
          border: none;
          color: #fff;
          font-size: 18px;
          font-weight: 500;
          letter-spacing: 1px;
          cursor: pointer;
          text-align: center;
          line-height: 45px;
          transition: all 0.3s ease;
          background: linear-gradient(150deg, #7FFFD4, #20B2AA);
        }
        form .button input:hover,
        .button a:hover {
          background: linear-gradient(-150deg, #7FFFD4, #20B2AA);
        }
        @media(max-width: 584px) {
          form .user-details .input-box {
            width: 100%;
          }
        }
        footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px 0;
        position: fixed;
        width: 100%;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        }
        footer small {
        font-size: 12px;
        }
     </style>
   </head>
<body>
  <header>
  <div class="container">
        <h1><a href="index.html">KARYAWAN</a></h1>
        <ul>
          <li><a href="index.html">HALAMAN UTAMA</a></li>
          <li>
            <a href="javascript:void(0)">DATA</a>
            <div class="dropdown">
              <a href="tampil.php">DATA KARYAWAN</a>
              <a href="gaji.php">DATA GAJI</a>
            </div>
          </li>
          <li><a href="departemen.php">DEPARTEMEN</a></li>
          <li><a href="jabatan.php">JABATAN</a></li>
          <li><a href="riwayatPekerjaan.php">KONTRAK KERJA</a></li>
          <li><a href="logout.php">LOGOUT</a></li>
        </ul>
      </div>
  </header>
  <div class="form">
  <div class="containera">
    <div class="title">Update Data Gaji</div>
    <div class="content">
    <form action="gajiUpdateAksi.php" name="Finput" method="POST">
      <div class="user-details">
      <?php
        if (isset($_GET['id_gaji'])) {
          $id_gaji = $_GET['id_gaji'];
            
          $query = "SELECT * FROM gaji WHERE id_gaji = '$id_gaji'";
          $result = mysqli_query($koneksi, $query);
            
        if (mysqli_num_rows($result) > 0) {
          $data = mysqli_fetch_assoc($result);
      ?>
        <div class="input-box">
          <span class="details">Nama Karyawan</span>
          <select name="id_karyawan" required>
              <?php
                while ($row_karyawan = mysqli_fetch_assoc($result_karyawan)) {
                  echo "<option value='" . $row_karyawan['id_karyawan'] . "'";
                if ($row_karyawan['id_karyawan'] == $data['id_karyawan']) {
                  echo " selected";
                }
                  echo ">" . $row_karyawan['nama_lengkap'] . "</option>";
                }
              ?>
          </select>
        </div>
        <div class="input-box">
          <span class="details">Jumlah Gaji</span>
          <input type="text" placeholder="Masukkan Jumlah Gaji" name="jumlah_gaji" value="<?php echo $data['jumlah_gaji']; ?>" required>
        </div>
      <?php
          } else {
            echo "Data tidak ditemukan.";
          }
        } else {
          echo "ID Karyawan tidak ditemukan.";
        }
      ?>
    </div>
    <div class="button">
        <input type="submit" value="Update">
        <input type="reset" value="Batal" onclick="window.location.href='gaji.php'">
    </div>
    </form>
    </div>
    </div>
  </div>
<footer>
      <div class="container">
        <small>Copyright &copy; 2024 - KELOMPOK 13 SMBD.</small>
      </div>
    </footer>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Tampilan Data Jabatan</title>
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
      body{
        background-color: #20B2AA;
        justify-content: center;
        align-items: center;
        font-family: 'Poppins', sans-serif;
        padding-bottom: 70px;
      }
      a {
      color: inherit;
      text-decoration: none;
      }
    .container {
      width:90%;
      margin:0 auto;
    }
    .container:after {
      content:'';
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
    }
    header ul li {
      display: inline-block;
    }
    header ul li a {
      padding: 25px 20px;
      display: inline-block;
    }
    header ul li a:hover {
      background-color: #000000;
      color: #fff;
    }
    .active {
      background-color: #696969;
      color: #fff;
    }
    th{
      background-color: #2ACF69;
    }
    td, tr, th{
      border: 1px solid #CCCCCC;
      padding: 5px 15px;
      height: 35px;
    }
    .dropdown {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
    li:hover .dropdown {
      display: block;
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
      position: fixed;
    }
    footer small {
      font-size: 12px; 
    }
    .table-container {
			width: 23%;
			margin: 20px auto;
			padding: 20px;
			border: 2px solid #000000;
			border-radius: 10px;
			background: #fff;
    }
    .button-container {
			text-align: left; 
			margin-bottom: 20px; 
		}
		.button-container .detail-button {
			font-family: 'Poppins', sans-serif;
			background-color: #2ACF69;
			border: none;
			color: black;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin-right: 20px;
			border-radius: 5px; 
			cursor: pointer; 
		}
		.button-container .detail-button:hover {
			background-color: #45a049;
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
    <center><h1>DATA JABATAN</h1></center>
    <div class="table-container">
    <div class="button-container">
        <a href="jabatanDetail.php" class="detail-button">Detail</a>
				<a href="jabatanInput.php" class="detail-button">Tambah Data</a>
    </div>
    <table style="margin-left: auto;margin-right: auto;" border="1">
      <tr>
          <th>Jabatan</th>
          <th>Jumlah Jabatan</th> 
      </tr>
        <?php
          include "koneksi.php";
          $tampil=mysqli_query($koneksi,"CALL jumlah_karyawan_per_jabatan()");
          while ($data=mysqli_fetch_array($tampil)) {
        ?>
      <tr>
          <td><?php echo $data['nama_jabatan'] ?></td>
          <td><?php echo $data['jumlah_karyawan'] ?></td> 
      </tr>
      <?php
      }
      ?>
  </table>
  </div>
  <footer>
    <div class="container">
      <small>Copyright &copy; 2024 - KELOMPOK 13 SMBD.</small>
    </div>
  </footer>
</body>
</html>

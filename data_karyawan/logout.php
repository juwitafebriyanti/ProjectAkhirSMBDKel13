<?php
  session_start();

  unset($_SESSION["username"]);
  unset($_SESSION["password"]);

  session_destroy();
  echo "<script>alert('Berhasil Logout.'); window.location.href = 'login.php';</script>";
?>

<?php 
	include 'koneksi.php';

	session_start();
	error_reporting(0);

	if (isset($_POST['submit'])) {
		$username = $_POST['username'];
		$password = ($_POST['password']);

		$sql = "SELECT * FROM tb_login WHERE username='$username' AND password='$password'";
		$result = mysqli_query($koneksi, $sql);
		if ($result->num_rows > 0) {
			$row = mysqli_fetch_assoc($result);
			$_SESSION['username'] = $row['username'];
			header("Location: index.html");
		} else {
			echo "<script>alert('Username atau Password salah.')</script>";
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="login.css">

	<title>Login Form  </title>
</head>
<body>
	<div class="container">
		<form action="" method="POST" class="login-email">
			<p class="login-text" style="font-size: 2rem; font-weight: 800;">Login</p>
			<div class="input-group">
				<input type="text" placeholder="username" name="username" value="<?php echo $username; ?>" required>
			</div>
			<div class="input-group">
				<input type="password" placeholder="Password" name="password" value="<?php echo $_POST['password']; ?>" required>
			</div>
			<div class="input-group">
				<button name="submit" class="btn">Login</button>
			</div>
			<center><p class="login-register-text"></p></center>
		</form>
	</div>
</body>
</html>
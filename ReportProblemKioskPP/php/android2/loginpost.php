<?php

try {
   $con= new mysqli("localhost","root","","my_db");

   if ($con->connect_error) {
		die("Connection failed: " . $con->connect_error);
	}
	
	/*
	foreach ($_REQUEST as $key => $value){
		if ($key == "username") {
			$username = $value;
		}

		if ($key == "password") {
			$password = $value;
		}
	}*/
	
   $username = $_POST['username'];
   $password = $_POST['password'];
   
   $sql1 = "SELECT Role FROM table1 WHERE Username='$username' AND Password='$password'";
   
   $result = $con->query($sql1);
	
	if ($result->num_rows > 0) {
		
		while($row = $result->fetch_assoc()) {
			//echo "works";
			echo $row["Role"];
		}
	}
}	
	catch(PDOException $e) {
		echo "Error: " . $e->getMessage();
	}
	
$conn = null;
?>
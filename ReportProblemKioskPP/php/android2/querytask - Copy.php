<?php

try {
   $con= new mysqli("localhost","root","","kpi_mech");

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
	
   $var1 = $_POST['NotifNo'];
    
   $sql1 = "SELECT ID, location, EmpNo, Status FROM kpi_mech.task_db WHERE NotifNo = $var1 AND (Status = 2 OR Status = 1) ORDER BY Severity ASC limit 1";
   
   $result = $con->query($sql1);
	
	if ($result->num_rows > 0) {
		
		while($row = $result->fetch_assoc()) {
			//echo "works";
			echo $row["ID"];
			//echo $row["location"];
			//echo $row["EmpNo"];
			//echo $row["Status"];
		}
	}
}	
	catch(PDOException $e) {
		echo "Error: " . $e->getMessage();
	}
	
$conn = null;
?>
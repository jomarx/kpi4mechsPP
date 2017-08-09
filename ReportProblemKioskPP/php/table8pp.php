<!DOCTYPE html>

<?php
$page = $_SERVER['PHP_SELF'];
$sec = "10";
?>
<html>
    <head>
    <meta http-equiv="refresh" content="<?php echo $sec?>;URL='<?php echo $page?>'">
    </head>
	<style>
	td {
		
		border:1px solid black;
		font-size: 15px	;
	}
		th {
		font-size: 15px	;
		border:1px solid black;
	}

	</style>
<body>

<?php
echo "<center>";
echo "<span style='font-size: 25pt'>";
//echo date("m/d/Y H:i:s");
//echo "<BR><b>Mechanic Status</b><BR><BR>";
echo "</span>";


$servername = "192.168.143.220";
$username = "jomar";
$password = "magic44ever";
$dbname = "kpi_mech";

try {
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	//Start connection
	
//	$sql = "SELECT * from mbreak_db";
		$sql = "SELECT empID, ShortName, NotifNo, dayOrNight, status FROM `mech_db` WHERE att_stat = '1' AND mechanicID = '1'";

	$result = $conn->query($sql);
    		
	
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>empID</th><th>ShortName</th><th>NotifNo</th><th>dayOrNight</th><th>status</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc()) {
			
			//$to_time = $row["status"];
			if ($row["status"] == "2") {
				$empStatus = "On Break";
			} else if ($row["status"] == "1") {
				$empStatus = "Busy";
			} else if ($row["status"] == "0") {
				$empStatus = "Available";
			} else {
				$empStatus = "Unknown";
			}
						
			echo "<tr>";
			echo "<td>".$row["empID"]."</td>";
			echo "<td>".$row["ShortName"]."</td>";
			echo "<td>".$row["NotifNo"]."</td>";
			echo "<td>".$row["dayOrNight"]."</td>";
			echo "<td>".$empStatus."</td>";
	
			echo "</tr>";
    		
	}
	
		echo "</table>";
		echo "</center>";
		echo "<BR><b>Mechanic Status</b><BR><BR>";
} else {
    		echo "No results";
}
	
	
}

catch(PDOException $e) {
     echo "Error: " . $e->getMessage();
}
$conn = null;
?>

</body>
</html>

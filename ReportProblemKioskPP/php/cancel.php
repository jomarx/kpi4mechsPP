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
echo date("m/d/Y H:i:s");
echo "</span>";


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kpi_mech";

try {
	// Create connection
	$conn = new mysqli($servername, $username, "", $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	//Start connection
	
//	$sql = "SELECT * from mbreak_db";
		$sql = "SELECT mech_db.FirstName,mech_db.LastName,mech_db.ShortName,cancel_db.recorded,cancel_db.taskID,task_db.ID,task_db.details,mbcode_db.details as det from cancel_db INNER JOIN mech_db ON mech_db.empID=cancel_db.mech INNER JOIN task_db ON task_db.ID=cancel_db.taskID INNER JOIN mbcode_db ON task_db.details=mbcode_db.id";

	$result = $conn->query($sql);
    		
	
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>FirstName</th><th>LastName</th><th>ShortName</th><th>Task Details</th><th>Recorded</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc())
		{
			
			
			echo "<tr>";
			echo "<td>".$row["FirstName"]."</td>";
			echo "<td>".$row["LastName"]."</td>";

			echo "<td>".$row["ShortName"]."</td>";
			echo "<td>".$row["det"]."</td>";
			echo "<td>".$row["recorded"]."</td>";

}
echo "</tr>";
	
		echo "</table>";
		echo "</center>";
	
	}
	
	
	
}
catch(PDOException $e) {
     echo "Error: " . $e->getMessage();
}
$conn = null;
?>

</body>
</html>

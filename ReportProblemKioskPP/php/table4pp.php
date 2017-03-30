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


$servername = "192.168.143.200";
$username = "nodemcu1";
$password = "secret";
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
		$sql = "SELECT sm_db.AssetName, sm_db.SerialNo,sm_db.Make,sm_db.Model,sm_db.Supplier,sm_db.Category,sm_db.Location,sm_db.AssetStatus,sm_db.AssetCondition,mbreak_db.StartDate,mbreak_db.EndDate,mbcode_db.details as det from sm_db INNER JOIN mbreak_db ON sm_db.RFID=mbreak_db.SpecialSerial INNER JOIN task_db ON task_db.ID=mbreak_db.TaskID INNER JOIN mbcode_db ON task_db.details=mbcode_db.id";

	$result = $conn->query($sql);
    		
	
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>AssetName</th><th>SerialNo</th><th>Make</th><th>Model</th><th>Supplier</th><th>Category</th><th>Location</th><th>AssetStatus</th><th>AssetCondition</th><th>StartDate</th><th>EndDate</th><th>DownTime</th><th>Details</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc())
		{
			
			$to_time = strtotime($row["EndDate"]);
			$from_time = strtotime($row["StartDate"]);
			$duration = round(abs($to_time - $from_time) / 60,2);

			
			echo "<tr>";
	echo "<td>".$row["AssetName"]."</td>";
			echo "<td>".$row["SerialNo"]."</td>";
			echo "<td>".$row["Make"]."</td>";
			echo "<td>".$row["Model"]."</td>";
			echo "<td>".$row["Supplier"]."</td>";
			echo "<td>".$row["Category"]."</td>";
			
			echo "<td>".$row["Location"]."</td>";
			echo "<td>".$row["AssetStatus"]."</td>";
			echo "<td>".$row["AssetCondition"]."</td>";
			echo "<td>".$row["StartDate"]."</td>";
			
			echo "<td>".$row["EndDate"]."</td>";
		if (($duration >=60)&&($duration <1440)){
			$duration=$duration/60;
		
		if ($duration >1){
		echo "<td>".$duration."Hours</td>";
		}
		else{
		echo "<td>".$duration."Hour</td>";
			
		}
		}
		else if ($duration >= 1440) {
			$duration=$duration/1440;
			$dur =floor($duration);
		if ($dur<1){
		echo "<td>".$dur." Days</td>";
		}
		else{
		echo "<td>".$dur." Day</td>";
			
		}
			
		}
		else{
		if ($duration >1){
		echo "<td>".floor($duration)." Minutes</td>";
		
		}
		else{
		echo "<td>".floor($duration)." Minute</td>";
			
		}
		}
			
		echo "<td>".$row["det"]."</td>";
			
		
			echo "</tr>";
    		
			}
	
		echo "</table>";
		echo "</center>";
	}
	else {
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

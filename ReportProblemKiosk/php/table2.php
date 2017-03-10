<!DOCTYPE html>
<?php
$page = $_SERVER['PHP_SELF'];
$sec = "10";
?>
<html>
    <head>
    <meta http-equiv="refresh" content="<?php echo $sec?>;URL='<?php echo $page?>'">
    </head>
<body>

<?php
echo "<center>";
echo "<span style='font-size: 25pt'>";
echo date("m/d/Y H:i:s");
echo "</span>";


$servername = "192.168.42.85";
$username = "nodemcu1";
$password = "secret";
$dbname = "kpi_mech";
$style3 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ffff00; font-size: 40px; ' align='center'>";//format if StartTime exceed $limit in minutes
$style1 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ff6666; font-size: 40px; ' align='center'>";//format if StartTime exceed $limit in minutes

$style2 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ffffff; font-size: 40px; ' align='center'>";//format otherwise
$limit = 15;
$limit2 = 30;

try {
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	//Start connection
	$sql = "SELECT location, kp.ShortName,BreakStartTime, StartTime, EndTime, kpi.details FROM task_db t JOIN kpi_mech.mbcode_db kpi on t.details=kpi.id JOIN kpi_mech.mech_db kp on t.Assignee=kp.empID WHERE t.status < 3";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 25pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>Location</th><th>Assignee</th><th>BreakStartTime</th><th>StartTime</th><th>EndTime</th><th>Breakdown Type</th></tr>";
		echo "</span>";
		// output data of each row
		while($row = $result->fetch_assoc())
		{
			$to_time = strtotime(date("H:i:s"));
			$from_time = strtotime($row["StartTime"]);
			$duration = round(abs($to_time - $from_time) / 60,2);
			
			if (($duration > $limit) && ($duration > $limit2)){$style=$style1;}
			
			else if (($duration > $limit) && ($duration < $limit2)) {$style=$style3;}
			else{$style=$style2;}
			echo "<tr>";
			echo $style.$row["location"]."</td>";
			echo $style.$row["ShortName"]."</td>";
			echo $style.$row["BreakStartTime"]."</td>";
			echo $style.$row["StartTime"]."</td>";
			echo $style.$row["EndTime"]."</td>";
			echo $style.$row["details"]."</td>";
			echo "</tr>";
    		}
		
		echo "</table>";
		echo "</center>";
	} else {
    		echo "No results";
	}
	
	
	
	
$sql2 = "SELECT ID FROM kpi_mech.task_db WHERE Status = '0' limit 1 ";
$result2 = $conn->query($sql2);
	 if ($result2->num_rows > 0) {
	$row2 = $result2->fetch_assoc();

		$id = $row2["ID"];
		echo $id;
		
			$sql3 = "SELECT empID FROM kpi_mech.mech_db WHERE status = '0' limit 1";
			$result3 = $conn->query($sql3);
			if ($result3->num_rows > 0) {
$row3 = $result3->fetch_assoc();
	
	echo $row3["empID"];
	
	$empid = $row3["empID"];
				$sql4 = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = $empid" ;
				$conn->query($sql4);
				

				$sql5 = "UPDATE kpi_mech.task_db SET Status = 1, Assignee = $empid WHERE ID = $id" ;
				if ($conn->query($sql5)){
					
					echo "updated";
				}
				else{
					echo "Not";
					
				}
				

			}
			else {
				echo "No results";
			}
		

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

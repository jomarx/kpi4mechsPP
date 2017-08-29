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


$servername = "192.168.143.220";
$username = "jomar";
$password = "magic44ever";
$dbname = "kpi_mech";
$style3 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ffff00; font-size: 30px; ' align='center'>";//format if StartTime exceed $limit in minutes (yellow)
$style1 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ff6666; font-size: 30px; ' align='center'>";//format if StartTime exceed $limit in minutes (red)

$style2 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #ffffff; font-size: 30px; ' align='center'>";//format otherwise (white)
$style4 = "<td style = 'wlocationth: 150px; border: 4px solid black; background-color: #22CA2F; font-size: 30px; ' align='center'>";//format if StartTime = 0 (green)
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
	$sql = "SELECT t.ID, location, kp.ShortName,BreakStartTime, StartTime, EndTime, kpi.details, t.machineType FROM task_db t JOIN kpi_mech.mbcode_db kpi on t.details=kpi.id JOIN kpi_mech.mech_db kp on t.Assignee=kp.empID WHERE (t.status != 3 and t.status != 7)";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 20pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>Task ID</th><th>Location</th><th>Assignee</th><th>ReportedTime</th><th>StartTime</th><th>EndTime</th><th>BreakdownType</th><th>MachineType</th></tr>";
		echo "</span>";
		// output data of each row
		while($row = $result->fetch_assoc()) {
			$to_time = strtotime(date("H:i:s"));
			$from_time = strtotime($row["StartTime"]);
			$duration = round(abs($to_time - $from_time) / 60,2);
				
			if (($duration > $limit) && ($duration > $limit2)){
				$style=$style1;
			}
			
			else if (($duration > $limit) && ($duration < $limit2)) {
				$style=$style3;
			}

			else if (($duration = $to_time ) && ($to_time < $from_time )){
				$style=$style4;
			}
			else {
				$style=$style2;
			}
			echo "<tr>";
			echo $style.$row["ID"]."</td>";
			echo $style.$row["location"]."</td>";
			echo $style.$row["ShortName"]."</td>";
			echo $style.$row["BreakStartTime"]."</td>";
			echo $style.$row["StartTime"]."</td>";
			echo $style.$row["EndTime"]."</td>";
			echo $style.$row["details"]."</td>";
			echo $style.$row["machineType"]."</td>";
			echo "</tr>";
    		}
		
		echo "</table>";
		echo "</center>";
	} else {
  //  		echo "No results";
	}
	
	
/*	removed auto assign, change to view only	
//task auto assign (status 0)	
$sql2 = "SELECT ID FROM kpi_mech.task_db WHERE Status = '0' limit 1 ";
$result2 = $conn->query($sql2);
	 if ($result2->num_rows > 0) {
	$row2 = $result2->fetch_assoc();

		$id = $row2["ID"];
//		echo $id;
		
			$sql3 = "SELECT empID, NotifNo FROM kpi_mech.mech_db WHERE status = '0' AND mechanicID = 1 AND att_stat = 1 AND NotifNo >= 1 limit 1";
			$result3 = $conn->query($sql3);
			if ($result3->num_rows > 0) {
			$row3 = $result3->fetch_assoc();
	
				echo $row3["empID"];
	
				$empid = $row3["empID"];
				$NotifNo3 = $row3["NotifNo"];
				$sql4 = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = $empid" ;
				if($conn->query($sql4)){
					
									$sql5 = "UPDATE kpi_mech.task_db SET Status = 1, Assignee = $empid, NotifNo = $NotifNo3 WHERE ID = $id" ;
								if ($conn->query($sql5)){
						
		//					echo "updated";
							}
						else{
	//						echo	 "Not";
					
							}
		
				}
				
					
				

			}
			else {
			//	echo "No results";
			}

	} 
	else {
    //		echo "1No results";
	}

//auto assign = cancelled task	
$sqlstatus5 = "SELECT ID, NotifNo FROM kpi_mech.task_db WHERE Status = '5' limit 1 ";
$resultstatus5 = $conn->query($sqlstatus5);
	 if ($resultstatus5->num_rows > 0) {
		$rowstatus5 = $resultstatus5->fetch_assoc();
		
		$idstatus5 = $rowstatus5["ID"];
		
		
					$sqlmechcanceled = "SELECT mech FROM kpi_mech.cancel_db WHERE taskID = $idstatus5 limit 1";
					$resultmechcanceled = $conn->query($sqlmechcanceled);

					if ($resultmechcanceled->num_rows > 0) {
					$rowmechcanceled = $resultmechcanceled->fetch_assoc();
						$mechcanceled=$rowmechcanceled["mech"];
									$sqlselectnot = "SELECT empID,NotifNo FROM kpi_mech.mech_db WHERE status='0' and empID!=$mechcanceled AND mechanicID = 1 AND att_stat = 1 AND NotifNo >= 1 limit 1";
									$resultselectnot = $conn->query($sqlselectnot);

										if ($resultselectnot->num_rows > 0) {
											$rowselectnot = $resultselectnot->fetch_assoc();
											$selectnot=$rowselectnot["NotifNo"];
											$mechcanceled=$rowselectnot["empID"];
											echo $selectnot;
														$sqlupdatecancelled = "UPDATE kpi_mech.task_db SET Location ='1',Status='1',NotifNo=$selectnot,Assignee=$mechcanceled WHERE ID = $idstatus5" ;
														$sqlupdatecancelledMech = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = $mechcanceled" ;
														$conn->query($sqlupdatecancelledMech);


															if ($conn->query($sqlupdatecancelled)){
						
												//					echo "updated";
															}
						
					
										}			

					
					}			
	 }	


//auto assign = timeout task
$sqlstatus6 = "SELECT ID, NotifNo FROM kpi_mech.task_db WHERE Status = '6' limit 1 ";
$resultstatus6 = $conn->query($sqlstatus6);
	 if ($resultstatus6->num_rows > 0) {
		$rowstatus6 = $resultstatus6->fetch_assoc();
		
		$idstatus6 = $rowstatus6["ID"];
		
		
					$sqlmechtimeout = "SELECT mech FROM kpi_mech.timeout_db WHERE taskID = $idstatus6 limit 1";
					$resultmechtimeout = $conn->query($sqlmechtimeout);

					if ($resultmechtimeout->num_rows > 0) {
					$rowmechtimeout = $resultmechtimeout->fetch_assoc();
						$mechtimeout=$rowmechtimeout["mech"];
									$sqlselectnot2 = "SELECT empID,NotifNo FROM kpi_mech.mech_db WHERE status='0' and empID!=$mechtimeout AND mechanicID = 1 AND att_stat = 1 AND NotifNo >= 1 limit 1";
									$resultselectnot2 = $conn->query($sqlselectnot2);

										if ($resultselectnot2->num_rows > 0) {
											$rowselectnot2 = $resultselectnot2->fetch_assoc();
											$selectnot2=$rowselectnot2["NotifNo"];
											$mechtimeout=$rowselectnot2["empID"];
											
														$sqlupdatetimeout = "UPDATE kpi_mech.task_db SET Status='1',NotifNo=$selectnot2,Assignee=$mechtimeout WHERE ID = $idstatus6" ;
														$sqlupdatetimeoutMech = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = $mechtimeout" ;
														$conn->query($sqlupdatetimeoutMech);
															if ($conn->query($sqlupdatetimeout)){
						
												//					echo "updated";
															}
						
					
										}			

					
					}			
	 }	

*/

	 
}
catch(PDOException $e) {
     echo "Error: " . $e->getMessage();
}
$conn = null;
?>

</body>
</html>

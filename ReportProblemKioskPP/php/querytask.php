<?php

try {
	//$con= new mysqli("localhost","root","","kpi_mech");
	$con= new mysqli("localhost","jomar","magic44ever","kpi_mech");

   if ($con->connect_error) {
		die("Connection failed: " . $con->connect_error);
	}
	
	
	foreach ($_REQUEST as $key => $value){
		if ($key == "NotifNo") {
			$var1 = $value;
		}
		if ($key == "taskID") {
			$var2 = $value;
		}
		if ($key == "typer") {
			$typer = $value;
		}
		if ($key == "EmpNo") {
			$EmpNo = $value;
		}
	}
	
   //$var1 = $_POST['NotifNo'];
    
   //$sql1 = "SELECT ID, location, Status FROM kpi_mech.task_db WHERE NotifNo = $var1 AND (Status = 2 OR Status = 1) ORDER BY Severity ASC limit 1";

	//query for available tasks
	//needs var1(NotifNo)
	if ($typer == 1) {
		$sql1 = "SELECT ID, location, Status, Assignee FROM kpi_mech.task_db WHERE NotifNo = $var1 AND (Status = 2 OR Status = 1) ORDER BY Severity ASC limit 1";
	}
	//start tasks
	//needs (taskID)var2
	if ($typer == 2) {
		$sql1 = "UPDATE kpi_mech.task_db SET StartTime = (Curtime()), Status = 2 WHERE ID = $var2;";
	}
	//task done
	//needs (taskID)var2
	if ($typer == 3) {
		$sql1 = "UPDATE kpi_mech.task_db SET EndTime = (Curtime()), EndDate = (now()), Status = 3 WHERE ID = $var2;";
	}
	//task TIMEOUT
	//needs (taskID)var2
	if ($typer == 4) {
		$sql1 = "UPDATE kpi_mech.task_db SET Status = 6 WHERE ID = $var2;";
	}
	//task Cancel
	//needs (taskID)var2 and var1(NotifNo)
	if ($typer == 5) {
		$sql1 = "UPDATE kpi_mech.task_db SET Status = 5 WHERE ID = $var2;";
	}
	//Set Status to started (no update on start time)
	if ($typer == 6) {
		$sql1 = "UPDATE kpi_mech.task_db SET Status = 2 WHERE ID = $var2;";
	}
   
   $result = $con->query($sql1);
   
   if ($typer == 1) {
	   if ($result->num_rows > 0) {
		
			while($row = $result->fetch_assoc()) {
				//echo "works";
				if ($typer == 1) {
					echo $row["ID"].",".$row["location"].",".$row["Status"].",".$row["Assignee"];
				}
				
			}
		}
	}
	if ($typer == 2) {
		echo "StartTime and Status updated, ";
	}
	
	if ($typer == 3) {
		echo "EndTime and Status updated, ";
		
		$sql2 = "UPDATE kpi_mech.mech_db SET status = 0 WHERE NotifNo = $var1;";
		$result = $con->query($sql2);
		echo "Mech_db status updated, ";
		
		$sql3 = "UPDATE kpi_mech.mbreak_db SET EndDate = (now()) WHERE TaskID = $var2";
		$result = $con->query($sql3);
		echo "mbreak_db status updated, ";
		
	}
	if ($typer == 4) {
		//querytask.php?typer=4&taskID=570&NotifNo=1&EmpNo=49
		echo "TIMEOUT updated, ";
		
		$sql2 = "INSERT INTO kpi_mech.timeout_db (taskID, mech, date, time) values ($var2, $EmpNo, CURDATE(), Curtime());";
		$result = $con->query($sql2);
		echo "timeout_db entry inserted, ";
		
		$sql3 = "UPDATE kpi_mech.mech_db SET status = 0 WHERE NotifNo = $var1;";
		$result = $con->query($sql3);
		echo "mech_db status updated, ";
	}
	
	if ($typer == 5) {
		//querytask.php?typer=5&taskID=570&NotifNo=1&EmpNo=49
		echo "Cancel updated, ";
		
		$sql2 = "INSERT INTO kpi_mech.cancel_db (taskID, mech, date, time) values ($var2, $EmpNo, CURDATE(), Curtime());";
		$result = $con->query($sql2);
		echo "Cancel_db entry inserted, ";
		
		$sql3 = "UPDATE kpi_mech.mech_db SET status = 0 WHERE NotifNo = $var1;";
		$result = $con->query($sql3);
		echo "mech_db status updated, ";
	}
	if ($typer == 6) {
		echo "Status updated";
	}
}	
	catch(PDOException $e) {
		echo "Error: " . $e->getMessage();
	}
	
$conn = null;
?>
<?php


error_reporting(1);
include("config.php");
$userid=$_POST["userid"];
session_start();


$sql = "SELECT * FROM mech_db where empID='$userid' AND disabled='0'";

$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {
	//set attendance in = 0, status = available
	$sql1 = "UPDATE mech_db set att_stat='1', status='0' where empID='$userid'";

	if ($row["status"]=='2') {
		
		$sql2 = "UPDATE mstat_db SET EndDate = (now()), status = '2' WHERE empID='$userid' AND status = '3'";

		$sql3 = "UPDATE mech_db set status='0', att_stat = 1 where empID='$userid'";
		
		$conn->query($sql2);
		$conn->query($sql3);
	}
	
	if ($conn->query($sql1) === TRUE) {


			$_SESSION["id"]=$userid;
		?>
		<script>

			window.location.replace("home.php");

		</script>
	<?php
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
			}

			echo "here";
	//only put attendance for mechanics
	if ($row["mechanicID"]=='1') {
		//check if attandance record is available
		$sql12 = "SELECT empID, counter FROM mstat_db WHERE DataType = '0' and empID = '$userid' AND status = '0'";

		$resulter1 = $conn->query($sql12);
		
		if ($resulter1->num_rows > 0) {
			//wala lang
		} else {
			$sql13 = "insert into mstat_db (empID, StartDate, status, DataType) values ('$userid', (now()), 0, 0)";
			$conn->query($sql13);
		}
	}
	

		$conn->close();

	}
	
 else {
	echo "User not found";
	}


?>
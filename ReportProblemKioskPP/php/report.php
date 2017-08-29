<?php


error_reporting(0);
include("config.php");

$mbcode=$_POST["mbcode"];
$location=$_POST["location"];
$machineType=$_POST["machineType"];

$date=date("Y-m-d H:i:s");
session_start();
$id=$_SESSION["id"];

if (($mbcode=='0')||($location=='999')||($machineType=='Type')){
	$_SESSION["submiterror"]='1';
	?>
	<script>

	window.location.replace("reportproblem.php");

	</script>
	<?php
} else {
	$sql1 = "INSERT INTO task_db (EmpNo,BreakStartTime,location,recorded,details,Status,StartDate,machineType)
VALUES ('$id','$date','$location','$date','$mbcode','0',(now()),'$machineType')";

	if ($conn->query($sql1) === TRUE) {
	//header("location:home.php");
	echo "Report Successfully submitted! ";
	sleep(1);
	session_destroy();
	

?>
<script>

window.location.replace("index.php");

</script>
<?php

	} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
	}
}
$conn->close();




?>

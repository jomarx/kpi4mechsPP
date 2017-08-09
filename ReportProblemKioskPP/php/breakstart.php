<?php


error_reporting(0);
include("config.php");
session_start();
$userid=$_SESSION["id"];
//$userid1=$_SESSION["id"];

$sql1 = "insert into mstat_db (empID, StartDate, Status) values ('$userid', (now()), 3)";


$sql2 = "UPDATE mech_db SET status='2' WHERE empID='$userid';";


if ($conn->query($sql1) === TRUE) {

	$conn->query($sql2);
	
	?>
<script>

window.location.replace("home.php");

</script>
<?php
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();




?>
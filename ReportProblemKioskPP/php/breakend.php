<?php


error_reporting(0);
include("config.php");
session_start();
$userid=$_SESSION["id"];

$sql1 = "UPDATE mstat_db SET EndDate = (now()), status = '2' WHERE empID='$userid' AND status = '3'";

$sql2 = "UPDATE mech_db set status='0', att_stat = 1 where empID='$userid'";


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
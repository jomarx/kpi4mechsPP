<?php

//mechanic logout
error_reporting(0);
include("config.php");
session_start();
$userid=$_SESSION["id"];

$sql1 = "UPDATE mech_db set status='1', att_stat='0' where empID='$userid'";
//set mechanic log out time, status = 1 (end of shift)
$sql2 = "UPDATE mstat_db SET EndDate = (now()), status = '1' WHERE empID='$userid' AND status = '0' AND DataType = '0'";

if ($conn->query($sql1) === TRUE) {
	//run query for update attendance
	$conn->query($sql2);

session_destroy();
	?>
<script>

window.location.replace("index.php");

</script>
<?php
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();




?>
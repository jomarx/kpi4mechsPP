<?php


error_reporting(0);
include("config.php");

$destLoc=$_POST["location"];
$assetNumber=$_POST["AssetNumber"];
$date=date("Y-m-d H:i:s");

session_start();

$userid=$_SESSION["id"];

$sql1 = "SELECT * FROM sm_db where AssetNo='$assetNumber'";
$result = $conn->query($sql1);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {
	//header("location:home.php");
	echo "Machine successfully moved! <br>";
	echo "Old Location : ".$row["Location"];
	$sourceLoc = $row["Location"];
	
	//record movement to mechbreak_db
 	$sql2 = "INSERT INTO kpi_mech.mechbreak_db(AssetNo, StartDate, status, sourceLoc, destLoc, userID) values ('$assetNumber', Curtime(), 3, '$sourceLoc', '$destLoc', '$userid')";
	$result2 = $conn->query($sql2);
	
	//update location on sm_db
	$sql3 = "UPDATE kpi_mech.sm_db SET Location = '$destLoc' WHERE AssetNo = '$assetNumber'";
	$result3 = $conn->query($sql3);
	

} else {
	echo "Machine doesn't exist! ";
	echo "Error: " . $sql1 . "<br>" . $conn->error;
}

$conn->close();

?>

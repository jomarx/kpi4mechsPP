<?php
//sm move report

error_reporting(0);
include("config.php");

$assetNumber=$_POST["AssetNumber"];
$date=date("Y-m-d H:i:s");

$assetStatus=$_POST["AssetStatus"];
$assetCondition=$_POST["AssetCondition"];

session_start();

$userid=$_SESSION["id"];

$sql1 = "SELECT * FROM sm_db where AssetNo='$assetNumber'";
$result = $conn->query($sql1);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {
	//header("location:home.php");
	echo "Machine successfully updated! <br>";
	echo "Old AssetStatus : ".$row["AssetStatus"]."<BR>";
	echo "Old AssetCondition : ".$row["AssetCondition"]."<BR>";
	
	//record update status to mechbreak_db
 	$sql2 = "INSERT INTO kpi_mech.mechbreak_db(AssetNo, StartDate, status, userID) values ('$assetNumber', Curtime(), 4, '$userid')";
	$result2 = $conn->query($sql2);
	
	//update location on sm_db
	$sql3 = "UPDATE kpi_mech.sm_db SET AssetStatus = '$assetStatus', AssetCondition = '$assetCondition' WHERE AssetNo = '$assetNumber'";
	$result3 = $conn->query($sql3);
	

} else {
	echo "Machine doesn't exist! ";
	echo "Error: " . $sql1 . "<br>" . $conn->error;
}

$conn->close();

?>

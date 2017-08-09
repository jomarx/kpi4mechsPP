<?php


error_reporting(0);
include("config.php");

$name=$_POST["name"];
$score=$_POST["score"];

session_start();
$uname=$_SESSION["id"];
$time=date("H:i:s");
$id1=$_SESSION["meetingID"];

/*
$sql = "SELECT * FROM meetingatt_db where empID='$name'";
$result = $conn->query($sql);
$row = $result->fetch_assoc(); 
*/

$sql3 = "SELECT * FROM meetingatt_db where empID='$name' and meetingID='$id1' and updated='0'";


$result3 = $conn->query($sql3);
$row3 = $result3->fetch_assoc(); 
$id_to_update=$row3["id"];

/*
$sql2 = "SELECT * FROM meeting_db where meetingid='$id'";
$result2 = $conn->query($sql2);
$row2 = $result2->fetch_assoc(); 

if (($result->num_rows > 0)&&($result2->num_rows > 0)&&($result3->num_rows < 1)) {
*/

if ($result3->num_rows > 0) {
	//$sql1 = "INSERT into meetingatt_db(id,empID,curtime,meetingID,username) VALUES ('','$name','$time','$id1','$uname')";

	$sql1 = "UPDATE kpi_mech.meetingatt_db SET curtimeOut = (curtime()), testScore = '$score',updated = 1 WHERE id = '$id_to_update'";

	$result = $conn->query($sql1);
	
	$_SESSION["success2"]='1';
	header("location:meetingOutScore.php");
	
	$conn->close();

} else {
	$_SESSION["not2"]='1';
	header("location:meetingOutScore.php");
}


?>
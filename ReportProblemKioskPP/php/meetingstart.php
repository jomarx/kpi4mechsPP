<?php


error_reporting(0);
include("config.php");

$name=$_POST["name"];
$id=$_POST["id"];
session_start();
$uname=$_SESSION["id"];
$time=date("H:i:s");

/*
$sql = "SELECT * FROM mech_db where empID='$name'";


$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

$sql3 = "SELECT * FROM meetingatt_db where empID='$name' and meetingID='$id'";

$result3 = $conn->query($sql3);
$row3 = $result3->fetch_assoc(); 
*/

$sql2 = "SELECT * FROM meeting_db where meetingid='$id'";
$result2 = $conn->query($sql2);
$row2 = $result2->fetch_assoc(); 

//if (($result->num_rows > 0)&&($result2->num_rows > 0)&&($result3->num_rows < 1)) {

if ($result2->num_rows > 0) {
	$_SESSION["success"]='1';
	$_SESSION["meetingID"]=$id;
	header("location:startmeeting1.php");
	
	$conn->close();

} else {
	$_SESSION["not"]='1';
	header("location:startmeeting.php");
}


?>
<?php


error_reporting(0);
include("config.php");

$id=$_POST["id"];
session_start();

$sql = "SELECT * FROM meeting_db where meetingid='$id'";


$result = $conn->query($sql);
$row = $result->fetch_assoc(); 




if ($result->num_rows > 0) {
$_SESSION["success"]=$id;
header("location:viewmeeting.php");

}else{
header("location:viewmeeting.php");

	
}


?>
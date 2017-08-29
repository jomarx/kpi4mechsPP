<?php


error_reporting(0);
include("config.php");

$name=$_POST["name"];

session_start();
$sql1 = "INSERT into meeting_db(meetingname) VALUES ('$name')";

if ($conn->query($sql1) === TRUE) {

$_SESSION["success"]='1';
header("location:addmeeting.php");
} else {

header("location:addmeeting.php");
}

$conn->close();




?>
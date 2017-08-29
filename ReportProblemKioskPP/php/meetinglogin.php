<?php

include("config.php");
$userid=$_POST["userid"];
$password=$_POST["password"];
session_start();


$sql = "SELECT * FROM account_db where username='$userid' and password='$password'";
$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {
	$_SESSION["id"]=$row["empNo"];
	header("location:meetinghome.php");
} else {
	$_SESSION["error1"]=1;
	header("location:meeting.php");
}
$conn->close();


?>
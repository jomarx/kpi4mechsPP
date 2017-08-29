<?php 
date_default_timezone_set("Asia/Manila");

$servername = "192.168.143.220";
$username = "jomar";
$password = "magic44ever";
$dbname = "kpi_mech";
// Create connection



$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>
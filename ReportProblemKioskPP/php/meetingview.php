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

<?php
//logout auto menu
if ($_SESSION["sourceLoc"]=='2') {
	//from meetinghome
	?>
	<a href="meetinghome.php">Back to Main Menu</a><BR>
	<a href="meetinglogout.php">Exit Session</a>
	<?php
} else if ($_SESSION["sourceLoc"]=='1') {
	//from home
	?>
	<a href="home.php">Back to Main Menu</a><BR>
	<a href="signout.php">Exit Session</a>
	<?php
} else {
	//javascript back
	echo "<a href='javascript:history.back(1);'>Back to main menu</a>";
}
?>
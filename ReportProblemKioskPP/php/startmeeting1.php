<html>
<?php
error_reporting(0);
session_start();

if ($_SESSION["id"]==""){
	header('location:meeting.php');
}

echo "<b>Encoder Employee ID : </b>".$_SESSION["id"]."<br>";
echo "<b>Meeting ID : </b>".$_SESSION["meetingID"]."<br>";
echo "<b>Please scan participant's ID : </b><br><br>"
?>
<body>

<form action="meetingstart1.php" method="POST" id="myform">

<input type="text" name="name" id="name" placeholder="User ID" autofocus>

<input type="submit" value="submit" name="submit" id="submit" >



</form>

<?php
if (isset($_SESSION["success1"])){
echo "Success";
unset($_SESSION["success1"]);

}

if (isset($_SESSION["not1"])){
echo "Meeting ID or Employer ID does not match any record or already inside meeting";
unset($_SESSION["not1"]);

}

?>
<br><br>
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
</body>
</html>
<html>
<?php
error_reporting(0);
session_start();

if ($_SESSION["id"]==""){

	header('location:meeting.php');

}

?>
<body>

<form action="meetingadd.php" method="POST" id="myform">
<input type="text" name="name" id="name" placeholder="Meeting Name">

<input type="submit" value="submit" name="submit" id="submit" >



</form>

<?php
if (isset($_SESSION["success"])){
echo "Success";
unset($_SESSION["success"]);

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
</body>
</html>
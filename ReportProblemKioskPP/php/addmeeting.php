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

<a href="meetinghome.php">BACK</a>
</body>
</html>
<html>
<?php
error_reporting(0);
session_start();

if ($_SESSION["id"]!=""){

	header('location:meetinghome.php');

}

?>
<body>

<form action="meetinglogin.php" method="POST" id="myform">
<input type="text" name="userid" id="userid" placeholder="userid">
<input type="password" name="password" id="password" placeholder="password">

<input type="submit" value="submit" name="submit" id="submit" >



</form>
</body>
</html>
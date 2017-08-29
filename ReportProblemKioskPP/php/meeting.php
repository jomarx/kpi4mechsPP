<html>
<?php
error_reporting(0);
session_start();

if ($_SESSION["id"]!=""){

	header('location:meetinghome.php');
}
?>
<body>
<center><b>
<img src="hb.jpg">
<BR><p>Hanes Global Supply Chain Philippines Inc<BR><BR>Multi Kiosk Login</p>
</b>
<form action="meetinglogin.php" method="POST" id="myform">
<input type="text" name="userid" id="userid" placeholder="User ID"><BR><BR>
<input type="password" name="password" id="password" placeholder="Password"><BR><BR>
<font color="red">
<?php
if (isset($_SESSION["error1"])){
	echo "Wrong username and/or password!<br><br>";
	unset($_SESSION["error1"]);
}
?>
</font>
<input type="submit" value="submit" name="submit" id="submit" >

</center>


</form>
</body>
</html>
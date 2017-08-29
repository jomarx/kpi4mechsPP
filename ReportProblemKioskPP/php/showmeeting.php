<html>
<style>
body{

font-size: 15pt;	
}
tr {
font-size: 15pt;	
padding:10px;
	border-style: solid;
}
th {
font-size: 15pt;	
padding:10px;

	border-style: solid;
}
td {
padding:10px;

	border-style: solid;
}



</style>
<?php

error_reporting(0);
session_start();

if ($_SESSION["id"]==""){

	header('location:meeting.php');

}

?>
<body>


<?php

	include("config.php");

$sql = "SELECT * FROM meeting_db";


$result = $conn->query($sql);

if ($result->num_rows > 0) {

	
	?>

<table>
<tr>
<th>
Meeting ID
</th>
<th>
Meeting Name
</th>
</tr>

	<?php
while($row = $result->fetch_assoc()){
?>
<tr>
<td>
<?php echo $row["meetingid"] ?>
</td>
<td>
<?php echo $row["meetingname"] ?>
</td>
</tr>

<?php




}
?>
</table>

<?php
}else{

	echo "<br> NONE";
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
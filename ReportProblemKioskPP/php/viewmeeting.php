<html>
<style><html>
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

<form action="meetingview.php" method="POST" id="myform">
<input type="text" name="id" id="id" placeholder="Meeting ID">

<input type="submit" value="submit" name="submit" id="submit" >



</form>

<?php
if (isset($_SESSION["success"])){
	include("config.php");
echo "Meeting ID: ".$id=$_SESSION["success"]."<br>";

$sql = "SELECT * FROM meetingatt_db INNER JOIN mech_db on meetingatt_db.empID=mech_db.empID where meetingatt_db.meetingID='$id'";


$result = $conn->query($sql);

if ($result->num_rows > 0) {

	
	?>

<table>
<tr>
<th>
Employee ID
</th>
<th>
First Name
</th>
<th>
Middle Name
</th>
<th>

Last Name
</th>
<th>

Time

</th>
</tr>

	<?php
while($row = $result->fetch_assoc()){
?>
<tr>
<td>
<?php echo $row["empID"] ?>
</td>
<td>
<?php echo $row["FirstName"] ?>
</td>
<td>
<?php echo $row["ShortName"] ?>
</td>
<td>
<?php echo $row["LastName"] ?>
</td>
<td>
<?php echo $row["curtime"] ?>
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
unset($_SESSION["success"]);

}

?>

<a href="meetinghome.php">BACK</a>
</body>
</html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<body><center>
<B>Mechanic Report Updater<BR>
<font color=red>
<?php 
session_start();
include("config.php");

if (isset($_SESSION["success"])){
	echo "Successfully updated taskID!<br><br>";
	unset($_SESSION["success"]);
}

if (isset($_SESSION["error5"])){
	echo "Missing info AND/OR wrong info! Please complete the form correctly!<br><br>";
	unset($_SESSION["error5"]);
}
?>
</font><br>
<?php 
$userid=$_SESSION["id"];
$mmechSvr=$_SESSION["mechSvr"];
$sql = "SELECT * FROM mech_db where empID='$userid'";

$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($mmechSvr > 0) {
	echo "Supervisor Mode : <BR>";
}

if ($result->num_rows > 0) {
	echo "Pangalan: </B>".$row["FirstName"]." ".$row["ShortName"]." ".$row["LastName"]."&nbsp&nbsp&nbsp&nbsp <b>Clock No: </b>".$userid;
}	

?>
<b><br>
<form action="mechreportsubmit.php" method="post" id="myform">

<?php
if ($mmechSvr <= 0) {
	?>
	<p>Enter Task ID : </p>
	<select name="taskID" id="taskID">
	<?php
		$sql9 = "SELECT task_db.ID FROM kpi_mech.task_db WHERE task_db.Status <> 7 AND Date(StartDate) = curdate() AND Assignee=$userid ORDER BY `ID` DESC";
		$result9 = $conn->query($sql9);
	while($row9 = $result9->fetch_assoc()){
		?>
		<option value="<?php echo $row9["ID"] ?>"><?php echo $row9["ID"] ?></option>
		<?php
	}
	?>
	</select>
<?php
} else {
	?>
	<p>Enter Task ID : </p><input type="text" name="taskID" id="taskID" placeholder="Number"><br>
	<?php
}
?>
<br>
<p>Enter Person affected : </p><input type="text" name="perAffect" id="perAffect" placeholder="Number" value="1"><br><br>

<p>Update Task Type : </p>
<select name="mbcode" id="mbcode">
<?php
	$sql = "SELECT * FROM mbcode_db";
	$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
	?>
	<option value="<?php echo $row["id"] ?>"><?php echo $row["details"] ?></option>
	<?php
}
?>
</select>

<br><br>
<p>Enter comments / spare parts used : </p>

<textarea id="question" name="question" style="width:500px;height:300px"></textarea>
<BR><BR></b>
<button id="submit" >SUBMIT</button>



</form>
<BR>
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

</center>
</body>
</html>
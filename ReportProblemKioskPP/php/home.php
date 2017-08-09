<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>

<center>

<?php
	session_start();

	if ($_SESSION["id"]==""){
		header('location:index.php');
	}
	
?>

<body>


<?php

error_reporting(0);
include("config.php");

$userid=$_SESSION["id"];

$sql = "SELECT * FROM mech_db where empID='$userid'";
$result = $conn->query($sql);
$row = $result->fetch_assoc(); 
if ($result->num_rows > 0) {
		
		echo "Hello! ";	
		echo $row["FirstName"];
		echo " ";		
		echo $row["LastName"];
		echo ",   ano ang gusto mo gawin ngayon ? :";	
	
	if ($row["mechanicID"]=='1'){
		
		if ($row["status"]=='0'){
		
		?><BR><BR>
		<a href="breakstart.php">Break Start</a><BR>
		<?php

		}
		
		else if ($row["status"]=='2'){
			?><BR>
			<a href="breakend.php">Break End</a><BR>
			<?php


		}
	?>	
	<a href="logout.php">Mechanic Logout</a><?php
	}
	if ($row["SPReporting"]=='1'){
		?><BR>
		<BR><a href="reportproblem.php">Sewing Problem Reporting</a><BR>
		<?php
	}

}
?>	
<br><br><br>

	<a href="hr.php">HR Express Form</a><br><br>
	<a href="kaizen.php">Kaizen Express Form</a><br><br>
	<a href="nearmiss.php">Near Miss / Hazard Reporting</a><br><br>
	<a href="compl.php">Compliance Committee - Comments and Suggestions</a><br><br>
	

<br><br><br>
<a href="signout.php">Exit Session</a>


</center>
</body>
</html>

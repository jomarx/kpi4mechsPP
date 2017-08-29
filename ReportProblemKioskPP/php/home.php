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

//source location for go back home/back redirect
//1 = home.php
//2 = meetinghome.php
$_SESSION["sourceLoc"]='1';

$userid=$_SESSION["id"];

$sql = "SELECT * FROM mech_db where empID='$userid'";
$result = $conn->query($sql);
$row = $result->fetch_assoc(); 
if ($result->num_rows > 0) {
		
		echo "Hello! ";	
		echo $row["FirstName"];
		echo " ";		
		echo $row["LastName"];
		echo ",   ano ang gusto mo gawin ngayon ? :<br><br>";	
	
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
		?><BR><BR>
		<a href="reportproblem.php">Sewing Problem Reporting</a><BR><BR>
		<a href="table51ppsv.php">Task Database (for Supervisor)</a><BR>
		<?php
	}

}
?>	
<br><br><br>

	<br>
	<a href="hr.php">HR Express Form</a><br><br>
	<?php
	if ($row["hrTeam"]=='1'){
		?>
		<a href="hrview.php">HR Express Viewer</a><BR>
		<BR>
		<?php
	}
	?>
	<a href="kaizen.php">Kaizen Express Form</a><br><br>
	<a href="kaizenview.php">Kaizen Viewer</a><BR>
	<BR>
	<?php
	if ($row["kaiTeam"]=='1'){
		$_SESSION["kaiTeam"]=$row["kaiTeam"];
	}
	?>
	<a href="nearmiss.php">Near Miss / Hazard Reporting</a><br><br>
	<a href="nearmissview.php">Near Miss Viewer</a><BR>
	<BR>
	<?php
	if ($row["nmTeam"]=='1'){
		$_SESSION["nmTeam"]=$row["nmTeam"];
	}
	?>
	<a href="compl.php">Compliance Committee - Comments and Suggestions</a><BR><BR>
	<?php
	if ($row["comComTeam"]=='1'){
	?>
		<a href="complview.php">Compliance Committee Viewer</a><BR>
		<BR>
		<?php
	}
	?>
	<br><br>
	

<br><br><br>
<a href="signout.php">Exit Session</a>


</center>
</body>
</html>

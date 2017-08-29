<!DOCTYPE html>

<?php
$page = $_SERVER['PHP_SELF'];
$sec = "600";
?>
<html>
    <head>
    <meta http-equiv="refresh" content="<?php echo $sec?>;URL='<?php echo $page?>'">
    </head>
	<style>
	td {
		
		border:1px solid black;
		font-size: 15px	;
	}
		th {
		font-size: 15px	;
		border:1px solid black;
	}

	</style>
<body>
<BR><b>Task Database (for Supervisor) </b><BR>
<form action="table51ppsvsubmit.php" method="post" id="myform">
<p><b>Enter desired cell : </b></p><input type="text" name="cell" id="cell" placeholder="cell" value="1">
<button id="submit" >SUBMIT</button>
</form><br>
<?php


echo "<center>";
echo "<span style='font-size: 25pt'>";
//echo date("m/d/Y H:i:s");
//echo "<BR><b>Task Database (for reports)</b><BR><BR>";
echo "</span>";


error_reporting(0);
include("config.php");

session_start();

$cell=$_SESSION["cell"];
	
	//Start connection
	
//	$sql = "SELECT * from mbreak_db";
		$sql = "SELECT task_db.ID,task_db.location,mech_db.FirstName,mech_db.LastName,mech_db.ShortName,mech_db.dayOrNight,mbcode_db.details,task_db.StartTime,task_db.EndTime,task_db.StartDate,task_db.BreakStartTime,task_db.EndDate, task_db.comments, task_db.commentsMech, task_db.machineType, task_db.AssignedTime, task_db.AffectedUsers from mech_db INNER JOIN task_db ON task_db.Assignee=mech_db.empID INNER JOIN mbcode_db ON mbcode_db.id=task_db.details WHERE task_db.Status <> 7 AND task_db.location = '$cell' AND Date(StartDate) = curdate() ORDER BY `ID` DESC";

	$result = $conn->query($sql);
    		
	
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>Task ID</th><th>Date Time</th><th>Location</th><th>First Name</th><th>Last Name</th><th>Short Name</th><th>Day Or Night</th><th>Details</th><th>Machine Type</th><th>Break Start</th><th>Assigned Time</th><th>Start Date</th><th>End Date</th><th>Comments</th><th>Comments Mech</th><th>Affected Users</th><th>Duration (m)</th><th>Machine Downtime</th><th>Response Time(m)</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc())
		{
			
			$to_time = strtotime($row["StartTime"]);
			$from_time = strtotime($row["EndTime"]);
			$duration = round(abs($to_time - $from_time) / 60,2);

			$cur_time = strtotime($row["StartDate"]);
			
			echo "<tr>";
			echo "<td>".$row["ID"]."</td>";
			echo "<td>".date('m.d.y', $cur_time)."</td>";
			echo "<td>".$row["location"]."</td>";
			echo "<td>".$row["FirstName"]."</td>";
			echo "<td>".$row["LastName"]."</td>";
			echo "<td>".$row["ShortName"]."</td>";
			echo "<td>".$row["dayOrNight"]."</td>";
			echo "<td>".$row["details"]."</td>";
			echo "<td>".$row["machineType"]."</td>";
			
			$to_time1 = strtotime($row["StartTime"]);
			$from_time1 = strtotime($row["AssignedTime"]);
			$duration1 = round(abs($to_time1 - $from_time1) / 60,2);
			$duration2 = $duration * round($row["AffectedUsers"]);
			
			echo "<td>".$row["BreakStartTime"]."</td>";
			echo "<td>".$row["AssignedTime"]."</td>";
			echo "<td>".$row["StartTime"]."</td>";
			echo "<td>".$row["EndTime"]."</td>";
			echo "<td>".$row["comments"]."</td>";
			echo "<td>".$row["commentsMech"]."</td>";
			echo "<td>".$row["AffectedUsers"]."</td>";

		
		if ($duration >1){
			echo "<td>".floor($duration)."</td>";
			echo "<td>".floor($duration2)."</td>";	
			echo "<td>".floor($duration1)."</td>";	
		} else {
			echo "<td>".floor($duration)."</td>";
			echo "<td>".floor($duration2)."</td>";	
			echo "<td>".floor($duration1)."</td>";	
		}
		
			
		
			echo "</tr>";
    		
			}
	
		echo "</table>";
		echo "</center>";
		echo "<BR><b>Task Database (for reports) </b><BR><BR>";
	}
	else {
    		echo "No results";
	}

?>
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
</body>
</html>

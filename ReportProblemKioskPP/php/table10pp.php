<!DOCTYPE html>

<?php
$page = $_SERVER['PHP_SELF'];
$sec = "30";
include("config.php");
session_start();
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
<?php
echo "<center><br>";
echo "<span style='font-size: 25pt'>";
//echo date("m/d/Y H:i:s");
//echo "<BR><b>Mechanic Status</b><BR><BR>";
echo "</span>";



		$sql = "SELECT mechbreak_db.counter,mechbreak_db.userID, mechbreak_db.AssetNo, mechbreak_db.StartDate, smloc_db.details, mechbreak_db.sourceLoc FROM `mechbreak_db` INNER JOIN smloc_db ON mechbreak_db.sourceLoc = smloc_db.id WHERE mechbreak_db.status = 3";

	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>movement ID</th><th>UserID</th><th>AssetNo</th><th>StartDate</th><th>Destination</th><th>Source</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc()) {
			
			//$to_time = $row["status"];
	
			echo "<tr>";
			echo "<td>".$row["counter"]."</td>";
			echo "<td>".$row["userID"]."</td>";
			echo "<td>".$row["AssetNo"]."</td>";
			echo "<td>".$row["StartDate"]."</td>";
			echo "<td>".$row["details"]."</td>";
			echo "<td>".$row["sourceLoc"]."</td>";	
			echo "</tr>";
    		
	}
	
		echo "</table>";
		echo "</center>";
		echo "<BR><b>Machine Movement</b><BR><BR>";
} else {
    		echo "No results";
}
?>

</body>
</html>

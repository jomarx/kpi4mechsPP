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

//Start connection
	
$sql = "SELECT sm_db.Name, sm_db.StatusCategory, sm_db.AssetStatus, sm_db.AssetNo, smloc_db.details, sm_db.Category, sm_db.Make, sm_db.Model, sm_db.AssignedTo, sm_db.Site, sm_db.AssetCondition, sm_db.Supplier, sm_db.SerialNo, sm_db.TagNames FROM sm_db INNER JOIN smloc_db ON sm_db.Location = smloc_db.id";
		
	$result = $conn->query($sql);
    		
	
	if ($result->num_rows > 0) {
		echo "<span style='font-size: 15pt'>";
		echo "<table style='border:4px solid black; width: 100%'>";
		//echo "<font size='30'>";
		echo "<tr><th>Name</th><th>StatusCategory</th><th>AssetStatus</th><th>AssetNo</th><th>Location</th><th>Category</th><th>Make</th><th>Model</th><th>AssignedTo</th><th>Site</th><th>AssetCondition</th><th>Supplier</th><th>SerialNo</th><th>TagNames</th></tr>";
		echo "</span>";
		
		// <th>SpecialSerial</th><th>StartDate</th><th>EndDate</th><th>Details</th>
		// output data of each row
		while($row = $result->fetch_assoc()) {
			
			echo "<tr>";
			echo "<td>".$row["Name"]."</td>";
			echo "<td>".$row["StatusCategory"]."</td>";
			echo "<td>".$row["AssetStatus"]."</td>";
			echo "<td>".$row["AssetNo"]."</td>";
			echo "<td>".$row["details"]."</td>";
			echo "<td>".$row["Category"]."</td>";
			echo "<td>".$row["Make"]."</td>";
			echo "<td>".$row["Model"]."</td>";
			echo "<td>".$row["AssignedTo"]."</td>";
			echo "<td>".$row["Site"]."</td>";
			echo "<td>".$row["AssetCondition"]."</td>";
			echo "<td>".$row["Supplier"]."</td>";
			echo "<td>".$row["SerialNo"]."</td>";
			echo "<td>".$row["TagNames"]."</td>";
	
			echo "</tr>";
    		
		}
	
		echo "</table>";
		echo "</center>";
		echo "<BR><b>Sewing Machine Status</b><BR><BR>";
		
	} else {
	echo "No results";
}
	
?>

</body>
</html>

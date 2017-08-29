<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<font color="red">
<?php 
session_start();
include("config.php");
error_reporting(0);
$kaiTeam=$_SESSION["kaiTeam"];

	if (isset($_SESSION["delsuccess"])){

		echo "Delete data is a success!";
		unset($_SESSION["delsuccess"]);

	}

?>
</font>
<style>
body{
	font-size: 15pt;	
}
tr {
	font-size: 15pt;	
	border-style: solid;
}
th {
	font-size: 15pt;	
	border-style: solid;
}
td {
	border-style: solid;
}



</style>
<body>
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
<table>
<tr>
<th>Kaizen ID</th>
<th>Employee ID</th>
<th>Cell Number</th>
<th>First Name</th>
<th>Last Name</th>
<th>Current Situation</th>
<th>Target Situation</th>
<th>Comments</th>
<th>Date</th>
<th>DateModified</th>
<th>Status</th>
<?php 
if ($kaiTeam==1) {
	echo "<th>Edit</th>";
	echo "<th>Delete</th>";
} 
?>
</tr>
<?php 

$sql = "SELECT kaizen.auto_num, kaizen.clockNo,kaizen.cellNo,mech_db.FirstName,mech_db.LastName,kaizen.question1,kaizen.question2,kaizen.comments,kaizen.dateSubmitted,kaizen.dateModified,kaizen.status FROM kaizen INNER JOIN mech_db on kaizen.clockNo=mech_db.empID";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()){ 

?>
<tr>
<td><?php echo $row["auto_num"] ?></td>
<td><?php echo $row["clockNo"] ?></td>
<td><?php echo $row["cellNo"] ?></td>
<td><?php echo $row["FirstName"] ?></td>
<td><?php echo $row["LastName"] ?></td>
<td><?php echo $row["question1"];?></td>
<td><?php echo $row["question2"] ?></td>
<td><?php echo $row["comments"] ?></td>
<td><?php echo $row["dateSubmitted"] ?></td>
<td><?php echo $row["dateModified"] ?></td>
<td><?php if ($row["status"]=='0'){
	echo "New";
	} elseif ($row["status"]=='1'){
		//Ongoing
		echo "Ongoing";
	} elseif ($row["status"]=='2') {
		//Served
		echo "Served";
	} else {
		//wala lang
	}
?></td>
<?php 
if ($kaiTeam==1) {
	$modid = $row['auto_num'];
	echo "<td><a href='kaizen.php?modid=$modid'>Modify</a></td>";
	echo "<td><a href='kaizensubmit.php?modid=$modid'>Delete</a></td>";
} 
?>
</tr>




<?php
}
}	

?>
</table>

</body>
<script type='text/javascript'>
$(document).ready(function() {
$('#other').attr('disabled','disabled');        
$('select[name="category"]').on('change',function(){
var  others = $(this).val();
    if(others == "8"){           
    $('#other').removeAttr('disabled');          
     }else{
     $('#other').attr('disabled','disabled'); 
    }  

  });
});
</script>
</html>
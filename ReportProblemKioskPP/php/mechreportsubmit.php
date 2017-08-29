<?php
//mech report submit
error_reporting(0);
include("config.php");

$taskID=$_POST["taskID"];
$perAffect=$_POST["perAffect"];
$mbcode=$_POST["mbcode"];
$question=$_POST["question"];

session_start();

$id=$_SESSION["id"];
$mechSvr=$_SESSION["mechSvr"];
/*
echo $taskID;
echo "<br>";
echo $perAffect;
echo "<br>";
echo $mbcode;
echo "<br>";
echo $question;
echo "<br>";
*/
if (($taskID==0)||($perAffect==0)||($perAffect>=31)||($mbcode==0)){
	$_SESSION["error5"]='1';
	
	?>
	<script>
		window.location.replace("mechreport.php");
	</script>
	<?php
	
} else if ($mechSvr==1){
	$sql1 = "UPDATE kpi_mech.task_db SET AffectedUsers = $perAffect, details = $mbcode, comments = '$question' WHERE ID = $taskID";
} else {
	$sql1 = "UPDATE kpi_mech.task_db SET AffectedUsers = $perAffect, details = $mbcode, commentsMech = '$question' WHERE ID = $taskID";
}

if ($conn->query($sql1) === TRUE) {
	$_SESSION["success"]='1';
	?>
<script>
	window.location.replace("mechreport.php");
</script>
<?php
} else {
    echo "Error : " . $sql1 . "<br>" . $conn->error;
}

$conn->close();

?>
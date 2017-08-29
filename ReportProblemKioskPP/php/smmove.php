<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>

<?php

session_start();

if ($_SESSION["id"]==""){
	header('location:meeting.php');
}
?>

<body>
<b><center>
<p>Destination :</p>
<form action="smmovereport.php" method="post" id="myform">

<select name="location" id="location">
<?php

/*
#mechbreak_db 

break_status codes:
0 - N/A
1 - break start
2 - break end

#status codes :
0- N/A
3 - moved
4 - disposed/moved/etc update status

*/

include("config.php");
$sql = "SELECT * FROM smloc_db";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
	?>
	<option value="<?php echo $row["id"] ?>"><?php echo $row["details"] ?></option>
	<?php
}
?>
</select>
<br>

<p>Asset Number :</p>
<input type="text" name="AssetNumber" id="AssetNumber" placeholder="Asset" required="required" autofocus>&nbsp;
<br><br>
<button name="submit" id="submit" >SUBMIT</button>
<br><br><br><br>
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

<script>

$('#myform').submit(function(){
	return false;
});
 
$('#submit').click(function(){
	$.post(
	$('#myform').attr('action'),
	$('#myform :input').serializeArray(),
	
 function(result){
	$('#result1').html(result);
	document.getElementById("AssetNumber").value="";
	//$('#myform')[0].reset();
 }
 );

 
});

</script>
 

<p class="alert alert-success" id='result1'></p>


</form>

</body>

</center>
</html>

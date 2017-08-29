<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<body>
<B>KAIZEN EXPRESS FORM</B><BR>
<?php 
session_start();
error_reporting(0);
include("config.php");
$userid=$_SESSION["id"];
$modid = $_GET['modid'];
$sql = "SELECT * FROM mech_db where empID='$userid'";

$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {
	echo "<br>";
	echo "Pangalan: ".$row["FirstName"]." ".$row["ShortName"]." ".$row["LastName"]."<b>&nbsp&nbsp&nbsp&nbsp Clock No: </b>".$userid;
	//echo "<br>".$modid;
	?>
	<font color="red">
	<?php 
	if (isset($_SESSION["success"])){

		echo "<br>Submit data is a success!";
		unset($_SESSION["success"]);

	}
	
		if (isset($_SESSION["notsuccess"])){

		echo "Please complete the form, there are missing data!";
		unset($_SESSION["notsuccess"]);

	}
	
}	
?>
</font><BR><BR><b>

<?php
if ($modid > 0) {
	
	$sqlmodid = "SELECT kaizen.auto_num, kaizen.clockNo, kaizen.cellNo, mech_db.FirstName, mech_db.LastName, kaizen.question1, kaizen.question2, kaizen.dateSubmitted, kaizen.status FROM kpi_mech.kaizen INNER JOIN mech_db on kaizen.clockNo=mech_db.empID WHERE kaizen.auto_num = $modid";

	$result1 = $conn->query($sqlmodid);
	$row1 = $result1->fetch_assoc(); 
	if ($result->num_rows > 0) {
	//echo "<b>Kaizen ID : ".$row1["auto_num"]."<BR><BR>";
	}
	?>
	
	<form action="kaizensubmit.php?updater=1" method="post" id="myform">
	&nbsp; Kaizen ID : 
	<input type="text" name="auto_num" id="auto_num" value="<?php echo $row1["auto_num"];?>">
	&nbsp; Cell : 
	<input type="text" name="cellno" id="cellno" placeholder="Cell Number" value="<?php echo $row1["cellNo"];?>">
	&nbsp; Date : 
	<input type="text" name="date" id="date" placeholder="Date" value="<?php echo $row1["dateSubmitted"];?>">
	<BR>
	<p>Current Situation : </b></p>
	<textarea id="question1" name="question1" style="width:500px;height:150px"><?php echo htmlspecialchars($row1["question1"]); ?></textarea>
	<BR>
	<p><b>Target Situation Process: </b></p>
	<textarea id="question2" name="question2" style="width:500px;height:150px"><?php echo htmlspecialchars($row1["question2"]); ?></textarea>
	<BR>
	<p><b>Comments: </b></p>
	<textarea id="comments" name="comments" style="width:500px;height:150px"><?php echo htmlspecialchars($row1["comments"]); ?></textarea>
	<BR><BR>
	Status : <select name="status" id="status">
		<option value="0">New</option>
		<option value="1">Ongoing</option>
		<option value="2">Served</option>
	</select>
	<BR><BR>
	<button id="submit" >SUBMIT</button>
<?php
} else {
	?>
	<form action="kaizensubmit.php" method="post" id="myform">
	&nbsp;Cell : 
	<input type="text" name="cellno" id="cellno" placeholder="Cell Number">
	&nbsp;Date : 
	<input type="text" name="date" id="date" placeholder="Date" value="<?php echo date("m/d/Y H:i:s");?>">
	<BR>
	<p>Current Situation : </b></p>
	<textarea id="question1" name="question1" style="width:500px;height:150px"></textarea>
	<BR>
	<p><b>Target Situation Process: </b></p>
	<textarea id="question2" name="question2" style="width:500px;height:150px"></textarea>
	<BR>
	<BR>
	<button id="submit" >SUBMIT</button>
	<?php
}
?>

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

</body>
<script type='text/javascript'>
$(document).ready(function() {
$('#auto_num1').attr('disabled','disabled');        
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
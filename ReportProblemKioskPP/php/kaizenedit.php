<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<body>
<B>KAIZEN EXPRESS FORM</B><BR>
<?php 
session_start();
include("config.php");
$userid=$_SESSION["id"];
$sql = "SELECT * FROM mech_db where empID='$userid'";

$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {

	echo "Pangalan: ".$row["FirstName"]." ".$row["ShortName"]." ".$row["LastName"]."<b>&nbsp&nbsp&nbsp&nbsp Clock No: </b>".$userid;
	echo "<br><br>";
	?>
	<font color="red">
	<?php 
	if (isset($_SESSION["success"])){

		echo "Submit data is a success!";
		unset($_SESSION["success"]);

	}
	
		if (isset($_SESSION["notsuccess"])){

		echo "Please complete the form, there are missing data!";
		unset($_SESSION["notsuccess"]);

	}
	
}	

?></font><BR><BR><b>
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
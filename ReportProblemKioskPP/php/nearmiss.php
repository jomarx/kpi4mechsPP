<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<body>
<B>NEAR MISS / HAZARD REPORTING</B><BR>
<?php 
session_start();
include("config.php");
$userid=$_SESSION["id"];
$sql = "SELECT * FROM mech_db where empID='$userid'";

$result = $conn->query($sql);
$row = $result->fetch_assoc(); 

if ($result->num_rows > 0) {

	echo "Pangalan: ".$row["FirstName"]." ".$row["ShortName"]." ".$row["LastName"]."&nbsp&nbsp&nbsp&nbsp Clock No:".$userid;


}	

?>
<form action="nearmisssubmit.php" method="post" id="myform">
<select id="category" name="category">
<option value="1">Near Miss</option>
<option value="2">Hazard Report</option>
<option value="8">Others</option>


</select>
<input type="text" name="other" id="other" placeholder="Others">
<br>
<textarea id="question" name="question" style="width:500px;height:300px"></textarea>
<BR><BR>
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

<?php
if (isset($_SESSION["success"])){

echo "Success";
unset($_SESSION["success"]);

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
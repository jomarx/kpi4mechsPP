<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<body>
<B>Compliance Committee Comments FORM</B><BR><BR>
Meron ba po kayo gusto sabihin sa Compliance committee? Gamitin lang po ang form na ito para ibahagi ang iyong saloobin.<BR><BR>
<?php 
session_start();
include("config.php");
$userid=$_SESSION["id"];
$sql1 = "SELECT * FROM mech_db where empID='$userid'";

$result = $conn->query($sql1);
$row11 = $result->fetch_assoc(); 

if ($result->num_rows > 0) {

	echo "Pangalan: ".$row11["FirstName"]." ".$row11["ShortName"]." ".$row11["LastName"]."&nbsp&nbsp&nbsp&nbsp Clock No:".$userid;


}	

?>
<form action="complsubmit.php" method="post" id="myform">
<select id="category" name="category">
<option value="1">Health & Security Team</option>
<option value="2">Safety Awareness Team</option>
<option value="3">GSMS Audit Team</option>
<option value="4">Ergonomics Team</option>
<option value="5">Training / Video / Contest Team </option>
<option value="6">ERT Team</option>
<option value="7">Environment & Energy Team</option>
<option value="8">Others</option>


</select>
<input type="text" name="other" id="other" placeholder="Others">
<br>
<textarea id="question" name="question" style="width:500px;height:300px"></textarea>
<BR><BR>
<button id="submit" >SUBMIT</button>



</form>
<BR>
<a href="home.php">Back to Main Options</a><BR>
<a href="signout.php">Exit Session</a>

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
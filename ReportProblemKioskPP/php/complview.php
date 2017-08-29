<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
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
<th>
Employee ID
</th>
<th>
First Name
</th>
<th>
Middle Name
</th>
<th>

Last Name
</th>
<th>

Category

</th>
<th>

Question

</th>
<th>
Status
</th>
</tr>
<?php 
session_start();
include("config.php");
$sql = "SELECT * FROM compl INNER JOIN mech_db on compl.clockNo=mech_db.empID";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()){ 

?>
<tr>
<td>
<?php echo $row["clockNo"] ?>
</td>
<td>
<?php echo $row["FirstName"] ?>
</td>
<td>
<?php echo $row["ShortName"] ?>
</td>
<td>
<?php echo $row["LastName"] ?>
</td>

<td>
<?php
if ($row["category"]=='8'){
echo $row["categoryOther"];

}else

{
 echo $row["category"]; 
}
?>
</td>

<td>
<?php echo $row["question"] ?>
</td>
<td>
<?php echo $row["status"] ?>
</td>

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
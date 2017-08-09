<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/submit.js"></script>
</head>
<?php

session_start();

if ($_SESSION["id"]!=""){

	header('location:home.php');

}

?>
<body>
<b><center><br><br>
<p> Hanes Global Supply Chain Philippines Inc<br><br><br>Multifunction Kiosk<br><BR>Scan ID :</p></b>
<form action="login.php" method="post" id="myform">
<input type="password" name="userid" id="userid" placeholder="userid" autofocus>

<button id="submit" >SUBMIT</button>
</center>


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
 $('#myform')[0].reset();
 }
 );

});

</script>
</form>

   <div id="result1"></div>
</body>
</html>

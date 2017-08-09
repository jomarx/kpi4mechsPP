<?php

error_reporting(0);
include("config.php");

$category=$_POST["category"];
$question=$_POST["question"];
$other=$_POST["other"];

session_start();
$id=$_SESSION["id"];
if ($category=='8'){
$sql1 = "INSERT into nearmiss(clockNo,category,categoryOther,question,status) VALUES ('$id','$category','$other','$question','0')";
}
else{
$sql1 = "INSERT into nearmiss(clockNo,category,question,status) VALUES ('$id','$category','$question','0')";

}
if ($conn->query($sql1) === TRUE) {

$_SESSION["success"]='1';
	?>
<script>

window.location.replace("nearmiss.php");

</script>
<?php
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?>
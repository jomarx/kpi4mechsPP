<?php

error_reporting(0);
include("config.php");

$cell=$_POST["cell"];

session_start();

$_SESSION["cell"]=$cell;

?>
<script>

	window.location.replace("table51ppsv.php");

</script>

<?php

$conn->close();

?>
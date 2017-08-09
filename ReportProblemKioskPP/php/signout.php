<?php


error_reporting(0);
include("config.php");
session_start();

session_destroy();
	?>
<script>

window.location.replace("index.php");

</script>
<?php

$conn->close();




?>

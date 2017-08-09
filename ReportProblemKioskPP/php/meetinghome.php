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

<a href="showmeeting.php">Show Meeting IDs</a><BR><BR>
<a href="addmeeting.php">Add Meeting ID</a><BR><BR>
<a href="startmeeting.php">Start Meeting</a><BR><BR>
<a href="viewmeeting.php">View Meeting</a><BR><BR>
<a href="meetinglogout.php">Logout</a>



</body>
</html>
<?php

//error_reporting(0);
include("config.php");

$cellno=$_POST["cellno"];
$question1=$_POST["question1"];
$question2=$_POST["question2"];
$status=$_POST["status"];
$comments=$_POST["comments"];
$auto_num1=$_POST["auto_num"];

$modid = $_GET['modid'];
$updater = $_GET['updater'];

session_start();

//$modid=$_SESSION["modid"];
//echo "need to delete".$modid;

if ($modid > 0) {
	$sql2 = "DELETE FROM kpi_mech.kaizen WHERE kaizen.auto_num = $modid";
	
			if ($conn->query($sql2) === TRUE) {
				$_SESSION["delsuccess"]='1';
				?>
				<script>
					window.location.replace("kaizenview.php");
				</script>
				<?php

			} 
	
}

if (($cellno<=0)||($question1=="")||($question2=="")) {
		$_SESSION["notsuccess"]='1';
		?>
		<script>
			window.location.replace("kaizen.php");
		</script>
		<?php
		
		} else {
			if ($updater == 1) {
				//to update
				$sql1 = "UPDATE kpi_mech.kaizen SET dateModified = (Curtime()), question1 = '$question1', question2='$question2', status='$status', comments='$comments'  WHERE auto_num = $auto_num1";
			} else {
				//to insert
				$sql1 = "INSERT into kaizen(clockNo,cellNo,dateSubmitted,question1,question2,status) VALUES ('$id','$cellno',now(),'$question1','$question2','0')";
				
				// Pear Mail Library
				//https://stackoverflow.com/questions/712392/send-email-using-the-gmail-smtp-server-from-a-php-page
				/*
				include_once "Mail.php";

				$from = '<jomar@jomarx.com>';
				$to = '<jmaquinay@gmail.com>';
				$subject = 'Hi!';
				$body = "Hi,\n\nHow are you?";

				$headers = array(
					'From' => $from,
					'To' => $to,
					'Subject' => $subject
				);

				$smtp = Mail::factory('smtp', array(
						'host' => 'ssl://smtp.gmail.com',
						'port' => '465',
						'auth' => true,
						'username' => 'jomar@jomarx.com',
						'password' => 'magic44ever'
					));

				$mail = $smtp->send($to, $headers, $body);

				if (PEAR::isError($mail)) {
					echo('<p>' . $mail->getMessage() . '</p>');
				} else {
					echo('<p>Message successfully sent!</p>');
				}*/
			}
			if ($conn->query($sql1) === TRUE) {
				$_SESSION["success"]='1';
				?>
				<script>
					window.location.replace("kaizen.php");
				</script>
				<?php
			} else {
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
}

$conn->close();
?>
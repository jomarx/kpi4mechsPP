<!DOCTYPE html>
<html>
<body>

<?php
echo "<center>";
echo date("m/d/Y");
echo "</center>";
echo "<table style='border: 4px solid black;width: 100%'>";
echo "<tr><th>location</th><th>Assignee</th><th>StartTime</th><th>EndTime</th><th>Job Code</th></tr>";

class TableRows extends RecursiveIteratorIterator { 
     function __construct($it) { 
         parent::__construct($it, self::LEAVES_ONLY); 
     }

     function current() {
         return "<td style='wlocationth: 150px; border: 4px solid black;'>" . parent::current(). "</td>";
     }

     function beginChildren() { 
         echo "<tr>"; 
     } 

     function endChildren() { 
         echo "</tr>" . "\n";
     } 
} 

$servername = "192.168.42.85";
$username = "nodemcu1";
$password = "secret";
$dbname = "kpi_mech";

try {
     $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
     $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     $stmt = $conn->prepare("SELECT location, Assignee, StartTime, EndTime, details FROM task_db WHERE status < 4"); 
     $stmt->execute();

     // set the resulting array to associative
     $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 

     foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
         echo $v;
     }
}
catch(PDOException $e) {
     echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";
?>  


</body>
</html>

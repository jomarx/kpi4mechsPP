<?php
 
/*
 * Following code will delete a product from table
 * A product is identified by product id (pid)
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (isset($_POST['pid'])) {
    $pid = $_POST['pid'];
 
    // include db connect class
    define('DB_USER', "root"); // db user
	define('DB_PASSWORD', ""); // db password (mention your db password here)
	define('DB_DATABASE', "androidhive"); // database name
	define('DB_SERVER', "localhost"); // db server
	 
 
    // connecting to db
    $con = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE) ;

	if ($con->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
 
    // mysql update row with matched pid
    $sql1 = "DELETE FROM products WHERE pid = $pid";
	
	$result = $con->query($sql1);
 
    // check if row deleted or not
    if ($result->num_rows > 0) {
        // successfully updated
        $response["success"] = 1;
        $response["message"] = "Product successfully deleted";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // no product found
        $response["success"] = 0;
        $response["message"] = "No product found";
 
        // echo no users JSON
        echo json_encode($response);
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);
}
?>
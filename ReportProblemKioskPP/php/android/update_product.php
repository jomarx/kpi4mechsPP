<?php
 
/*
 * Following code will update a product information
 * A product is identified by product id (pid)
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (isset($_POST['pid']) && isset($_POST['name']) && isset($_POST['price']) && isset($_POST['description'])) {
 
    $pid = $_POST['pid'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $description = $_POST['description'];
 
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
    $sql1 = "UPDATE products SET name = '$name', price = '$price', description = '$description' WHERE pid = $pid";
 
	$result = $con->query($sql1);
 
    // check if row inserted or not
    if ($result) {
        // successfully updated
        $response["success"] = 1;
        $response["message"] = "Product successfully updated.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
 
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);
}
?>
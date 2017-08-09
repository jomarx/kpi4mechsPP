<?php
 
/*
 * Following code will create a new product row
 * All product details are read from HTTP Post Request
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (isset($_POST['name']) && isset($_POST['price']) && isset($_POST['description'])) {
 
    $name = $_POST['name'];
    $price = $_POST['price'];
    $description = $_POST['description'];
 
    // include db connect class
    define('DB_USER', "root"); // db user
	define('DB_PASSWORD', ""); // db password (mention your db password here)
	define('DB_DATABASE', "androidhive"); // database name
	define('DB_SERVER', "localhost"); // db server
 
 
    // connecting to db
    $sql1 = "INSERT INTO products(name, price, description) VALUES('$name', '$price', '$description')";
	
	$con = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE) ;

	if ($con->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
 
	// get all products from products table
	$result = $con->query($sql1);

 
    // check if row inserted or not
    if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Product successfully created.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
        // echoing JSON response
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
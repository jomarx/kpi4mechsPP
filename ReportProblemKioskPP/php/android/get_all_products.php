<?php
 
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
// include db connect class

define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password (mention your db password here)
define('DB_DATABASE', "androidhive"); // database name
define('DB_SERVER', "localhost"); // db server
 
$sql1 = "SELECT * FROM products";

$con = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE) ;

	if ($con->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
 
// get all products from products table
$result = $con->query($sql1);
 
// check for empty result
if ($result->num_rows > 0) {
    // looping through all results
    // products node
    $response["products"] = array();
 
    while ($row = $result->fetch_assoc()) {
        // temp user array
        $product = array();
        $product["pid"] = $row["pid"];
        $product["name"] = $row["name"];
        $product["price"] = $row["price"];
        $product["created_at"] = $row["created_at"];
        $product["updated_at"] = $row["updated_at"];
 
        // push single product into final response array
        array_push($response["products"], $product);
    }
    // success
    $response["success"] = 1;
 
    // echoing JSON response
    echo json_encode($response);
} else {
    // no products found
    $response["success"] = 0;
    $response["message"] = "No products found";
 
    // echo no users JSON
    echo json_encode($response);
}
?>
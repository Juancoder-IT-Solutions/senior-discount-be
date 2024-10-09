<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access, Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json; charset=UTF-8");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

// if(isset($data->username) && !empty($data->username) ){
	
	$username = $mysqli_connect->real_escape_string($data->username);
	$password = $mysqli_connect->real_escape_string($data->password);


	$fetch_rows = $mysqli_connect->query("SELECT * FROM senior_table WHERE senior_username='$username' AND senior_password='$password'") or die(mysqli_error());

	$response = array();

	if(mysqli_num_rows($fetch_rows) > 0){
		
		$row = $fetch_rows->fetch_array();
		$response['senior_id'] = $row['senior_id'];
		$response['first_name'] = $row['first_name'];
		$response['middle_name'] = $row['middle_name'];
		$response['last_name'] = $row['last_name'];
		$response['email_address'] = $row['email_address'];
		$response['full_address'] = $row['full_address'];
		$response['response'] = 1;
		// echo 1;	

	}else{
		$response['senior_id'] = 0;
		$response['first_name'] = "";
		$response['middle_name'] = "";
		$response['last_name'] = "";
		$response['email_address'] = '';
		$response['full_address'] = '';
		$response['response'] = 0;
	}

	echo json_encode($response);
	
// }

?>
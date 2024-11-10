<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

if(isset($data->senior_id) && !empty($data->senior_id )){

	$senior_id = $mysqli_connect->real_escape_string($data->senior_id);

	$row = array();
	$fetch = $mysqli_connect->query("SELECT * FROM guardian WHERE senior_id_fk='$senior_id'") or die(mysql_error());


	// $row['birth_file'] = base64_encode($row['file_name_birth']);
	$row = $fetch->fetch_array();

	echo json_encode($row);

}

?>
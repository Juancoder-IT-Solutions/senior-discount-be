<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

if(isset($data->user_id) && !empty($data->user_id )){

	$user_id = $mysqli_connect->real_escape_string($data->user_id);

	$row = array();
	$fetch = $mysqli_connect->query("SELECT s.*, b.file_name_birth, g.file_name_id FROM senior_table s LEFT JOIN birthcertificate_table b ON s.senior_id=b.senior_id LEFT JOIN government_id g ON g.senior_id=s.senior_id where s.senior_id='$user_id'") or die(mysql_error());


	$row['birth_file'] = base64_encode($row['file_name_birth']);
	$row = $fetch->fetch_array();

	echo json_encode($row);

}

?>
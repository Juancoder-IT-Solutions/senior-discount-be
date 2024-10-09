<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

$user_id = $mysqli_connect->real_escape_string($data->user_id);
$fetch = $mysqli_connect->query("SELECT * FROM `transaction_history`");
$response = array();// AND senior_id='$user_id'
while ($row = $fetch->fetch_array()) {
    $list = array();
	$esRow = getEstablishment($row['ID_establishment']);
    $list['id'] = $row['transaction_id'];
    $list['establishment'] = $esRow['establishment_name'];
    $list['establishment_address'] = $esRow['establishment_address'];
    $list['date_added'] = $row['date_added'];
    array_push($response, $list);
}

echo json_encode($response);
?>
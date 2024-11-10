<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

$user_id = $mysqli_connect->real_escape_string($data->user_id);
$user_category = $mysqli_connect->real_escape_string($data->user_category);

if($user_category == "E"){
    $query = "ID_establishment='$user_id'";
}else{
    $query = "senior_id='$user_id'";
}

$fetch = $mysqli_connect->query("SELECT * FROM `transaction_history` WHERE $query ORDER BY date_added DESC");
$response = array();// AND senior_id='$user_id'
while ($row = $fetch->fetch_array()) {
    $list = array();
	$esRow = getEstablishment($row['ID_establishment']);
	$sRow = getSenior($row['senior_id']);
    $fullname = $sRow['first_name']." ".$sRow['middle_name']." ".$sRow['last_name'];
    $list['id'] = $row['transaction_id'];
    $list['establishment'] = $user_category == "E" ? $fullname : $esRow['establishment_name'];
    $list['establishment_address'] = $user_category == "E" ? $sRow['full_address'] : $esRow['establishment_address'];
    $list['date_added'] = $row['date_added'];
    array_push($response, $list);
}

echo json_encode($response);
?>
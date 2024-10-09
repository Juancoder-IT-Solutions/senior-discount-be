<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

$user_id = $mysqli_connect->real_escape_string($data->user_id);
$fetch = $mysqli_connect->query("SELECT * FROM `announcement`");
$response = array();// AND senior_id='$user_id'
while ($row = $fetch->fetch_array()) {
    $list = array();
    $list['id'] = $row['ID_announcement'];
    $list['what_announcement'] = $row['what_announcement'];
    $list['where_announcement'] = $row['where_announcement'];
    $list['subject'] = $row['subject'];
    $list['description'] = $row['description'];
    $list['date_posted'] = $row['date_posted'];
    array_push($response, $list);
}

echo json_encode($response);
?>
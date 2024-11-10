<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

$ID_establishment = $mysqli_connect->real_escape_string($data->user_id);
$discount = $mysqli_connect->real_escape_string($data->discount);

$sql = $mysqli_connect->query("UPDATE `establishment` SET `give_discount`='$discount' WHERE ID_establishment='$ID_establishment'");

if($sql){
    echo 1;
}else{
    echo 0;
}

?>
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

$data = json_decode(file_get_contents("php://input"));

$senior_id = $mysqli_connect->real_escape_string($data->senior_id);
$ID_establishment = $mysqli_connect->real_escape_string($data->establisment_id);
// $discount = $mysqli_connect->real_escape_string($data->discount);

$discount = getDiscount($ID_establishment);


$fetch = $mysqli_connect->query("SELECT * FROM `senior_table` WHERE senior_id='$senior_id'");
if ($fetch->num_rows > 0) {
    $sql = $mysqli_connect->query("INSERT INTO `transaction_history` (`ID_establishment`, `senior_id`,discount) VALUES ('$ID_establishment','$senior_id','$discount')");

    if ($sql) {
        echo 1;
    } else {
        echo 0;
    }
} else {
    echo -1;
}

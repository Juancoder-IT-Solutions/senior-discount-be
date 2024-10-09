<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'core/config.php';

// Get JSON data from the request
$data = json_decode(file_get_contents("php://input"));
$student_id = $mysqli_connect->real_escape_string($data->user_id);
$classwork_id = $mysqli_connect->real_escape_string($data->classwork_id);
foreach ($data->answers as $questionId => $answer) {
    // Process each answer
    $classwork_detail_id = $mysqli_connect->real_escape_string($questionId);
    $sc_answer = $mysqli_connect->real_escape_string($answer);

    $fetch = $mysqli_connect->query("SELECT * FROM `tbl_classwork_detail` WHERE classwork_detail_id='$classwork_detail_id'");
    $row = $fetch->fetch_assoc();

    if($row['classwork_type'] == "O"){
        if($row['classwork_answer'] == $sc_answer){
            $score = $row['class_points'];
        }else{
            $score = 0;
        }
    }else{
        $score = "";
    }

    $sql = $mysqli_connect->query("INSERT INTO `tbl_student_classwork`(classwork_id,student_id,classwork_detail_id,sc_answer,score) VALUES ('$classwork_id','$student_id','$classwork_detail_id','$sc_answer','$score')") or die(mysqli_error());
}
echo 1;

?>

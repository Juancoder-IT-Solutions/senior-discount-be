<?php

function getCurrentDate(){
	ini_set('date.timezone','UTC');
	//error_reporting(E_ALL);
	date_default_timezone_set('UTC');
	$today = date('H:i:s');
	$system_date = date('Y-m-d H:i:s', strtotime($today)+28800);
	return $system_date;
}

function getEstablishment($id){
	global $mysqli_connect;

	$fetchData = $mysqli_connect->query("SELECT * FROM `establishment` WHERE ID_establishment = '$id'");
	if($fetchData->num_rows > 0){
		$row = $fetchData->fetch_array();
		return $row;
	}else{
		return null;
	}
	
}

function getDiscount($id){
	global $mysqli_connect;

	$fetchData = $mysqli_connect->query("SELECT give_discount FROM `establishment` WHERE ID_establishment = '$id'");
	if($fetchData->num_rows > 0){
		$row = $fetchData->fetch_array();
		return $row['give_discount'];
	}else{
		return 0;
	}
	
}

function getSenior($id){
	global $mysqli_connect;

	$fetchData = $mysqli_connect->query("SELECT * FROM `senior_table` WHERE senior_id = '$id'");
	if($fetchData->num_rows > 0){
		$row = $fetchData->fetch_array();
		return $row;
	}else{
		return null;
	}
	
}
?>
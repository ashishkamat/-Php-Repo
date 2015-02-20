<?php
	include('../Helper.php');
$db = new Database();
$db->connect();
$db->select('product_details'); 
$res = $db->getResult();
print_r($res);
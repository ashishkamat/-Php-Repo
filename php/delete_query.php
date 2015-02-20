<?php
include('Helper.php');
	$product_id=$_REQUEST['delete'];
 
$helper->delete("product_details","product_id='$product_id'");
	header('Location:trialvp.php');
?>
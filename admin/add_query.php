<?php
include('../Helper.php');
	$product_name=$_REQUEST['product_name'];
	$price=$_REQUEST['price'];
	$image_name=$_REQUEST['image_name'];
	$description=$_REQUEST['description'];

  if ($_FILES["image_path"]["error"] > 0)
  {
     echo "<font size = '5'><font color=\"#e31919\">Error: NO CHOSEN FILE <br />";
     echo"<p><font size = '5'><font color=\"#e31919\">INSERT TO DATABASE FAILED";
   }
   else
   {
	$uploaddir="uploads/";
     move_uploaded_file($_FILES["image_path"]["tmp_name"],"$uploaddir" . $_FILES["image_path"]["name"]);
     echo"<font size = '5'><font color=\"#0CF44A\">SAVED<br>";
	}
     $file="$uploaddir".$_FILES["image_path"]["name"];
	 
$helper->insert("product_details","product_name,price,image_name,image_path,description","'$product_name','$price','$image_name','$file','$description'");
	
?>

<!DOCTYPE html>
<html>
<head>
<style>

table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
	color:white;
}
th, td {
    padding: 12px;
}
#header {
    background-color:black;
    color:white;
     text-align:center;
    padding:5px;
}

#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:800px;
    width:100px;
    float:left;
    padding:5px;
		
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}


.semi-transparent-button {
  display: block;
  box-sizing: border-box;
 
  padding: 8px;
  width: 80%;
  max-width: 200px;
  background: #fff; /* fallback color for old browsers */
  background: rgba(255, 255, 255, 0.5);
  border-radius: 8px;
  color:grey;
  
  text-decoration: none;
  letter-spacing: 1px;
  transition: all 0.3s ease-out;
}
.semi-transparent-button:hover,
.semi-transparent-button:focus,
.semi-transparent-button:active {
  background: #fff;
  color: #000;
  transition: all 0.5s ease-in;
}
.semi-transparent:focus {
  outline: none;
}

.is-blue {
  background: #1e348e; /* fallback color for old browsers */
  background: rgba(30, 52, 142, 0.5);
}
.is-blue:hover,
.is-blue:focus,
.is-blue:active {
  background: #1e348e; /* fallback color for old browsers */
  background: rgb(30, 52, 142);
  color: #fff;
}

.with-border {
  border: 1px solid #fff;
}

a{
	color:white;
	text-decoration:none;
}
.a_new{
	color:black;
	text-decoration:none;
}
</style>
</head>


<body>
<div id="header">
<table style="width:100%">
  <tr>
	<td><h2 style="color:white"><A href="url">HOME</A></h2></td>
    <td><h2><a href="url1"> View Product </a></h2></td>
	
   	<td><h2><a href="url2"> Add/Update Product</a></h2></td>
	
	<td><h2><a href="url3"> Logout</a></h2></td>
	
  
    		

  </tr>
</table>
</div>
<h2>
<form style="text-align:center" action="add_query.php" enctype="multipart/form-data" method="post">
<div id="add_product">
<pre>
<b>Product Name: </b><input type="text" name="product_name" id="pn" /></br>
<b>Price:  </b>      <input type="text" name="price" id="price" /></br>
<b>Image Name: </b>  <input type="text" name="image_name" id="in" /></br>
<b>Image Path: </b>  <input type="file" name="image_path"></br>
<b>Description: </b> <textarea name="description" rows="10" cols="30"></textarea></br>
<input type="submit" value="Add/Update" />  <button type="button" onclick="admin_home.php">Cancel</button>
<pre>
</div>

</form>
</h2>

</body>
</html>


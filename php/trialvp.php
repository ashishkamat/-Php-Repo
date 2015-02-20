<!DOCTYPE html>
<html>

<head>
		<script type="text/javascript">
				function delete_product(value)
				{
				alert(value);
				window.location="delete_query.php?delete="+value;
				}
				function add_product(value)
				{
				alert(value);
				window.location="add_to_cart.php?add="+value;
				}
				/*function call()
				{
					alert("Hello");
				}*/
		
		</script>
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
.ab{
color:black;
size: 15;
}

</style>
</head>

<body onload=call();>

<div id="header">
<table style="width:100%">
  <tr>
	<td><h2 style="color:white"><A href="AdminHome.html">HOME</A></h2></td>
    <td><h2><a href="url1"> Customer Support</a></h2></td>
	
   	<td><h2><a href="url2"> About Us</a></h2></td>
	
	<td><h2><a href="url3"> Sign IN</a></h2></td>		

  </tr>
</table>
</div>
<div id="nav">
<a href="url1" class="a_new"><h2><b>Sign UP</h2></a><br>

<a class="semi-transparent-button" href="url4"> CART </a><br/>

<a class="semi-transparent-button" href="url4"> ADD </a><br/>

		
						
 <a class="semi-transparent-button" href="update_query.php"> UPDATE </a><br/>


</div>
			
			
			<div id="content" >
		
						<style>
						table, th, td {
						    
							border: 1px solid black;
							border-collapse: collapse;
						}
						th, td {
 							   padding: 5px;
    						   text-align: left;
                               }
                               
						</style>
						
						<?php 
						echo "<table align='center' width=90% >";
						
						?>
					<!--  	<col width="80">
                        <col width="60">
                        <col width="30">
                        <col width="80">
                        <col width="30">
                        <col width="10"> 
						-->
						<tr>
   						    <th width="80" class="ab">Image</th>
    						<th width="60" class="ab">Product Name</th>
    						<th width="30" class="ab">Price</th>
   						    <th width="80" class="ab">Description</th>
    						<th width="30" class="ab">Product ID</th>
    						<th width="10" class="ab">Select</th>
    						<br/>
 					    </tr>
 				
						<?php  
						include "Helper.php";

				$result=$helper->read_all("*","product_details");
				
					if(is_array($result))
					{
						foreach($result as $row)
						{
							$product_id=$row['product_id'];
							
						
							
							?>
						
								<td width="" class="ab"><img src='<?=$row["image_path"]?>' width=150px height=150px></td> <!-- columns can have both text and images -->
								<td width="60" class="ab"><b><?=$row['product_name'] ?></b></td>
						    	<td width="30" class="ab"><?=$row['price'] ?>              </td>
								<td width="80" class="ab"><?=$row['description'] ?>        </td>
								<td width="30" class="ab"><?=$row['product_id'] ?>         </td>
								<td width="80" class="ab">
                           
						   
						   <input type="button" value="DELETE" onClick='delete_product("<?=$row['product_id'] ?>")'/>
						    <input type="button" value="ADD TO CART" onClick='add_product("<?=$row['product_id'] ?>")'/>
                                </td>
									
				            </tr>
					   
					    <?php     
						}
						echo "</table>";
					}
					?>
			</div>
		
			
<div id="footer">
Copyright © ALM_E-COM@cybage.com
</div>

</body>
</html>
			

























<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="pers.adapter.java.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="jsFile/jquery-3.3.1.min.js"></script>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:750px;
    width:150px;
    float:left;
    padding:5px;	      
}
#section {
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
   
.product{ 
	background:white;
	width:200px; 
	height300px;  
	float:left;
	padding:5px;
	text-align:center;
} 

img{ 
	width:150px; 
	height:150px; 
	border:2px solid green; 
}  
</style>
<title>商城</title>
</head>
<body>

	<div id="header">
	<h1>大力商城</h1>
	</div>

	<div id="nav">
		<br>
		<h3 id = "goProductList" title="商品">ProductList </h3><br>
		<h3 id = "goShopCart" title="购物车">ShopCart</h3><br>
	</div>

<script type="text/javascript"> 

function setSession(pName, pPath, pPrice)
{
	var myForm=document.createElement("form")
	myForm.method = "post";
	myForm.action = "Purchase";
	myForm.style.display = "none";
   	var myInput1 = document.createElement("input");
   	myInput1.name= "pName";
   	myInput1.value = pName;
   	myForm.appendChild(myInput1);
   	var myInput2 = document.createElement("input");
   	myInput2.name= "pPath";
   	myInput2.value = pPath;
   	myForm.appendChild(myInput2);
   	var myInput3 = document.createElement("input");
   	myInput3.name= "pPrice";
   	myInput3.value= pPrice;
   	myForm.appendChild(myInput3);
	document.body.appendChild(myForm);
	myForm.submit();
	return myForm;
}
	
	
$(function(){ 
	$("#m1Btn").click(function(){ 
		setSession("C++习题集", "Images//000001.png", "70");
	});
	$("#m2Btn").click(function(){  
		setSession("Java开发实例", "Images//000002.png", "90");
	});
	 
	$("#CheckOutBtn").click(function(){  
	    
	});
})


</script>

	<div id="productList" class="section">
		<div class="product">
			<img src="Images//000001.png" alt="" />
			<p>商品名称：C++习题集</p>
			<p>商品价格：70元</p>
			<input type="button" name="m1" value="加入购物车" id="m1Btn">
		</div>
		<div class="product">
			<img src="Images//000002.png" alt="" />
			<p>商品名称：Java开发实例</p>
			<p>商品价格：90元</p>
			<input type="button" name="m2" value="加入购物车" id="m2Btn">
  		</div>
	</div>
	
	<div id="shopCart" class="section" style="display:none">
		<p>欢迎来到购物车</p> 
		<%  
			ArrayList<ProductInfo> productList = null;
			ArrayList<ProductInfo> proLinkList = null;
			try
			{
				productList = (ArrayList<ProductInfo>)request.getSession().getAttribute("MyGoods");
				proLinkList = (ArrayList<ProductInfo>)request.getSession().getAttribute("MyLinkGoods");
			}
			finally
			{	
				if (productList!=null)
				{
					for (ProductInfo product:productList)
					{
						String proName = "";
						if (product.getPName()!=null)
							 proName = new String(product.getPName().getBytes("ISO-8859-1"), "utf-8");
						out.println(proName+";"+
								product.getPic_Path()+";"+
								product.getP_Price()+";"+
								product.getPMount()+"<br>");
					}
					for (ProductInfo product:proLinkList)
					{
						String proName = "";
						if (product.getPName()!=null)
							 proName = new String(product.getPName().getBytes("ISO-8859-1"), "utf-8");
						out.println(proName+";"+
								product.getPic_Path()+";"+
								product.getP_Price()+";"+
								product.getPMount()+"<br>");
					}
				}
			}
		%>
		
		<input type="button" name="checkOut" value="结算" id="CheckOutBtn">
	</div>

	<div id="footer">
		欢迎来到大力商城
	</div>
	
<script type="text/javascript">  
$(function(){  
     $("#goProductList").click(function(){  
    	 goToProductList();
        });
     $("#goProductList").mouseover(function(){  
            this.className = "浏览商品";
        });
     $("#goProductList").mouseout(function(){  
           this.className = "";
       });
     }); 
     
$(function(){  
    $("#goShopCart").click(function(){  
    	goToShopCart();
       });
    $("#goShopCart").mouseover(function(){  
           this.className = "进入购物车";
       });
    $("#goShopCart").mouseout(function(){  
          this.className = "";
      });
    }); 
        
 function goToProductList(){  
	 $("#productList").show();
	 $("#shopCart").hide();
  } 
 
 function goToShopCart(){  
	 $("#productList").hide();
	 $("#shopCart").show();
  }
</script>

</body>
</html>
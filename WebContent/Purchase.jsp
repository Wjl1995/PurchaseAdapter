<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="pers.adapter.java.*"%> 
<%@ page  import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>结算完毕</title>
</head>
<body>

	<p>
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
				for (ProductInfo product:productList)
				{
					out.println(new String(product.getPName().getBytes("ISO-8859-1"), "utf-8")+";"+
							product.getPic_Path()+";"+
							product.getP_Price()+"<br>");
				}
				for (ProductInfo product:proLinkList)
				{
					out.println(product.getPName()+";"+
							product.getPic_Path()+";"+
							product.getP_Price()+"br");
				}
			}
		%>
	</p>
	
</body>
</html>
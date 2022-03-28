<%@page import="day1.Product"%>
<%@page import="java.util.List"%>
<%@page import="day1.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table{
		width:70%;margin:auto;border-collapse: collapse;
	}
	caption {
		text-align: right;font-size: 0.8em;
	}
	td,th{
		border : 1px solid gray;text-align: center;padding: 7px 4px;
	}
	th{
		background-color: tomato;color:white;
	}
</style>
<meta charset="UTF-8">
<title>product_list</title>
</head>
<body>
<%
	ProductDao dao = ProductDao.getproductDao();
	List<Product> list = dao.selectAll();
%>
	<h3>TBL_PRODCUT 테이블 데이터</h3>
	<table>
		<tr>
			<th>상품코드 </th>
			<th>카테고리 </th>
			<th>상품명 </th>
			<th>가격 </th>
		</tr>
		<%
		for(int i=0; i<list.size();i++){
			Product product = list.get(i);
			%>
			<tr>
				<td><%=product.getPcode() %></td>
				<td><%=product.getCategory() %></td>
				<td><%=product.getPname() %></td>
				<td><%=product.getPrice() %></td>
			</tr>
			<% 
		}
		%>
	</table>
</body>
</html>
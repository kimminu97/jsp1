<%@page import="day2.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="day2.dao.HrdProblemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<ul>
	
	<%
	out.print("<script>alert('조회가 완료되었습니다.')");
	out.print("</script>");
	
	HrdProblemDao dao = HrdProblemDao.getHrdProblemDao();
	List<SaleSum> sales=dao.selectSale();
	for(int i=0;i<sales.size();i++){
	//	out.print(sales.get(i));	//테스트용
	//	out.print("<br>");
	%>
	<li><%=sales.get(i).getCustNo() %></li>
	<li><%=sales.get(i).getCustName() %></li>
	<li><%=sales.get(i).getGrade() %></li>
	<li style="padding-bottom:20px"><%=sales.get(i).getSum() %></li>
	<%
	}
	
	%>
</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="a.jsp">a.jsp url 요청</a> <br>
	<a href="b.jsp">b.jsp url 요청</a><br>
	<a href="forward_test.jsp">C.jsp url 요청</a><br>
	<a href="forward_test.jsp?name=momo">C.jsp url 요청</a><br>
	<%
		session.setAttribute("sdata", "sana"); //session 객체에 애트리뷰트 데이터 저장
		application.setAttribute("adata", "나연");
	%>
</body>
</html>
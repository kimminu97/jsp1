<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Array"%>
<%@page import="day2.vo.MemberReg_Test"%>
<%@page import="day2.dao.MemberReg_TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- memberReg.html에서 입력한 7개의 사용자 입력값을 전달받아 table태그에 출력 -->
<%
	//method='post' 방식으로 데이터 전달되었을때는 반드시 UTF-8방식으로 설정
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String email=request.getParameter("email");
	String age=request.getParameter("age");		//프론트에서 유효성검사를 했다는 조건
	String addr=request.getParameter("addr");
	String gender=request.getParameter("gender");
	String[] hobby=request.getParameterValues("hobby");
	//hobby는 배열 -> getparametervalues() 메소드로 데이터받음 -> 변수타임 String[]
	String hobbyS = Arrays.toString(hobby);
	hobbyS= hobbyS.substring(1,hobbyS.length()-1);
	//tostring은 []표시하므로 []빼고 추출
	MemberReg_Test vo = new MemberReg_Test(name,password,email,age,addr,gender,hobbyS);
	MemberReg_TestDao dao=MemberReg_TestDao.getMemberRegDao();
	dao.insert(vo);
%>
<table>
	<tr>
		<th>이름</th>
		<td><%=name %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%=password %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=email %></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><%=age %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=addr %></tdh>
	</tr>
	<tr>
		<th>성별</th>
		<td><%=gender.equals("male")? "남성":"여성" %></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%
				for(int i=0; i<hobby.length;i++){
					%>
					<%=hobby[i] %>
					<%
				}
			%></td>
	</tr>
</table>
</body>
</html>
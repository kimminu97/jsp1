<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
<div class="wrap_container">
  <header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </header>
   <!-- top.jsp를 include -->
    <%@ include file="top.jsp" %>
	 <section>
            <h2 style="text-align: center;" class="section"><strong>회원목록조회/수정</strong></h2>
            <table style="width: 90%;margin: auto;text-align: center;"> 
                <tr style="text-align: center;">    
                    <th>번호</th>       
                    <th>이름</th>
                    <th>연락처</th>
                    <th>주소</th>
                    <th>가입일자</th>
                    <th>등급</th>
                    <th>거주지역</th>
                </tr>
            <%
				//테이블의 데이터 모두 가져오기
				Object temp2=request.getAttribute("list");
				List<HrdMember> list = (List<HrdMember>)temp2;
			%>
				
			<%
				for(int i=0;i<list.size();i++){
			%>
				<tr> 
					<td > <a style="color: blue;" href="update.jsp?custno=<%= list.get(i).getCustNo()%>">
					:<%=list.get(i).getCustNo() %></a> 
					</td>
					<td><%=list.get(i).getCustName()%></td>
					<td><%=list.get(i).getPhone() %></td>
					<td><%=list.get(i).getAddress()%></td>
					<td><%=list.get(i).getJoinDate()%></td>
					<td><%
						String temp=list.get(i).getGrade();
						switch(temp){
						case"A": 
							out.print("VIP");
							break;
						case"B":
							out.print("일반");
							break;
						case"C":
							out.print("직원");
							break;
						}
					%></td>
					<td><%=list.get(i).getCity()%></td>
				</tr>
			<%
				}
			%>					
              	
            </table>
        </section>
    <footer>
        <p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
    </footer>
    </div>
</body>
</html>
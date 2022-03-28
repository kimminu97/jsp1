<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2 request test</title>
</head>
<body>
	<!-- post_test.html에서 사용자가 데이터 입력후 submit 실행 후 url : 
				http://localhost:8081/jsp_1/day3/request_test.jsp
				query string이 없습니다.(개발자도구 f12 - 네트워크 탭- ctrl+r - url 선택 - payload-form data
				request_test.jsp 에서는 위의 데이터를 전달 받습니다. 
				method는 form의 입력값을 전달하는 방식을 결정  
					form태그에서 method설정 없으면 기본이 "get" : 쿼리 스트링으로 입력값 전달(데이터 조회할때 전달)
								사용자 요청의 url 인코딩 기본이 utf-8
								url에 사용자 입력값이 보입니다.
								form태그 사용 외에도 a태그 href 속성값에 url로 전달 가능
					method "post":  form data로 입력값 전달(데이터 저장)
								이때 form data 인코딩은 직접 설정이 필요합니다.
								url에 사용자 입력값이 없습니다.	
								
			*get 과 post 방식의 주요한 차이는 
			- 보낼수 있는 데이터의 크기 제한이 다릅니다. get은 글자수 2000자 정도(브라우저 마다 다름)
			  post는 2MB 정도  
			- get으로 보낸 요청은 캐쉬 됩니다.
				-->
	<%
		request.setCharacterEncoding("UTF-8");	//method='post'에서는 꼭 필요
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		//String data3 = request.getParameter("data3");
		
		out.print("사용자 입력값 출력 테스트");	/* out도 jsp의 내장객체 */
		out.print("<br>data1=");
		out.print(data1);
		out.print("<br>data2=");
		out.print(data2);
		out.print("<br>data3=");
		//out.print(data3);	//post_test.html 입력요소 중에 name이 'data3' 없습니다. null
		
		
		
		/* 결론 : 사용자 입력오류는 제거하기위해 1) 프론트단에서 자바스크립트로 유효성 검사
									2) 서버단에서 try~catch로 처리하기*/
	%>
</body>
</html>
<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//테이블의 데이터 모두 가져오기
	HrdMemberDao dao =HrdMemberDao.getInstance();
	List<HrdMember> list = dao.selectAll();

	request.setAttribute("list", list);
	pageContext.forward("4_memberlist.jsp");
%>
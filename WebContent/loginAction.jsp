<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	
	<%
		UserDAO userDao = new UserDAO();
		int result = userDao.login(user.getUserID(), user.getUserPassword());
		if(result == 1) {
			out.println("<script>");
			out.println("location.href = 'main.jsp'");
			out.println("</script>");
		}
		else if(result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		else if(result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		else if(result == -2) {
			out.println("<script>");
			out.println("alert('데이터베이스 오류가 발생했습니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
	%>
</body>
</html>
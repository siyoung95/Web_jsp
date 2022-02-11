<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 게시글의 데이터를 DB에 저장하는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	
	<%
		String userID = null;
				
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			out.println("<script>");
			out.println("alert('로그인을 하세요.')");
			out.println("location.href = 'login.jsp'");
			out.println("</script>");
		} 
		/*  */
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0) {
			out.println("<script>");
			out.println("alert('유효하지 않은 글입니다.')");
			out.println("location.href = 'bbs.jsp'");
			out.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) {
			out.println("<script>");
			out.println("alert('권한이 없습니다.')");
			out.println("location.href = 'bbs.jsp'");
			out.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.delete(bbsID);
				if(result == -1) {
					out.println("<script>");
					out.println("alert('글 삭제에 실패했습니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {	
					out.println("<script>");
					out.println("location.href = 'bbs.jsp'");
					out.println("</script>");
				}
			}
		%>
</body>
</html>
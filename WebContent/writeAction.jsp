<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- 게시글의 데이터를 DB에 저장하는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
		} else {
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				out.println("<script>");
				out.println("alert('입력이 안된 사항이 있습니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1) {
					out.println("<script>");
					out.println("alert('글쓰기에 실패했습니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {	
					out.println("<script>");
					out.println("location.href = 'bbs.jsp'");
					out.println("</script>");
					}
				}
			}
		%>
</body>
</html>
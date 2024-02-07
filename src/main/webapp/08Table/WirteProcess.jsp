<%@ page import="com.model1.board.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>

<%
    String num = request.getParameter("num");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setNum(num);

    BoardDAO dao = new BoardDAO();
    int affected = dao.insertWrite(dto);

    dao.close();

    if (iResult == 1) {
        response.sendRedirect("List.jsp");
    }


%>
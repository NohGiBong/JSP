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
    int affected = dao.updateEdit(dto);

    dao.close();

    if(iresult == 1 ) {
        response.sendRedirect("View.jsp?num=" + dto.getNum());
    } else { // 실패
        utils.JSFunction.alertBack("수정 실패", out);
    }

%>

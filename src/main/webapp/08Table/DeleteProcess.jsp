<%@ page import="com.model1.board.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>

<%
    String num = request.getParameter("num");

    BoardDTO dto = new BoardDTO();

    BoardDAO dao = new BoardDAO();
    dto = dao.selectView(num);  //

    // 세션 로그인 ID
    String sessionId = session.getAttribute("UserId").toString();

    int delResult = 0;
    if(sessionId.equals(dto.getId())){
        dto.setNum(num);
        delResult = dao.deleteView(dto);
        dao.close();

        if(delResult == 1){
            utils.JSFunction.alertBack("삭제 되었습니다.", "List.jsp", out);
        } else {
            utils.JSFunction.alertBack("삭제 실패", out);
        }
    } else {
        // 작성자 본인이 아니면 삭제 안 됨
        utils.JSFunction.alertBack("본인만 삭제 가능", out);
    }




%>

<%@ page import="com.model1.board.BoardDAO" %>
<%@ page import="com.model1.board.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="IsLoggedIn.jsp"%>

<%
    String num = request.getParameter("num");
    BoardDTO dto = new BoardDTO();
    BoardDAO dao = new BoardDAO();
    dto = dao.selectView(num); //해당 게시글 가져오기
    //세션 로그인 ID
    String sessionId = session.getAttribute("UserId").toString();
    int delResult = 0;
    if(sessionId.equals(dto.getId())){
        dto.setNum(num);
        delResult = dao.deletePost(dto);
        dao.close();
        if(delResult == 1){
            JSFunction.alertLocation("삭제 되었습니다.", "List.jsp", out);
        }else {
            JSFunction.alertBack("삭제 실패", out);
        }
    }else {
        //작성자 본인이 아니면 삭제 안됨
        JSFunction.alertBack("본인만 삭제 가능", out);
    }
%>

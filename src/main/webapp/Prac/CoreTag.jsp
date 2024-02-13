<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.common.Person" %>
<%@ page import="com.common.DancingQueen" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Who?</title>
</head>
<body>

    <c:set var="AAAA" value="1577" />
    <c:set var="BBBB" value="${(AAAA * 10) / 2}" />
    <c:set var="CCCC" value="<%= new Date() %>" />
    <c:set var="DDDD" value="닫는 거 보단 이게 편함" />

    <h2>변수에 저장된 값 그대로 출력</h2>
    ${AAAA} <br/>
    ${BBBB} <br/>
    <fmt:formatDate value="${CCCC}" type="date" pattern="yyyy년 MM월 dd일 HH시 mm분" /><br/>
    ${DDDD} <br/>

    <h2>생성자 만들기</h2>
    <%
        String str1 = "누군가";
        String str2 = "죽었어";
    %>

    <c:set var="asdf" value="<%= new DancingQueen(str1, str2)%>" scope="request" /> <%--미리 만들어둔 java 파일에서 끌어옴. 자바빈즈--%>

    ${requestScope.asdf.who} <br/>
    ${requestScope.asdf.what} <br/>

    <h2>List로 값 입력</h2>
    <%
        ArrayList<DancingQueen> somelist = new ArrayList<>();
        somelist.add(new DancingQueen("걔", "살았어"));
        somelist.add(new DancingQueen("쟤", "죽다 살았어"));
    %>
    <c:set var="somelist" value="<%= somelist %>" scope="request" />

    ${requestScope.somelist[0].who} <br/>
    ${requestScope.somelist[0].what} <br/>
    ${requestScope.somelist[1].who} <br/>
    ${requestScope.somelist[1].what} <br/>


    <h4>forEach로 간단하게 출력하고 if 써보기</h4>


    <c:forEach var="item" items="${somelist}">
            ${item.who} <br/>
            ${item.what} <br/>
    </c:forEach>

</body>
</html>

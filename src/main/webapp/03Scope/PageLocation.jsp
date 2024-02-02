<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.common.Person" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>page 영역</title>
</head>
<body>
    <h2>이동 후 page 영역의 속성값 읽기</h2>
    <%
        Object pageInteger = pageContext.getAttribute("pageInteger");
        Object pageString = pageContext.getAttribute("pageString");
        Object pagePerson = pageContext.getAttribute("pagePerson");
    %>

    <ul>
        <li> Integer 객체 : <%= (pageInteger == null) ? "값 없음" : pageInteger %></li>
        <li> String 객체 : <%= (pageString == null)? "값 없음" : pageString %></li>
        <li> Person 객체 : <%= (pagePerson == null)? "값 없음" : ((Person)pagePerson).getName() %> </li>
    </ul>
</body>
</html>
</body>
</html>
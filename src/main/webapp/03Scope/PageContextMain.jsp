<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.common.Person" %>
<%
    pageContext.setAttribute("pageInteger", 1000);
    pageContext.setAttribute("pageString", "페이지 영역의 문자열");
    pageContext.setAttribute("pagePerson", new Person("이순신", 100));
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>page 영역</title>
</head>
<body>
    <h2>page 영역의 속성값 읽기</h2>
    <%
        int pageInteger = (Integer) pageContext.getAttribute("pageInteger");
        String pageString = (String) pageContext.getAttribute("pageString").toString();
        Person pagePerson = (Person) pageContext.getAttribute("pagePerson");
    %>
    <ul>
        <li>pageInteger : <%= pageInteger %></li>
        <li>pageString : <%= pageString %></li>
        <li>pagePerson : <%= pagePerson.getName() %>, <%= pagePerson.getAge() %></li>
    </ul>

    <h2>include된 파일에서 page 영역 읽어오기</h2>
    <%@ include file= "PageInclude.jsp" %>

    <h2>페이지 이동 후 page 영역에서 읽어오기</h2>
    <a href = "PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>

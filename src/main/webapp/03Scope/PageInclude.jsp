<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.common.Person" %>
<h4>Include 페이지</h4>
<%
    int pageInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
    // String pageString2 = (String) pageContext.getAttribute("pageString").toString();
    Person pagePerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>
    <li>Integer 객체 : <%= pageInteger2 %></li>
    <li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
    <li>Person 객체 : <%= pagePerson2.getName() %>, <%= pagePerson2.getAge() %></li>
</ul>

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html>
</body>
</html>
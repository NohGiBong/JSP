<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.common.Person" %>
<%
    request.setAttribute("requestString", "request 영역의 문자열");
    request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>request 영역</title>
</head>
<body>
    <h2>request 영역의 속성값 삭제하기</h2>
    <%
        request.removeAttribute("requestString");
        request.removeAttribute("requestInteger"); // 없는 값을 삭제하려 시도해도 오류 나지 않음
    %>
    <h2>request 영역의 속성값 읽기</h2>
    <%
        Person rPerson = (Person) request.getAttribute("requestPerson");
    %>
    <ul>
        <li>String  : <%= request.getAttribute("requestString") %></li>
        <li>Person  : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
    </ul>
    <h2>포워드 된 페이지에서 request 영역 속성값 읽기</h2>
    <%
        request.getRequestDispatcher(
                "RequestForward.jsp?paramHan=한글&paramEng=English")
        .forward(request, response);
    %>
</body>
</html>

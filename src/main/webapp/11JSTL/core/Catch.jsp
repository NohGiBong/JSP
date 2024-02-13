<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%
    int num1 = 100;
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Catch</title>
</head>
<body>
    <h2>자바 코드에서의 예외</h2>

    <c:catch var="eMsg">
        <%
            int result = num1/0;
        %>
    </c:catch>
    예외 내용 : ${eMsg}

    <h2>EL에서의 예외</h2>
    <c:set var="num2" value="200" />
    <c:catch var="eMsg">
        ${"일" + num2}
    </c:catch>
    예외 내용 : ${eMsg}

</body>
</html>

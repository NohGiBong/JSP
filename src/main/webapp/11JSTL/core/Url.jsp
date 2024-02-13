<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <%--response 내장객체 sendRedirect와 동일하게 페이지 이동 처리--%>
    <meta charset="UTF-8">
    <title>JSTL - url</title>
</head>
<body>
    <c:set var="requestVar" value="MustHave" scope="request" />
    <%--<c:url value="OtherPage.jsp" var="url">
        <c:param name="user_param1" value="Must" />
        <c:param name="user_param2">Have</c:param>
    </c:url>
    <a href="${url}">OtherPage.jsp 바로가기</a>--%>

    <c:url value="OtherPage.jsp" var="url" />
    <form action="${url}" method="POST">
        <input type="hidden" name="user_param1" value="Must" />
        <input type="hidden" name="user_param2" value="Have" />
        <button type="submit">OtherPage.jsp 바로가기</button>
    </form>

</body>
</html>

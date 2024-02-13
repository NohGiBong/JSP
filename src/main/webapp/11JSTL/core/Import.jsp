<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - import</title>
</head>
<body>
    <%--외부 파일을 현재 위치에 삽입할 때 사용--%>
    <c:set var="requestVar" value="MustHave" scope="request"/>
    <c:import url="OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP"/>
        <c:param name="user_param2" value="기본서"/>
    </c:import>

    <h2>다른 문서 삽입하기</h2>
    ${contents}

    <h2>외부 자원 삽입하기</h2>
    <iframe src="GoldPage.jsp" style="width: 100%; height: 600px;"></iframe>
</body>
</html>

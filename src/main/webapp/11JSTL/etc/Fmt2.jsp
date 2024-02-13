<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - fmt 2</title>
</head>
<body>
    <c:set var="today" value="<%= new java.util.Date()%>" />

    <h2>날짜 포맷</h2>
    full: <fmt:formatDate value="${today}" type="date" dateStyle="full" /> <br/>
    short: <fmt:formatDate value="${today}" type="date" dateStyle="short" /> <br/>
    long: <fmt:formatDate value="${today}" type="date" dateStyle="long" /> <br/>
    default: <fmt:formatDate value="${today}" type="date" dateStyle="default" /> <br/>

    <h2>시간 포맷</h2>
    full: <fmt:formatDate value="${today}" type="time" timeStyle="full" /> <br/>
    short: <fmt:formatDate value="${today}" type="time" timeStyle="short" /> <br/>
    long: <fmt:formatDate value="${today}" type="time" timeStyle="long" /> <br/>
    default: <fmt:formatDate value="${today}" type="time" timeStyle="default" /> <br/>


    <h2>날짜/시간 표시</h2>
    <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full" />
    <br/>
    <fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss" />

    <h2>타임존 설정</h2>
    <fmt:timeZone value="GMT">
        <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full" />
        <br/>
    </fmt:timeZone>
    <fmt:timeZone value="America/Chicago">
        <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full" />
    </fmt:timeZone>
</body>
</html>

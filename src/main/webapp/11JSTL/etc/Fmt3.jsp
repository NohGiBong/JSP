<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - fmt 3</title>
</head>
<body>
  <h2>로케일 설정</h2>
  <c:set var="today" value="<%= new java.util.Date() %>" />

    한글로 설정 : <fmt:setLocale value="ko_kr" />
  <fmt:formatNumber value="10000" type="currency" />
  <fmt:formatDate value="${today}" /> <br/>

    일어로 설정 : <fmt:setLocale value="ja_jp" />
  <fmt:formatNumber value="10000" type="currency" />
  <fmt:formatDate value="${today}" /> <br/>

  영어로 설정 : <fmt:setLocale value="en_US" />
  <fmt:formatNumber value="10000" type="currency" />
  <fmt:formatDate value="${today}" /> <br/>

</body>
</html>

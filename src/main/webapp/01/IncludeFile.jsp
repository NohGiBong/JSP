<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>

<html>
<head>
    <title>page 지시어 - import 속성</title>
</head>
<body>
<%
    LocalDateTime today = LocalDateTime.now(); // 오늘 날짜
    LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); // 내일 날짜
%>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - Exception</title>
</head>
<body>
    <%
        //response 내장 객체에서 에러코드 가져옴
        int status = response.getStatus();
        System.out.println(status);

        if (status == 404) {
            out.print("404 에러가 발생");
            out.print("<br/> 파일 경로를 확인하세요.");
        } else if (status == 405) {
            out.print("405 에러가 발생");
            out.print("<br/> 요청 방식을 확인하세요.");
        } else if (status == 500) {
            out.print("500 에러가 발생");
            out.print("<br/> 소스 코드를 확인하세요.");
        }
    %>
</body>
</html>

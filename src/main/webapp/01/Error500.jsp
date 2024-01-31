



<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE>
<html lang="en">
<head>
    <title>지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
    <%
        try {
            int Age = Integer.parseInt(request.getParameter("age")) + 10; // 에러 발생
            out.println("10년 후 당신의 나이는 " + Age + "입니다."); // 실행되지 않음
        }
        catch (Exception e) {
            out.println("예외 발생 : 매개변수 age가 null입니다.");
        }
    %>
</body>
</html>

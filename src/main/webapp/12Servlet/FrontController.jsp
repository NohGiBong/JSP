<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrontController</title>
</head>
<body>
    <h2>한 번의 매핑으로 여러 가지 요청 처리하기</h2>
    ${resultValue}
    <ol>
        <li>URI :  ${uri}</li>
        <li>요청명 : ${commandStr}</li>
    </ol>
    <ul>
        <li><a href="../12Servlet/regist.one">회원가입</a></li>
        <li><a href="../12Servlet/login.one">로그인</a></li>
        <li><a href="../12Servlet/freeboard.one">자유 게시판</a></li>
    </ul>
</body>
</html>

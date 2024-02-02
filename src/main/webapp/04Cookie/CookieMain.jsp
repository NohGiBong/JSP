<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%--
    쿠키는 웹사이트에 접속했을 때 사용자를 기억하는 수단
    쿠키는 처음 만들어진 시점에서 서버는 쿠키를 읽을 수 없다.

    name : 쿠키 이름
    value : 쿠키 값
    domain : 쿠키를 적용할 도메인
    path : 쿠키를 적용할 경로
    maxAge : 쿠키 유지기간(단위: 초) 하루 :86400

    name은 문자열을 입력하는데 , ; space = 포함 X
    path는 특정 경로 입력하면 그 하위 경로도 포함
    age를 설정 안 하면 브라우저 종료될 때 쿠키 만료된다.
    getAge age 설정 안 했을 때 -1 반환한다.
--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie</title>
</head>
<body>
    <h2>1. 쿠키(Cookie) 설정</h2>
    <%
        Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(3600);
        response.addCookie(cookie);
    %>

    <h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies!= null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                String cookieValue = c.getValue();
                out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
            }
        }
    %>

    <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
    <a href = "CookieResult.jsp">
        다음 페이지에서 쿠키값 확인하기
    </a>
</body>
</html>

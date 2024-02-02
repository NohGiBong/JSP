<%@ page import="java.util.Map" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>application 영역</title>
</head>
<body>
    <h2>application 영역의 공유</h2>
<%--
    웹 애플리케이션 당 하나의 application 객체 생성
    서버를 닫기 전까지 계속 유지된다.
    클라이언트가 요청하는 모든 페이지가 application 객체를 공유함
--%>
    <%
        // HashMap은 순서를 보장하지 않음. LinkedHashMap은 순서대로 출력
        Map<String, Person> maps = new LinkedHashMap<>();
        maps.put("actor1", new Person("제우스", 22));
        maps.put("actor2", new Person("오너", 23));
        maps.put("actor3", new Person("페이커", 28));
        maps.put("actor4", new Person("구마유시", 23));
        maps.put("actor5", new Person("케리아", 24));
        application.setAttribute("maps", maps);
    %>
    application 영역에 속성이 저장되었습니다.
</body>
</html>

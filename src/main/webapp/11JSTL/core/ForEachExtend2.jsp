<%@ page import="java.util.LinkedList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - forEach3</title>
</head>
<body>
    <h2>List 컬렉션</h2>
    <%
        LinkedList<Person> lists = new LinkedList<>();
        lists.add(new Person("맹사성", 34));
        lists.add(new Person("장영실", 44));
        lists.add(new Person("신숙주", 54));
    %>
    <c:set var="lists" value="<%= lists%>" />
    <c:forEach items="${lists}" var="list">
        <li>
            이름 : ${list.name}, 나이 : ${list.age}
        </li>
    </c:forEach>

    <h2>Map 켤렉션 사용하기</h2>
    <%
        Map<String, Person> maps = new HashMap<>();
        maps.put("1st", new Person("맹사성", 34));
        maps.put("2nd", new Person("장영실", 44));
        maps.put("3rd", new Person("신숙주", 54));
    %>
    <c:set var="maps" value="<%= maps%>"/>
    <c:forEach items="${maps}" var="map">
        <li>key => ${map.key} <br/>
            value => 이름 : ${map.value.name}, 나이 : ${map.value.age}
        </li>
    </c:forEach>
</body>
</html>

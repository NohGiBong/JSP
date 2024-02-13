<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Out</title>
</head>
<body>
  <%--표현식처럼 변수 출력할 때 사용--%>
  <%--null일 때 default 값이 출력된다--%>

  <c:set var="iTag">
    i 태그는 <i>기울임</i>을 표현합니다.
  </c:set>

  <h2>기본 사용</h2>
  <c:out value="${iTag}" />

  <h2>escapeXml 속성</h2>
  <%--특수문자를 변환할지 여부. 기본값은 true--%>
  <%--false로 지정 시 HTML 태그를 해석해 마크업이 적용된 상태로 출력된다.--%>
  <c:out value="${iTag}" escapeXml="flase" />

  <h2>default 속성</h2>
  <c:out value="${param.name}" default="이름 없음" />
  <c:out value="" default="빈 문자열도 값입니다." />
  <%--빈 칸을 넣는다고 null이 출력되지 않음. 내용이 없는 값, value를 넣어줘야 default 출력--%>
</body>
</html>

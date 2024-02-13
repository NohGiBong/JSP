<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - choose/when/otherwise</title>
</head>
<body>
    <%--변수 선언--%>
    <c:set var="number" value="100" />

    <%--다중 조건을 판단할 때 사용--%>
   <%-- <c:choose>
        <c:when test="조건1">조건 1을 만족하는 경우</c:when>
        <c:when test="조건2">조건 2을 만족하는 경우</c:when>
        <c:otherwise>아무 조건도 만족하지 않는 경우</c:otherwise> &lt;%&ndash;else &ndash;%&gt;
    </c:choose>
    --%>

    <h2>choose 태그로 홀짝 판단하기</h2>
    <c:choose>
        <c:when test="${number %2 ==0}" >
            ${number}는 짝수입니다.
        </c:when>
        <c:otherwise>
            ${number}는 홀수입니다.
        </c:otherwise>
    </c:choose>

    <h2>국영수 점수 입력하면 평균을 내어 학점 출력하기</h2>
    <form>
        국어: <input type="text" name="kor"><br/>
        영어: <input type="text" name="eng"><br/>
        수학: <input type="text" name="math"><br/>
        <input type="submit" value="학점 구하기">
    </form>

    <%--모든 과목 점수가 입력되었는지 확인--%>
    <c:if test="${!(empty param.kor or empty param.eng or empty param.math)}">
        <%--평균 계산--%>
        <c:set var="avg" value="${(param.kor + param.eng + param.math) / 3}"/>
        평균 점수는 ${avg} 이므로
        <c:choose>
            <c:when test="${avg>=90}">A학점</c:when>
            <c:when test="${avg>=90}">B학점</c:when>
            <c:when test="${avg>=90}">C학점</c:when>
            <c:when test="${avg>=90}">D학점</c:when>
            <c:otherwise>F학점</c:otherwise>
        </c:choose>


    </c:if>
</body>
</html>

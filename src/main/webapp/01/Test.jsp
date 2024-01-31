
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8"
%>
<%--
    <%@> 지시어
        >   JSP 페이지를 자바 코드로 변환하는데 필요한 정보를 JSP 엔진에 알려준다.
            보통 스크립트 언어, 인코딩 방식 설정
        page 지시어 : jsp 페이지에 대한 정보 설정.
        inclue 지시어 : 현재 페이지에 외부페이지를 포함시킨다.
        taglib 지시어 : 표현 언어에서 사용할 JSTL, 자바클래스를 선언한다.

        스크립트 요소는  JSP에서 자바코드를 사용할 수 있게 해준다.

    <%! %> 스크립트 요소(선언부)
        > 표현식이나, 스크립틀릿에서 사용할 멤버 변수, 메소드를 선언한다.
        서블릿으로 변환시에 _jspService() 메서드 외부에 선언된다.

    <%= %> 스크립트 요소(표현식)
        > JSP 페이지가 요청을 받아서 실행될 때 동작해야할 코드를 작성하는 영역
        _jspService() 내부에 기술한다.
        자바에서는 메소드 내부에 또 다른 메서드를 선언하는 게 불가능

    <% %> 스크립트 요소(스크립틀릿)
        > 실행 결과로 하나의 값이 남는 문장
        상수, 변수, 수식, 메서드 변환값

--%>
<html>
<head>
    <title>Hello JSP</title>
    <%!
        String str1 = "JSP";
        String str2 = "안녕하세요";
    %>
</head>
<body>
    <h2>처음만드는 <%= str1%></h2>
    <p>
        <%
            out.println(str2 + " " + str1 + "입니다. 열심히 공부합시다.");
        %>
    </p>
</body>
</html>

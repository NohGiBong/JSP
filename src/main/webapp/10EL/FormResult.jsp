<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - 폼 값 출력</title>
</head>
<body>
    <h2>EL로 폼값 받기</h2>
    <ul>
        <li>이름 : ${param.name}</li>
        <li>성별 : ${param.gender}</li>
        <li>학력 : ${param.grade}</li>
        <li>관심사 : ${paramValues.inter[0]}
            ${paramValues.inger[1]}
            ${paramValues.inger[2]}
            ${paramValues.inger[3]}
        </li>
    </ul>
</body>
</html>

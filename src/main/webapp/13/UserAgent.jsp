<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <%
        String client = request.getHeader("User-Agent");
        out.println(client);
    %>

</body>
</html>

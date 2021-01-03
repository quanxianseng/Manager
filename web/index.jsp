<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/27 0027
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bank</title>
    <link rel="stylesheet" href="CSS/Interface.css" type="text/css">
</head>

<body>
<div id="interface" class="interface">
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <input id="firstinput" type="email" name="email" placeholder="输入邮箱账号" required><br>
        <input id="secondinput" type="password" name="password" placeholder="输入密码" required><br>
        <input id="thirdinput" type="submit" value="登录">
    </form>
</div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/29 0029
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .bodymain {
            width: 1859px;
            height: 1000px;
            background: rgba(138, 199, 234, 1.00);
        }

        .search {
            height: 630px;
            width: 400px;
            background: rgba(0, 0, 0, 0.30);
            top: 20%;
            left: 40%;
            line-height: 100px;
            position: absolute;
        }

        .headlogin {
            height: 50px;
            align-content: center;
            text-align: center;
            font-size: 30px;
            color: antiquewhite;
            font-family: "黑体";
        }

        .headlogin1 {
            height: 50px;
            align-content: center;
            text-align: center;
            font-size: 30px;
            color: antiquewhite;
            font-family: "黑体";
        }

        .search form {
            height: 450px;
            width: 400px;
            margin: 0;
            padding: 0px;
        }

        .email {
            border: none;
            outline: none;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            float: left;
            display: block;
            margin: 30px 0 40px 30px;
        }

        .password {
            border: none;
            outline: none;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 30px 0px 40px 30px;
        }

        .regist {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 30px 0px 40px 30px;
        }

        .return {
            height: 10px;
            width: 400px;
            margin-top: 23px;
            color: antiquewhite;
        }

        .regist:hover {
            background: rgba(138, 199, 234, 1.00);
        }

    </style>
</head>
<body>
<div class="bodymain">
    <div class=search>
        <div class="headlogin">银行信息管理系统</div>
        <div class="headlogin1">用户注册页面</div>
        <form action="${pageContext.request.contextPath}/registerServlet" method="post">
            <input class="email" type="text" name="email" placeholder="请输入账号">
            <input class="password" type="password" name="password" placeholder="请输入密码">
            <input class="regist" type="submit" value="确定"><br>
            <span>${msg}</span>

        </form>
        <div class="return">
            <a href="UserLoginFrame.jsp">返回用户登录页面</a>
        </div>
    </div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/29 0029
  Time: 15:36
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

        .headuser {
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

        .count {
            border: none;
            outline: none;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            float: left;
            display: block;
            margin: 50px 0 60px 30px;
        }

        .pass {
            border: none;
            outline: none;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 50px 0px 60px 30px;
        }

        .login {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 50px 0px 60px 30px;
        }

        .return {
            height: 10px;
            width: 400px;
            margin-top: 20px;
            color: antiquewhite;
        }

        .login:hover {
            background: rgba(138, 199, 234, 1.00);
        }
    </style>
</head>
<body>
<div class="bodymain">
    <div class=search>
        <div class="headlogin">银行信息管理系统</div>
        <div class="headuser">用户登录界面</div>
        <form action="" method="post">
            <input class="count" type="email" name="email" placeholder="输入邮箱账号" required><br>
            <input class="pass" type="password" name="password" placeholder="输入密码" required><br>
            <input class="login" type="submit" value="登录">
        </form>
    </div>
</div>
</body>
</html>
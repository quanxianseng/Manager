<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/29 0029
  Time: 14:45
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
            height: 660px;
            width: 400px;
            background: rgba(0, 0, 0, 0.30);
            top: 20%;
            left: 40%;
            line-height: 100px;
            position: absolute;
            box-shadow: 1px 1px 10px black;
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
            height: 500px;
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

        .check {
            border: none;
            outline: none;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: -55px 0px 40px 30px;
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
            position: relative;
            top: -30px;
            margin-top: 20px;
            color: antiquewhite;
        }

        .login:hover {
            background: rgba(138, 199, 234, 1.00);
        }
    </style>
    <script type="text/javascript">
        //切换验证码
        function refreshCode() {
            //1.获取验证码图片对象
            const vcode = document.getElementById("vcode");
            //2.设置其src属性，加时间戳
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time=" + new Date().getTime();
        }
    </script>
</head>
<body>
<div class="bodymain">
    <div class="search">
        <div class="headlogin">银行信息管理系统</div>
        <div class="headuser">用户登录界面</div>
        <form action="${pageContext.request.contextPath}/loginServlet" method="post">
            <input class="count" type="email" name="email" placeholder="输入邮箱账号" required><br>
            <input class="pass" type="password" name="password" placeholder="输入密码" required><br>
            <a href="javascript:refreshCode();" style="height: 0px; position: absolute;top: 320px;left: 30px">
                <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode">
            </a>
            <input class="check" type="text" name="verifycode" id="verifycode" placeholder="请输入验证码"/>
            <input class="login" type="submit" value="登录">
        </form>

        <div class="return">
            <a href="Register.jsp">没有账号，免费注册</a>
            <a href="GeneralFrame.jsp" style="float: right">返回登录主页面</a>
        </div>
    </div>
</div>
</body>
</html>
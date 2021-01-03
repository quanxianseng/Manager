<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/29 0029
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        .klog {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 100px 0px 60px 30px;
        }

        .klog:hover {
            background: rgba(138, 199, 234, 1.00);
        }

        .mlog {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 50px 0px 60px 30px;
        }

        .mlog:hover {
            background: rgba(138, 199, 234, 1.00);
        }
    </style>
</head>
<body>
<div class="bodymain">
    <div class=search>
        <div class="headlogin">银行信息管理系统</div>
        <div class="headuser">登录页面</div>
        <form>
            <a href="UserLoginFrame.jsp">
                <input class="klog" type="button" value="用户登录"></a>
            <a href="${pageContext.request.contextPath}/ManagerOperationServlet">
                <input class="mlog" type="button" value="管理员登录"></a>
        </form>
    </div>
</div>
</body>
</html>
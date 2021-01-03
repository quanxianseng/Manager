<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2020/12/31 0031
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        function redirect() {
            $.ajax({
                url: "http://localhost:8080/bank_war_exploded/ManagerOperationServlet",
                type: "post",
                sync: true,
                success: function () {
                    alert("删除成功");
                },
                error: function () {
                    alert("删除失败");
                }
            })


        }
    </script>
    <style type="text/css">
        .contain-table {
            text-align: center;
            width: auto;
            border: 1px solid black;
        }

        .contain-table .td5 {
            height: 30px;
            width: 300px;
        }

        .contain-table .td5 .input5 {
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;

            width: 50px;
            background-color: #ff735b;
            border: 1px solid black;
            font-weight: bolder;
        }

        .contain-table .td5 .input5:hover {
            color: white;
        }

        .title > table .td5 a {
            text-decoration: none;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            font-size: 22px;
            border: 1px solid black;
            margin: 10px;
            color: black;
            font-family: 华文楷体;
            font-weight: bolder;
        }
    </style>
</head>
<body>


<div style="float: left;margin-left: 200px">


    <table class="contain-table" border="1px solid red" cellpadding="0" cellspacing="0">
        <tr>
            <th>编号</th>
            <th>储户账号</th>
            <th>操作时间</th>
            <th>操作内容</th>
        </tr>
        <c:forEach var="i" items="${msg}" varStatus="status">

            <form action="" method="post">
                <tr>
                    <td class="td1">
                            ${status.count}
                    </td>
                    <td class="td1" id="t1">
                            ${i.email}
                    </td>
                    <td class="td2" id="t2">
                            ${i.time}
                    </td>
                    <td class="td3" id="t3">
                            ${i.operation}
                    </td>
                </tr>
            </form>

        </c:forEach>
    </table>


</div>
<div style="float: right;margin-right: 100px">


    <table class="contain-table" border="1px solid red" cellpadding="0" cellspacing="0">
        <tr>
            <th>编号</th>
            <th>储户邮箱</th>
            <th>账户金额</th>
            <th>注销储户</th>
        </tr>
        <c:forEach var="j" items="${card}" varStatus="status">
            <form action="${pageContext.request.contextPath}/DeleteServlet" method="post">
                <tr>
                    <td class="td1" id="td1">
                            ${status.count}
                    </td>
                    <td class="td2" id="td2">
                        <input type="text" name="email" value="${j.email}" readonly>
                    </td>
                    <td>
                            ${j.money}
                    </td>
                    <td class="td5" id="td5">

                        <input class="input5" type="submit" value="删除" onclick="redirect()"/>

                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>


</div>
</body>
</html>

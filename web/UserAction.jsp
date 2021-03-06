<%--
  Created by IntelliJ IDEA.
  User: 全先森
  Date: 2021/1/2 0002
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户存取钱转账界面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function save() {
            /*var id = document.getElementById("operation");
            id.style.display = "block";*/
            $("#operation").slideDown(1000);
        }

        function withdraw() {
           /* var id = document.getElementById("WithDrawoperation");
            id.style.display = "block";*/
            $("#WithDrawoperation").slideDown(1000);
        }

        function trans() {
            /*var id = document.getElementById("Transoperation");
            id.style.display = "block";*/
            $("#Transoperation").slideDown(1000);
        }

        function SaveExit() {
           /* var xx = document.getElementById("operation");
            xx.style.display = "none";*/
            $("#operation").slideUp(1000);
        }

        function WithDrawExit() {
           /* var xx = document.getElementById("WithDrawoperation");
            xx.style.display = "none";*/
            $("#WithDrawoperation").slideUp(1000);
        }

        function TransExit() {
            /*var xx = document.getElementById("Transoperation");
            xx.style.display = "none";*/
            $("#Transoperation").slideUp(1000);
        }

    </script>
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

        .save {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 100px 0px 60px 30px;
        }

        .save:hover {
            background: rgba(138, 199, 234, 1.00);
        }

        .withdraw {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 50px 0px 60px 30px;
        }


        .withdraw:hover {
            background: rgba(138, 199, 234, 1.00);
        }

        .trans {
            line-height: normal;
            height: 50px;
            width: 340px;
            font-size: 1rem;
            border-radius: 8px 8px 8px 8px;
            display: block;
            margin: 50px 0px 60px 30px;
        }

        .trans:hover {
            background: rgba(138, 199, 234, 1.00);
        }

        .return {
            height: 10px;
            width: 400px;
            position: relative;
            top: -30px;
            margin-top: 20px;
            color: antiquewhite;
        }

        #operation {
            width: 200px;
            height: 200px;
            margin-left: 630px;
            margin-top: 340px;
            position: absolute;
            display: none;
        }

        #operation form input {
            width: 200px;
            margin-left: 75px;
            margin-top: 60px;
        }

        .bodymain #operation .exit {
            float: right;
            margin-right: 15px;
            font-size: 22px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        #WithDrawoperation {
            width: 200px;
            height: 200px;
            margin-left: 630px;
            margin-top: 340px;
            position: absolute;
            display: none;
        }

        #WithDrawoperation form input {
            width: 200px;
            margin-left: 75px;
            margin-top: 60px;
        }


        .bodymain #WithDrawoperation .exit {
            float: right;
            margin-right: 15px;
            font-size: 22px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        #Transoperation {
            width: 200px;
            height: 200px;
            margin-left: 630px;
            margin-top: 340px;
            position: absolute;
            display: none;
        }

        #Transoperation form input {
            width: 200px;
            margin-left: 75px;
            margin-top: 45px;
        }


        .bodymain #Transoperation .exit {
            float: right;
            margin-right: 15px;
            font-size: 22px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        .search span {
            margin: 150px;
        }

        .search input {
            margin-top: 20px;
        }

        .search .return {
            margin-left: 288px;
        }

    </style>
</head>
<body>
<div class="bodymain">
    <div class=search>
        <div class="headlogin">银行信息管理系统</div>
        <div class="headuser">操作页面</div>
        <!-- <a href="SaveMoney.html">-->
        <span>用户余额${money}</span>
        <input class="save" type="button" value="存钱" onclick="save()"/><!--</a>-->

        <!-- <a href="WithDrawMoney.html">-->
        <input class="withdraw" type="button" value="取款" onclick="withdraw()"/><!--</a>-->

        <!--<a href="TransMoney.html">-->
        <input class="trans" type="button" value="转账" onclick="trans()"><!--</a>-->

        <div class="return">
            <a href="GeneralFrame.jsp">返回主登陆界面</a>
        </div>
    </div>

    <div id="operation" style="background-color:darkgrey;border-radius: 10px;width: 350px;height: 300px">
        <form action="/bank_war_exploded/SaveMoneyServlet" method="post">
            <div class="SaveOperation" style="text-align: center">存钱操作
                <span class="exit" id="exit" onclick="SaveExit()">+</span>
            </div>

            <input type="text" name="money" placeholder="存入钱金额" required><br>
            <input type="submit" value="确定">
        </form>
    </div>

    <div id="WithDrawoperation" style="background-color:darkgrey;border-radius: 10px;width: 350px;height: 300px">
        <form action="/bank_war_exploded/WithDrawServlet" method="post">
            <div class="" style="text-align: center">取钱操作
                <span class="exit" id="exit" onclick="WithDrawExit()">+</span>
            </div>
            <input type="text" name="money" placeholder="取出钱金额" required><br>
            <input type="submit" value="确定">
        </form>
    </div>

    <div id="Transoperation" style="background-color:darkgrey;border-radius: 10px;width: 350px;height: 300px">
        <form action="/bank_war_exploded/TransServlet" method="post">
            <div class="" style="text-align: center">转账操作
                <span class="exit" id="exit" onclick="TransExit()">+</span>
            </div>
            <input type="text" name="transemail" placeholder="转账邮箱" required><br>
            <input type="text" name="transmoney" placeholder="转账钱目" required><br>
            <input type="submit" value="确定">
        </form>
    </div>
</div>
</body>
</html>

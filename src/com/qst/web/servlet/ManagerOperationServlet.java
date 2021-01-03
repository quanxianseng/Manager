package com.qst.web.servlet;

import com.qst.bean.Card;
import com.qst.bean.Message;
import com.qst.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManagerOperationServlet")
public class ManagerOperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        System.out.println("123");
        request.setCharacterEncoding("utf-8");
        //2.获取数据库数据
        List<Card> list1 = null;
        List<Message> list2 = null;

        //3.连接数据库
        UserDao dao = new UserDao();
        list1 = dao.getCardMessage();
        list2 = dao.getMessage();

        request.setAttribute("card", list1);

        request.setAttribute("msg", list2);

        request.getRequestDispatcher("Manager.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

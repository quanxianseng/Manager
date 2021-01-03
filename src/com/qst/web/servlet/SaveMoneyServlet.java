package com.qst.web.servlet;

import com.qst.bean.Card;
import com.qst.bean.Message;
import com.qst.bean.User;
import com.qst.dao.Dao;
import com.qst.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/SaveMoneyServlet")
public class SaveMoneyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String money = request.getParameter("money");
        Date time = new Date();
        UserDao dao = new UserDao();
        dao.update(user.getEmail(), Integer.parseInt(money));
        session.setAttribute("money",Integer.parseInt(money)+(Integer) session.getAttribute("money"));
        dao.Message(user.getEmail(), time, "存了" + money + "元钱");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print("<script type='text/javascript'>");
        out.print("alert('存钱成功!');");
        out.print("window.location='" + request.getContextPath() + "/UserAction.jsp';");
        out.print("</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

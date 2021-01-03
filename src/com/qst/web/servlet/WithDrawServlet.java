package com.qst.web.servlet;

import com.qst.bean.User;
import com.qst.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/WithDrawServlet")
public class WithDrawServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String money = request.getParameter("money");
        Date time = new Date();
        UserDao dao = new UserDao();
        try {
            dao.WithDrawMoney(user.getEmail(), Integer.parseInt(money));
            session.setAttribute("money",(Integer)session.getAttribute("money")-Integer.parseInt(money));
            dao.Message(user.getEmail(), time, "取了" + money + "元钱");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'>");
            out.print("alert('取钱成功!');");
            out.print("window.location='" + request.getContextPath() + "/UserAction.jsp';");
            out.print("</script>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

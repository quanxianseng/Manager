package com.qst.web.servlet;

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
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/TransServlet")
public class TransServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String transemail = request.getParameter("transemail");
        String transmoney = request.getParameter("transmoney");
        int nenwM = Integer.parseInt(transmoney);
        Date time = new Date();
        UserDao dao = new UserDao();
        int temp = dao.OldMoney(user.getEmail());

            if (temp > nenwM) {
                try {
                    Dao.save("update cards set money = ? where email = ?",temp-nenwM,user.getEmail());
                    Dao.save("update cards set money = ? where email = ?",dao.OldMoney(transemail)+nenwM,transemail);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                System.out.println("hhhh"+dao.OldMoney(transemail));
                session.setAttribute("money",(Integer)session.getAttribute("money")-Integer.parseInt(transmoney));
                dao.Message(user.getEmail(), time, "向" + transemail + "转账" + transmoney + "元钱");
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                System.out.println("ssssss52512215");
                out.print("<script type='text/javascript'>");
                out.print("alert('转账成功!');");
                out.print("window.location='" + request.getContextPath() + "/UserAction.jsp';");
                out.print("</script>");
            } else {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.print("<script type='text/javascript'>");
                out.print("alert('余额不足!');");
                out.print("window.location='" + request.getContextPath() + "/UserAction.jsp';");
                out.print("</script>");

            }

        //dao.update(transemail, Integer.parseInt(transmoney));


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

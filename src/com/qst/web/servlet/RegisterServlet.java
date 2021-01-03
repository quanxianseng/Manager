package com.qst.web.servlet;

import com.qst.bean.User;
import com.qst.dao.UserDao;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email);
        User user = new User(email, password);
        UserDao dao = new UserDao();
        if (dao.findEmail(email)) {
            request.setAttribute("msg", "邮箱已存在");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            //写入数据库
            dao.Register(user);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'>");
            out.print("alert('注册成功!');");
            out.print("window.location='" + request.getContextPath() + "/UserLoginFrame.jsp';");
            out.print("</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.qst.web.servlet;

import com.qst.bean.Card;
import com.qst.bean.Message;
import com.qst.bean.User;
import com.qst.dao.UserDao;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.设置编码
        req.setCharacterEncoding("utf-8");
        /*//2.获取请求参数
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        //3.封装user对象
        User Loginuser = new User();
        Loginuser.setEmail(email);
        Loginuser.setPassword(password);*/

        //2.获取所有请求参数
        //2.1获取用户填写验证码
        String verifycode = req.getParameter("verifycode");
        Map<String, String[]> map = req.getParameterMap();
        //3.验证码校验
        HttpSession session1 = req.getSession();
        String checkcode_server = (String) session1.getAttribute("CHECKCODE_SERVER");
        if (!checkcode_server.equalsIgnoreCase(verifycode)) {
            //验证码不正确
            //提示信息
            req.setAttribute("login_msg", "验证码错误!");
            //跳转登陆页面
            req.getRequestDispatcher("/UserLoginFrame.jsp").forward(req, resp);
            return;
        }
        //4.创建User对象
        User loginUser = new User();
        try {
            BeanUtils.populate(loginUser, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用UserDao的Login方法
        UserDao dao = new UserDao();
        User user = dao.Login(loginUser);
        //5.判断user
        if (user == null) {
            //登录失败
            /*  req.getRequestDispatcher("/failServlet").forward(req, resp);*/
            //设置编码
            resp.setContentType("text/html;charset=utf-8");
            //获取用户填写
            PrintWriter out = resp.getWriter();
            out.print("<script type='text/javascript'>");
            out.print("alert('登陆失败，邮箱账号或者密码错误!');");
            out.print("window.location='" + req.getContextPath() + "/UserLoginFrame.jsp';");
            out.print("</script>");
        } else {
            //登录成功
            //存储数据
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            int money = dao.OldMoney(user.getEmail());
            session.setAttribute("money",money);
            //转发
//            req.getRequestDispatcher("/successServlet").forward(req,resp);
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.print("<script type='text/javascript'>");
            out.print("alert('登陆成功!');");
            out.print("window.location='" + req.getContextPath() + "/UserAction.jsp';");
            out.print("</script>");

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}

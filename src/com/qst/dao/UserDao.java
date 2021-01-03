package com.qst.dao;

import com.qst.bean.Card;
import com.qst.bean.Message;
import com.qst.bean.User;
import com.qst.utils.DBUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 操作数据库中users表的类
 */
public class UserDao {
    //声明JDBCTemplate对象共用
    private JdbcTemplate template = new JdbcTemplate(DBUtils.getDataSource());

    /**
     * 登录方法
     *
     * @param LoginUser
     * @return user包含用户全部数据, 没有查询到，返回null
     */
    public User Login(User LoginUser) {
        try {
            //1.编写sql
            String sql = "select * from users where email = ? and password = ?";
            //2.调用方法
            List<User> user = Dao.getList(User.class, sql, LoginUser.getEmail(), LoginUser.getPassword());
            if (user.size() == 0)
                return null;
            return user.get(0);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 用户注册的方法
     *
     * @param UserRegister
     */
    public void Register(User UserRegister) {

        String sql = "insert into users (email,password) values (?,?)";
        try {
            Dao.save(sql, UserRegister.getEmail(), UserRegister.getPassword());
            sql = "insert into cards (email,money) values (?,?)";
            Dao.save(sql, UserRegister.getEmail(), 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 这是判断用户名重复的方法
     *
     * @param email
     * @return
     */
    public boolean findEmail(String email) {
        String sql = "select * from users where email=?";
        List<User> list = Dao.getList(User.class, sql, email);
        System.out.println(list);
        return list.size() > 0;
    }

    /**
     * 这是用来获取用户存取钱，钱数变化之前的钱
     *
     * @param email
     * @return
     */
    public int OldMoney(String email) {
        //1.定义sql
        String sql = "select money from cards where email = ?";
        Dao dao = new Dao();
        List<Card> list = dao.getList(Card.class, sql, email);
        return list.get(0).getMoney();
    }

    /**
     * 这是用户存钱的方法
     */
    public void update(String email, int money) {
        //1.定义sql
        String sql = "update cards set money = ? where email = ?";
        Dao dao = new Dao();
        UserDao Dao = new UserDao();
        int oldMoney = Dao.OldMoney(email);
        int newMoney = oldMoney + money;
        System.out.println(newMoney+" "+oldMoney);
        try {
            dao.save(sql, newMoney, email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 这是储户取钱的方法
     *
     * @param email
     * @param money
     * @throws SQLException
     */
    public void WithDrawMoney(String email, int money) throws SQLException {
        String sql = "update cards set money = ? where email = ?";
        if (OldMoney(email) - money >= 0) {
            Dao dao = new Dao();
            UserDao Dao = new UserDao();
            int oldMoney = Dao.OldMoney(email);
            int newMoney = oldMoney - money;
            dao.save(sql, newMoney, email);
        } else {
            System.out.println("账户余额不足");
        }
    }

    /**
     * 这是形成管理员查询日志表的方法
     * @param email
     * @param time
     * @param operation
     */
    public void Message(String email, Date time, String operation) {
        String sql = "insert into manager (email,time,operation) values (?,?,?)";
        Dao dao = new Dao();
        try {
            dao.save(sql, email, time, operation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 管理员根据输入对应已有储户的邮箱账号删除储户所有相关信息
     *
     * @param email
     * @return
     */
    public void delete(String email) {
        //1.定义sql
        String sql = "delete from users where email = ?";
        String sql2 = "delete from cards where email = ?";
        String sql3 = "delete from manager where email = ?";

        try {
            Dao.save(sql, email);
            Dao.save(sql2, email);
            Dao.save(sql3, email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库card表内的内容形成管理员日志
     *
     * @return
     */
    public List<Card> getCardMessage() {
        String sql = "select * from cards";
        ArrayList<Card> al;
        al = (ArrayList<Card>) Dao.getList(Card.class, sql);
        return al;
    }

    /**
     * 获取manager表内的内容形成管理员日志
     *
     * @return
     */
    public List<Message> getMessage() {
        String sql = "select email,time,operation from manager";
        ArrayList<Message> arrayList;
        arrayList = (ArrayList<Message>) Dao.getList(Message.class, sql);
        return arrayList;
    }

    /**
     * 这是储户转账的方法
     * @param email
     * @param transemail
     * @param money
     */
    public void TransMoney(String email,String transemail,Integer money){
        UserDao dao = new UserDao();
        try {
            dao.WithDrawMoney(email,money);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dao.update(transemail,-money);
    }
}

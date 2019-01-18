package cqkj.mcg.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil
{
    private static String url = null;
    private static String user = null;
    private static String pwd = null;

    static Connection con = null;
    static PreparedStatement st = null;
    static ResultSet rs = null;

    static
    {
        Properties ps = new Properties();
        try
        {
            ps.load(DBUtil.class.getClassLoader().getResourceAsStream("mcgorcl.properties"));
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        url = ps.getProperty(url);
        user = ps.getProperty(user);
        pwd = ps.getProperty(pwd);
    }

    /**
     * 加载数据库，建立连接
     * 
     * @throws ClassNotFoundException
     * @throws SQLException
     * 
     * @throws Exception
     */
    public static Connection startjdbc() throws Exception
    {

        // 1.加载数据库驱动
        Class.forName("oracle.jdbc.OracleDriver");

        // 2.数据库连接
        /**
         * 1.IP地址 localhost/127.0.0.1， 端口号 1521
         * 2.数据库名称 orcl
         * 3.用户名，密码 mcg 888888
         */
        con = DriverManager.getConnection(url, user, pwd);

        return con;
    }

    /**
     * 释放资源
     */
    public static void overjdbc()
    {
        // 释放资源
        if (rs != null)
        {
            try
            {
                rs.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            rs = null;
        }
        if (st != null)
        {
            try
            {
                st.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            st = null;
        }
        if (con != null)
        {
            try
            {
                con.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }

            con = null;
        }
    }
}

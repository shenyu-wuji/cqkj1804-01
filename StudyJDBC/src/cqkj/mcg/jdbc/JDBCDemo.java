package cqkj.mcg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBCDemo
{

    public static void main(String[] args)
    {

        Demo d1 = new Demo();
        try
        {
            //d1.select();
            //d1.inputmessage("尼禄", 19, "女", "003");
            d1.select();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            d1.overjdbc();
        }
        /*try
        {
            // 1.加载数据库驱动
            Class.forName("oracle.jdbc.OracleDriver");
        
            // 2.数据库连接
            *//**
               * 1.IP地址 localhost/127.0.0.1， 端口号 1521
               * 2.数据库名称 orcl
               * 3.用户名，密码 mcg 888888
               *//*
                con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "mcg", "888888");
                
                // 3.创建Statement对象(执行SQL命令)
                st = con.createStatement();
                
                // 4.执行SQL命令
                rs = st.executeQuery("select * from student s where s.stuage >18");
                
                // 读取结果集中的数据
                while (rs.next())
                {
                 // rs.get...(列的索引或列的名称)
                 System.out.print(rs.getInt(1) + ",");
                 System.out.print(rs.getString(2));
                 System.out.print(rs.getNString("stuage")); // 列名不区分大小写
                
                 System.out.println("");
                }
                
                // 数据的增删改
                st.executeQuery("");
                
                }
                catch (Exception e)
                {
                e.printStackTrace();
                }
                finally
                {
                overjdbc();
                }*/

    }
}

class Demo
{
    static Connection con = null;
    static PreparedStatement st = null;
    static ResultSet rs = null;

    public Demo()
    {
        startjdbc();
    }

    /**
     * 向数据库添加数据
     * 
     * @param name
     *            学生姓名
     * @param age
     *            学生年龄
     * @param sex
     *            性别
     * @param stuno
     *            学号
     * @throws SQLException
     */
    void inputmessage(String name, int age, String sex, String stuno) throws SQLException
    {
        st =con.prepareStatement( "insert into student (stuid,stuname,stuage,stusex,stuno) values(seq001.nextval,?,?,?,?)");
        st.setString(1, name);
        st.setInt(2, age);
        st.setString(3, sex);
        st.setString(4, stuno);
        
        st.executeUpdate();                           
    }                          

    /**
     * 查询数据库
     * @throws SQLException
     */
    @SuppressWarnings("resource")
    void select() throws SQLException
    {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("请输入要查找的学号：");
        String no = sc.nextLine();
        st = con.prepareStatement("select * from student s where s.stuname like ?");
        st.setString(1, no);
        
        rs = st.executeQuery();
        // 读取结果集中的数据
        while (rs.next())
        {
         // rs.get...(列的索引或列的名称)
         System.out.print(rs.getInt(1) + ",");
         System.out.print(rs.getString(2));
         System.out.print(rs.getString(3));
         System.out.print(rs.getNString("stuage")); // 列名不区分大小写
        
         System.out.println("");
        }
    }
    /**
     * 加载数据库，建立连接，创建Statement对象
     */
    void startjdbc()
    {
        try
        {
            // 1.加载数据库驱动
            Class.forName("oracle.jdbc.OracleDriver");

            // 2.数据库连接
            /**
             * 1.IP地址 localhost/127.0.0.1， 端口号 1521
             * 2.数据库名称 orcl
             * 3.用户名，密码 mcg 888888
             */
            con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "mcg", "888888");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * 释放资源
     */
    void overjdbc()
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

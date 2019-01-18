package cqkj.mcg.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class StudentDao
{
    private Connection con = null;
    private PreparedStatement st = null;
    private ResultSet rs = null;

    /**
     * 向数据库添加数据
     * 
     * @param stu
     *            学生对象
     * @return 0：添加失败，1：添加成功
     */
    public int insert(Student stu)
    {
        int rows = 0;

        // SQL语句
        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement(
                    "insert into student (stuid,stuname,stuage,stusex,stuno) values(seq001.nextval,?,?,?,?)");
            st.setString(1, stu.getStuName());
            st.setInt(2, stu.getStuAge());
            st.setString(3, stu.getStuSex());
            st.setString(4, stu.getStuNo());

            // 执行sql语句
            rows = st.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.overjdbc();
        }

        return rows;
    }

    /**
     * 删除数据
     * 
     * @param stuid
     *            学生ID
     * @return 0：删除失败，1：删除成功
     */
    public int delete(int stuid)
    {
        int rows = 0;

        // sql语句
        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("delete from student where stuid = ?");
            st.setInt(1, stuid);

            // 执行sql语句
            rows = st.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.overjdbc();
        }

        return rows;
    }

    /**
     * 从数据库查询数据
     * 
     * @param stuid
     *            学生ID
     * @return 查询到的学生对象,为null代表未查到
     */
    public Student selectById(int stuid)
    {
        // 创建学生对象
        Student s = null;

        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("select * from student s where s.stuid = ?");
            st.setInt(1, stuid);

            // 执行sql语句
            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                s = new Student();
                s.setStuId(rs.getInt(1));
                s.setStuNo(rs.getString(2));
                s.setStuName(rs.getString(3));
                s.setStuAge(rs.getInt(4));
                s.setStuSex(rs.getString(5));
                break;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        finally
        {
            DBUtil.overjdbc();
        }

        // 返回所查学生对象
        return s;
    }

    /**
     * 从数据库查询学生表的全部信息
     * 
     * @return 学生表的所有学生信息的集合
     */
    public List<Student> selectAll()
    {
        // 定义学生集合
        ArrayList<Student> arr = new ArrayList<Student>();

        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("select * from student");

            // 执行sql语句
            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                arr.add(new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.overjdbc();
        }

        // 返回学生集合
        return arr;
    }

    /**
     * 分页查询
     * @param pageIndex   页码
     * @param pageSize    每页的大小
     * @return  学生信息集合
     */
    public List<Student> selectPaging(int pageIndex, int pageSize)
    {
        // 定义学生集合
        ArrayList<Student> arr = new ArrayList<Student>();

        try
        {
            con = DBUtil.startjdbc();

            st = con.prepareStatement(
                    "select stuId,stuNo,stuName,stuAge,stuSex "
                    + "from (select stuId,stuNo,stuName,stuAge,stuSex,rownum rw "
                    + "from (select stuId,stuNo,stuName,stuAge,stuSex from student order by stuname) st)"
                    + " where rw between ((? - 1) * ? + 1) and (? * ?)");
            st.setInt(1, pageIndex);
            st.setInt(2, pageSize);
            st.setInt(3, pageIndex);
            st.setInt(4, pageSize);

            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                arr.add(new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.overjdbc();
        }

        return arr;
    }

}

package cqkj.mcg.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cqkj.mcg.jdbc.DBUtil;

public class CourseDao
{

    private Connection con = null;
    private PreparedStatement st = null;
    private ResultSet rs = null;

    /**
     * 向课程表添加数据
     * @param cou  课程对象
     * @return 0：添加失败，1：添加成功
     */
    public int insert(Course cou)
    {
        int rows = 0;

        // SQL语句
        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement(
                    "insert into Course (cId,cNo,cName) values(seq002.nextval,?,?)");
            st.setString(1, cou.getcNo());
            st.setString(2, cou.getcName());

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
     * 从课程表删除数据
     * @param cid  课程ID
     * @return  0：删除失败，1：删除成功
     */
    public int delete(int cid)
    {
        int rows = 0;

        // sql语句
        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("delete from Course where cid = ?");
            st.setInt(1, cid);

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
     * 按ID从课程表查询信息
     * @param cid  课程ID
     * @return  返回查找到的课程对象，null代表未找到
     */
    public Course selectById(int cid)
    {
        // 创建课程对象
        Course cou = null;

        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("select cId,cNo,cName from Course c where c.cid = ?");
            st.setInt(1, cid);

            // 执行sql语句
            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                cou = new Course();
                cou.setcId(rs.getInt(1));
                cou.setcNo(rs.getString(2));
                cou.setcName(rs.getString(3));
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

        // 返回所查课程对象
        return cou;
    }

    /**
     * 从数据库查询课程表的所有信息
     * @return   课程表信息集合
     */
    public List<Course> selectAll()
    {
        // 定义课程集合
        ArrayList<Course> arr = new ArrayList<Course>();

        try
        {
            con = DBUtil.startjdbc();
            st = con.prepareStatement("select cId,cNo,cName from Course");

            // 执行sql语句
            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                arr.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3)));
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

        // 返回课程集合
        return arr;
    }

    /**
     * 分页查询
     * @param pageIndex   页码
     * @param pageSize    一页的大小
     * @return  返回课程信息集合
     */
    public List<Course> selectPaging(int pageIndex, int pageSize)
    {
        // 定义课程集合
        ArrayList<Course> arr = new ArrayList<Course>();

        try
        {
            con = DBUtil.startjdbc();

            st = con.prepareStatement(
                    "select cId,cNo,cName "
                    + "from (select cId,cNo,cName,rownum rw "
                    + "from (select cId,cNo,cName from Course order by cname) st)"
                    + " where rw between ((? - 1) * ? + 1) and (? * ?)");
            st.setInt(1, pageIndex);
            st.setInt(2, pageSize);
            st.setInt(3, pageIndex);
            st.setInt(4, pageSize);

            rs = st.executeQuery();

            // 读取结果集中的数据
            while (rs.next())
            {
                arr.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3)));
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

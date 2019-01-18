package com.cqkj.dao.impl.oracle;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourse;
import com.cqkj.bean.selTC;
import com.cqkj.dao.TCourseDao;

public class TCourseDaoImpl extends BaseDaoImpl<TCourse> implements TCourseDao
{
    /**
     * 模糊查询
     */
    @Override
    public void selectName(PageList<TCourse> pageList, String name) throws Exception
    {
        String sql = "select * from TCourse";

        // 模糊查询，如果查询文本框有内容就按内容模糊查询
        if (!(name == null || name.isEmpty()))
        {
            sql += " where cName like ?";
            selectByPage(TCourse.class, sql, pageList, "%" + name + "%");
        }
        else
        {
            selectByPage(TCourse.class, sql, pageList);
        }
    }

    /**
     * 按课程编号查询
     */
    @Override
    public boolean selectBycNo(String cNo) throws Exception
    {
        String sql = "select count(1) from TCourse where cNo = ?";

        int flag = Integer.parseInt(executeQueryObj(sql, cNo).toString());

        if (flag != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * 按学生ID查询未选课程
     */
    public List<TCourse> selectUnTC(int usersId) throws Exception
    {
        // 查询该学生有没有选课
        String sql = "select count(1) from usersInfo u join TSC on u.usersid = TSC.STUID  where u.usersid = ?";
        int flag = Integer.parseInt(executeQueryObj(sql, usersId).toString());

        // 如果选课就查询未选课程，未选课就查询全部课程
        if (flag != 0)
        {
            sql = "select * from TCourse where cid not in (select TSC.CID from usersInfo u join TSC on  u.usersid = TSC.STUID  where u.usersid = ?)";
            return selectAll(TCourse.class, sql, usersId);
        }
        else
        {
            return selectAll(TCourse.class);
        }
    }

    /**
     * 俩表连接，查询学生选课结果，课程信息和成绩
     */
    public void selectTCResult(selTC<TCourse> selTc, String usersId) throws Exception
    {
        if (usersId == null)
        {
            //查询所有选课信息
            String sql = "select c.cid,c.cno,c.cname,c.createDate,t.score,u.name from usersInfo u join TSC t on u.usersid = t.STUID join TCourse c on t.cid = c.cid";
            selectAll(TCourse.class, selTc, sql);
        }
        else
        {
            //按学生ID查询
            String sql = "select c.cid,c.cno,c.cname,c.createDate,t.score,t.scId from usersInfo u join TSC t on u.usersid = t.STUID join TCourse c on t.cid = c.cid where u.usersid = ?";
            selectAll(TCourse.class, selTc, sql, Integer.parseInt(usersId));
        }
        
    }

    /**
     * 俩表连接，查询结果，结果放在selTC中
     * 
     * @param c
     * @param selTc
     * @param sql
     * @param objs
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public void selectAll(Class<TCourse> c, selTC<TCourse> selTc, String sql, Object... objs) throws Exception
    {
        // 定义T类型的集合
        List<TCourse> lst = new ArrayList<TCourse>();

        // 拼接查询的列名
        Field[] fields = c.getDeclaredFields();

        // 执行查询
        executeQuery(sql, objs);

        // 读取查询结果
        while (rs.next())
        {
            // 根据类型对象，创建该类型的对象（该类型必须包含无参数的构造方法）
            TCourse obj = c.newInstance();

            for (Field f : fields)
            {
                f.setAccessible(true);
                // 通过字段对象，给字段对应的对象赋值值
                // 根据数据类型来获取表中的值，赋值给对象中的字段（保证数据类型一致）
                setFieldValue(f, obj);
            }

            lst.add(obj);
            selTc.getScore().add(rs.getObject(fields.length + 1));
            selTc.getForeign().add(rs.getObject(fields.length + 2));
        }

        selTc.setData(lst);
    }
}

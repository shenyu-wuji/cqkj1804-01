package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourse;
import com.cqkj.bean.selTC;
import com.cqkj.dao.TCourseDao;
import com.cqkj.dao.factory.DaoFactory;

public class TCourseService
{
    // 数据访问层对象
    TCourseDao tCourseDao = DaoFactory.<TCourseDao>createDao("TCourseDaoImpl");

    /**
     * 增，添加数据
     * 
     * @param cou
     * @return
     * @throws Exception
     */
    public int addTCourse(TCourse cou) throws Exception
    {
        return tCourseDao.insert(cou);
    }

    /**
     * 删，删除数据,物理删除
     * 
     * @param cId
     * @return
     * @throws Exception
     */
    public int delTCourse(int cId) throws Exception
    {
        TCourse cou = new TCourse();
        cou.setcId(cId);
        return tCourseDao.delete(cou);
    }

    /**
     * 改，更新数据
     * 
     * @param cou
     * @return
     * @throws Exception
     */
    public int updTCourse(TCourse cou) throws Exception
    {
        return tCourseDao.update(cou);
    }

    /**
     * 查询所有
     * 
     * @return
     */
    public List<TCourse> SelectAll()
    {
        try
        {
            return tCourseDao.selectAll(TCourse.class);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }

    }
    /**
     * 按照主键ID进行查询
     * @param cId
     * @return
     * @throws Exception
     */
    public TCourse selectById(int cId) throws Exception
    {
        TCourse cou = new TCourse();
        cou.setcId(cId);
        return tCourseDao.selectById(cou);
    }

    /**
     * 按查询框内容模糊查询
     * 
     * @param pageList
     * @throws Exception
     */
    public void selectName(PageList<TCourse> pageList,String name) throws Exception
    {
        tCourseDao.selectName(pageList,name);
    }
    /**
     * 按课程编号查询,检验用户名是否存在
     * @param cNo
     * @return
     * @throws Exception
     */
    public boolean selectBycNo(String cNo) throws Exception
    {
        return tCourseDao.selectBycNo(cNo);
    }

    /**
     * 按照学生ID查询该学生未选课程
     * @param usersId
     * @return
     * @throws Exception
     */
    public List<TCourse> selectUnTC(int usersId) throws Exception
    {
        return tCourseDao.selectUnTC(usersId);
    }
    /**
     * 按学生ID查询选课结果,结果课程信息和成绩存入selTC中
     * @param selTc
     * @param usersId
     * @throws Exception
     */
    public void selectTCResult(selTC<TCourse> selTc,String usersId) throws Exception
    {
        tCourseDao.selectTCResult(selTc,usersId);
    }

}

package com.cqkj.service;


import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourse;
import com.cqkj.bean.UsersInfo;
import com.cqkj.dao.UsersInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class UsersInfoService
{
    //数据访问层对象
    UsersInfoDao usersInfoDao = DaoFactory.<UsersInfoDao>createDao("UsersInfoDaoImpl");
    
    /**
     * 系统用户登录
     * @param loginName  用户名
     * @param loginPwd   用户密码
     * @return  用户对象
     * @throws Exception
     */
    public UsersInfo login(int role,String loginName,String loginPwd) throws Exception
    {
        return usersInfoDao.login(role,loginName, loginPwd);
    }
    /**
     * 添加用户
     * @param user  用户对象
     * @return
     * @throws Exception
     */
    public int AddUsersInfo(UsersInfo user) throws Exception
    {
        return usersInfoDao.insert(user);
    }
    /**
     * 物理删除数据
     * @param usersId
     * @return
     * @throws Exception
     */
    public int delUsersInfo(int usersId) throws Exception
    {
        UsersInfo ui = new UsersInfo();
        ui.setUsersId(usersId);
        return usersInfoDao.delete(ui);
    }
    /**
     * 逻辑删除
     * @param usersId
     * @return
     * @throws Exception
     */
    public int isDelUsersInfo(int usersId) throws Exception
    {
        UsersInfo ui = new UsersInfo();
        ui.setUsersId(usersId);
        return usersInfoDao.isDelete(ui);
    }
    /**
     * 更新编辑数据
     * @param usersId
     * @return
     * @throws Exception
     */
    public int updUsersInfo(UsersInfo user) throws Exception
    {
        return usersInfoDao.update(user);
    }
    /**
     * 查询所有数据
     * @return
     */
    public List<UsersInfo> SelectAll()
    {
        try
        {
            return usersInfoDao.selectAll(UsersInfo.class);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }

    }
    /**
     * 分页查询
     * @param pageList  
     * @throws Exception
     */
    public void selectPage(PageList<UsersInfo> pageList) throws Exception
    {
        usersInfoDao.selectPage(pageList);
    }
    /**
     *根据ID主键查询
     * @param usersId
     * @return
     * @throws Exception
     */
    public UsersInfo selectById(int usersId) throws Exception
    {
        UsersInfo ui = new UsersInfo();
        ui.setUsersId(usersId);
        return usersInfoDao.selectById(ui);
    }
    /**
     * 按用户名查询，检验用户名是否合理
     * @param loginName
     * @return
     * @throws Exception
     */
    public boolean selectByLoginName(String loginName) throws Exception
    {
        return usersInfoDao.selectByLoginName(loginName);
    }
    /**
     * 按用户类型，管理员，教师，学生查询对应对象
     * @param deptsCode
     * @return
     * @throws Exception
     */
    public List<UsersInfo> selectDeptsCode(String deptsCode) throws Exception
    {
        return usersInfoDao.selectDeptsCode(deptsCode);
    }
}

package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.DeptsInfo;
import com.cqkj.bean.PageList;
import com.cqkj.bean.UsersInfo;
import com.cqkj.dao.DeptsInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class DeptsInfoService
{
    // 数据访问层对象
    DeptsInfoDao deptsInfoDao = DaoFactory.<DeptsInfoDao>createDao("DeptsInfoDaoImpl");

    /**
     * 添加数据
     * @param di
     * @return
     * @throws Exception
     */
    public int AddUsersInfo(DeptsInfo di) throws Exception
    {
        return deptsInfoDao.insert(di);
    }
    /**
     * 查询所有数据
     * 
     * @return
     */
    public List<DeptsInfo> SelectAll()
    {
        try
        {
            return deptsInfoDao.selectAll(DeptsInfo.class);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 逻辑删除
     * @param deptsId
     * @return
     * @throws Exception
     */
    public int delDeptsInfo(int deptsId) throws Exception
    {
        DeptsInfo deptsInfo = new DeptsInfo();
        deptsInfo.setDeptsId(deptsId);
        return deptsInfoDao.delete(deptsInfo);
    }
    /**
     * 更新编辑数据
     * @param ui
     * @return
     * @throws Exception
     */
    public int updDeptsInfo(DeptsInfo ui) throws Exception
    {
        return deptsInfoDao.update(ui);
    }
    /**
     * 分页查询
     * @param pageList
     * @throws Exception
     */
    public void selectPage(PageList<DeptsInfo> pageList) throws Exception
    {
        deptsInfoDao.selectPage(pageList);
    }
    /**
     * 根据主键ID查询
     * @param deptsId
     * @return
     * @throws Exception
     */
    public DeptsInfo selectById(int deptsId) throws Exception
    {
        DeptsInfo deptsInfo = new DeptsInfo();
        deptsInfo.setDeptsId(deptsId);
        return deptsInfoDao.selectById(deptsInfo);
    }
    /**
     * 按照部门编号查询，检验部门编号是否合理
     * @param deptsCode
     * @return
     * @throws Exception
     */
    public boolean selectByDeptsCode(String deptsCode) throws Exception
    {
        return deptsInfoDao.selectByDeptsCode(deptsCode);
    }
}

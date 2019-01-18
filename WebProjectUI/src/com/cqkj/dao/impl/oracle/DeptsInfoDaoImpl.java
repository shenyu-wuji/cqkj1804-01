package com.cqkj.dao.impl.oracle;

import com.cqkj.bean.DeptsInfo;
import com.cqkj.bean.PageList;
import com.cqkj.dao.DeptsInfoDao;

public class DeptsInfoDaoImpl extends BaseDaoImpl<DeptsInfo> implements DeptsInfoDao
{
    /**
     * 分页查询
     */
    @Override
    public void selectPage(PageList<DeptsInfo> pageList) throws Exception
    {
        String sql = "select * from DeptsInfo";
        
        selectByPage(DeptsInfo.class, sql, pageList);
    }
    /**
     * 按照部门编号查询，判断部门编号命名是否合理
     * @param deptsCode
     * @return
     * @throws Exception
     */
    public boolean selectByDeptsCode(String deptsCode) throws Exception
    {
        String sql = "select count(1) from DeptsInfo where deptsCode = ?";
        int flag = Integer.parseInt(executeQueryObj(sql, deptsCode).toString());
        
        if (flag != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}

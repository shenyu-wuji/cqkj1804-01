package com.cqkj.dao.impl.oracle;


import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.UsersInfo;
import com.cqkj.dao.UsersInfoDao;

public class UsersInfoDaoImpl extends BaseDaoImpl<UsersInfo> implements UsersInfoDao
{
    /**
     * 查询提交上来的用户名及密码是否正确，返回查询结果，查不到就为空
     * 
     * @throws Exception
     */
    public UsersInfo login(int role, String loginName, String loginPwd) throws Exception
    {
        // 创建sql语句
        String sql = "select * from UsersInfo where deptsId = ? and loginName = ? and loginPwd = ?";
        
        // 从数据库查询内容
        executeQuery(sql, role, loginName, loginPwd);
        UsersInfo usersInfo = null;

        while (rs.next())
        {
            // 查到数据，创建对象，设置属性
            usersInfo = new UsersInfo();
            usersInfo.setUsersId(rs.getInt("usersId"));
            usersInfo.setDeptsId(rs.getInt("deptsId"));
            break;
        }

        return usersInfo;
    }

    /**
     * 分页查询
     */
    @Override
    public void selectPage(PageList<UsersInfo> pageList) throws Exception
    {
        String sql = "select * from UsersInfo where isDelete = 0";

        selectByPage(UsersInfo.class, sql, pageList);
    }

    /**
     * 根据用户名来查询，检验用户名的合理性
     */
    public boolean selectByLoginName(String loginName) throws Exception
    {
        String sql = "select count(1) from UsersInfo where loginName = ?";
        int flag = Integer.parseInt(executeQueryObj(sql, loginName).toString());

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
     * 按照用户类型进行查询，如：教师和学生
     * @param deptsCode
     * @return
     * @throws Exception
     */
    public List<UsersInfo> selectDeptsCode(String deptsCode) throws Exception
    {
        String sql = "select u.* from usersInfo u join deptsInfo d on u.deptsid = d.deptsid where isDelete = 0 and d.deptscode = ?";
        
        return selectAll(UsersInfo.class, sql, deptsCode);
    }

}

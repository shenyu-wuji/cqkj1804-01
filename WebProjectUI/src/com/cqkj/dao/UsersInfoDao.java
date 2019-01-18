package com.cqkj.dao;



import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.UsersInfo;

public interface UsersInfoDao extends BaseDao<UsersInfo>
{
    UsersInfo login(int role,String loginName,String loginPwd) throws Exception;
    
    void selectPage(PageList<UsersInfo> pageList) throws Exception;
    
    boolean selectByLoginName(String loginName) throws Exception;
    
    List<UsersInfo> selectDeptsCode(String deptsCode) throws Exception;
}

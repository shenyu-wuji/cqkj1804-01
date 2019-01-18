package com.cqkj.dao;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourse;
import com.cqkj.bean.selTC;

public interface TCourseDao extends BaseDao<TCourse>
{
    void selectName(PageList<TCourse> pageList,String name) throws Exception;
    
    boolean selectBycNo(String cNo) throws Exception;
    
    List<TCourse> selectUnTC(int usersId) throws Exception;
    
    void selectTCResult(selTC<TCourse> selTc,String usersId) throws Exception;
    
    void selectAll(Class<TCourse> c,selTC<TCourse> selTc, String sql, Object... objs) throws Exception;
}

package com.cqkj.dao;

import com.cqkj.bean.DeptsInfo;
import com.cqkj.bean.PageList;

public interface DeptsInfoDao extends BaseDao<DeptsInfo>
{
    void selectPage(PageList<DeptsInfo> pageList) throws Exception;
    
    boolean selectByDeptsCode(String deptsCode) throws Exception;
}

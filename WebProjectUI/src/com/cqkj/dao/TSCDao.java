package com.cqkj.dao;

import com.cqkj.bean.TSC;

public interface TSCDao extends BaseDao<TSC>
{
    int updSCByForeign(int usersId,int cId,int score) throws Exception;
}

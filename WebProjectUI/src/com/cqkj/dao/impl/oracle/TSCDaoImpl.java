package com.cqkj.dao.impl.oracle;

import java.util.List;

import com.cqkj.bean.TSC;
import com.cqkj.dao.TSCDao;

public class TSCDaoImpl extends BaseDaoImpl<TSC> implements TSCDao
{
    /**
     * 按选课表外键先进行查询，获取查询对象的主键，再根据查到的主键更新对象
     */
    public int updSCByForeign(int usersId, int cId, int score) throws Exception
    {
        String sql = "select * from TSC t where t.stuid = ? and t.cid = ?";

        List<TSC> lsc = selectAll(TSC.class, sql, usersId, cId);

        TSC tsc = new TSC(lsc.get(0).getScId(),usersId,cId,score,lsc.get(0).getCreateDate());

        return update(tsc);
    }
}

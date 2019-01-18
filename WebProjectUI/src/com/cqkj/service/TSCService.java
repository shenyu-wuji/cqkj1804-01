package com.cqkj.service;

import com.cqkj.bean.TSC;
import com.cqkj.bean.UsersInfo;
import com.cqkj.dao.TSCDao;
import com.cqkj.dao.factory.DaoFactory;

public class TSCService
{
    TSCDao tsCDao = DaoFactory.<TSCDao>createDao("TSCDaoImpl");

    /**
     * 添加选课对象
     * @param tsc
     * @return
     * @throws Exception
     */
    public int addSC(TSC tsc) throws Exception
    {
        return tsCDao.insert(tsc);
    }
    /**
     * 按选课表主键更新数据
     * @param sc
     * @return
     * @throws Exception
     */
    public int updSC(TSC sc) throws Exception
    {
        return tsCDao.update(sc);
    }
    /**
     * 不按主键更新数据,先查询后更新
     * @param usersId
     * @param cId
     * @param score
     * @return
     * @throws Exception
     */
    public int updSCByForeign(int usersId,int cId,int score) throws Exception
    {
        return tsCDao.updSCByForeign(usersId,cId,score);
    }
    
    /**
     * 物理删除选课结果
     * @param scId
     * @return
     * @throws Exception
     */
    public int delSC(int scId) throws Exception
    {
        TSC tsc = new TSC();
        tsc.setScId(scId);
        return tsCDao.delete(tsc);
    }
}

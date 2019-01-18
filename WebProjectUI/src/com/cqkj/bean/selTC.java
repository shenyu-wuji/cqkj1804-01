package com.cqkj.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 两表联查实例，用于保存查询到的数据
 * @author XJJ
 *
 * @param <T>
 */
public class selTC<T>
{
    /**
     * 保存泛型类集合
     */
    private List<T> data;
    /**
     * 保存查到的分数
     */
    private List score = new ArrayList();
    /**
     * 用于存储外键
     */
    private List foreign = new ArrayList();
    
    public selTC(){}
    
    
    /**
     * 全参构造方法
     * @param data
     * @param score
     */
    public selTC(List<T> data, List score,List foreign)
    {
        super();
        this.data = data;
        this.score = score;
        this.foreign = foreign;
    }


    public List<T> getData()
    {
        return data;
    }

    public void setData(List<T> data)
    {
        this.data = data;
    }

    public List getScore()
    {
        return score;
    }

    public void setScore(List score)
    {
        this.score = score;
    }


    public List getForeign()
    {
        return foreign;
    }


    public void setForeign(List foreign)
    {
        this.foreign = foreign;
    }

    
}

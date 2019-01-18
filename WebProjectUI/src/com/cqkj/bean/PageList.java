package com.cqkj.bean;

import java.util.List;

/**
 * 分页查询实例，用来保存查到的数据类型的集合，页码，和总数量等
 * @author XJJ
 *
 * @param <T>泛型类，接收任何类型
 */
public class PageList<T>
{
    /**
     * 保存泛型类集合
     */
    private List<T> data; // 泛型集合，用来接收各种类型的数据集合
    
    /**
     * 页码
     */
    private int pageIndex = 1; 
    /**
     * 每页内容数量
     */
    private int pageSize = 3;
    /**
     * 查到的内容的总数量
     */
    private int count = 0;

   

    public List<T> getData()
    {
        return data;
    }

    public void setData(List<T> data)
    {
        this.data = data;
    }

    public int getPageIndex()
    {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex)
    {
        this.pageIndex = pageIndex;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getCount()
    {
        return count;
    }

    public void setCount(int count)
    {
        this.count = count;
    }

    /**
     * 获取每页的第一个元素的序列
     * @return
     */
    public int getFirstSeq()
    {
        return (this.pageIndex - 1) * pageSize;
    }

    /**
     * 获取总页码
     * 
     * @return 总页码数
     */
    public int getPageCount()
    {
        return this.count % this.pageSize == 0 ? (this.count / this.pageSize) : (this.count / this.pageSize) + 1;
    }

}

package com.cqkj.bean;

import com.cqkj.dao.PK;

public class DeptsInfo
{
    /**
     * 主键ID
     */
    @PK
    private int deptsId;

    /**
     * 用户类型编号
     */
    private String deptsCode;

    /**
     * 用户类型名
     */
    private String deptsName;

    /**
     * 无参构造方法
     */
    public DeptsInfo()
    {
    }

    /**
     * 不带ID的构造方法，用来创建对象
     * 
     * @param deptsCode
     *            部门编号
     * @param deptsName
     *            部门名称
     */
    public DeptsInfo(String deptsCode, String deptsName)
    {
        this.deptsCode = deptsCode;
        this.deptsName = deptsName;
    }

    /**
     * 全参构造方法，用来查询，接收对象
     * 
     * @param deptsId
     *            部门ID
     * @param deptsCode
     *            部门编号
     * @param deptsName
     *            部门名称
     */
    public DeptsInfo(int deptsId, String deptsCode, String deptsName)
    {
        this(deptsCode, deptsName);
        this.deptsId = deptsId;
    }

    public int getDeptsId()
    {
        return deptsId;
    }

    public void setDeptsId(int deptsId)
    {
        this.deptsId = deptsId;
    }

    public String getDeptsCode()
    {
        return deptsCode;
    }

    public void setDeptsCode(String deptsCode)
    {
        this.deptsCode = deptsCode;
    }

    public String getDeptsName()
    {
        return deptsName;
    }

    public void setDeptsName(String deptsName)
    {
        this.deptsName = deptsName;
    }

}

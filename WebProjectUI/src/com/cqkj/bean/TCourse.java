package com.cqkj.bean;

import java.util.Date;

import com.cqkj.dao.PK;

public class TCourse
{
    @PK
    private int cId;

    private String cNo;
    private String cName;

    private Date createDate;
    
    public TCourse(){}
    
    /**
     * 无主键构造方法
     * @param cNo
     * @param cName
     * @param createDate
     */
    public TCourse(String cNo, String cName, Date createDate)
    {
        super();
        this.cNo = cNo;
        this.cName = cName;
        this.createDate = createDate;
    }

    /**
     * 全参构造方法
     * @param cId
     * @param cNo
     * @param cName
     * @param createDate
     */
    public TCourse(int cId, String cNo, String cName, Date createDate)
    {
        super();
        this.cId = cId;
        this.cNo = cNo;
        this.cName = cName;
        this.createDate = createDate;
    }

    public int getcId()
    {
        return cId;
    }

    public void setcId(int cId)
    {
        this.cId = cId;
    }

    public String getcNo()
    {
        return cNo;
    }

    public void setcNo(String cNo)
    {
        this.cNo = cNo;
    }

    public String getcName()
    {
        return cName;
    }

    public void setcName(String cName)
    {
        this.cName = cName;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

}

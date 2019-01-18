package com.cqkj.bean;

import java.util.Date;

import com.cqkj.dao.PK;

public class TSC
{
    @PK
    private int scId;

    private int stuId;
    private int cId;
    private int score = 60;
    private Date createDate;

    public TSC()
    {
    }

    /**
     * 无主键ID的构造方法
     * 
     * @param stuId
     * @param cId
     * @param score
     * @param createDate
     */
    public TSC(int stuId, int cId, int score, Date createDate)
    {
        this.stuId = stuId;
        this.cId = cId;
        this.score = score;
        this.createDate = createDate;
    }

    /**
     * 全参构造方法
     * 
     * @param scId
     * @param stuId
     * @param cId
     * @param score
     * @param createDate
     */
    public TSC(int scId, int stuId, int cId, int score, Date createDate)
    {
        this(stuId, cId, score, createDate);
        this.scId = scId;
    }

    public int getScId()
    {
        return scId;
    }

    public void setScId(int scId)
    {
        this.scId = scId;
    }

    public int getStuId()
    {
        return stuId;
    }

    public void setStuId(int stuId)
    {
        this.stuId = stuId;
    }

    public int getcId()
    {
        return cId;
    }

    public void setcId(int cId)
    {
        this.cId = cId;
    }

    public int getScore()
    {
        return score;
    }

    public void setScore(int score)
    {
        this.score = score;
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

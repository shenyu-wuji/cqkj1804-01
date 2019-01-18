package cqkj.mcg.course;

public class Course
{
    private int cId;
    private String cNo;
    private String cName;
    
    public Course(){}
    
    /**
     * 无ID构造方法，用于创建对象
     * @param cNo  课程号
     * @param cName  课程名称
     */
    public Course(String cNo,String cName)
    {
        this.cNo = cNo;
        this.cName = cName;
    }
    
    /**
     * 全参数构造方法   用于查询
     * @param cId  课程ID
     * @param cNo  课程号
     * @param cName   课程名称
     */
    public Course(int cId,String cNo,String cName)
    {
        this(cNo, cName);
        this.cId = cId;
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
    
    
    
}

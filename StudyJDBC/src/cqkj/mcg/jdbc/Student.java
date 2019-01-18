package cqkj.mcg.jdbc;

public class Student
{
  //定义学生属性：学生ID，学号，姓名，性别，年龄
    private int stuId;
    private String stuNo;
    private String stuName;
    private int stuAge;
    private String stuSex;
    
    public Student(){}
    
    /**
     * 无学生ID的构造方法，用于向数据库添加对象
     * @param stuno  学号
     * @param stuName  姓名
     * @param stusex   性别
     * @param stuage   年龄
     */
    public Student(String stuNo,String stuName,int stuAge,String stuSex)
    {
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.stuAge = stuAge;
        this.stuSex = stuSex;
    }
    
    /**
     * 全参数构造方法,用于查询表中所有信息
     * @param stuId  学生ID
     * @param stuno  学号
     * @param stuName  姓名
     * @param stusex   性别
     * @param stuage   年龄
     */
    public Student(int stuId,String stuNo,String stuName,int stuAge,String stuSex)
    {
        this(stuNo, stuName, stuAge, stuSex);
        this.stuId = stuId;
    }

    public int getStuId()
    {
        return stuId;
    }

    public void setStuId(int stuId)
    {
        this.stuId = stuId;
    }

    public String getStuNo()
    {
        return stuNo;
    }

    public void setStuNo(String stuNo)
    {
        this.stuNo = stuNo;
    }

    public String getStuName()
    {
        return stuName;
    }

    public void setStuName(String stuName)
    {
        this.stuName = stuName;
    }

    public int getStuAge()
    {
        return stuAge;
    }

    public void setStuAge(int stuAge)
    {
        this.stuAge = stuAge;
    }

    public String getStuSex()
    {
        return stuSex;
    }

    public void setStuSex(String stuSex)
    {
        this.stuSex = stuSex;
    }
}

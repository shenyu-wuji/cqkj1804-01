package com.cqkj.bean;

import com.cqkj.dao.PK;

public class Student
{
	
	// 字段名，数据类型
	// 学生ID
	@PK
	private int stuId;
	
	// 学生编号
	private String stuNo;
	
	// 姓名
	private String stuName;
	
	// 年龄
	private int stuAge = 0;
	
	// 性别
	private String stuSex;

	
	/**
	 * 性别
	 * @return
	 */
	public int getStuId()
	{
		return stuId;
	}

	/**
	 * 性别
	 * @param stuId
	 */
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
	
	public Student()
	{
		
	}
	
	public Student(String stuNo,String stuName, String stuSex, int stuAge)
	{
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.stuSex = stuSex;
		this.stuAge = stuAge;
	}
	
	/**
	 * 构造方法
	 * @param stuId 
	 * @param stuNo
	 * @param stuName
	 * @param stuSex
	 * @param stuAge
	 */
	public Student(int stuId, String stuNo,String stuName, String stuSex, int stuAge)
	{
		this(stuNo,stuName,stuSex,stuAge);
		this.stuId = stuId;
	}
	
}

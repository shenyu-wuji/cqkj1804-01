package com.cqkj.dao.factory;

import java.util.Properties;

public class DaoFactory
{
	@SuppressWarnings("unchecked")
	public static <T> T createDao(String daoName)
	{
		T obj = null;
		
		try
		{
			Properties ps = new Properties();
			ps.load(DaoFactory.class.getResourceAsStream("dbType.properties"));
			String dbType = ps.getProperty("dbType");
			
			// 获取完整的类的路径
			String classPath = dbType + "." + daoName;
			
			Class<?> c = Class.forName(classPath);
			
			obj = (T)c.newInstance();

		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return obj;
	}
}

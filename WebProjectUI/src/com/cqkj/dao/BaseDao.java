package com.cqkj.dao;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.selTC;

public interface BaseDao<T>
{
	/**
	 * 执行添删改
	 * @param sql
	 * @param params
	 * @return
	 */
	int executeUpdate(String sql, Object... params) throws Exception;

	/**
	 * 查询方法
	 * @param sql
	 * @param params
	 * @return
	 */
     void executeQuery(String sql, Object... params) throws Exception;
	
	/**
	 * 将对象插入到对应的数据库
	 * 约定1：对象对应的类名需要与表名保持一致（不区分大小写）
	 * 约定2：对象中的属性必须与表中的字段名一致（不区分大小写）
	 * 约定3：表中的主键需要与对象中的被"@PK"注解的字段对应（主键使用“S_表名.nextVal”序列自动生成）
	 * 扩展1：如果表名或字段名与对象对应类中的名称或属性名称不一致的情况，可以使用@TbInfoName(name="字段名")注解，使其对应。
	 * 其它备注：本方法主要是根据传过来的对象，获取对应的Class类型对象，解析并获取其中成员信息，拼接出insert Sql语句，将对象的数据插入到对象对应表中
	 * @param t 插入的对象
	 * @return 返回插入成功影响的行
	 * @throws Exception 调用本方法需要自行处理异常
	 */
	public int insert(T t) throws Exception;
	
	
	
	/**
     * 向数据库表中删除数据的方法
     * 物理删除
     * @param t
     * 泛型类的对象
     * @return 操作的行数
     * @throws Exception
     *             异常处理
     */
    public int delete(T t) throws Exception;

    /**
     * 向数据库表中删除数据的方法
     * 逻辑删除
     * @param t
     * @return
     * @throws Exception
     */
    public int isDelete(T t) throws Exception;
    
    /**
     * 向数据库表中修改数据的方法
     * 
     * @param t 泛型类的对象
     * @return 操作的行数
     * @throws Exception
     *             异常处理
     */
    public int update(T t) throws Exception; 

	/**
	 * 根据主键ID 查询当前T类型对应表中的一行数据
	 * @param c
	 * @return T类型对象  （使用的时候，只需要将主键的ID赋值就可以了）
	 * @throws Exception
	 */
	public T selectById(T t) throws Exception;
	
	
	/**
	 * 查询当前T类型对应表中的所有数据
	 * @param c
	 * @return T类型对象集合
	 * @throws Exception
	 */
	public List<T> selectAll(Class<T> c) throws Exception;
	
	
	/**
	 * 按SQL语句查询，返回T类型对象集合
	 * @param c
	 * @return T类型对象集合
	 * @throws Exception
	 */
	public List<T> selectAll(Class<T> c, String sql, Object ... objs) throws Exception;
	
	/**
	 * 按SQL语句查询，查询结果存入selTC中
	 * @param c
	 * @param selTc
	 * @param sql
	 * @param objs
	 * @throws Exception
	 */
	//public void selectAll(Class<T> c,selTC<T> selTc, String sql, Object... objs) throws Exception;
	
	/**
	 * 按SQL语句分页查询,查询结果存入PageList中
	 * @param c
	 * @return T类型对象集合
	 * @throws Exception
	 */
	public void selectByPage(Class<T> c, String sql,PageList<T> pageList, Object... objs) throws Exception;
	
	/**
	 * 返回查询结果中的第一行，第一列的结果
	 * @param sql
	 * @param params
	 * @return 对象（自己获取到了数据之后，根据实际情况再作转换）
	 * @throws Exception
	 */
	public Object executeQueryObj(String sql, Object... params) throws Exception; 
	
}



package com.cqkj.bean;

import java.util.Date;

import com.cqkj.dao.Default;
import com.cqkj.dao.PK;
import com.cqkj.dao.isDelete;

/**
 * 用户信息实例对应的表
 * 
 * @author XJJ
 *
 */
public class UsersInfo
{
    @PK
    private int usersId;

    private int deptsId;
    private String loginName;
    private String loginPwd;
    private String name;
    private String sex;
    private int age;
    private String phone;
    private String idCard;
    private String weChat;
    private String address;
    
    @isDelete
    private int isDelete = 0;
    
    private int isEnable = 1;
    
    
    private Date createDate;
    
    private int createUser;
    
    @Default
    private Date lastUpdateDate;
    
    private int lastUpdateUser;

    /**
     * 无参构造方法
     */
    public UsersInfo()
    {
    }
    
    public UsersInfo(int deptsId, String loginName, String loginPwd, String name, String sex, int age, String phone,
            String idCard, String weChat, String address,Date createDate,int createUser,Date lastUpdateDate,int lastUpdateUser)
    {
        this.deptsId = deptsId;
        this.loginName = loginName;
        this.loginPwd = loginPwd;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
        this.idCard = idCard;
        this.weChat = weChat;
        this.address = address;
        this.createDate = createDate;
        this.createUser = createUser;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
    }

    /**
     * 不带ID的构造方法，用来创建对象
     * 
     * @param deptsId
     *            部门ID
     * @param loginName
     *            用户名
     * @param loginPwd
     *            用户密码
     * @param name
     *            姓名
     * @param sex
     *            性别
     * @param age
     *            年龄
     * @param phone
     *            手机号
     * @param idCard
     *            身份证号
     * @param weChat
     *            微信号
     * @param address
     *            住址
     * @param isDelete
     *            是否删除
     * @param isEnable
     *            是否启用
     * @param createDate
     *            创建日期
     * @param createUser
     *            创建人
     * @param lastUpdateDate
     *            最后更新日期
     * @param lastUpdateUser
     *            最后更新人
     */
    public UsersInfo(int deptsId, String loginName, String loginPwd, String name, String sex, int age, String phone,
            String idCard, String weChat, String address, int isDelete, int isEnable, Date createDate,
            int createUser, Date lastUpdateDate, int lastUpdateUser)
    {
        this.deptsId = deptsId;
        this.loginName = loginName;
        this.loginPwd = loginPwd;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
        this.idCard = idCard;
        this.weChat = weChat;
        this.address = address;
        this.isDelete = isDelete;
        this.isEnable = isEnable;
        this.createDate = createDate;
        this.createUser = createUser;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
    }

    /**
     * 全参构造方法，用来查询接受对象
     * 
     * @param usersId
     * @param deptsId
     * @param loginName
     * @param loginPwd
     * @param name
     * @param sex
     * @param age
     * @param phone
     * @param idCard
     * @param weChat
     * @param address
     * @param isDelete
     * @param isEnable
     * @param createDate
     * @param createUser
     * @param lastUpdateDate
     * @param lastUpdateUser
     */
    public UsersInfo(int usersId, int deptsId, String loginName, String loginPwd, String name, String sex, int age,
            String phone, String idCard, String weChat, String address, int isDelete, int isEnable,
            Date createDate, int createUser, Date lastUpdateDate, int lastUpdateUser)
    {
        this(deptsId, loginName, loginPwd, name, sex, age, phone, idCard, weChat, address, isDelete, isEnable,
                createDate, createUser, lastUpdateDate, lastUpdateUser);
        this.usersId = usersId;
    }

    public int getUsersId()
    {
        return usersId;
    }

    public void setUsersId(int usersId)
    {
        this.usersId = usersId;
    }

    public int getDeptsId()
    {
        return deptsId;
    }

    public void setDeptsId(int deptsId)
    {
        this.deptsId = deptsId;
    }

    public String getLoginName()
    {
        return loginName;
    }

    public void setLoginName(String loginName)
    {
        this.loginName = loginName;
    }

    public String getLoginPwd()
    {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd)
    {
        this.loginPwd = loginPwd;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public int getAge()
    {
        return age;
    }

    public void setAge(int age)
    {
        this.age = age;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getWeChat()
    {
        return weChat;
    }

    public void setWeChat(String weChat)
    {
        this.weChat = weChat;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public int getIsDelete()
    {
        return isDelete;
    }

    public void setIsDelete(int isDelete)
    {
        this.isDelete = isDelete;
    }

    public int getIsEnable()
    {
        return isEnable;
    }

    public void setIsEnable(int isEnable)
    {
        this.isEnable = isEnable;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public int getCreateUser()
    {
        return createUser;
    }

    public void setCreateUser(int createUser)
    {
        this.createUser = createUser;
    }

    public Date getLastUpdateDate()
    {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate)
    {
        this.lastUpdateDate = lastUpdateDate;
    }

    public int getLastUpdateUser()
    {
        return lastUpdateUser;
    }

    public void setLastUpdateUser(int lastUpdateUser)
    {
        this.lastUpdateUser = lastUpdateUser;
    }

}

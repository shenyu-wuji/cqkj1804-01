--create Sequence S_deptsInfo;
--create Sequence S_usersInfo;
--drop Sequence S_deptsInfo;
--drop Sequence S_usersInfo;
/*部门表*/
--drop table deptsInfo
create table deptsInfo
(
    deptsId number,   --部门ID  主键
    deptsCode nvarchar2(30),       --部门编号  唯一
    deptsName nvarchar2(20) not null,   --部门名称
    constraint PK_di_dsid primary key (deptsId),
    constraint UQ_di_dsco unique (deptsCode)
);
comment on column deptsInfo.Deptsid is '部门ID，主键';
comment on column deptsInfo.deptsCode is '部门编号，唯一';
comment on column deptsInfo.deptsName is '部门名称'
;

insert into deptsInfo(deptsId,deptsCode,deptsName) values(S_deptsInfo.Nextval,'a001','航空部');
insert into deptsInfo(deptsId,deptsCode,deptsName) values(S_deptsInfo.Nextval,'a002','装备部');
commit;
--select * from deptsInfo;
--delete from deptsInfo;

--drop table usersInfo;
/*用户信息表 */
create table usersInfo
(
    usersId number,    --用户ID   主键
    deptsId number,     --部门ID   外键
    loginName nvarchar2(16),    --用户名   唯一
    loginPwd nvarchar2(16) not null,     --用户密码   非空
    name nvarchar2(10),              --姓名
    sex char(1),                     --性别    只为y和x
    age number default(20),        --年龄    0到150
    phone nvarchar2(11),          --手机号
    idCard nvarchar2(18),         --身份证号
    weChat nvarchar2(12),             --微信号
    address nvarchar2(100),            --住址
    
    isDelete number default(0),    --是否删除  0 未删除  1代表删除
    isEnable number default(1),    --是否启用  1 启用   0代表禁用
    createDate date default (sysdate),   --创建日期
    createUser number,            --创建人
    lastUpdateDate date default(sysdate),      --最后更新日期
    lastUpdateUser number,           --最后更新人
    constraint PK_usi_uid primary key (usersId),
    constraint FK_usi_di foreign key (deptsId) references deptsInfo(deptsId),
    constraint UQ_usi_ln unique (loginName),
    constraint CK_usi_sex check (sex = 'y' or sex = 'x'),
    constraint CK_usi_age check (age > 0 and age < 150),
    
    constraint CK_usi_ide check (isDelete = '0' or isDelete = '1'),
    constraint CK_usi_ien check (isEnable = '0' or isEnable = '1')
);
comment on column usersInfo.usersId is '用户ID，主键';
comment on column usersInfo.deptsId is '部门ID，外键';
comment on column usersInfo.loginName is '用户名，唯一';
comment on column usersInfo.loginPwd is '用户密码，非空';
comment on column usersInfo.name is '姓名';
comment on column usersInfo.sex is '性别,只为y和x';
comment on column usersInfo.age is '年龄,0到150';
comment on column usersInfo.phone is '手机号';
comment on column usersInfo.idCard is '身份证号';
comment on column usersInfo.weChat is '微信号';
comment on column usersInfo.address is '住址';
comment on column usersInfo.isDelete is '是否删除,0未删除,1删除';
comment on column usersInfo.isEnable is '是否启用,1启用,0禁用';
comment on column usersInfo.createDate is '创建日期';
comment on column usersInfo.createUser is '创建人';
comment on column usersInfo.lastUpdateDate is '最后更新日期';
comment on column usersInfo.lastUpdateUser is '最后更新人'
;
insert into usersInfo
(usersId,deptsId,loginName,loginPwd,name,sex,age,phone,idCard,weChat,address,isDelete,isEnable,createUser,lastUpdateUser) 
values(S_usersInfo.Nextval,2,'mcg','888888','马晨光','y',22,'15397918762','410225199612304950','m953903943','开封',0,1,S_usersInfo.Currval,S_usersInfo.Currval);
insert into usersInfo
(usersId,deptsId,loginName,loginPwd,name,sex,age,phone,idCard,weChat,address,isDelete,isEnable,createUser,lastUpdateUser) 
values(S_usersInfo.Nextval,2,'ailei','666666','艾蕾','x',21,'15537860023','410225199512104955','a953903943','乌鲁克',0,1,S_usersInfo.Currval,S_usersInfo.Currval);
commit;
--select * from usersInfo;
--delete from usersInfo; 




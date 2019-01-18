--create Sequence S_TCourse;
--create Sequence S_TCourse;
--create Sequence S_TSC;
--create Sequence S_TSC;


--drop table deptsInfo
/*创建项目课程表*/
create table TCourse(
      cId number primary key,  --课程ID  cId number 主键
      cNo varchar2(10) not null unique,  --课程编号  cNo varchar2(10)  非空  唯一
      cName varchar2(20) not null,   --课程名称  cName varchar2(20) 非空
      createDate date default (sysdate)   --创建日期
);
comment on column TCourse.cId is '课程ID，主键';
comment on column TCourse.cNo is '课程编号，唯一';
comment on column TCourse.cName is '课程名称，非空';
comment on column TCourse.createDate is '创建日期'
;

insert into TCourse(cId,cNo,cName) values(S_TCourse.Nextval,'a001','历史学');
insert into TCourse(cId,cNo,cName) values(S_TCourse.Nextval,'a002','管理学');
commit;
--select * from TCourse;

/*创建项目选课表*/
create table TSC(
       scId number primary key,  --选课ID  scId number 主键
       stuId number,   --学生ID  stuId number 外键
       cId number,    --课程ID   cId number 外键
       score number(5,2) default 0 check(score>=0 and score<=100),   --成绩    score number(5,2) 默认值0 大于0 小于100
       createDate date default (sysdate),   --创建日期,
       constraint TSC_usersInfo foreign key (stuId) references usersInfo(usersId),
       constraint TSC_course foreign key (cId) references TCourse(cId)
);
comment on column TSC.scId is '选课ID，主键';
comment on column TSC.stuId is '课程编号，外键';
comment on column TSC.cId is '课程ID，外键'; 
comment on column TSC.score is '成绩';
comment on column TSC.createDate is '创建日期'
;

insert into TSC(scId,stuId,cId,score) values(S_TSC.Nextval,1,2,98.0);
insert into TSC(scId,stuId,cId,score) values(S_TSC.Nextval,2,2,97.5);
commit;
--select * from TSC;

create table Department(
deptId int primary key,
deptName varchar(30)
)
alter table employeSQL add constraint fk_empDeptid foreign key (empDeptid) references Department(deptId)
sp_help Department

drop table Department
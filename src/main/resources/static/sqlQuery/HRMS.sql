create database hrms;
use hrms;

-- 사원테이블
drop table hr_employees; 
CREATE TABLE HR_EMPLOYEES(
EMP_NO INT(10) AUTO_INCREMENT,
EMP_NAME VARCHAR(20) NOT NULL,
EMP_BIRTH_DAY DATE not NULL,
EMP_HIRE_DATE DATE not NULL,
EMP_EMAIL VARCHAR(50) not null UNIQUE,
EMP_PASSWORD VARCHAR(150) NOT null,
EMP_GENDER CHAR(1) not NULL,
EMP_SALARY INT(10),
EMP_PHONE VARCHAR(30),
EMP_MY_BOSS INT(10),
POS_CODE VARCHAR(10),
ROLE_CODE VARCHAR(10),
DEPT_CODE VARCHAR(10),
PROFILE VARCHAR(1000),
AUTO_LOGIN VARCHAR(3),
constraint PK_EMP_NO PRIMARY KEY (EMP_NO)
);

select *
from hr_employees;


where role_code = 00000; 



select *
from hr_role;

ALTER TABLE hr_employees
    ADD cookie_limit_time DATETIME;

ALTER TABLE hr_employees
ADD EMP_SESSION VARCHAR(200);


-- 직급 테이블
drop table HR_POSITION; 
create table HR_POSITION(
POS_CODE VARCHAR(10),
POS_NAME VARCHAR(20) not NULL,
constraint PK_POS_CODE primary key (POS_CODE)
);

-- 부서 테이블
drop table HR_DEPARTMENT; 
create table HR_DEPARTMENT(
DEPT_CODE VARCHAR(10),
DEPT_NAME VARCHAR(20),
constraint PK_DEPT_CODE primary key (DEPT_CODE)
);

-- 게시판
drop table HR_BOARD;
INSERT INTO HR_BOARD (BD_TITLE,BD_TITLE,BD_CONTENT,EMP_NO) VALUES('알립니다!!!','NOTICE','다들 좋은데 취직하시길!!',1);
CREATE TABLE HR_BOARD(
  BOARD_NO INT(10) AUTO_INCREMENT,
  BD_TYPE VARCHAR(20),
  BD_TITLE VARCHAR(100),
  BD_CONTENT VARCHAR(1000),
  BD_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  VIEW_COUNT INT(10) DEFAULT 0,
  EMP_NO INT(10),
  IMPORTANT INT(1) DEFAULT 0,
  constraint PK_BOARD_NO PRIMARY KEY (BOARD_NO)
);



-- 댓글테이블
drop table HR_REPLY;
INSERT INTO HR_REPLY (REP_CONTENT,BOARD_NO,EMP_NO) VALUES('댓글입니다.!!!',1,1);
create table HR_REPLY(
REP_NO INT(10) auto_increment,
REP_CONTENT VARCHAR(1000),
REP_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
BOARD_NO INT(10),
EMP_NO INT(10),
constraint PK_REP_NO primary key (REP_NO)
);

-- 사원 동호회 연결 테이블
drop table HR_EMP_CLUB; 
create table HR_EMP_CLUB(
EC_INDEX INT(10) auto_increment,
EMP_JOIN_DATE DATETIME default CURRENT_TIMESTAMP,
EMP_NO INT(10),
CLUB_CODE INT(10),
constraint PK_EC_INDEX primary key (EC_INDEX)
);


-- 동호회 테이블
drop table HR_CLUB; 
create table HR_CLUB(
CLUB_CODE INT(10) AUTO_INCREMENT,
CLUB_NAME VARCHAR(30) not NULL,
CLUB_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
CLUB_PROFILE VARCHAR(150),
EMP_NO INT(10),
constraint PK_CLUB_CODE primary key (CLUB_CODE)
);



-- 동호회 게시판
drop table HR_CLUB_BOARD; 
create table HR_CLUB_BOARD(
CB_NO INT(10) auto_increment,
CB_TITLE VARCHAR(100),
CB_CONTENT VARCHAR(1000),
CB_DATE DATETIME default CURRENT_TIMESTAMP,
CB_URL VARCHAR(1000),
EMP_NO INT(10),
CLUB_CODE INT(10),
constraint PK_CB_NO primary key (CB_NO)
);


-- 동호회 게시판 댓글 테이블
drop table HR_CLUB_REPLY; 
create table HR_CLUB_REPLY(
CLUB_REP_NO INT(10) AUTO_INCREMENT,
CLUB_REP_CONTENT VARCHAR(1000),
CLBU_REP_DATE DATETIME default CURRENT_TIMESTAMP,
CB_NO INT(10),
EMP_NO INT(10),
constraint PK_CLUB_REP_NO primary key (CLUB_REP_NO)
);


-- 직책 테이블
drop table HR_ROLE; 
create table HR_ROLE(
ROLE_CODE VARCHAR(10),
ROLE_NAME VARCHAR(20),
constraint PK_ROLE_CODE primary key (ROLE_CODE)
);
 

-- 결재 테이블
drop table HR_CONFIRM; 
create table HR_CONFIRM(
CON_NO INT(10) AUTO_INCREMENT,
CON_TITLE VARCHAR(100) not null,
CON_CONTENT VARCHAR(1000) not null,
CON_DATE DATETIME default CURRENT_TIMESTAMP,
CON_CHECK_DATE DATETIME,
CON_STATUS CHAR(1) default 'N',
FROM_EMP_NO INT(10) not null,
TO_EMP_NO INT(10) not null,
constraint PK_CON_NO primary key (CON_NO)
);



-- 메일 테이블
drop table HR_EMAIL; 
create table HR_EMAIL(
MAIL_NO INT(10) auto_increment,
MAIL_TO INT(10) NOT NULL,
MAIL_FROM INT(10) NOT NULL,
MAIL_TITLE VARCHAR(100) not null,
MAIL_CONTENT VARCHAR(1000) not null,
MAIL_DATE DATETIME default CURRENT_TIMESTAMP,
MAIL_STATUS CHAR(1) default 'N',
constraint PK_MAIL_NO primary key (MAIL_NO)
);

-- PROFILE 컬럼추가 ---------------------------------
ALTER TABLE hr_employees ADD COLUMN PROFILE VARCHAR(1000);
-- FK ADD query(일단 넣지 마세요!!!!)

alter TABLE HR_EMPLOYEES add constraint FK_HR_EMPLOYEES_EMP_MY_BOSS
FOREIGN KEY (EMP_MY_BOSS) REFERENCES HR_EMPLOYEES(EMP_NO)on delete cascade;

alter TABLE HR_EMPLOYEES add constraint FK_HR_EMPLOYEES_POS_CODE
FOREIGN KEY (POS_CODE) REFERENCES HR_POSITION(POS_CODE)on delete cascade;

alter TABLE HR_EMPLOYEES add constraint FK_HR_EMPLOYEES_CLUB_CODE
FOREIGN KEY (CLUB_CODE) REFERENCES HR_CLUB(CLUB_CODE)on delete cascade;

alter TABLE HR_EMPLOYEES add constraint FK_HR_EMPLOYEES_ROLE_CODE
FOREIGN KEY (ROLE_CODE) REFERENCES HR_ROLE(ROLE_CODE)on delete cascade;

alter TABLE HR_ACCOUNT add constraint FK_HR_ACCOUNT_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES HR_EMPLOYEES(EMP_NO)on delete cascade;

alter table HR_BOARD add constraint FK_HR_BOARD_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES HR_EMPLOYEES(EMP_NO) ON delete cascade;

alter table HR_REPLY add constraint FK_HR_REPLY_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_CLUB add constraint FK_HR_CLUB_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_CLUB_BOARD add constraint FK_HR_CLUB_BOARD_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_CLUB_REPLY add constraint FK_HR_CLUB_REPLY_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_CONFIRM_IN add constraint FK_HR_CONFIRM_IN_COUT_NO
foreign key (COUT_NO) references HR_CONFIRM_OUT(COUT_NO) on delete cascade;

alter table HR_CONFIRM_IN add constraint FK_HR_CONFIRM_IN_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_CONFIRM_OUT add constraint FK_HR_CONFIRM_OUT_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;

alter table HR_EMAIL add constraint FK_HR_EMAIL_EMP_NO
foreign key (EMP_NO) references HR_EMPLOYEES(EMP_NO) on delete cascade;



-- 부서테이블 데이터
insert into hr_department
values ('001', 'IT');
insert into hr_department
values ('002', 'HR');
insert into hr_department
values ('003', 'SALES');
insert into hr_department
values ('004', 'MARKETING');
insert into hr_department
values ('005', 'FINANCE');
insert into hr_department
values ('006', 'MANAGEMENT');

-- 직책테이블 데이터
insert into hr_role
values ('00000', '관리자');
insert into hr_role
values ('11111', '부서장');
select *
from hr_role;

--직급테이블 데이터

insert into hr_position
values ('005', '사원');
insert into hr_position
values ('004', '대리');
insert into hr_position
values ('003', '과장');
insert into hr_position
values ('002', '부장');
insert into hr_position
values ('001', '대표이사');

-- HRMS 관리자계정 생성
insert into hr_employees (emp_name, emp_birth_day, emp_hire_date, emp_email, emp_password, emp_gender, emp_salary,
                          emp_phone, pos_code, role_code, dept_code)
values ('김중앙', '1978-04-06', '2000-01-01', 'admin@samjosangsa.com', 'test', 'M', 4500000, '01000000000', '002', '00000',
        '002');

-- 부서장 계정 생성
insert into hr_employees (emp_name, emp_birth_day, emp_hire_date, emp_email, emp_password, emp_gender, emp_salary,
                          emp_phone, pos_code, role_code, dept_code)
values ('김정연', '1987-05-02', '2023-05-24', 'jykim1111@samjosangsa.com', '1111', 'F', 4500000, '01000000000', '002', '11111',
        '001');

-- 사원계정 생성
insert into hr_employees (emp_name, emp_birth_day, emp_hire_date, emp_email, emp_password, emp_gender, emp_salary,
                          emp_phone, pos_code, role_code, dept_code)
values ('박원영', '1991-08-02', '2023-05-12', 'young2222@samjosangsa.com', '2222', 'F', 3500000, '01000000000', '004', none,
        '001');

-- 결재데이터 생성
insert into hr_confirm (con_title, CON_CONTENT, CON_DATE, CON_STATUS, FROM_EMP_NO, TO_EMP_NO) values ('중앙00학원 사내앱 개발 관련의 건', '테스트 결재문건입니다.', '2023-05-24 16:49:09', 'N', 3, 2);

-- 샘플 메일 데이터 생성
insert into hr_email (mail_to , mail_from, mail_title, mail_content)
values(2,6,"결제부탁드립니다","테스트용메일입니다");
--  mail_to 수신자 mail_from 발신자 숫자만 바꿔서 발송할 것
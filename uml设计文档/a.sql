/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/12/16 14:39:03                          */
/*==============================================================*/


drop table if exists course;

drop table if exists student;

drop table if exists stuscore;

drop table if exists teacher;

drop table if exists user;

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   courseid             int not null,
   teacherid            int,
   cname                varchar(255),
   primary key (courseid)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   studentid            int not null,
   sname                text not null,
   age                  int default NULL,
   grade                int,
   sclass               int,
   phonenumber          text,
   primary key (studentid)
);

/*==============================================================*/
/* Table: stuscore                                              */
/*==============================================================*/
create table stuscore
(
   id                   int not null auto_increment,
   courseid             int,
   studentid            int,
   score                int,
   primary key (id)
);

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher
(
   teacherid            int not null,
   name                 varchar(255),
   age                  int default NULL,
   primary key (teacherid)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   username             varchar(255) not null,
   password             varchar(255) not null,
   auth                 varchar(255),
   primary key (username)
);

alter table course add constraint FK_teacher_and_course foreign key (teacherid)
      references teacher (teacherid) on delete restrict on update restrict;

alter table stuscore add constraint FK_course_and_score foreign key (courseid)
      references course (courseid) on delete restrict on update restrict;

alter table stuscore add constraint FK_student_and_score foreign key (studentid)
      references student (studentid) on delete restrict on update restrict;


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/16 20:19:08                          */
/*==============================================================*/


drop table if exists device;

drop table if exists devicet_ype;

drop table if exists maintain_consume;

drop table if exists maintain_record;

drop table if exists mantain_p;

/*==============================================================*/
/* Table: device                                                */
/*==============================================================*/
create table device
(
   id                   int not null,
   device_sn            varchar(40),
   device_type_sn       varchar(40),
   latest_time          datetime,
   device_name          varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: devicet_ype                                           */
/*==============================================================*/
create table devicet_ype
(
   id                   int not null,
   device_type_sn       varchar(40),
   device_type_name     varchar(100),
   maintain_p_sn        varchar(45),
   check_period         int,
   primary key (id)
);

/*==============================================================*/
/* Table: maintain_consume                                      */
/*==============================================================*/
create table maintain_consume
(
   id                   int not null auto_increment,
   maintain_record_sn   varchar(40),
   number               int,
   unit                 varchar(10),
   primary key (id)
);

/*==============================================================*/
/* Table: maintain_record                                       */
/*==============================================================*/
create table maintain_record
(
   id                   int not null,
   device_sn            varchar(40),
   maintain_p_sn        varchar(40),
   person_sn            varchar(45),
   maintain_time        datetime,
   maintain_content     varchar(100),
   maintain_record_sn   varchar(40),
   primary key (id)
);

/*==============================================================*/
/* Table: mantain_p                                             */
/*==============================================================*/
create table mantain_p
(
   id                   int not null,
   maintain_p_sn        varchar(40),
   maintain_project     varchar(100),
   primary key (id)
);

alter table device add constraint FK_Reference_1 foreign key (id)
      references devicet_ype (id) on delete restrict on update restrict;

alter table devicet_ype add constraint FK_Reference_2 foreign key (id)
      references mantain_p (id) on delete restrict on update restrict;

alter table maintain_record add constraint FK_Reference_4 foreign key (id)
      references maintain_consume (id) on delete restrict on update restrict;

alter table mantain_p add constraint FK_Reference_3 foreign key (id)
      references maintain_record (id) on delete restrict on update restrict;


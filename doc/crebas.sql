/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2017/6/5 10:30:23                            */
/*==============================================================*/

USE Official

if exists (select 1
            from  sysobjects
           where  id = object_id('Banner')
            and   type = 'U')
   drop table Banner
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Department')
            and   type = 'U')
   drop table Department
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Job')
            and   type = 'U')
   drop table Job
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JobType')
            and   type = 'U')
   drop table JobType
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Product')
            and   type = 'U')
   drop table Product
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProductImage')
            and   type = 'U')
   drop table ProductImage
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SystemUser')
            and   type = 'U')
   drop table SystemUser
go

/*==============================================================*/
/* Table: Banner                                                */
/*==============================================================*/
create table Banner (
   Id                   int                  identity,
   ImgUrl               varchar(100)         not null default '',
   Link                 varchar(100)         not null default '',
   IsEffictive          bit                  not null default 1,
   AddTime              datetime             not null default getdate(),
   IsDeleted            bit                  not null default 0,
   constraint PK_BANNER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Banner') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Banner' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '��ҳBannerͼ', 
   'user', @CurrentUser, 'table', 'Banner'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ImgUrl')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'ImgUrl'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ͼƬ��ַ',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'ImgUrl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Link')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'Link'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ת����',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'Link'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEffictive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'IsEffictive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�Ƿ���Ч',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'IsEffictive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AddTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'AddTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���ʱ��',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'AddTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Banner')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Banner', 'column', 'IsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ɾ����ʶ',
   'user', @CurrentUser, 'table', 'Banner', 'column', 'IsDeleted'
go

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
   Id                   int                  identity,
   Name                 nvarchar(50)         not null,
   constraint PK_DEPARTMENT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Department') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Department' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '���ű�', 
   'user', @CurrentUser, 'table', 'Department'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Department')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Department', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'Department', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Department')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Department', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'Department', 'column', 'Name'
go

/*==============================================================*/
/* Table: Job                                                   */
/*==============================================================*/
create table Job (
   Id                   int                  identity,
   JobTypeId            int                  not null,
   DepartmentId         int                  not null,
   WorkingPlace         nvarchar(50)         not null,
   HiringNumber         int                  not null,
   Responsibilities     nvarchar(max)        not null default '',
   Requirements         nvarchar(max)        not null default '',
   Preference           nvarchar(max)        not null default '',
   AsumePosts           nvarchar(max)        not null default '',
   AddTime              datetime             not null default getdate(),
   IsDeleted            bit                  not null default 0,
   constraint PK_JOB primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Job') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Job' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ְλ����Ƹ����Ϣ��', 
   'user', @CurrentUser, 'table', 'Job'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'Job', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'JobTypeId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'JobTypeId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ְλ����Id������ְλ���ͱ������',
   'user', @CurrentUser, 'table', 'Job', 'column', 'JobTypeId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DepartmentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'DepartmentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����Id���������ű������',
   'user', @CurrentUser, 'table', 'Job', 'column', 'DepartmentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WorkingPlace')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'WorkingPlace'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�����ص�',
   'user', @CurrentUser, 'table', 'Job', 'column', 'WorkingPlace'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'HiringNumber')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'HiringNumber'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ƹ����',
   'user', @CurrentUser, 'table', 'Job', 'column', 'HiringNumber'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Responsibilities')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'Responsibilities'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��λְ��',
   'user', @CurrentUser, 'table', 'Job', 'column', 'Responsibilities'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Requirements')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'Requirements'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ְҪ��',
   'user', @CurrentUser, 'table', 'Job', 'column', 'Requirements'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Preference')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'Preference'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���ȿ���',
   'user', @CurrentUser, 'table', 'Job', 'column', 'Preference'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AsumePosts')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'AsumePosts'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����Ͷ�ݷ�ʽ',
   'user', @CurrentUser, 'table', 'Job', 'column', 'AsumePosts'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AddTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'AddTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���ʱ��',
   'user', @CurrentUser, 'table', 'Job', 'column', 'AddTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Job', 'column', 'IsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ɾ����ʶ',
   'user', @CurrentUser, 'table', 'Job', 'column', 'IsDeleted'
go

/*==============================================================*/
/* Table: JobType                                               */
/*==============================================================*/
create table JobType (
   Id                   int                  identity,
   Name                 nvarchar(50)         not null,
   constraint PK_JOBTYPE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('JobType') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'JobType' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ְλ���ͱ�', 
   'user', @CurrentUser, 'table', 'JobType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('JobType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'JobType', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'JobType', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('JobType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'JobType', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ְλ����',
   'user', @CurrentUser, 'table', 'JobType', 'column', 'Name'
go

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product (
   Id                   int                  identity,
   Name                 nvarchar(50)         not null,
   Description          nvarchar(500)        not null default '',
   Model                nvarchar(100)        not null default '',
   Details              nvarchar(max)        not null default '',
   Specification        nvarchar(max)        not null default '',
   ShowInHomePage       bit                  not null default 0,
   AddTime              datetime             not null default getdate(),
   UpdateTime           datetime             not null default getdate(),
   IsDeleted            bit                  not null default 0,
   constraint PK_PRODUCT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Product') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Product' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '��Ʒ��Ϣ��', 
   'user', @CurrentUser, 'table', 'Product'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ʒ����',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Model')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Model'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ʒ�ͺ�',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Model'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Details')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Details'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ʒ����',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Details'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Specification')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'Specification'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ʒ��񣨼���������',
   'user', @CurrentUser, 'table', 'Product', 'column', 'Specification'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ShowInHomePage')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'ShowInHomePage'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�Ƿ�����ҳչʾ',
   'user', @CurrentUser, 'table', 'Product', 'column', 'ShowInHomePage'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AddTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'AddTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���ʱ��',
   'user', @CurrentUser, 'table', 'Product', 'column', 'AddTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'UpdateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ʱ��',
   'user', @CurrentUser, 'table', 'Product', 'column', 'UpdateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Product')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Product', 'column', 'IsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ɾ����ʶ',
   'user', @CurrentUser, 'table', 'Product', 'column', 'IsDeleted'
go

/*==============================================================*/
/* Table: ProductImage                                          */
/*==============================================================*/
create table ProductImage (
   Id                   int                  identity,
   ProductId            int                  not null,
   ImgUrl               varchar(100)               not null,
   IsDeleted            bit                  not null default 0,
   constraint PK_PRODUCTIMAGE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ProductImage') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ProductImage' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '��ƷͼƬ��', 
   'user', @CurrentUser, 'table', 'ProductImage'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('ProductImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('ProductImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProductId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'ProductId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ƷId��������Ʒ��Ϣ������',
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'ProductId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('ProductImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ImgUrl')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'ImgUrl'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ͼƬ��ַ',
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'ImgUrl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('ProductImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'IsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ɾ����ʶ',
   'user', @CurrentUser, 'table', 'ProductImage', 'column', 'IsDeleted'
go

/*==============================================================*/
/* Table: SystemUser                                            */
/*==============================================================*/
create table SystemUser (
   Id                   int                  identity,
   Username             varchar(16)          not null,
   Password             varchar(16)          not null,
   constraint PK_SYSTEMUSER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SystemUser') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SystemUser' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'ϵͳ�û���', 
   'user', @CurrentUser, 'table', 'SystemUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SystemUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SystemUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Username')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Username'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�û���',
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Username'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SystemUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', @CurrentUser, 'table', 'SystemUser', 'column', 'Password'
go


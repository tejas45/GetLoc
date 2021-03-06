USE [RMSystem]
GO
/****** Object:  Table [dbo].[WagesMaster]    Script Date: 12/22/2016 00:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WagesMaster](
	[WagesMasterID] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginID] [bigint] NULL,
	[ClientID] [bigint] NULL,
	[HourlyRate] [numeric](18, 2) NULL,
	[CratedDate] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__WagesMas__3214EC070BC6C43E] PRIMARY KEY CLUSTERED 
(
	[WagesMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RosterMaster]    Script Date: 12/22/2016 00:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RosterMaster](
	[RosterId] [bigint] IDENTITY(1,1) NOT NULL,
	[eid] [bigint] NULL,
	[cid] [bigint] NULL,
	[month] [int] NULL,
	[year] [bigint] NULL,
	[1] [varchar](5) NULL,
	[2] [varchar](5) NULL,
	[3] [varchar](5) NULL,
	[4] [varchar](5) NULL,
	[5] [varchar](5) NULL,
	[6] [varchar](5) NULL,
	[7] [varchar](5) NULL,
	[8] [varchar](5) NULL,
	[9] [varchar](5) NULL,
	[10] [varchar](5) NULL,
	[11] [varchar](5) NULL,
	[12] [varchar](5) NULL,
	[13] [varchar](5) NULL,
	[14] [varchar](5) NULL,
	[15] [varchar](5) NULL,
	[16] [varchar](5) NULL,
	[17] [varchar](5) NULL,
	[18] [varchar](5) NULL,
	[19] [varchar](5) NULL,
	[20] [varchar](5) NULL,
	[21] [varchar](5) NULL,
	[22] [varchar](5) NULL,
	[23] [varchar](5) NULL,
	[24] [varchar](5) NULL,
	[25] [varchar](5) NULL,
	[26] [varchar](5) NULL,
	[27] [varchar](5) NULL,
	[28] [varchar](5) NULL,
	[29] [varchar](5) NULL,
	[30] [varchar](5) NULL,
	[31] [varchar](5) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_RosterMaster] PRIMARY KEY CLUSTERED 
(
	[RosterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermissionMaster]    Script Date: 12/22/2016 00:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionMaster](
	[PermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionType] [nvarchar](200) NULL,
	[CreatedDate] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_PermissionMaster] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginMaster]    Script Date: 12/22/2016 00:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginMaster](
	[loginID] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Dob] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Photo] [nvarchar](max) NULL,
	[HourlyRate] [numeric](18, 2) NULL,
	[AnnualSalary] [numeric](18, 2) NULL,
	[OtherNotes] [nvarchar](max) NULL,
	[EmpDate] [date] NULL,
	[Permission] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[loginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetStaffInfoDRP]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStaffInfoDRP]
@PermissionId bigint
as
BEGIN
Select  LM.loginID,LM.Name  from LoginMaster as LM WITH(NOLOCK) 
where LM.Permission=@PermissionId and LM.IsDeleted=0 order by loginID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetStaffInfobyLoginId]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetStaffInfobyLoginId]
@LoginId bigInt
as
Begin
Select Top 1 * from LoginMaster With(nolock) Where IsDeleted=0 And loginID=@LoginId
END
GO
/****** Object:  StoredProcedure [dbo].[GetStaffInfo]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStaffInfo]
@PermissionId bigint
as
BEGIN
Select  *  from LoginMaster as LM WITH(NOLOCK) 
where LM.Permission=@PermissionId and LM.IsDeleted=0 order by loginID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetLoginInfo]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoginInfo]
@Email nvarchar(200),
@Password nvarchar(50)
as
BEGIN
Select  TOP 1 *  from LoginMaster as LM WITH(NOLOCK) 
where LM.Email=@Email and LM.Password=@Password and LM.IsDeleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllWages]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllWages]
as
Select WM.WagesMasterID,LM.Name AS EmployeeName,LM1.Name AS ClientName,WM.HourlyRate from WagesMaster as WM WITH(NOLOCK) 
Inner join LoginMaster as LM WITH(NOLOCK)ON LM.loginID=WM.LoginID AND LM.IsDeleted=0
Inner join LoginMaster as LM1 WITH(NOLOCK)ON LM1.loginID=WM.ClientID AND LM1.IsDeleted=0
WHERE WM.IsDeleted=0
order by WM.WagesMasterID desc
GO
/****** Object:  StoredProcedure [dbo].[GetAllPermission]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPermission]
as
Select PM.PermissionId,PM.PermissionType from PermissionMaster as PM WITH(NOLOCK) 
WHERE PM.IsDeleted=0
order by PM.PermissionId asc
GO
/****** Object:  StoredProcedure [dbo].[DeleteLoginProfile]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLoginProfile]
@LoginMasterId BIGINT
AS
BEGIN
IF(@LoginMasterId>0)
BEGIN
	UPDATE LoginMaster SET IsDeleted=1 WHERE loginID=@LoginMasterId
END

END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateStaffInfo]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateStaffInfo]
@LoginMasterID BIGINT,
@Email	nvarchar(200),
@Password	nvarchar(50),
@Name	nvarchar(200),
@Address	nvarchar(max),
@Phone	nvarchar(50),
@Dob	nvarchar(50),
@Gender	nvarchar(50),
@Photo	nvarchar(max),
@HourlyRate	numeric(18,2),
@AnnualSalary	numeric(18,2),
@OtherNotes	nvarchar(max),
@EmpDate	date,
@Permission	bigint,
@LoginId bigint out
as
BEGIN
SET NOCOUNT ON
	IF(@LoginMasterID=0)
	BEGIN
		INSERT into LoginMaster (Email,Password,Name,Address,Phone,Dob,Gender,Photo,HourlyRate,AnnualSalary,OtherNotes,EmpDate,Permission)
		values (@Email,@Password,@Name,@Address,@Phone,@Dob,@Gender,@Photo,@HourlyRate,@AnnualSalary,@OtherNotes,@EmpDate,@Permission)
	
		SET @LoginId=SCOPE_IDENTITY()
		RETURN @LoginId
	END
	ELSE
	BEGIN
		UPDATE LoginMaster SET Email=@Email,Password=@Password,Name=@Name,Address=@Address,Phone=@Phone,
		Dob=@Dob,Gender=@Gender,Photo=@Photo,HourlyRate=@HourlyRate,AnnualSalary=@AnnualSalary,
		OtherNotes=@OtherNotes,EmpDate=@EmpDate,Permission=@Permission WHERE loginID=@LoginMasterID
		
		SET @LoginId=@LoginMasterID
		RETURN @LoginId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddDeleteWagesInfo]    Script Date: 12/22/2016 00:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDeleteWagesInfo]
@WagesMasterID bigint,
@LoginID	bigint,
@ClientID	bigint,
@HourlyRate	numeric(18,2),
@WagesID bigint out
as
BEGIN
SET NOCOUNT ON
	IF(@WagesMasterID=0)
	BEGIN
		INSERT into WagesMaster (LoginID,ClientID,HourlyRate)
		values (@LoginID,@ClientID,@HourlyRate)
	
		SET @WagesID=SCOPE_IDENTITY()
		RETURN @WagesID
	END
	ELSE
	BEGIN
		UPDATE WagesMaster SET IsDeleted=1 WHERE WagesMasterID=@WagesMasterID
		
		SET @WagesID=@WagesMasterID
		RETURN @WagesID
	END
END
GO
/****** Object:  Default [DF_Table_1_createdDate]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[LoginMaster] ADD  CONSTRAINT [DF_Table_1_createdDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_LoginMaster_IsDeleted]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[LoginMaster] ADD  CONSTRAINT [DF_LoginMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_PermissionMaster_CreatedDate]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[PermissionMaster] ADD  CONSTRAINT [DF_PermissionMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_PermissionMaster_IsDeleted]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[PermissionMaster] ADD  CONSTRAINT [DF_PermissionMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF__WagesMast__Crate__0DAF0CB0]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[WagesMaster] ADD  CONSTRAINT [DF__WagesMast__Crate__0DAF0CB0]  DEFAULT (getdate()) FOR [CratedDate]
GO
/****** Object:  Default [DF__WagesMast__IsDel__0EA330E9]    Script Date: 12/22/2016 00:55:28 ******/
ALTER TABLE [dbo].[WagesMaster] ADD  CONSTRAINT [DF__WagesMast__IsDel__0EA330E9]  DEFAULT ((0)) FOR [IsDeleted]
GO

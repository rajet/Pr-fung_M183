CREATE TABLE [dbo].[Userlogin] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [Username]  VARCHAR (50) NOT NULL,
    [Password]  VARCHAR (50) NOT NULL,
    [IP]        VARCHAR (20) NULL,
    [Browser]   VARCHAR (20) NULL,
    [SessionID] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

SET IDENTITY_INSERT [dbo].[Userlogin] ON
INSERT INTO [dbo].[Userlogin] ([Id], [Username], [Password], [IP], [Browser], [SessionID]) VALUES (1, N'test', N'test', NULL, NULL, N'b93130f5354bf0b258dd244cbd2d76ce46e0c248')
SET IDENTITY_INSERT [dbo].[Userlogin] OFF

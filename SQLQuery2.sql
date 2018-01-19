CREATE TABLE [dbo].[Comment] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [PostId]    VARCHAR (50) NOT NULL,
    [Comment]   TEXT         NOT NULL,
    [CreatedOn] DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

SET IDENTITY_INSERT [dbo].[Comment] ON
INSERT INTO [dbo].[Comment] ([Id], [PostId], [Comment], [CreatedOn]) VALUES (2, N'1', N'Hello there, great article! Keep it up!', N'2018-01-01 00:00:00')
INSERT INTO [dbo].[Comment] ([Id], [PostId], [Comment], [CreatedOn]) VALUES (4, N'1', N'Yes, indeed!', N'2018-01-01 00:00:00')
INSERT INTO [dbo].[Comment] ([Id], [PostId], [Comment], [CreatedOn]) VALUES (1002, N'1', N'asdads', N'2018-01-19 08:49:50')
SET IDENTITY_INSERT [dbo].[Comment] OFF


CREATE TABLE [dbo].[Post] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Title]       VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (500) NOT NULL,
    [Content]     TEXT          NOT NULL,
    [CreatedOn]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

SET IDENTITY_INSERT [dbo].[Post] ON
INSERT INTO [dbo].[Post] ([Id], [Title], [Description], [Content], [CreatedOn]) VALUES (1, N'How to Write a Blog Post', N'How to Write a Blog Post: A Bookmarkable Formula + 5 Free Blog Post Templates', N'You''ve probably heard how paramount blogging is to the success of your marketing. Without it, your SEO will tank, you''ll have nothing to promote in social media, you''ll have no clout with your leads and customers, and you''ll have fewer pages to put those valuable calls-to-action that generate inbound leads. Need I say more?

So why, oh why, does almost every marketer I talk to have a laundry list of excuses for why they can''t consistently blog? Maybe because, unless you''re one of the few people who actually like writing, business blogging kind of stinks. You have to find words, string them together into sentences, and ughhh where do you even start?', N'2018-01-01 00:00:00')
SET IDENTITY_INSERT [dbo].[Post] OFF


CREATE TABLE [dbo].[User] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (50) NOT NULL,
    [Password] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] ([Id], [Username], [Password]) VALUES (1, N'test', N'test')
SET IDENTITY_INSERT [dbo].[User] OFF
USE [quanlisanbong]
GO
/****** Object:  Table [dbo].[doithue]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doithue](
	[madoithue] [nvarchar](50) NOT NULL,
	[tendoithue] [nvarchar](50) NOT NULL,
	[dtdoithue] [nvarchar](50) NOT NULL,
	[masan] [nvarchar](50) NOT NULL,
	[khunggio] [nvarchar](50) NOT NULL,
	[ngaythue] [datetime] NOT NULL,
	[madichvu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doithue] PRIMARY KEY CLUSTERED 
(
	[madoithue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanbong]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanbong](
	[masan] [nvarchar](50) NOT NULL,
	[tensan] [nvarchar](50) NOT NULL,
	[loaisan] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[giasan] [float] NULL,
 CONSTRAINT [PK_sanbong_1] PRIMARY KEY CLUSTERED 
(
	[masan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[madoithue] [nvarchar](50) NOT NULL,
	[masan] [nvarchar](50) NOT NULL,
	[khunggio] [nvarchar](50) NOT NULL,
	[ngaythue] [datetime] NOT NULL,
	[madichvu] [nvarchar](50) NOT NULL,
	[manhanvien] [nvarchar](50) NOT NULL,
	[tongtien] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dichvu]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dichvu](
	[madichvu] [nvarchar](50) NOT NULL,
	[tendichvu] [nvarchar](50) NOT NULL,
	[giadichvu] [float] NOT NULL,
 CONSTRAINT [PK_dichvu_1] PRIMARY KEY CLUSTERED 
(
	[madichvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_thongtinthue]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_thongtinthue]
AS
SELECT dbo.doithue.tendoithue, dbo.doithue.dtdoithue, dbo.sanbong.tensan, dbo.sanbong.diachi, dbo.hoadon.khunggio, dbo.hoadon.ngaythue, dbo.dichvu.tendichvu
FROM     dbo.doithue INNER JOIN
                  dbo.hoadon ON dbo.doithue.madoithue = dbo.hoadon.madoithue INNER JOIN
                  dbo.sanbong ON dbo.doithue.masan = dbo.sanbong.masan INNER JOIN
                  dbo.dichvu ON dbo.doithue.madichvu = dbo.dichvu.madichvu
GO
/****** Object:  Table [dbo].[ngaythuesan]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ngaythuesan](
	[ngaythue] [datetime] NOT NULL,
	[khunggio] [nvarchar](50) NOT NULL,
	[tinhtrang] [bit] NOT NULL,
	[masan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ngaythuesan_1] PRIMARY KEY CLUSTERED 
(
	[khunggio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_checksan]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_checksan]
AS
SELECT dbo.sanbong.tensan, dbo.ngaythuesan.khunggio, dbo.ngaythuesan.ngaythue, dbo.doithue.tendoithue, dbo.ngaythuesan.tinhtrang
FROM     dbo.ngaythuesan INNER JOIN
                  dbo.doithue ON dbo.ngaythuesan.khunggio = dbo.doithue.khunggio INNER JOIN
                  dbo.sanbong ON dbo.ngaythuesan.masan = dbo.sanbong.masan AND dbo.doithue.masan = dbo.sanbong.masan
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manhanvien] [nvarchar](50) NOT NULL,
	[tennhanvien] [nvarchar](50) NOT NULL,
	[chucvu] [nvarchar](50) NOT NULL,
	[dtnhanvien] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_nhanvien] PRIMARY KEY CLUSTERED 
(
	[manhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_xemhoadon]    Script Date: 11/13/2022 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_xemhoadon]
AS
SELECT dbo.doithue.tendoithue, dbo.doithue.dtdoithue, dbo.sanbong.tensan, dbo.hoadon.khunggio, dbo.hoadon.ngaythue, dbo.dichvu.tendichvu, dbo.nhanvien.tennhanvien, dbo.hoadon.tongtien
FROM     dbo.doithue INNER JOIN
                  dbo.dichvu ON dbo.doithue.madichvu = dbo.dichvu.madichvu INNER JOIN
                  dbo.hoadon ON dbo.doithue.madoithue = dbo.hoadon.madoithue INNER JOIN
                  dbo.nhanvien ON dbo.hoadon.manhanvien = dbo.nhanvien.manhanvien INNER JOIN
                  dbo.sanbong ON dbo.doithue.masan = dbo.sanbong.masan
GO
ALTER TABLE [dbo].[doithue]  WITH CHECK ADD  CONSTRAINT [FK_doithue_dichvu] FOREIGN KEY([madichvu])
REFERENCES [dbo].[dichvu] ([madichvu])
GO
ALTER TABLE [dbo].[doithue] CHECK CONSTRAINT [FK_doithue_dichvu]
GO
ALTER TABLE [dbo].[doithue]  WITH CHECK ADD  CONSTRAINT [FK_doithue_ngaythuesan] FOREIGN KEY([khunggio])
REFERENCES [dbo].[ngaythuesan] ([khunggio])
GO
ALTER TABLE [dbo].[doithue] CHECK CONSTRAINT [FK_doithue_ngaythuesan]
GO
ALTER TABLE [dbo].[doithue]  WITH CHECK ADD  CONSTRAINT [FK_doithue_sanbong] FOREIGN KEY([masan])
REFERENCES [dbo].[sanbong] ([masan])
GO
ALTER TABLE [dbo].[doithue] CHECK CONSTRAINT [FK_doithue_sanbong]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_doithue] FOREIGN KEY([madoithue])
REFERENCES [dbo].[doithue] ([madoithue])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_doithue]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_ngaythuesan] FOREIGN KEY([khunggio])
REFERENCES [dbo].[ngaythuesan] ([khunggio])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_ngaythuesan]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_nhanvien] FOREIGN KEY([manhanvien])
REFERENCES [dbo].[nhanvien] ([manhanvien])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_nhanvien]
GO
ALTER TABLE [dbo].[ngaythuesan]  WITH CHECK ADD  CONSTRAINT [FK_ngaythuesan_sanbong] FOREIGN KEY([masan])
REFERENCES [dbo].[sanbong] ([masan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ngaythuesan] CHECK CONSTRAINT [FK_ngaythuesan_sanbong]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ngaythuesan"
            Begin Extent = 
               Top = 10
               Left = 321
               Bottom = 239
               Right = 526
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doithue"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 278
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "sanbong"
            Begin Extent = 
               Top = 7
               Left = 583
               Bottom = 261
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_checksan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_checksan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "doithue"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sanbong"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "dichvu"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 148
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_thongtinthue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_thongtinthue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "doithue"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dichvu"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 316
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "nhanvien"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sanbong"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_xemhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_xemhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_xemhoadon'
GO

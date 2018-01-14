object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 720
  ClientWidth = 823
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 551
    Top = 481
    Width = 217
    Height = 217
  end
  object Label1: TLabel
    Left = 476
    Top = 8
    Width = 46
    Height = 25
    Caption = 'bmp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 488
    Top = 240
    Width = 34
    Height = 25
    Caption = 'jpg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 463
    Top = 481
    Width = 77
    Height = 25
    Caption = 'image1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object DBImage1: TDBImage
    Left = 540
    Top = 8
    Width = 265
    Height = 217
    DataField = 'BmpImage'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 449
    Height = 481
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 63
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 165
    Top = 560
    Width = 124
    Height = 41
    Caption = 'Loadfromfile'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DBImage2: TDBImage
    Left = 540
    Top = 240
    Width = 265
    Height = 217
    DataField = 'JpgImage'
    DataSource = DataSource1
    TabOrder = 4
  end
  object Button3: TButton
    Left = 165
    Top = 607
    Width = 124
    Height = 41
    Caption = 'Loadfromstream'
    TabOrder = 5
    OnClick = Button3Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\SES\DelphiXE\temp\TestSqLite4\Materiale.s3db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 762
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 768
    Top = 64
  end
  object FDTable1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from materiale order by id')
    Left = 752
    Top = 144
  end
end

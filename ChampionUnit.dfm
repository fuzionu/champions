object ChampionForm: TChampionForm
  Left = 430
  Top = 308
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Find Champion'
  ClientHeight = 400
  ClientWidth = 378
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LolLogo: TImage
    Left = 32
    Top = 8
    Width = 313
    Height = 121
  end
  object ChampionImage: TImage
    Left = 16
    Top = 144
    Width = 169
    Height = 169
  end
  object ChampionStats: TLabel
    Left = 195
    Top = 144
    Width = 3
    Height = 13
  end
  object ChampNotFound: TLabel
    Left = 136
    Top = 312
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object InputField: TEdit
    Left = 64
    Top = 328
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'Seach for Champion...'
    OnClick = InputFieldClick
  end
  object SearchButton: TButton
    Left = 64
    Top = 360
    Width = 113
    Height = 17
    Caption = 'Search'
    TabOrder = 1
    OnClick = SearchButtonClick
  end
  object ClearButton: TButton
    Left = 208
    Top = 360
    Width = 113
    Height = 17
    Caption = 'Clear'
    TabOrder = 2
    OnClick = ClearButtonClick
  end
  object ExitButton: TButton
    Left = 152
    Top = 384
    Width = 81
    Height = 17
    Caption = 'Exit'
    TabOrder = 3
    OnClick = ExitButtonClick
  end
end

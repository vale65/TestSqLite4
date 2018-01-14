unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.FMTBcd,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.Gestures,
  System.Actions, FMX.ActnList, FMX.TabControl, FMX.Objects, FMX.Ani, FMX.Edit,
  FMX.ListView,
  FMX.Surfaces,

  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
  {$ELSE}
    Vcl.Imaging.jpeg,
  {$ENDIF}

  FMX.Graphics, REST.Backend.EMSServices, REST.Backend.EMSFireDAC;


//  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.IOUtils,
//  FMX.Types,
//  FMX.Controls,
//  FMX.Forms, FMX.Graphics, FMX.Dialogs,
//  FMX.ListView.Types, FMX.TabControl, FMX.ListView, FMX.StdCtrls,
//  FMX.Controls.Presentation,
//  System.Actions, FMX.ActnList, FMX.Gestures,
//  FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
//  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
//  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
//  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB,
//  FireDAC.Comp.Client, Firedac.DApt, FMX.ListView.Appearances,
//  FMX.ListView.Adapters.Base, FMX.Objects,
//  FMX.Surfaces, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
//  FireDAC.Comp.DataSet, FMX.Ani;
//  Vcl.Graphics,
//  Vcl.AxCtrls,



type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    ListaTab: TTabItem;
    DettaglioTab: TTabItem;
    ToolBar2: TToolBar;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    GestureManager1: TGestureManager;
    ListView1: TListView;
    ToolBar1: TToolBar;
    AboutBtn: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    Label2: TLabel;
    BitmapAnimation1: TBitmapAnimation;
    Image1: TImage;
    EstraiBmp: TSpeedButton;
    FDQuery1: TFDQuery;
    FDQuery1id: TIntegerField;
    FDQuery1des: TStringField;
    FDQuery1JpgImage: TBlobField;
    FDQuery1BmpImage: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure ListView1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ListView1ItemClickEx2(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
//    function GetBitmapFromBlob( Blob: TBlobField): TBitmap;
//    function LoadBmpFromJpgBlob(Blob: TBlobField): TBitmap;
    procedure Jpeg2Bmp(Blob: TBlobField; var BMP: TBitmap);
    procedure AboutBtnClick(Sender: TObject);
//    procedure CaricaJpg;
    procedure EstraiBmpClick(Sender: TObject);
    procedure GetBitmapFromBlob( Blob: TBlobField; var Bmp: TBitmap);
private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ioUtils;

{$R *.fmx}

procedure TForm1.AboutBtnClick(Sender: TObject);
begin
//  CaricaJpg;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  showmessage('00');
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := ListaTab;


{$IF DEFINED(IOS) or DEFINED(ANDROID)}
//  showmessage('05');
//  FDConnection1.Params.Values['Database'] := TPath.GetDocumentsPath +  'Materiale.s3db';
  FDConnection1.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'Materiale.s3db';
  showmessage( FDConnection1.Params.Values['Database'] );
  FDConnection1.Connected := True;
  if FDConnection1.Connected then
    showmessage( 'FDConnection1.Connected' );
{ $ ELSE}
//  FireTaskList.Params.Values['Database'] := 'tasks.s3db';
{$ENDIF}







end;


procedure TForm1.ListView1Click(Sender: TObject);
begin
// questo da errore:
  //Label2.Text := Listview1.Selected.ToString;

end;

procedure TForm1.ListView1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiLongTap then
    ShowMessage('EventInfo.GestureID = igiLongTap');

end;






procedure TForm1.ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
//  ms: TMemoryStream;
//  Jpg: TJpegImage;
//  BMP: TBitmap;
  q: TFDQuery;
  s: string;
//  Blob: TBlobField;
  Str: TStream;
begin
  if LocalClickPos.X >= TListView( Sender ).Width -60 then
    ChangeTabAction1.ExecuteTarget( Self );

  s := TListView( Sender ).Items[TListView( Sender ).ItemIndex].Text;
  Label2.Text := s;

  s := Trim(copy(s, 1, pos('-',s)-1));

  q := TFDQuery.Create(Self);
  try
    q.Connection := FDConnection1;
    q.SQL.Clear;
    q.SQL.Add('SELECT id, des, JpgImage, BmpImage FROM MATERIALE WHERE id = :id');
    q.Params.ParamByName('id').Value := s;
    q.Open();

//    BMP := TBitmap.Create;
//    try
////      Jpeg2Bmp(TBlobField( q.FieldByName('FOTO') ), BMP);
////      BMP := LoadBmpFromJpgBlob(TBlobField( q.FieldByName('FOTO') ));
////      LoadJpgFromBlob(BMP, TBlobField( q.FieldByName('FOTO') ));
////      Image1.Bitmap.Assign(BMP);
////      Image1.Bitmap := BMP;
//
//
//      ms := TMemoryStream.Create;
//
//
//      Blob := TBlobField( q.FieldByName('BmpImage') );
//      Blob.SaveToStream(ms);
////      Image1.Bitmap.CreateFromStream(ms);
//      Image1.Bitmap.LoadFromStream(ms);
//
//    finally
//      BMP.Free;
//    end;
//



//      MS := TMemoryStream.Create;
//      try
//        TBlobField(q.FieldByName('BmpImage')).SaveToStream(MS);
//        MS.Position := 0;
//
//        BMP := TBitmap.Create;
//        Jpg := TJPEGImage.Create;
//        try
//          Bmp.LoadFromStream(MS);
//          Image1.Bitmap.Assign(Bmp);
//          Image1.Repaint;
//        finally
//          Jpg.Free;
//          Bmp.Free;
//        end;
//      finally
//        MS.Free;
//      end;




  // creo uno stream da un campo blob che contiene un jpeg
  Str := q.CreateBlobStream(q.FieldByName('JpgImage'),TBlobStreamMode.bmRead);
//  Str := q.CreateBlobStream(q.FieldByName('JpgImage'),TBlobStreamMode.bmRead);

try
  Image1.Bitmap.LoadFromStream(str);
  Image1.Visible := True;

finally
  str.Free;
end;





    q.Close;
  finally
    q.Free;
  end;















end;










procedure TForm1.ListView1ItemClickEx2(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemObject);
begin
  if LocalClickPos.X >= TListView( Sender ).Width -60 then
    ChangeTabAction1.ExecuteTarget( Self );
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  q: TFDQuery;
  LItem: TListViewItem;
begin
  q := TFDQuery.Create(Self);
  try
    q.Connection := FDConnection1;
    q.SQL.Clear;
    q.SQL.Add('SELECT * FROM Materiale WHERE des LIKE :Des');
    q.Params.ParamByName('Des').Value := Edit1.Text + '%';
    try
      q.Open;
      showmessage( 'q active' );
    except
      showmessage( 'q not active' );
    end;

    ListView1.Items.Clear;
    ListView1.BeginUpdate;

    while not q.Eof do
    begin
      LItem := ListView1.Items.Add;
      LItem.Text := q.FieldByName('ID').AsString + ' - ' + q.FieldByName('Des').AsString;


      q.Next;
    end;
    ListView1.EndUpdate;
    q.Close;
  finally
    q.Free;
  end;
//
//
//      LItem := ListView1.Items.Add;
//      LItem.Text := 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
//
//
//      LItem := ListView1.Items.Add;
//      LItem.Text := 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
//
//      LItem := ListView1.Items.Add;
//      LItem.Text := 'cccccccccccccccccccccccccccccccccc';


end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  ChangeTabAction2.ExecuteTarget( Self );
  Image1.Visible := False;
end;






//function TForm1.LoadBmpFromJpgBlob(Blob: TBlobField): TBitmap;
//var
//  ms: TMemoryStream;
//  Picture: TPicture;
//begin
//  ms := TMemoryStream.Create;
//  try
//    Blob.SaveToStream(ms);
//    Picture := TPicture.Create;
//    Picture.LoadFromStream(ms);
//    Result := TBitmap.Create;
//    try
//      Result.Width := Picture.Width;
//      Result.Height := Picture.Height;
//      Result.Canvas.Draw(0, 0, Picture.Graphic);
//    finally
//      Result.Free;
//    end;
//  finally
////    Picture.Free;
//  end;
//end;




//procedure TForm1.LoadJpgFromBlob(Jpeg: TJpegImage; Blob: TBlobField);
//var
//  ms: TMemoryStream;
//begin
//  ms := TMemoryStream.Create;
//  try
//    Blob.SaveToStream(ms);
//    ms.Position := 0;
//    JPeg.LoadFromStream(ms);
//  finally
//    ms.Free;
//  end;
//end;




//
//procedure TForm1.Jpeg2Bmp(Blob: TBlobField; var BMP: TBitmap);
//var
//  ms: TMemoryStream;
//  Jpg: TJPEGImage;
//begin
//  ms := TMemoryStream.Create;
//  Blob.SaveToStream(ms);
//
////  Bmp.PixelFormat := pf32bit;
//  Jpg := TJPEGImage.Create;
//  try
//    Jpg.LoadFromStream(ms);
//    Bmp.Assign(Jpg);
//  finally
//    Jpg.Free;
//  end;
//
//end;





//function TForm1.BmpResize(Fileorig, FileThumb: string; DimPixelBmp: double): boolean;
procedure TForm1.Jpeg2Bmp(Blob: TBlobField; var BMP: TBitmap);
{$IF DEFINED(IOS) or DEFINED(ANDROID)}
{$ELSE}
var
  ms: TMemoryStream;
  Jpg: TJpegImage;
//  Scale: Double;
{$ENDIF}
begin
{$IF DEFINED(MSWINDOWS)}
  ms := TMemoryStream.Create;
  Blob.SaveToStream(ms);

  Jpg := TJpegImage.Create;

  try
    try
      Jpg.LoadfromStream(ms);

//      if jpg.Height > Jpg.Width then
//        Scale := DimPixelBmp / Jpg.Height
//      else
//        Scale := DimPixelBmp / Jpg.Width;
//
//      caption := FloatToStr( Scale );

//      Bmp := TBitmap.Create;
      try
        try

          {Create thumbnail bitmap, keep pictures aspect ratio}
          Bmp.Width := Jpg.Width;
          Bmp.Height:= Jpg.Height;
//          Bmp.Canvas.StretchDraw( Bmp.Canvas.Cliprect, Jpg );

          {Draw thumbnail as control}
//          Self.Canvas.Draw(100, 10, Bmp);

          {Convert back to JPEG and save to file}
          Jpg.Assign( Bmp );
    //      Jpg.SaveToFile( ChangeFileext(FileDest,  FSuffFotoRidotte + '.JPG') );
//          Bmp.SaveToFile( ChangeFileext(FileThumb, FSuffMiniature   + '.BMP') );

//          Result := True;
        finally
//          Bmp.free;
        end
      except
//        Memo1.Lines.Add( 'Errore conve ' + ExtractFileName(FileOrig) ) ;
      end;

    finally
      Jpg.free;
    end;
  except
//    Memo1.Lines.Add( 'Errore caric ' + ExtractFileName(FileOrig) );
  end;
{$ENDIF}

end;


//procedure TForm1.CaricaJpg;
//var
//  q: TFDQuery;
//  jp: TJpegimage;
//begin
//  jp := TJpegimage.Create;
//  jp.LoadFromFile('D:\SES\DelphiXE\temp\TestSqLite4\boxer.jpg');
//
//  q := TFDQuery.Create(Self);
//  q.Connection := FDConnection1;
//  q.SQL.Text := 'update materiale set JpgImage = :JpgImage where id = 1';
//  q.Params.ParamByName('JpgImage').Assign(jp);
//  q.ExecSQL;
//  q.Free;
//
//
//end;
//


procedure TForm1.EstraiBmpClick(Sender: TObject);
{$IF DEFINED(MSWINDOWS)}

var
  u,q: TFDQuery;
  Surf: TBitmapSurface;
  Stream: TMemoryStream;
  Bmp: TBitmap;
  jpg: TJpegimage;
{$endif}
begin
{$IF DEFINED(MSWINDOWS)}

  q := TFDQuery.Create(Self);
  q.Connection := FDConnection1;
  q.SQL.Text := 'Select * from materiale order by id';
  q.Open;

  u := TFDQuery.Create(Self);
  u.Connection := FDConnection1;
  u.SQL.Text := 'UPDATE materiale SET JpgImage = :stream where id = :id';

  while not q.Eof do
  begin
    Surf := TBitmapSurface.Create;
    Stream := TMemoryStream.Create;
    Bmp := TBitmap.Create;
    Jpg := TJpegimage.Create;

    try
      Stream.Position := 0;
      GetBitmapFromBlob( TBlobField(q.FieldByName('BmpImage') ), Bmp);
      Surf.Assign( Bmp );
      TBitmapCodecManager.SaveToStream( Stream, Surf, '.jpg');
      Jpg.LoadFromStream(Stream);
//      Stream.Position := 0;
//      Stream.SaveToFile('D:\SES\DelphiXE\temp\TestSqLite4\Immagini\' +q.FieldByName('id').AsString + '.png');

      // salvo


      u.Params.ParamByName('stream').Assign(Jpg);
      u.Params.ParamByName('id').Value := q.FieldByName('id').Value;
      u.ExecSQL;

    finally
      Surf.Free;
      Stream.Free;
      Bmp.Free;
      Jpg.Free;
    end;


    q.Next;
  end;
  q.Free;
{$endif}

end;



procedure TForm1.GetBitmapFromBlob( Blob: TBlobField; var Bmp: TBitmap);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;

    Bmp.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;


end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, FireDAC.Comp.UI, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.VCLUI.Wait,
Vcl.Imaging.jpeg  ;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    DBImage1: TDBImage;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    DBImage2: TDBImage;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    FDTable1: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
FDTable1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  jpg: TJpegImage;
  q: TFDQuery;
begin
//  Image1.Picture.RegisterFileFormat( 'jpg', 'JPG File' , TJPEGImage);
  q := TFDQuery.Create(Self);
  q.Connection := FDConnection1;
  q.SQL.Add('update materiale set JpgImage = :jpg where id = :id');
  jpg := TJpegImage.Create;


  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1978 - Never Say Die!\folder.jpg');
  q.Params.ParamByName('id').Value := 1;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1975 - Sabotage\folder.jpg');
  q.Params.ParamByName('id').Value := 2;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Blue Oyster Cult - 1975 - On Your Feet Or On Your Knees\folder.jpg');
  q.Params.ParamByName('id').Value := 3;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1970 - Black Sabbath\folder.jpg');
  q.Params.ParamByName('id').Value := 4;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1970 - Paranoid\folder.jpg');
  q.Params.ParamByName('id').Value := 5;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1971 - Master Of Reality\folder.jpg');
  q.Params.ParamByName('id').Value := 6;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1972 - Vol. 4\folder.jpg');
  q.Params.ParamByName('id').Value := 7;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1973 - Sabbath Bloody Sabbath\folder.jpg');
  q.Params.ParamByName('id').Value := 8;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1983 - Live Evil\folder.jpg');
  q.Params.ParamByName('id').Value := 9;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;

  jpg.LoadFromFile('D:\Musica\MP3\Hard Rock\Black Sabbath - 1981 - Mob Rules\folder.jpg');
  q.Params.ParamByName('id').Value := 10;
  q.Params.ParamByName('Jpg').Assign(jpg);
  q.ExecSQL;




  q.Free;
  jpg.Free;

end;




procedure TForm1.Button3Click(Sender: TObject);
var
  ms: TMemoryStream;
  Jpg: TJPegImage;
//  Blob: TBlobField;
begin
//  ms := TMemoryStream.Create;
//  TBlobField( FDTable1.FieldByName('BmpImage') ).SaveToStream(ms);
//  Image1.Picture.LoadFromStream(ms);
//  Image1.Refresh;
//  Image1.Repaint;




  MS := TMemoryStream.Create;
  try
    TBlobField(FDTable1.FieldByName('JpgImage')).SaveToStream(MS);
    MS.Position := 0;

    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromStream(MS);
      Image1.Picture.Assign(Jpg);
    finally
      Jpg.Free;
    end;
  finally
    MS.Free;
  end;








end;





procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDTable1.Close;
  FDConnection1.Connected := False;
end;

end.

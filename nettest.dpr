program nettest;

uses
  Forms,
  netu in 'netu.pas' {f1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf1, f1);
  Application.Run;
end.

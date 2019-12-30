{$APPTYPE CONSOLE}
uses sox, crt;

var

  sc: cardinal;
  buf: array of byte;

BEGIN
  initwsa;
  sc := createsocket;

  if paramcount <> 1 then begin
    writeln( 'haszn�lat: ' + paramstr(0) + ' <c�l IP>' );
    exit;
  end;
  if connect( sc, paramstr(1), 666 ) <> 0 then f_error( 'error at connect' );
  setlength( buf, 1024*1024 );

  repeat
    sendbuf( sc, buf, 1024*1024 );
  until keypressed;

  disconnect( sc );

  closewsa;
END.
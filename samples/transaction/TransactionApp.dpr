// ***************************************************************************
//
// Aspect For Delphi
//
// Copyright (c) 2015-2019 Ezequiel Juliano M�ller
//
// ***************************************************************************
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// ***************************************************************************

program TransactionApp;

uses
  Vcl.Forms,
  Main.View in 'Main.View.pas' {MainView} ,
  DB.Connection in 'DB.Connection.pas' {DBConnection: TDataModule} ,
  Invoice.Model in 'Invoice.Model.pas' {InvoiceModel: TDataModule} ,
  Transactional.Attribute in 'Transactional.Attribute.pas',
  Transactional.Aspect in 'Transactional.Aspect.pas',
  Global.Context in 'Global.Context.pas',
  Invoice.Dto in 'Invoice.Dto.pas',
  Invoice.Repository in 'Invoice.Repository.pas';

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBConnection, DBConnection);
  Application.CreateForm(TMainView, MainView);
  Application.Run;

end.

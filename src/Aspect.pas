// ***************************************************************************
//
// Aspect For Delphi
//
// Copyright (c) 2015-2020 Ezequiel Juliano M�ller
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

unit Aspect;

interface

uses

  System.SysUtils,
  System.Rtti;

type

  IAspect = interface
    ['{7647B37E-7BEA-42BD-ADEE-E719AF3C6CE9}']
    function GetName: string;

    procedure OnBefore(
      instance: TObject;
      method: TRttiMethod;
      const args: TArray<TValue>;
      out invoke: Boolean;
      out result: TValue
      );

    procedure OnAfter(
      instance: TObject;
      method: TRttiMethod;
      const args: TArray<TValue>;
      var result: TValue
      );

    procedure OnException(
      instance: TObject;
      method: TRttiMethod;
      const args: TArray<TValue>;
      out raiseException: Boolean;
      theException: Exception;
      out result: TValue
      );

    property Name: string read GetName;
  end;

  IAspectWeaver = interface
    ['{211E40BC-753F-4865-BB35-9CF81F1435C7}']
    procedure Proxify(instance: TObject);
    procedure Unproxify(instance: TObject);
  end;

  IAspectContext = interface
    ['{962E0295-9091-41CA-AF39-F6FD41174231}']
    procedure RegisterAspect(aspect: IAspect);
    function Weaver: IAspectWeaver;
  end;

implementation

end.

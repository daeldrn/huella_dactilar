[Setup]
AppName=Control Asistencia
AppVersion=1.0
AppPublisher=AllNovu Huella Digital
DefaultDirName={autopf}\ControlAsistencia
DisableProgramGroupPage=yes
OutputBaseFilename=ControlAsistencia_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "ControlAsistencia_Ejecutable\ControlAsistencia.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ControlAsistencia_Ejecutable\runtime\*"; DestDir: "{app}\runtime"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ControlAsistencia_Ejecutable\jnisgfplib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\jnisgnfiqlib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\jnisgwsqlib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\sgfpamx.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\sgfplib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\sgnfiqlib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\sgwsqlib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "ControlAsistencia_Ejecutable\driver\SgDrvSetupUniversal.exe"; DestDir: "{app}\driver"; Flags: ignoreversion

[Dirs]
Name: "{app}\app"
Name: "{app}\runtime"
Name: "{app}\driver"

[Icons]
Name: "{autoprograms}\Control Asistencia"; Filename: "{app}\ControlAsistencia.exe"
Name: "{autodesktop}\Control Asistencia"; Filename: "{app}\ControlAsistencia.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Crear un icono en el escritorio"; GroupDescription: "Iconos adicionales:"; Flags: unchecked

[Run]
Filename: "{app}\driver\SgDrvSetupUniversal.exe"; Description: "Instalar el Driver Universal Secugen"; Flags: shellexec waituntilterminated; StatusMsg: "Instalando driver, por favor espere...";

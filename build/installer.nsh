!macro RunApp
${StdUtils.ExecShellAsUser} $0 "$launchLink" "open" ""
!macroend



!macro customInit
  !system "echo '' > ${BUILD_RESOURCES_DIR}/customInit"
  !ifdef IsSilent
    SetSilent silent
  !endif
!macroend

!macro preInit
	SetRegView 64
	WriteRegExpandStr HKLM "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Program Files (x86)\Burgan Anket"
	WriteRegExpandStr HKCU "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Program Files (x86)\Burgan Anket"
	SetRegView 32
	WriteRegExpandStr HKLM "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Program Files (x86)\Burgan Anket"
	WriteRegExpandStr HKCU "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Program Files (x86)\Burgan Anket"
!macroend


!macro customInstall
  !system "echo '/s' > ${BUILD_RESOURCES_DIR}/customInstall"
  ExecWait '"$INSTDIR\myapp.exe" /s'
  !insertmacro RunApp
!macroend

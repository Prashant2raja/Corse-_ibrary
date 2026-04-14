@ECHO OFF
SETLOCAL

set "MAVEN_PROJECTBASEDIR=%~dp0"
if "%MAVEN_PROJECTBASEDIR:~-1%"=="\" set "MAVEN_PROJECTBASEDIR=%MAVEN_PROJECTBASEDIR:~0,-1%"
set "WRAPPER_DIR=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper"
set "WRAPPER_JAR=%WRAPPER_DIR%\maven-wrapper.jar"
set "WRAPPER_PROPERTIES=%WRAPPER_DIR%\maven-wrapper.properties"

if not exist "%WRAPPER_PROPERTIES%" (
  echo Missing Maven wrapper properties file: "%WRAPPER_PROPERTIES%"
  exit /b 1
)

if not exist "%WRAPPER_JAR%" (
  if not exist "%WRAPPER_DIR%" mkdir "%WRAPPER_DIR%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference = 'Stop';" ^
    "$props = Get-Content '%WRAPPER_PROPERTIES%';" ^
    "$wrapperUrl = ($props | Where-Object { $_ -match '^wrapperUrl=' } | Select-Object -First 1).Split('=',2)[1];" ^
    "if (-not $wrapperUrl) { throw 'wrapperUrl is missing from maven-wrapper.properties'; }" ^
    "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13;" ^
    "Invoke-WebRequest -UseBasicParsing -Uri $wrapperUrl -OutFile '%WRAPPER_JAR%';"
  if errorlevel 1 (
    echo Failed to download Maven wrapper jar from the URL in "%WRAPPER_PROPERTIES%".
    exit /b 1
  )
)

set "WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain"

java -classpath "%WRAPPER_JAR%" "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %MAVEN_OPTS% %JAVA_OPTS% %MAVEN_DEBUG_OPTS% %WRAPPER_LAUNCHER% %*
exit /b %errorlevel%

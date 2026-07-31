@echo off
cd /d "%~dp0"

echo ========== Push to gitee ==========
git push gitee master
echo gitee exit code: %errorlevel%

echo.
echo ========== Push to origin ==========
git push origin master
echo origin exit code: %errorlevel%

echo.
echo ========== Complete ==========
pause

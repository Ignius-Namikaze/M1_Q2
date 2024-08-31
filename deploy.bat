@echo off
REM ========================================================
REM Batch Script for Deploying a Web Application
REM Author: Ignius_Namikaze
REM Date: 2024-08-31
REM ========================================================

REM Step 1: Stop the existing application service
echo Stopping the existing application service...
net stop "YourAppServiceName"
IF ERRORLEVEL 1 (
    echo Failed to stop the service. Exiting...
    exit /b 1
)

REM Step 2: Backup the current version of the application
echo Backing up the current version...
xcopy /E /I /Y "C:\Path\To\CurrentApp" "C:\Backup\Path\%date%_%time%"
IF ERRORLEVEL 1 (
    echo Backup failed. Exiting...
    exit /b 1
)

REM Step 3: Copy the new application files to the deployment directory
echo Deploying new version...
xcopy /E /I /Y "C:\Path\To\NewApp" "C:\Path\To\Deployment"
IF ERRORLEVEL 1 (
    echo Deployment failed. Exiting...
    exit /b 1
)

REM Step 4: Update environment variables (if needed)
echo Updating environment variables...
setx PATH "%PATH%;C:\Path\To\NewApp\bin"
IF ERRORLEVEL 1 (
    echo Failed to update environment variables. Exiting...
    exit /b 1
)

REM Step 5: Start the application service
echo Starting the application service...
net start "YourAppServiceName"
IF ERRORLEVEL 1 (
    echo Failed to start the service. Exiting...
    exit /b 1
)

REM Step 6: Confirm deployment success
echo Deployment successful!

REM End of Script
pause

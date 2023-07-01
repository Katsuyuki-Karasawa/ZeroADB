# Checking for administrative permissions
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Launch a new PowerShell session with administrative permissions
    Start-Process powershell -Verb runAs -ArgumentList "-File `"$($myInvocation.MyCommand.Definition)`""
    # Stop script execution
    exit
}

# Target URL and destination directory for the download
$url = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
$output = "C:\Program Files\Platform-Tools\platform-tools.zip"

# Destination file for log output
$logFile = "C:\Program Files\Platform-Tools\log.txt"

# Start logging
Start-Transcript -Path $logFile -Append

try {
    # Create download directory if it does not exist
    if (!(Test-Path -Path "C:\Program Files\Platform-Tools\")) {
        New-Item -ItemType Directory -Force -Path "C:\Program Files\Platform-Tools\"
    }

    # Download file
    Invoke-WebRequest -Uri $url -OutFile $output

    # Unzip the downloaded file
    Expand-Archive -Path $output -DestinationPath "C:\Program Files\Platform-Tools\" -Force

    # Delete the unzipped file
    Remove-Item -Path $output

    # Add path to environment variables
    $path = [Environment]::GetEnvironmentVariable("Path", "Machine")
    $newPath = $path + ";C:\Program Files\Platform-Tools\platform-tools"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")

} catch {
    Write-Output "Error Occured!: $($_.Exception.Message)"
    Write-Output "Continue the process"
}

# End logging
Stop-Transcript

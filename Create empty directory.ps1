

####################################
# Author:      Eric Austin
# Create date: March 2024
# Description: Quickly create an empty directory on the desktop
####################################

$DirectoryName = [string]$null;
$DirectoryPath = [string]$null;
$InstanceNumber = [int]$null;

Try {
    #initialize directory name
    $DirectoryName = (Get-Date).ToString("yyyy.MM.dd_");

    #initialize instance number
    $InstanceNumber = 0;

    #increment the instance number until a path is found which does not already exist
    Do {
        #initialize directory path
        $DirectoryPath = Join-Path -Path $Env:USERPROFILE -ChildPath "Desktop";
        
        $InstanceNumber++;

        $DirectoryPath = Join-Path -Path $DirectoryPath -ChildPath "$($DirectoryName + $InstanceNumber.ToString())";
    } Until (-not (Test-Path -Path $DirectoryPath));

    #create directory
    New-Item -ItemType "Directory" -Path $DirectoryPath | Out-Null;

    #open directory
    Start-Process "Explorer" -ArgumentList $DirectoryPath;
}

Catch {
    Throw $Error[0]
    Pause
}
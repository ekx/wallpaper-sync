Start-Sleep -Seconds 5

$imageUrl = "https://wallpaper.bede.re/wallpaper.webp"

$picturesFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::MyPictures)
$destinationPath = Join-Path $picturesFolder "wallpaper.webp"

$success = $false
do {
    try {
        Invoke-WebRequest -Uri $imageUrl -OutFile $destinationPath -UseBasicParsing -ErrorAction Stop
        $success = $true;
    } catch {
        Start-Sleep -Seconds 5
    }
} while (-not $success)

# PowerShell Module PSVirtualDesktop needed: https://github.com/MScholtes/PSVirtualDesktop
foreach ($user in (Get-ChildItem -Path C:\Users)) {
    $Env:PSModulePath += ";$($user.FullName)\Documents\PowerShell\Modules"
}
Set-AllDesktopWallpapers $destinationPath

# ImageGlass command line tool needed: https://github.com/d2phap/ImageGlass
$igcmd = "C:\Tools\ImageGlass\igcmd.exe"
&$igcmd set-lock-screen $destinationPath

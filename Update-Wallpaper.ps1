Start-Sleep -Seconds 5

$imageUrl = "https://wallpaper.bede.re/wallpaper.png"

$picturesFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::MyPictures)
$destinationPath = Join-Path $picturesFolder "wallpaper.png"

$success = $false
do {
    try {
        Invoke-WebRequest -Uri $imageUrl -OutFile $destinationPath -UseBasicParsing -ErrorAction Stop
        $success = $true;
    } catch {
        Start-Sleep -Seconds 5
    }
} while (-not $success)

foreach ($user in (Get-ChildItem -Path C:\Users)) {
    $Env:PSModulePath += ";$($user.FullName)\Documents\PowerShell\Modules"
}
Set-AllDesktopWallpapers $destinationPath

$igcmd = "C:\Tools\ImageGlass\igcmd.exe"
&$igcmd set-lock-screen $destinationPath

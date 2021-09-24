$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\output.txt -append


function changeWallpaper {
$link = "https://cdn1.zzcartoon.com/contents/videos_screenshots/1000/1318/preview.mp4.jpg";
$filename = "\pictures\" + (Get-Date -Format "ddmmyyyy-HH-mm-ss").ToString() + ".jpg";
$path = $env:USERPROFILE + $filename
wget $link -o $path;
Start-Sleep -s 1
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction,int uParam,string lpvParam,int fuWinIni);     
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@
add-type $code 
[Win32.Wallpaper]::SetWallpaper($path)
}
changeWallpaper;

Stop-Transcript
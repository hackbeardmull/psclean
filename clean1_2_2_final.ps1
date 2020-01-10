    $ErrorActionPreference= 'silentlycontinue'
    Stop-Process -name "chrome" "opera" "safari"
    echo "Cleaning.... "
	echo "gived to you by hackbeardmull"
 
    
    # Deklarierung und Zuweisung der Variablen für Windowsinterne Daten
    $temporary_Internet_path_7 = "C:\Users\$env:username\AppData\Local\Microsoft\Windows\Temporary Internet Files"
    $app_Data_local_path_7 = "C:\Users\$env:username\AppData\Local\Microsoft\Windows\Caches"
    $downloads_path_7 = "C:\Users\$env:username\Downloads"
    $local_temp_path_7 = "C:\Users\$env:username\AppData\Local\Temp"
    
    # Deklarieren und Zuweisen der Browserspezifischen Variablen
    $chrome_path_7 = "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\History"
    $chrome_cookies_path_7 = "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\Cookies"
    $opera_path_7 = "C:\Users\$env:username\AppData\Local\Opera Software\Opera Stable\History"
	$firefox_path_7 = "C:\Users\$env:username\AppData\Roaming\Mozilla\Firefox\Profiles\v3d4m8hb.default"
	$safari_path_7 = "C:\Users\$env:username\AppData\Roaming\Apple Computer\Safari"
    
    # Variablen Test
	$temporary_path =  Test-Path $temporary_Internet_path_7
    $check_cashe =    Test-Path $chrome_path_7
    $check_download = Test-Path $downloads_path_7
    
	
    
    if($temporary_path -eq $True -And $check_cashe -eq $True -And $check_download -eq $True)
    {
        # Löschen der Windowsinternen Internet/History Files
        echo "Clean history"
        RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1

        echo "Clean Temporary internet files"
        RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
        (Remove-Item app_Data_local_path_7\* -Force -Recurse) 2> $null
        RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2

        Write "Clean Cache"
        (Remove-Item $app_Data_local_path_7\* -Force -Recurse) 2> $null

        
        # Löschen der Browserspezifischen Daten
        Write "Clean Downloads"
        (Remove-Item $downloads_path_7\* -Force -Recurse) 2> $null  
        
        if (Test-Path $chrome_path_7)
        {
            Write "Clean Chrome"
            (Remove-Item $chrome_path_7 -Force ) 
        }

        if (Test-Path $opera_path_7)
        {
            Write "Clean Opera"
            (Remove-Item $opera_path_7 -Force )
        }
        
        if (Test-Path $safari_path_7)
        {
            Write "Clean Safari"
            (Remove-Item $safari_path_7\* -Force -Recurse) 2> $null
        }
        
	    # Löschen der Temp Daten
        Write "Clean Windows Temp"
        (Remove-Item $local_temp_path_7\* -Force -Recurse) 2> $null
       
       echo "Done"
	$nuller = Read-Host "Dat:"
    }
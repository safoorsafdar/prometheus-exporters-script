$ServiceName = "windows_exporter"
$Service = Get-Service -Name $ServiceName
if($Service.Status -eq "running"){
  Write-Host "$ServiceName is running"
  Stop-Service $ServiceName
  $app = Get-WmiObject -Class Win32_Product -Filter "Name='$ServiceName'"
  $app.Uninstall() 
} else {
    Write-Host "$ServiceName not found."
}

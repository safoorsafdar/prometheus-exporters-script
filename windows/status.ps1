$ServiceName = "windows Exporter"
$sHost = "127.0.0.1"
$sPort = "9182"

# Check Status of Service
$Service = Get-Service -Name $ServiceName
if($Service.Status -eq "running"){
    Write-Host "$ServiceName is running" 
    # First we create the request.
    $HTTP_Request = [System.Net.WebRequest]::Create("http://" + $sHost + ":"+ $sPort)

    # We then get a response from the site.
    $HTTP_Response = $HTTP_Request.GetResponse()

    # We then get the HTTP code as an integer.
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    If ($HTTP_Status -eq 200) {
        Write-Host "Site is OK!"
        exit 0;
    } Else {
        Write-Host "The Site may be down, please check!"
        # Finally, we clean up the http request by closing it.
        If ($HTTP_Response -eq $null) { } 
        Else { $HTTP_Response.Close() }
        exit 1;
    }
} else {
    Write-Host "$ServiceName status is: $Service.Status"
    throw 'ERROR'
    exit 1
}

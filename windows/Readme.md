## Test the powershell script localy

`docker run -v /tmp/localdata:/tmp/containerdata  -it --rm mcr.microsoft.com/powershell pwsh /tmp/containerdata/test.ps`

`docker run --rm -v $(pwd):$(pwd):ro --workdir $(pwd) mcr.microsoft.com/powershell pwsh install.ps1'
# Prometheus Exporters Installation Scripts

Repository includes the various scripts to install Prometheus exporters for Linux and Windows.

## Node Exporter [prometheus/node_exporter](https://github.com/prometheus/node_exporter)

|  Script |  Description | 
|---|---|
| install.sh  | Install the node exporter agent  | 
|  status.sh | Check the status of node exporter  |
|  remove.sh |  Remove the node exporter | 
|  restart.sh |  Restart the node exporter | 


## WMI Exporter [prometheus-community/windows_exporter](https://github.com/prometheus-community/windows_exporter)

|  Script |  Description | 
|---|---|
| install.ps1  | Install the wmi exporter agent  | 
|  status.ps1 | Check the status of wmi exporter  |
|  remove.ps1 |  Remove the wmi exporter | 

### Linux Supported Version
* Amazon Linux 1 or CentOS 6 or RHEL 6
* Amazon Linux 2
* CentOS 7 or RHEL 7
* Ubuntu 14+ - Trusty
* Ubuntu 16 - Xenial

### Windows Supported Version
Script tested on various Windows Server 2008+

Note: On "Amazon Linux 1 or CentOS 6 or RHEL 6" servers, node exporter run as a daemon and above it uses service. For daemon, script available at [centos6-service.sh](https://gist.githubusercontent.com/safoorsafdar/626ba7b60885aec74cb7cb5baf07189d/raw/3ae4041e9ea8788175408a7e0fe9d422c1be311e/centos-6-service.sh)


## Usage

Modify `version` variable from script to install the desired version of the exporter.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update the tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

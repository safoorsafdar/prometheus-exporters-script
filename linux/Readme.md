## Test the shell script localy

`docker run --rm -v $(pwd):$(pwd):ro --workdir $(pwd) bash:4.4 bash install.sh`
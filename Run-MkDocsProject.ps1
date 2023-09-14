#Requires -Version 5.0
#Requires -RunAsAdministrator

param (
 [int]   $Port = 8000
)

docker run --rm -it -p "$($Port):8000" -v ${PWD}:/docs ghcr.io/milestonesystemsinc/mkdocs-milestone:latest


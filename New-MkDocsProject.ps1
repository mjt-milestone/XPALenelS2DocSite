#Requires -Version 5.0
#Requires -RunAsAdministrator

docker run --rm -it -v ${PWD}:/docs ghcr.io/milestonesystemsinc/mkdocs-milestone:latest new .

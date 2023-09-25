# LS OpenAccess service automatically stops seconds after starting

There is a known issue with OnGuard caused by an Active Directory account logging into the OpenAccess service after it starts, which can cause OpenAccess to crash. The OnGuard XProtect Access Service tries to log into OpenAccess when both services are running. This can trigger the crash. The recommended workaround is to switch the Single Sign-On user to a local Windows account and adjust the services to use this same local Windows account.


For questions and information about this issue, please contact support at ```oaaptechnical@carrier.com```.  Reference **LenelS2 Bug DE40122**.
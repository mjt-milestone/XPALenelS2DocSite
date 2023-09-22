---
hide:
  - toc
---
# Different installation scenarios (explained)

There are different ways to integrate XProtect with the OnGuard access control system. This section is a guide to help you figure out which deployment options you should consider. 

!!! glass "Deployment Guide"
    Milestone and LenelS2 have created a technical deployment guide which documents design recommendations, performance thresholds, and architectural guidance within one short document. The OnGuard XProtect Access integration is covered in this deployment guide. [Download](https://download.milestonesys.com/lenels2xpa/OnGuardXProtectArchDeck.pdf) and read the guide. 
***
| Installation Scenario                                                         |Use Case                                                                                                                                                    |
|-------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Single System                                                                 |   You have a single XProtect system (one event server per system) and a single OnGuard system (one OnGuard database per system).                          |
| Multiple Single Systems                                                       |  You have multiple single XProtect/OnGuard system pairs. The customer just wants each pair to behave independently of each other.                    |
| XProtect Federated Architecture with OnGuard Enterprise                       |   You have a federated XProtect system and an OnGuard Enterprise system that need pairing. The customer needs centralized configuration and alarms.   |
| Single system – Integration Server and OnGuard Server on separate machines    |   There is a need to run the required integration software components on a different machine than the OnGuard Server.                                    |
| XProtect Clustered with OnGuard Clustered                                     |   You have a XProtect clustered environment connecting to an OnGuard clustered environment.                                           |

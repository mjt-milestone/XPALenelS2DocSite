---
hide:
  - toc
---
# Installation program (explained)

The installation package consists of one context sensitive installer program:

+ XProtectAccess.OnGuard.msi

This program detects which server it's running on (OnGuard or XProtect), and installs the following software components:

1. OnGuard XProtect Access Service - installed on the OnGuard server, or its own integration server.
2. OnGuard XProtect Access MipPlugin - installed on the XProtect Event Server host machine or on a standalone Milestone XProtect Management Server. 

**Integration Server Process and OnGuard Server on the same machine.**
``` mermaid
flowchart LR
    a("OnGuard XProtect Access MIP Plugin"):::XPClass -- "HTTP REST API" --> b("OnGuard XProtect Access Service"):::XPClass
    b("OnGuard XProtect Access Service"):::XPClass -- "SIGNALR Events" --> a("OnGuard XProtect Access MIP Plugin"):::XPClass
    
    subgraph "OnGuard Server"
        direction TB
        subgraph "Integration Server Process"
        b("OnGuard XProtect Access Service"):::XPClass
        end
    b("OnGuard XProtect Access Service"):::XPClass <--> c("OnGuard OpenAccess Service"):::XPClass
    end
    subgraph "XProtect Management Server"
        direction TB
        subgraph "XProtect Event Server Process"
        a("OnGuard XProtect Access MIP Plugin"):::XPClass
        end
    end 
    classDef XPClass fill:#efb, stroke:#000, stroke-width:2px
```

**Or**

**Integration server process (OnGuard XProtect Access Service) hosted on a separate machine.**
```mermaid
flowchart LR
    A-->|HTTP Rest API|B
    B<-->|OpenAccess HTTPS API|C
    B-->|SIGNALR Events|A
    subgraph XProtect Management Server
        subgraph XProtect Event Server
        A[OnGuard XProtect Access MIP Plugin]:::XPClass
        end
    end
    subgraph Integration Server
    B[OnGuard XProtect Access Service]:::XPClass
    end
    subgraph OnGuard
    C[OnGuard OpenAccess Services]:::XPClass
    end

    classDef XPClass fill:#efb, stroke:#000, stroke-width:2px
```

!!! glass "Plugin version requirements"
    It's required that the exact same versions of the OnGuard XProtect Access integration software components are installed on both the OnGuard and XProtect machines.
    

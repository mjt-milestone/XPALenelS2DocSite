# Solution overview

The solution provided has two components:

1. OnGuard XProtect Access Service - Typically installed in the OnGuard environment.
2. OnGuard XProtect Access MipPlugin - Installed in the XProtect environment.

``` mermaid
flowchart LR
    a("OnGuard XProtect Access MIP Plugin"):::XPClass -- "HTTP REST API" --> b("OnGuard XProtect Access Service"):::XPClass
    b("OnGuard XProtect Access Service"):::XPClass -- "SIGNALR Events" --> a("OnGuard XProtect Access MIP Plugin"):::XPClass
    subgraph "OnGuard Server"
    b("OnGuard XProtect Access Service"):::XPClass <--> c("OnGuard OpenAccess Service"):::XPClass
    b("OnGuard XProtect Access Service"):::XPClass <--> d[("OnGuard Database")]:::XPClass
    end
    subgraph "XProtect Management Server"
        direction TB
        subgraph "XProtect Event Server Process"
        a("OnGuard XProtect Access MIP Plugin"):::XPClass
        end
    end 
    classDef XPClass fill:#efb, stroke:#000, stroke-width:2px
```
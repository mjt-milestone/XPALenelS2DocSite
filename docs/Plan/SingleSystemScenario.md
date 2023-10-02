# Single system scenario

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

For most systems, this is the recommended installation scenario.

+ First - install the OnGuard XProtect Access Service on the OnGuard server
+ Second - install the OnGuard XProtect Access MipPlugin on the XProtect server

??? warning "Encrypted communications?"
    All communication and authentication between the OnGuard XProtect Access MIP Plugin and the OnGuard XProtect Access Service can be fully encrypted and secured in both directions. Please read [Applying sercure communications between XProtect and the OnGuard XProtect Access Service](/Tech/XProtectCerts/) and [Applying secure communications between the OnGuard XProtect Access Service and OpenAccess](/Tech/OnGuardCerts/)
# Multiple single systems

Scaling the default scenario means adding more OnGuard systems and XProtect systems in a 1:1 ratio. The OnGuard and XProtect systems are independent of each other, keeping the OnGuard XProtect Access Service process on the OnGuard machine. The customer is NOT interested in centralized configuration or alarms, the integrated XProtect/OnGuard systems are independent of each other.

**Integration service (Onguard XProtect Access Service) and OnGuard hosted on the same machine at multiple single site locations.**

**Site #1** - single XProtect and OnGuard integrated system

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
**Site #2** - single XProtect and OnGuard integrated system

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

Site #1 and site #2 are independent of each other and not communicating with each other, or commonly managed.  The same is true for both the XProtect and the OnGuard systems in this scenario.
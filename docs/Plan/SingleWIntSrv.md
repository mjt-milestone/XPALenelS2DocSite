# Single system with integration server

This is the recommended system design to run the OnGuard XProtect Access Service on a different machine than the OnGuard server.

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
??? warning "Encrypted communications?"
    All communication and authentication between the OnGuard XProtect Access MIP Plugin and the OnGuard XProtect Access Service can be fully encrypted and secured in both directions. Please read [Applying sercure communications between XProtect and the OnGuard XProtect Access Service](/Tech/XProtectCerts/) and [Applying secure communications between the OnGuard XProtect Access Service and OpenAccess](/Tech/OnGuardCerts/)
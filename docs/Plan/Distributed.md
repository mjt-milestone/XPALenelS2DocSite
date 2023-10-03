# Distributed deployment options

It's possible to have the “integration” server on a different machine than the XProtect server or the OnGuard server. This option provides segmentation of OnGuard hardware and events to individual XProtect sites, and the distributed scenario helps support OnGuard clustering.

```mermaid
flowchart LR
    A>XProtect Site]:::XPClass <-->|XPA| B[Integration Server]:::XPClass
    B <-->|HTTPS| C(OnGuard Server):::XPClass
    classDef XPClass fill:#efb, stroke:#000, stroke-width:2px
```

??? Warning "NOT SUPPORTED - Many to one"
    For design, scaling, and performance reasons, Milestone doesn't support connecting multiple XProtect sites to the same Integration Server instance.

    ```mermaid
    flowchart LR
        A>XProtect Site 1]:::XPClass <-->|XPA| B[Integration Server]:::XPClass
        C>XProtect Site 2]:::XPClass <-->|XPA| B
        D>XProtect Site 2]:::XPClass <-->|XPA| B
        B[Integration Server]:::XPClass <-->|HTTPS| E(OnGuard Server):::XPClass
        classDef XPClass fill:#f57, stroke:#000, stroke-width:2px
    ```
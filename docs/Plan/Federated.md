# Milestone XProtect Federated Architecture with OnGuard Enterprise

This scenario has many uses. It is recommended for large scale deployments. This is the default scenario when the customer has an Enterprise deployment of OnGuard and wants to integrate with XProtect. Also, it is recommended when the customer wants centralized alarm and configuration management for both systems.

![FederatedArch](img/Fed2Ent41.png)

Milestone DOES NOT support connecting a single XProtect site to many different OnGuard regions.  We do not recommend running more than one XProtect Access integration per event server, for performance reasons.

![1XP2nOG](img/one2many41.png)

Milestone DOES NOT support connecting more than one XProtect site to a single OnGuard region.

![nXP21OG](img/many2141.png)

Each XPA line in these diagrams represents the HTTP/SignalR connection between the Event Server in XProtect and the OnGuard XProtect Access Service on the OnGuard server. There are some scenarios where the OnGuard XProtect Access Service may not live on the same OnGuard server, see Distributed deployment options for details.
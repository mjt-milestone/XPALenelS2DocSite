# Milestone XProtect Management Server redundancy solutions with OnGuard

Both of the XProtect Management Server redundancy solutions are tested and supported to work with the OnGuard XProtect Access integration.

1. Microsoft Clustered Server solution
2. XProtect Management Server Failover solution

!!! glass "Test results"
    Both XProtect Management Server redundancy solutions offer data resilience and availability for many XProtect system components. As such, integrations which rely on XProtect experience high availability and resilient video access. During failover events, interruption in service still occurs. In particular, the connection to the XProtect Event Server and integration plug-ins or services hosted in the same server environment experience disruption. Tests show the connection to XProtect Access services, and connections to OnGuard re-establish with **little or no loss of data, and full system operation restores within minutes.**

??? abstract "Redundancy configuration details"
    Find more information about these redundancy solutions for XProtect here:

    + [XProtect Management Server Failover](https://doc.milestonesys.com/latest/en-US/portal/htm/chapter-page-failoverms.htm?tocpath=Add-ons%7CXProtect%20Management%20Server%20Failover%7C_____0)
    + [Clustering XProtect Management Servers](https://doc.milestonesys.com/latest/en-US/standard_features/sf_mc/sf_considerationsrequirements/mc_multiplemanagementser.htm?Highlight=Cluster)
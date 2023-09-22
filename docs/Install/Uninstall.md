# Uninstalling the integration

When uninstalling the integration software to revert to an older version, please refer to Integration version downgrades.

??? warning
    When uninstalling both the OnGuard XProtect Access MipPlugin software and the XProtect Event Server on the same server, it's required to first uninstall the OnGuard XProtect Access MipPlugin components and uninstall the Event Server afterward. If the Event Server is uninstalled first, the integration software fails to uninstall.

Below is the process required to uninstall the 4.3 version of the plugin:</br>

1. Go to the **Programs and Features** menu on the Milestone server.
2. Uninstall the **Milestone OnGuard XProtect Access** plug-in.
3. Go to the **Programs and Features** menu on the OnGuard server.
4. Uninstall the **Milestone OnGuard XProtect Access** service.
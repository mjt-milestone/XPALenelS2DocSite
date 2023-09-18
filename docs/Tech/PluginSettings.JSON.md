---
hide:
  - navigation
---
# Working with the PluginSettings.json configuration file

The OnGuard XProtect Access Integration uses a .json file to control the configuration options for cardholder and visitor search, and alarm acknowledgment. This PluginSettings.json file is on the OnGuard server or the host of the OnGuard XProtect Access Service. The file location should be:

``` ps1
C:\ProgramData\VideoOS\VideoOS.OnGuard.XPA.Service\Translators\OnGuard\PluginSettings.json
```

Edit this file to change the data displayed for cardholders in the Smart Client, and change the display order for cardholder names. For example, the first name, middle name, and last name can appear in any order. It's also possible to change the data displayed for visitors. Lastly, the PluginSettings.json file can enable or disable the default alarm acknowledgment behavior.

After editing and saving the .json file, changes take effect after the next restart of the OnGuard XProtect Access Service and the XProtect Event Server. Follow this process to edit the file:

1. Complete the first cardholder search or receive the first access control event
2. .json file is created with the default configuration.
3. Edit the .json file to meet the new requirements.
4. Restart the OnGuard XProtect Access Service.
5. Restart the XProtect Event Server

??? success "Upgrading versions?"
    >
    > Upgrades from older versions of the OnGuard XProtect Access integration to versions 4.2 or newer may not automatically receive a fully detailed **PluginSettings.json** file. Delete the file, restart the OnGuard XProtect Access Service, send an event or perform a cardholder search.
    >
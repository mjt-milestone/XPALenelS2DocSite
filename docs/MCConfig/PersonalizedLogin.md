# Personalized login explained

Personalized login is an optional feature of XProtect Access. Personalized login links OnGuard user privileges to the access control hardware, events, and alarms available in the XProtect Access integration. 

When a user logs into Smart Client, the personalized login feature presents a second login procedure that authenticates with the integrated OnGuard system. When the user presents valid OnGuard credentials, the Smart Client’s XProtect Access features are narrowed to access control hardware, events, and alarms within that user’s OnGuard privileges.

Personalized login manages two configurations. First, is the global configuration used by the Management Client. Second, is the personalized configuration used in the Smart Client. Personalized configurations are subsets of the global configuration. This helps control accuracy of event handling, command execution, and device management.

!!! glass "Requirements"
    Personalized login has specific requirements:</br>
    <ul>
        <li>OnGuard 7.4 or higher</li>
        <li>XProtect Access 3.5 or higher</li>
    </ul>
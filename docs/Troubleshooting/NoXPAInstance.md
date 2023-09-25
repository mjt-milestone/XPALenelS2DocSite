# OnGuard XProtect Access instance not displayed in the XProtect Management Client

If XProtect is unable to communicate with the OnGuard XProtect Access instance, the instance won't appear in the Access Control section of the Management Client. This process should restore visibility:

<h2>On the Milestone server</h2>

1. Close the Management Client and Smart Client.
2. Stop the XProtect Event Server.</br>
    <h2>On the OnGuard server:</h2>
3. Stop the OnGuard XProtect Access Service.
4. Verify the required OnGuard services are running. 
    + LS Event Context Provider.
    + LS Message Broker.
    + LS OpenAccess.
    + LS Web Event Bridge.
    + LS Web Service.
5. Start the OnGuard XProtect Access Service</br>
    <h2>On the Milestone server:</h2>
6. Start the XProtect Event Server and wait for it to begin running.
7. Start the Management Client.

If the instance still isn't in the Management Client, investigate the logs and contact Milestone Technical Support.
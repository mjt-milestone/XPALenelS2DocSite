# Required OnGuard services

The following Windows services must run on the OnGuard machine:

| OnGuard Windows Service Name  | Description                                                                                       |
|-------------------------------|---------------------------------------------------------------------------------------------------|
| LS Communication Server       | Required to send and receive status and events between hardware devices and software.             |
| LS Event Context Provider     | Required to send events from the OnGuard system.                                                  |
| LS Login Driver               | Manages the database password for client login for OnGuard.                                       |
| LS Message Broker             | Required to receive real-time data from the OnGuard system.                                       |
| LS OpenAccess                 | Required to interface the OnGuard system web service-based API OpenAccess (REST/JSON web service).|
| LS Web Event Bridge           | Required to receive events from the OnGuard system.                                               |
| LS Web Service                | Required to interface the OnGuard system web-service-based events with OpenAccess (SignalR).      |
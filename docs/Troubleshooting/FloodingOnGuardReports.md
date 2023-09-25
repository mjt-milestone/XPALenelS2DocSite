# XProtect Access integration flooding OnGuard user transaction report

Milestone’s XProtect system frequently requests status of OnGuard hardware. To get the current state of a hardware device, the integration must update the hardware status on the parent panel, then query for the device state. A transaction for each hardware status update/query is entered into OnGuard for the single sign-on (SSO) user.

Customers making use of OnGuard’s built-in User Transaction report from OnGuard’s Sys Admin + Reports will see these transactions from the OnGuard XProtect Access integration under the SSO user in the report. It's not possible to filter the User Transaction report to omit the SSO user.

Possible workarounds include:

+ Install a compatible version of Crystal Reports and customize the report. However, OnGuard Technical Support, OAAP, etc., don't support custom reports.
+ Contact the OnGuard Custom Solutions group and have them create/customize the reports.
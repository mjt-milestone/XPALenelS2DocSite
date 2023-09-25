# Changing alarm acknowledgment behavior

Edit the **PluginSettings.json** file to change the behavior of the alarm acknowledgment between OnGuard and XProtect.

The section of the .json file to edit looks like this:

``` json
"AlarmAcknowledgmentSettings": {

/*Set this property to 'true' if you want to use the pre-4.2 sync behavior where only the acknowledged/closed alarm states are synchronized.*/

"OnlySynchronizeAlarmClosed": false

}
```

Change the false to true, save the file and restart the services.

??? abstract "Old alarm acknowledgement behavior explained"
    In older versions of the integration alarm status between XProtect and OnGuard was shared in a limited way. When alarms were closed in XProtect that state was shared with OnGuard. In the OnGuard system the same alarm would be acknowledged. Alarm status was shared in the opposite direction as well – from OnGuard to XProtect.

    Possible alarm states in XProtect and OnGuard weren't the same. In XProtect alarms could be new, acknowledged, set on hold, or closed. In OnGuard alarms were either active or acknowledged. For the XProtect Access OnGuard integration, acknowledged alarms in OnGuard were the same as closed alarms in XProtect. All other alarm states in XProtect were active alarms in OnGuard.

    | OnGuard Alarm Status | XProtect Alarm Status  |
    |----------------------|------------------------|
    | <ul><li>ACTIVE</li></ul> | <ul><li>NEW</li><li>ACKNOWLEDGED > IN PROGRESS</li><li>ON HOLD</li></ul>  |
    | <ul><li>ACKNOWLEDGED</li></ul> | <ul><li>CLOSED</li></ul>  |

    When alarms were acknowledged in OnGuard, the alarm was closed, and the associated alarm was also closed in XProtect. If the alarm was acknowledged within XProtect it would not change status in OnGuard. The status of the alarm in OnGuard would change when the alarm was closed in XProtect.
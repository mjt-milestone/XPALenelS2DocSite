# Cardholder search data fields are missing, or out of order

The OnGuard XProtect Access Integration uses a default list of cardholder data fields when searching for cardholders. Edit the PluginSettings.json file to change which data is available, and the order of the cardholder name fields.

The default list of cardholder data fields:

| .JSON file data field text    | Description   |
|-------------------------------|---------------|
| LASTNAME                      | Cardholders last name |
| FIRSTNAME                      | Cardholders first name |
| MIDNAME                      | Cardholders middle name |
| ADDR1                      | Street address on file for cardholder |
| CITY                      | City on file for cardholder |
| ZIP                    | Zip code or postal code on file for cardholder |
| PHONE                     | Phone number on file for cardholder |
| OPHONE                      | Additional phone number on file for cardholder |

Edit the list in this .json file to add new data fields, remove existing data fields and change the order of the data fields. "CardholderSearchFields" defines the data types available, and "CardholderDisplayName" sets the order of data display. If the list in the .json file is empty, then the complete range of search-able fields is used. The file location should be:

```C:\ProgramData\VideoOS\VideoOS.OnGuard.XPA.Service\Translators\OnGuard\PluginSettings.json```

The section of the .json file to edit in order to change the cardholder settings looks like this:

``` json
 “CredentialHolderSettings”: {

    /*The Onguard Cardholder fields used when searching for Credential Holders in XProtect. Leave empty to use all available searchable string fields in OnGuard.*/

    “CardholderSearchFields”: {

      “LASTNAME”,

      “FIRSTNAME”,

      “MIDNAME”,

      “ADDR1”,

      “CITY”,

      “ZIP”,

      “PHONE”,

      “OPHONE”

    }

    /*The Onguard Cardholder display name field is for changing the cardholder display name. Available fields are FIRSTNAME, MIDNAME, LASTNAME, and any additional Card Holder properties.*/,

    "CardholderDisplayName": {

      "FIRSTNAME",

      "MIDNAME",

      "LASTNAME",

    }

  }
```

After editing and saving the .json file, changes take effect after the next restart of the OnGuard XProtect Access Service and the XProtect Event Server.

??? warning "After integration version upgrades"
    Upgrades from previous versions of the OnGuard XProtect Access integration may not automatically receive a fully detailed **PluginSettings.json** file. If the .json file is not available, it can be recreated with the default search fields and display names the next time the OnGuard XProtect Access Service is restarted and a new search is performed. After the default file is created, it's recommended to edit the file to obtain the correct combination of search fields and name order for your installation.
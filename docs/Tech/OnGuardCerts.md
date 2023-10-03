# Applying secure communications between the OnGuard XProtect Access Service and OpenAccess

In versions 4.2 and higher of the XProtect Access OnGuard integration, encrypted communication is fully supported. This process shows the steps required to extract and distribute the required certificates and configure the solution to enable secure communications between the OnGuard XProtect Access Service and OpenAccess.

!!! glass "Standalone server"
    The process below isn't needed when the OnGuard XProtect Access Service runs on the OnGuard server that hosts the OpenAccess service. In integrated systems where the OnGuard XProtect Access Service and the OpenAccess service are co-located encrypted communication can be enabled with no extra configuration.

1. Go to the OpenAccess server, open PowerShell and run the following script to extract the CA certificate.
    ``` ps1
    $cert = Get-ChildItem 'Cert:\LocalMachine\LS Certificate Store' |`
    Where-Object{$_.Subject -like "*cn=$ENV:COMPUTERNAME*"}
    if ($cert) {$match = Select-String "CN=(.*?),"`
    -InputObject $cert.Issuer
    $issuer = $match.Matches.groups[1].Value
    $RootCert = Get-ChildItem 'Cert:\LocalMachine\Root'`
    |Where-Object{$_.Subject -like "CN=$issuer*"}
    if ($RootCert) {Export-Certificate -Cert $RootCert -FilePath ".\LenelCert.cer"}`
    else{write-host "Could not find $Issuer Certificate." -foregroundcolor Red}}`
    else{write-host "Could not find $env:Computername Certificate in LS Certificate Store."`
    -foregroundcolor Red}
    ```
2. By default the script exports the extracted root certificate to the current directory. Copy the certificate and move it to the OnGuard XProtect Access Service server.
3. On the OnGuard XProtect Access Service host server right-click the certificate and select **Install Certificate** to begin the certificate installation wizard.
4. Choose to place the certificate in the **Store Location** of the **Local Machine**.
5. Browse and import the certificate in to the **Trusted Root Certification Authorities** folder.\
6. Complete the wizard.
7. Now apply encryption for the OnGuard XProtect Access instance in the XProtect Management Client. This process enables use of **OpenAccess - SSL Certificate Validation**, option B below.</br>
    </br>
    ![EncryptOptions](img/EncryptionOptions.png)
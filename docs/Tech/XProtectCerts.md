# Applying secure communications between XProtect and the OnGuard XProtect Access Service

In versions 4.2 and higher of the XProtect Access OnGuard integration, there is a tool built into the XProtect Access service to help users manage certificates. This process shows the steps required to generate, distribute, and configure the solution to secure communications between XProtect and the OnGuard XProtect Access Service.

??? abstract "Certificate Types"
    The process included below is for self-signed certificates. If you are using a third party certificate, from a commercial certificate provider, please skip ahead to step number ten below. Refer to the [XProtect Certificate Guide](https://doc.milestonesys.com/latest/en-US/portal/htm/chapter-page-certificates-guide.htm) for any questions on dealing with certificates.

1. On a server with restricted access, open PowerShell as an administrator and run the script below, to create a CA certificate.</br>
    ```ps1
    # Run this script once, to create a certificate that can sign multiple server SSL certificates

    # Private certificate for signing other certificates (in certificate store)
    $ca_certificate = New-SelfSignedCertificate -CertStoreLocation cert:\CurrentUser\My -DnsName 'VMS Certificate Authority' -KeyusageProperty All `
                                                -KeyUsage CertSign, CRLSign, DigitalSignature -FriendlyName 'VMS CA Certificate' `
                                                -TextExtension @("2.5.29.19={critical}{text}ca=TRUE")

    # Thumbprint of private certificate used for signing other certificates
    Set-Content -Path "$PSScriptRoot\ca_thumbprint.txt" -Value $ca_certificate.Thumbprint

    # Public CA certificate to trust (Third-Party Root Certification Authorities)
    Export-Certificate -Cert "Cert:\CurrentUser\My\$($ca_certificate.Thumbprint)" -FilePath "$PSScriptRoot\root-authority-public.cer"
    ```
    ![RootCert](img/CX.Rootcert.png)</br>
2. By default the script places the new root certificate in the C:\ file location. Move the certificate to the XProtect server.
3. On the XProtect server right-click the certificate and select **Install Certificate** to begin the certificate installation wizard.
4. Choose to place the certificate in the **Store Location** of the **Local Machine**.
5. Browse and import the certificate in to the **Trusted Root Certification Authorities** folder.
6. Complete the wizard.
7. Go back to the server with restricted access where you generated the root certificate, open PowerShell and enter the script below, to generate a new client certificate to install on the server hosting the OnGuard XProtect Access Service.</br>
    ```ps1
    # Run this script once for each server for which an SSL certificate is needed.
    # Certificate should be executed on the single computer where the CA certificate is located.
    # The created server SSL certificate should then be moved to the server and imported in the
    # certificate store there.
    # After importing the certificate, allow access to the private key of the certificate for
    # the service user(s) of the services that must use the certificate.

    # Load CA certificate from store (thumbprint must be in ca_thumbprint.txt)
    $ca_thumbprint = Get-Content -Path "$PSScriptRoot\ca_thumbprint.txt"
    $ca_certificate = (Get-ChildItem -Path cert:\CurrentUser\My\$ca_thumbprint)

    # Prompt user for DNS names to include in certificate
    $dnsNames = Read-Host 'DNS names for server SSL certificate (delimited by space - 1st entry is also subject of certificate)'
    $dnsNamesArray = @($dnsNames -Split ' ' | foreach { $_.Trim() } | where { $_ })

    if ($dnsNamesArray.Length -eq 0) {
        Write-Host -ForegroundColor Red 'At least one dns name should be specified'
        exit
    }
    $subjectName = $dnsNamesArray[0]
    $dnsEntries = ($dnsNamesArray | foreach { "DNS=$_" }) -Join '&'

    # Optionally allow the user to type in a list of IP addresses to put in the certificate
    $ipAddresses = Read-Host 'IP addresses for server SSL certificate (delemited by space)'
    $ipAddressesArray = @($ipAddresses -Split ' ' | foreach { $_.Trim() } | where { $_ })
    if ($ipAddressesArray.Length -gt 0) {
        $ipEntries = ($ipAddressesArray | foreach { "IPAddress=$_" }) -Join '&'
        $dnsEntries = "$dnsEntries&$ipEntries"
    }

    # Build final dns entries string (e.g. "2.5.29.17={text}DNS=myhost&DNS=myhost.domain.com&IPAddress=10.0.0.103")
    $dnsEntries = "2.5.29.17={text}$dnsEntries"

    # The only required purpose of the sertificate is "Server Authentication"
    $serverAuthentication = '2.5.29.37={critical}{text}1.3.6.1.5.5.7.3.1'

    # Now - create the server SSL certificate
    $certificate = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Subject $subjectName -Signer $ca_certificate `
                                            -FriendlyName 'VMS SSL Certificate' -TextExtension @($dnsEntries, $serverAuthentication)

    # Export certificate to disk - protect with a password
    $password = Read-Host -AsSecureString "Server SSL certificate password"
    Export-PfxCertificate -Cert "Cert:\CurrentUser\My\$($certificate.Thumbprint)" -FilePath "$PSScriptRoot\$subjectName.pfx" -Password $password

    # Delete the server SSL certificate from the local certificate store
    $certificate | Remove-Item
    ```
8. The script requires input: the DNS name of the server hosting the OnGuard XProtect Access Service, the IP address of the server, and a certificate password of your own choosing - enter this information and complete the script.
9. By default the script generates the certificate at the C:\ file location. Copy the file and move it to the server hosting the OnGuard XProtect Access Service.</br>
    </br>
    ![SSLCert](img/CX.sslcert.png)</br>
10. Go to the server hosting the OnGuard XProtect Access Service and run the certificates snap-in for the local machine. Right-click the **Certificate** store within the **Personal** folder and choose to **Import** a new certificate.</br>
    </br>
    ![ImportSSL](img/CX.sslimport1.png){width=75%}</br>
11. Import the certificate into the store of the local machine. Choose the certificate file that you copied to the local server. Enter the password chosen during the script. Browse to the personal folder of the certificate store to choose that as the location for the certificate. Complete the import wizard.
12. Open the OnGuard XProtect Access Service service tray icon and choose the certificate to use. It should match the hostname of the OnGuard server. The service restarts once the configuration is saved.
13. Now apply encryption for the OnGuard XProtect Access instance in the XProtect Management Client. There are three options to use for secured communication for the integration. This process enables use of **XProtect Access  Service - SSL Certificate Validation**, option A below.</br>
    </br>
    ![EncryptOptions](img/EncryptionOptions.png)
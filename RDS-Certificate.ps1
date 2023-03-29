<#
.SYNOPSIS
This script sets the Remote Desktop (RD) certificate for RD Gateway, RD Web Access, RD Redirector, and RD Publishing servers.

.DESCRIPTION
The script prompts the user for the certificate path and password, and then sets the certificate for each of the RD roles specified.

.PARAMETER RDGatewayServer
The server name of the RD Gateway server.

.PARAMETER RDWebAccessServer
The server name of the RD Web Access server.

.PARAMETER RDRedirectorServer
The server name of the RD Redirector server.

.PARAMETER RDPublishingServer
The server name of the RD Publishing server.

.PARAMETER RDConnectionBrokerServer
The server name of the RD Connection Broker server.

.EXAMPLE
Set-RDCertificate.ps1 -RDGatewayServer "rdgateway.contoso.com" -RDWebAccessServer "rdweb.contoso.com" -RDRedirectorServer "rdredirector.contoso.com" -RDPublishingServer "rdpublishing.contoso.com" -RDConnectionBrokerServer "rdcb.contoso.com"

.NOTES
Author:
Last Edit: 2023-03-29
#>

## Function to prompt for certificate path and password
Function Get-CertificateInfo {
    [CmdletBinding()]
    Param()
    $CertificateLocation = Read-Host "Please enter the full path to your certificate (pfx) file"
    $CertificatePassword = Read-Host "Please enter your certificate (pfx format) password"
    $Password = ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force
    Return @{
        CertificateLocation = $CertificateLocation
        Password = $Password
    }
}

## Set the RD certificate for each specified role
Param(
    [Parameter(Mandatory=$false)]
    [string]$RDGatewayServer,
    [Parameter(Mandatory=$false)]
    [string]$RDWebAccessServer,
    [Parameter(Mandatory=$false)]
    [string]$RDRedirectorServer,
    [Parameter(Mandatory=$false)]
    [string]$RDPublishingServer,
    [Parameter(Mandatory=$false)]
    [string]$RDConnectionBrokerServer
)

## Get the certificate path and password from the user
$CertificateInfo = Get-CertificateInfo

## Set the RD certificate for each role specified
if ($RDGatewayServer) {
    Set-RDCertificate -Role RDGateway -ImportPath $CertificateInfo.CertificateLocation -Password $CertificateInfo.Password -ConnectionBroker $RDConnectionBrokerServer -Force
}
if ($RDWebAccessServer) {
    Set-RDCertificate -Role RDWebAccess -ImportPath $CertificateInfo.CertificateLocation -Password $CertificateInfo.Password -ConnectionBroker $RDConnectionBrokerServer -Force
}
if ($RDRedirectorServer) {
    Set-RDCertificate -Role RDRedirector -ImportPath $CertificateInfo.CertificateLocation -Password $CertificateInfo.Password -ConnectionBroker $RDConnectionBrokerServer -Force
}
if ($RDPublishingServer) {
    Set-RDCertificate -Role RDPublishing -ImportPath $CertificateInfo.CertificateLocation -Password $CertificateInfo.Password -ConnectionBroker $RDConnectionBrokerServer -Force
}

$CertificateLocation = read-host "Please enter the full path to your certificate (pfx) file"
$CertificatePassword = read-host "Please enter your certificate (pfx format) password"
$RDGatewayServer = ""
$RDWebAccessServer = ""
$RDRedirectorServer = ""
$RDPublishingServer = ""
$RDConnectionBrokerServer = ""
$Password = ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force
Set-RDCertificate -Role RDGateway -ImportPath $CertificateLocation Password $Password -ConnectionBroker $RDConnectionBrokerServer -Force
Set-RDCertificate -Role RDWebAccess -ImportPath $CertificateLocation Password $Password -ConnectionBroker $RDConnectionBrokerServer -Force
Set-RDCertificate -Role RDRedirector -ImportPath $CertificateLocation Password $Password -ConnectionBroker $RDConnectionBrokerServer -Force
Set-RDCertificate -Role RDPublishing -ImportPath $CertificateLocation Password $Password -ConnectionBroker $RDConnectionBrokerServer -Force

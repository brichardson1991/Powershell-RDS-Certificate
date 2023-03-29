This script sets the Remote Desktop Services (RDS) certificate for the RDGateway, RDWebAccess, RDRedirector and RDPublishing roles on a given RDS Connection Broker server.

Prerequisites
The script should be run on the RDS Connection Broker server.
The certificate file (.pfx format) should be accessible from the server.
The certificate password should be known.
Usage
Open PowerShell as an administrator.
Run the script.
When prompted, enter the full path to the certificate (.pfx format) file and the certificate password.
When prompted, enter the server names for the RDGateway, RDWebAccess, RDRedirector, RDPublishing and RDConnectionBroker roles.
Wait for the script to complete.

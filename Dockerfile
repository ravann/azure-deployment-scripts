FROM mcr.microsoft.com/azure-functions/python:3.0-python3.8-buildenv

LABEL version=1
LABEL author=ravan.nannapaneni@gmail.com
LABEL reviewer=Hanumantharao

# Update the list of packages
# Install pre-requisite packages.
RUN apt-get update && apt-get install -y wget apt-transport-https tzdata uuid

# Download the Microsoft repository GPG keys
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
# Update the list of packages after we added packages.microsoft.com
# Install PowerShell
RUN dpkg -i packages-microsoft-prod.deb && apt-get update && apt-get install -y powershell

# Install Azure PowerShell
RUN pwsh -noni -c "Install-Module Az -AllowClobber -Confirm:\$False -Force"

# Install Azure Functions
RUN apt-get install azure-functions-core-tools-3

# Copy the secrets file to root folder
COPY secrets.txt docker_entry.pwsh /

RUN chmod 755 *.pwsh

ENTRYPOINT [ "/docker_entry.pwsh" ]

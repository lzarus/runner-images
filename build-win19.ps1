# Image Windows 19
packer build -var "subscription_id=65fa933f-ebd5-434d-afa5-7fcf2375eeb0" `
    -var "client_id=5a8a3282-fe0c-4cbe-bb5d-1683893c212b" `
    -var "client_secret=iAo8Q~MUMhshZKbCQ.qLO45w2CWrHM4.r2dUkapa" `
    -var "install_password=Azerty123?" `
    -var "location=West Europe" `
    -var "managed_image_name=agentDevopsWin19-091123" `
    -var "managed_image_resource_group_name=RG-UP-FR-MUT-DEVOPS-01" `
    -var "tenant_id=475fd1d1-212f-472f-9c02-635526f47568" `
    -var "private_virtual_network_with_public_ip=true" `
    ./images/win/windows2019.json

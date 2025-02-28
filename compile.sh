#!/bin/sh

# LOCAL_PROVIDER_ENVIRONMENT will be the architecture of your machine, eg linux_amd64, darwin_arm64 etc
working_directory=$(pwd) 
echo "sourcing .env file..."
. ./.env

echo "removing .terraform..."
rm -rf .terraform

echo "removing .terraform.lock.hcl..."
rm -rf .terraform.lock.hcl 

echo "local provider environment: $LOCAL_PROVIDER_ENVIRONMENT"
echo "removing compiled provider plugin"
rm -rf ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/$LOCAL_PROVIDER_ENVIRONMENT/terraform-provider-jamfpro
cd ..
cd terraform-provider-jamfpro

echo "rebuilding binary"
go build

echo "moving binary to plugins folder & adjusting permissions"
mkdir -p ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/$LOCAL_PROVIDER_ENVIRONMENT/
mv terraform-provider-jamfpro ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/$LOCAL_PROVIDER_ENVIRONMENT/
chmod +x ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/$LOCAL_PROVIDER_ENVIRONMENT/terraform-provider-jamfpro

echo "initiating terraform"
cd $working_directory
terraform init
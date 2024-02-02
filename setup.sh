echo "removing .terraform..."
rm -rf .terraform

echo "removing .terraform.lock.hcl..."
rm -rf .terraform.lock.hcl 

echo "removing compiled provider plugin"
rm -rf ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/darwin_arm64/terraform-provider-jamfpro

cd ..
cd terraform-provider-jamfpro

echo "rebuilding binary"
go build

echo "moving binary to plugins folder & adjusting permissions"
mv terraform-provider-jamfpro ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/darwin_arm64/
chmod +x ~/.terraform.d/plugins/terraform.local/local/jamfpro/0.1.0/darwin_arm64/terraform-provider-jamfpro

echo "initiating terraform"
cd ..
cd terraform-sandbox
terraform init
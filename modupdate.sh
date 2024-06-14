echo "updating provider modules..."

cd /Users/joseph/github/terraform-provider-jamfpro
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-sdk-jamfpro@dev-jl-httpclientv2
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@dev-jl-version2
go mod tidy
echo "provider module update complete"

echo "updating sdk modules..."
cd /Users/joseph/github/go-api-sdk-jamfpro
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@dev-jl-version2
go mod tidy
echo "sdk modules update complete"

echo "updating jamfpro integrations"
cd /Users/joseph/github/go-api-http-client-integration-jamfpro/jamfprointegration
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client-integration-jamfpro
echo "jamfpro integrations module update complete"

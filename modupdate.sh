echo "updating provider modules..."

cd ../terraform-provider-jamfpro
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-sdk-jamfpro@latest
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@latest
go mod tidy
echo "provider module update complete"

echo "updating sdk modules..."
cd ../go-api-sdk-jamfpro
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@dev-jl-version2
go mod tidy
echo "sdk modules update complete"

cd ../terraform-

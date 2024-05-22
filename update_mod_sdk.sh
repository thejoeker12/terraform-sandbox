cd ../terraform-provider-jamfpro
go clean --cache
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-sdk-jamfpro@main
go mod tidy
cd ../terraform-sandbox
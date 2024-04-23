cd ../terraform-provider-jamfpro
go clean --cache
go get github.com/deploymenttheory/go-api-sdk-jamfpro@main
go mod tidy
cd ../terraform-sandbox
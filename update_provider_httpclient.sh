cd ../terraform-provider-jamfpro
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@fix-cookiejar
go mod tidy
cd ../terraform-sandbox
sh compile.sh

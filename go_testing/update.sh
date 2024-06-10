clear
echo "updating sdk..."
GOPROXY=direct go get -u "github.com/deploymenttheory/go-api-sdk-jamfpro@dev-jl-httpclientv2"
echo "updating integration..."
GOPROXY=direct go get -u "github.com/deploymenttheory/go-api-http-client-integration-jamfpro/jamfprointegration"
echo "updating http client..."
GOPROXY=direct go get -u "github.com/deploymenttheory/go-api-http-client@dev-jl-version2"
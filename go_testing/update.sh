clear

# cd /Users/joseph/github/go-api-http-client-integration-jamfpro/
# git add .
# git commit -m "debugging"
# git push
# cd /Users/joseph/github/terraform-sandbox/go_testing/

echo "updating integration..."
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client-integration-jamfpro/jamfprointegration

# clear

# go run main.go

# echo "updating sdk..."
# GOPROXY=direct go get -u github.com/deploymenttheory/go-api-sdk-jamfpro@dev-jl-httpclientv2

echo "updating http client..."
GOPROXY=direct go get -u github.com/deploymenttheory/go-api-http-client@dev-jl-version2
clear

GIT_SEPARATOR="----------GIT----------"

# Dir check
dirProvider="/Users/joseph/github/terraform-provider-jamfpro"
dirSdk="/Users/joseph/github/go-api-sdk-jamfpro"
dirHttpClient="/Users/joseph/github/go-api-http-client"
dirJproIntegration="/Users/joseph/github/go-api-http-client-integration-jamfpro"
directories=("$dirProvider" "$dirSdk" "$dirHttpClient" "$dirJproIntegration")

echo "checking dirs..."
for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Directory $dir does not exist."
    exit 1
  fi
done

# Github links

TARGET_BRANCH_SDK="dev-jl-httpclientv2"
TARGET_BRANCH_HTTP_CLIENT="dev-jl-version2"
TARGET_BRANCH_INTEGRATION="0.0.1"

ghRootLinkSdk="github.com/deploymenttheory/go-api-sdk-jamfpro"
ghRootLinkHttpClient="github.com/deploymenttheory/go-api-http-client"
ghRootLinkJproIntegration="github.com/deploymenttheory/go-api-http-client-integrations/jamfpro/jamfprointegration"

GH_SDK="$ghRootLinkSdk@$TARGET_BRANCH_SDK"
GH_HTTP_CLIENT="$ghRootLinkHttpClient@$TARGET_BRANCH_HTTP_CLIENT"
GH_INTEGRATION="$ghRootLinkJproIntegration@$TARGET_BRANCH_INTEGRATION"

# Automated Commits

echo "committing saved changes"
debuggingCommitMessage="automated debugging"

echo $GIT_SEPARATOR
cd $dirSdk
git add .
git commit -m "automated debugging comm"
git push

echo $GIT_SEPARATOR
cd $dirHttpClient
git add .
git commit -m "automated debugging"
git push

echo $GIT_SEPARATOR
cd $dirJproIntegration
git add .
git commit -m "automated debugging"
git push
echo "----------GIT DONE----------"

# Mod dependency updates
echo "updating sdk modules..."
cd $dirSdk
go clean --cache
GOPROXY=direct go get -u $GH_HTTP_CLIENT
go mod tidy


echo "updating provider modules..."
cd $dirProvider
go clean --cache
GOPROXY=direct go get -u $GH_SDK
GOPROXY=direct go get -u $GH_HTTP_CLIENT
GOPROXY=direct go get -u $GH_INTEGRATION
go mod tidy

echo "done"
clear
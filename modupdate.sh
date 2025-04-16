# Dir check
dirProvider="/Users/josephlittle/github/terraform-provider-jamfpro"
dirSdk="/Users/josephlittle/github/go-api-sdk-jamfpro"
dirClient="/Users/josephlittle/github/go-api-http-client"
dirIntegration="/Users/josephlittle/github/go-api-http-client-integrations"
directories=("$dirProvider" "$dirSdk" "$dirClient" "$dirIntegration")

echo "checking dirs..."
for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Directory $dir does not exist."
    exit 1
  fi
done

# Github links

ghSdk="github.com/deploymenttheory/go-api-sdk-jamfpro"
ghClient="github.com/deploymenttheory/go-api-http-client"
ghIntegration="github.com/deploymenttheory/go-api-http-client-integrations"

TARGET_BRANCH_SDK="dev-pagination"
TARGET_BRANCH_HTTP_CLIENT="latest"
TARGET_BRANCH_INTEGRATION="latest"

GH_SDK="$ghSdk@$TARGET_BRANCH_SDK"
GH_CLIENT="$ghClient@$TARGET_BRANCH_HTTP_CLIENT"
GH_INTEGRATION="$ghIntegration@$TARGET_BRANCH_INTEGRATION"

# Automated Commits

# echo "committing saved changes"
# debuggingCommitMessage="automated debugging"

# echo $GIT_SEPARATOR
# cd $dirSdk
# git add .
# git commit -m "automated debugging comm"
# git push

# echo $GIT_SEPARATOR
# cd $dirHttpClient
# git add .
# git commit -m "automated debugging"
# git push

# echo $GIT_SEPARATOR
# cd $dirJproIntegration
# git add .
# git commit -m "automated debugging"
# git push
# echo "----------GIT DONE----------"

# Mod dependency updates

go clean --cache

echo "updating sdk modules..."
cd $dirSdk
GOPROXY=direct go get -u $GH_CLIENT
GOPROXY=direct go get -u $GH_INTEGRATION
go mod tidy

echo "updating provider modules..."
cd $dirProvider
GOPROXY=direct go get -u $GH_SDK
GOPROXY=direct go get -u $GH_CLIENT
GOPROXY=direct go get -u $GH_INTEGRATION
go mod tidy

echo "updating integration modules..."
cd $dirIntegration
GOPROXY=direct go get -u $GH_CLIENT
go mod tidy


echo "updating test env"
cd /Users/josephlittle/Github/terraform-sandbox/go_testing/
GOPROXY=direct go get -u $GH_SDK
go mod tidy

echo "done"
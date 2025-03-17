package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/deploymenttheory/go-api-http-client-integrations/jamf/jamfprointegration"
	"github.com/deploymenttheory/go-api-http-client/httpclient"
	"github.com/deploymenttheory/go-api-sdk-jamfpro/sdk/jamfpro"
	"go.uber.org/zap"
)

const FQDN string = "https://lbgsandbox.jamfcloud.com"
const hidesensitive bool = true
const pkgPaths string = "/Users/josephlittle/Github/packages/"
const pkgChrome string = "googlechrome.dmg"
const pkgSus string = "sus_package.dmg"
const bigmomma string = "bigfile.dmg"

var CLIENT_ID string = os.Getenv("jamfpro_client_id")
var CLIENT_SECRET string = os.Getenv("jamfpro_client_secret")

func main() {

	loggerConfig := zap.NewDevelopmentConfig()
	logger, _ := loggerConfig.Build()
	sugar := logger.Sugar()

	jamfproIntegration, err := jamfprointegration.BuildWithOAuth(
		FQDN,
		sugar,
		20*time.Second,
		CLIENT_ID,
		CLIENT_SECRET,
		hidesensitive,
		http.Client{},
	)

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	httpconfig := httpclient.ClientConfig{
		Integration:              jamfproIntegration,
		Sugar:                    sugar,
		HideSensitiveData:        hidesensitive,
		TokenRefreshBufferPeriod: 20 * time.Second,
		MandatoryRequestDelay:    100 * time.Millisecond,
		RetryEligiableRequests:   false,
		HTTP:                     http.Client{},
	}

	builtClient, err := httpconfig.Build()

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	jp := jamfpro.Client{
		HTTP: builtClient,
	}

	fullPath := fmt.Sprintf("%s%s", pkgPaths, bigmomma)

	pkgMetadata := jamfpro.ResourcePackage{
		PackageName:          bigmomma,
		FileName:             bigmomma,
		CategoryID:           "-1",
		Priority:             3,
		FillUserTemplate:     BoolPtr(false),
		RebootRequired:       BoolPtr(false),
		OSInstall:            BoolPtr(false),
		SuppressUpdates:      BoolPtr(false),
		SuppressFromDock:     BoolPtr(false),
		SuppressEula:         BoolPtr(false),
		SuppressRegistration: BoolPtr(false),
	}

	resp_meta, err := jp.CreatePackage(pkgMetadata)
	if err != nil {
		fmt.Printf("Error creating package manifest: %+v", err)
		return
	}

	jp.HTTP.ModifyHttpTimeout(100 * time.Minute)
	_, err = jp.UploadPackage(resp_meta.ID, []string{fullPath})

	if err != nil {
		fmt.Println(err)
	}

	packageJSON, err := json.MarshalIndent(resp_meta, "", "    ") // Indent with 4 spaces
	if err != nil {
		log.Fatalf("Error marshaling created package data: %v", err)
	}
	fmt.Println("Created Package Details:\n", string(packageJSON))
}

// BoolPtr is a helper function to create a pointer to a bool.
func BoolPtr(b bool) *bool {
	return &b
}

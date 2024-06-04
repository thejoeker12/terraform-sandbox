package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"time"

	"github.com/deploymenttheory/go-api-http-client-integration-jamfpro/jamfprointegration"
	"github.com/deploymenttheory/go-api-http-client/httpclient"
	"github.com/deploymenttheory/go-api-http-client/logger"
	"github.com/deploymenttheory/go-api-sdk-jamfpro/sdk/jamfpro"
	"go.uber.org/zap"
)

type creds struct {
	Cid string `json:"clientId"`
	Cs  string `json:"clientSecret"`
}

func main() {
	// Define the path to the JSON configuration file
	// Initialize the Jamf Pro client with the HTTP client configuration

	credsFilePath := "/Users/joseph/github/terraform-sandbox/clientauth.json"
	jsonFile, err := os.Open(credsFilePath)
	if err != nil {
		fmt.Println(err)
	}
	defer jsonFile.Close()

	byteFile, _ := io.ReadAll(jsonFile)
	var Creds creds
	_ = json.Unmarshal(byteFile, &Creds)

	log := logger.BuildLogger(logger.LogLevelDebug, "pretty", "	", "", false)

	integration := &jamfprointegration.Integration{
		BaseDomain:           "https://lbgsandbox.jamfcloud.com",
		InstanceName:         "lbgsandbox",
		ClientId:             Creds.Cid,
		ClientSecret:         Creds.Cs,
		AuthMethodDescriptor: "oauth2",
		Logger:               log,
	}

	clientConfig := httpclient.ClientConfig{
		LogLevel:                  "LogLevelDebug",
		LogOutputFormat:           "pretty",
		LogConsoleSeparator:       "   ",
		Integration:               integration,
		ExportLogs:                false,
		HideSensitiveData:         false,
		CookieJarEnabled:          true,
		MaxRetryAttempts:          5,
		EnableDynamicRateLimiting: true,
		CustomTimeout:             5 * time.Second,
		TokenRefreshBufferPeriod:  1 * time.Minute,
		TotalRetryDuration:        10 * time.Minute,
		FollowRedirects:           false,
		MaxConcurrentRequests:     1,
	}

	baseClient, err := httpclient.BuildClient(clientConfig, false)
	if err != nil {
		log.Debug("Failed to initialize Jamf Pro client")
	}

	jamfClient := jamfpro.Client{
		HTTP: baseClient,
	}

	// Building details to be created
	newBuilding := &jamfpro.ResourceBuilding{
		Name:           "Apple Park",
		StreetAddress1: "The McIntosh Tree",
		StreetAddress2: "One Apple Park Way",
		City:           "Cupertino",
		StateProvince:  "California",
		ZipPostalCode:  "95014",
		Country:        "The United States of America",
	}

	// Create the building
	createdBuilding, err := jamfClient.CreateBuilding(newBuilding)
	if err != nil {
		log.Debug("Error creating building:", zap.String("body:", fmt.Sprintf("%v", err)))
	}

	// Print the details of the created building
	fmt.Printf("Created Building: %+v\n", createdBuilding)
}

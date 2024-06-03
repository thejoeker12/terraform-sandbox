package main

import (
	"fmt"
	"log"
	"time"

	"github.com/deploymenttheory/go-api-http-client-integration-jamfpro/jamfprointegration"
	"github.com/deploymenttheory/go-api-http-client/httpclient"
	"github.com/deploymenttheory/go-api-sdk-jamfpro/sdk/jamfpro"
)

func main() {
	// Define the path to the JSON configuration file
	// Initialize the Jamf Pro client with the HTTP client configuration

	inte := jamfprointegration.Integration{}

	clientConfig := httpclient.ClientConfig{
		LogLevel:                  "LogLevelDebug",
		LogOutputFormat:           "pretty",
		LogConsoleSeparator:       "   ",
		Integration:               inte,
		ExportLogs:                false,
		HideSensitiveData:         false,
		CookieJarEnabled:          true,
		MaxRetryAttempts:          5,
		EnableDynamicRateLimiting: true,
		CustomTimeout:             5 * time.Second,
		TokenRefreshBufferPeriod:  5 * time.Second,
		TotalRetryDuration:        10 * time.Minute,
		FollowRedirects:           false,
	}
	client, err := httpclient.BuildClient(clientConfig, false)
	if err != nil {
		log.Fatalf("Failed to initialize Jamf Pro client: %v", err)
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
	createdBuilding, err := client.CreateBuilding(newBuilding)
	if err != nil {
		log.Fatalf("Error creating building: %v", err)
	}

	// Print the details of the created building
	fmt.Printf("Created Building: %+v\n", createdBuilding)
}

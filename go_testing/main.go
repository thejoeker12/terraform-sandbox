package main

import (
	"encoding/json"
	"fmt"
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

var CLIENT_ID string = os.Getenv("jamfpro_client_id")
var CLIENT_SECRET string = os.Getenv("jamfpro_client_secret")

func main() {

	loggerConfig := zap.NewProductionConfig()
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

	// jamfproIntegration, err := jamfprointegration.BuildWithBasicAuth(
	// 	FQDN,
	// 	sugar,
	// 	20*time.Second,
	// 	"joseph.little",
	// 	"Tokyo2023!JL",
	// 	hidesensitive,
	// 	http.Client{},
	// )

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

	resp, err := jp.GetComputerPrestageByID("118")

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	jsonData, err := json.MarshalIndent(resp, " ", "	")

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	fmt.Println(string(jsonData))

}

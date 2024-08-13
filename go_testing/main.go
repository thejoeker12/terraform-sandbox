package main

import (
	"bytes"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"os"
	"path/filepath"
)

func main() {
	url := "https://lbgsandbox.jamfcloud.com/api/v1/icon"
	imagePath := "/Users/joseph/github/terraform-sandbox/go_testing/cat.png"

	file, err := os.Open(imagePath)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}
	defer file.Close()

	var requestBody bytes.Buffer
	multipartWriter := multipart.NewWriter(&requestBody)
	fileWriter, err := multipartWriter.CreateFormFile("image", filepath.Base(imagePath))
	if err != nil {
		fmt.Println("Error creating form file:", err)
		return
	}

	_, err = io.Copy(fileWriter, file)
	if err != nil {
		fmt.Println("Error copying file data:", err)
		return
	}

	multipartWriter.Close()

	req, err := http.NewRequest("POST", url, &requestBody)
	if err != nil {
		fmt.Println("Error creating request:", err)
		return
	}

	req.Header.Set("accept", "application/json")
	req.Header.Set("Content-Type", multipartWriter.FormDataContentType())
	// req.Header.Set("Content-Type", "image/png")

	token := os.Getenv("TOKEN")
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", token))

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Error sending request:", err)
		return
	}
	defer resp.Body.Close()

	// Read and print the response
	body, err := io.ReadAll(resp.Body)
	if err != nil {

		fmt.Println("Error reading response:", err)
		return
	}
	fmt.Println("Response:", string(body))
}

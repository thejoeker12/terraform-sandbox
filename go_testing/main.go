package main

import (
	"fmt"
	"strings"
)

func main() {
	testVal := "text/xml;charset=UTF-8"
	fmt.Println(parseHeader(testVal))

}

func parseHeader(header string) (string, map[string]string) {
	parts := strings.SplitN(header, ";", 2) // Split into main value and parameters
	mainValue := strings.TrimSpace(parts[0])

	params := make(map[string]string)
	if len(parts) > 1 { // Check if there are parameters
		for _, part := range strings.Split(parts[1], ";") {
			kv := strings.SplitN(part, "=", 2)
			if len(kv) == 2 {
				params[strings.TrimSpace(kv[0])] = strings.Trim(strings.TrimSpace(kv[1]), "\"")
			}
		}
	}

	return mainValue, params
}

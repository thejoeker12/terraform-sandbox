package main

import (
	"fmt"
	"net/url"
)

func main() {
	test_data := "https://joe.com/i%20am%20a%20test"
	parsed, _ := url.Parse(test_data)
	test := parsed.Path

	fmt.Println(test)

}

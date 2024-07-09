package main

import "fmt"

func main() {
	test := []string{"a", "b", "c", "d", "a"}
	fmt.Print(redirectLoop(test))

}

func redirectLoop(urls []string) bool {

	for i, j := range urls {
		for k, l := range urls {
			if i != k {
				if j == l {
					return true
				}
			}
		}
	}

	return false
}

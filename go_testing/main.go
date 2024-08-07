package main

import (
	"encoding/json"
	"log"
	"reflect"
)

type Parent struct {
	Key1 []Child
	Key2 string
	Key3 *Child
}

type Child struct {
	CKey1 string
}

func main() {
	obj1 := Parent{
		Key1: []Child{
			{
				CKey1: "Cheese",
			},
			{
				CKey1: "Ham",
			},
		},
	}

	obj2 := Parent{}

	marshalled1, _ := json.MarshalIndent(obj1, "", "	")
	marshalled2, _ := json.MarshalIndent(obj2, "", "	")

	log.Println("OBJ 1 - POPULATED:")
	log.Printf("obj1: %+v", obj1)
	log.Printf("obj1.Key1: %v", obj1.Key1)
	log.Println(string(marshalled1))
	log.Printf("reflect.TypeOf(&obj1.Key1): %v", reflect.TypeOf(&obj1.Key1))
	log.Println("-----")
	log.Println("OBJ 2 - EMPTY:")
	log.Printf("obj2: %+v", obj2)
	log.Printf("obj2.key1: %v", obj2.Key1)
	log.Println(string(marshalled2))
	log.Printf("rreflect.TypeOf(&obj2.Key1): %v", reflect.TypeOf(&obj2.Key1))

	structs := []Parent{obj1, obj2}
	for i, s := range structs {
		if s.Key1 == nil {
			log.Printf("Struct: %v key one is empty!", structs[i])
		} else {
			log.Printf("not empty!")
		}
	}

}

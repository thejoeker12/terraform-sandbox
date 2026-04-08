package main

import (
	"fmt"
	"time"
)

// interface

type Vehicle interface {
	Start() error
	Ident() string
}

// car struct

type Car struct {
	Name string
}

// lorry struct

type Lorry struct {
	Weight int
}

// car methods

func (c Car) Start() error {
	fmt.Println("car started")
	return nil
}

func (c Car) Ident() string {
	return c.Name
}

// lorry methods

func (l Lorry) Start() error {
	fmt.Println("starting")
	time.Sleep(1)
	fmt.Println("started")
	return nil
}

func (l Lorry) Ident() string {
	return fmt.Sprintf("Lorry with Weight: %d", l.Weight)
}

// func which consumes interface

func StartVehicle(veh Vehicle) {
	veh.Start()
	fmt.Printf("Starting... %s\n", veh.Ident())
}

// main

func main() {
	car1 := Car{
		Name: "BMW",
	}

	lorry1 := Lorry{
		Weight: 10,
	}

	var vehicleSlice []Vehicle
	vehicleSlice = append(vehicleSlice, car1)
	vehicleSlice = append(vehicleSlice, lorry1)

	for _, v := range vehicleSlice {
		StartVehicle(v)
	}

}

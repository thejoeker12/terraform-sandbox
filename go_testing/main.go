package main

import (
	"fmt"
)

type Engine struct {
	Displacement float64
	CylCount     int
}

type Vehicle interface {
	Start()
	GetStatus() bool
}

func main() {
	BMW := &Car{
		Make:  "BMW",
		Model: "3 Series",
		Age:   10,
		Engine: Engine{
			Displacement: 3.999,
			CylCount:     6,
		},
	}

	Iveco := &Lorry{
		Name: "jeff",
	}

	fmt.Println(BMW.Started)
	fmt.Println(StartVehicle(BMW))

	fmt.Println(Iveco.Started)
	fmt.Println(StartVehicle(Iveco))

}

func StartVehicle(v Vehicle) bool {
	v.Start()
	return v.GetStatus()

}

// Car
type Car struct {
	Started bool
	Make    string
	Model   string
	Age     int
	Engine  Engine
}

func (c *Car) Start() {
	c.Started = true
}

func (c *Car) GetStatus() bool {
	return c.Started
}

// Lorry
type Lorry struct {
	Started bool
	Name    string
}

func (c *Lorry) Start() {
	c.Started = true
}

func (c *Lorry) GetStatus() bool {
	return c.Started
}

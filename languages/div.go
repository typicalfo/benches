package main

import (
    "errors"
    "fmt"
)

func div(x, y float64) (float64, error) {
    if y == 0 {
        return 0, errors.New("division by zero")
    }
    return x / y, nil
}

func main() {
    x, y := 1., 0.
    if z, err := div(x, y); err != nil {
        fmt.Printf("Division failed: %v\n", err)
    } else {
        fmt.Printf("The result is: %v\n", z)
    }
}


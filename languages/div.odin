package main

import "core:fmt"

Division_Error :: enum {
	None,
	Division_By_Zero,
}

divide :: proc(a, b: f64) -> (f64, Division_Error) {
	if b == 0.0 {
		return 0, .Division_By_Zero
	}
	return a / b, .None
}

main :: proc() {
	fmt.println("Odin Division Example")
	
	result1, err1 := divide(10.0, 2.0)
	if err1 != .None {
		fmt.printf("Error: %v\n", err1)
		return
	}
	fmt.printf("10 / 2 = %.2f\n", result1)
	
	result2, err2 := divide(10.0, 0.0)
	if err2 != .None {
		fmt.printf("Error: %v\n", err2)
		fmt.println("Program completed")
		return
	}
	fmt.printf("10 / 0 = %.2f\n", result2)
	
	fmt.println("Program completed")
}
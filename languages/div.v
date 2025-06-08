module main

struct DivisionByZeroError {
	Error
	msg string
}

fn (err DivisionByZeroError) msg() string {
	return err.msg
}

fn divide(a f64, b f64) !f64 {
	if b == 0.0 {
		return DivisionByZeroError{
			msg: 'Division by zero'
		}
	}
	return a / b
}

fn main() {
	println('V Division Example')
	
	result1 := divide(10.0, 2.0) or {
		println('Error: ${err.msg()}')
		return
	}
	println('10 / 2 = ${result1:.2f}')
	
	result2 := divide(10.0, 0.0) or {
		println('Error: ${err.msg()}')
		println('Program completed')
		return
	}
	println('10 / 0 = ${result2:.2f}')
	
	println('Program completed')
}
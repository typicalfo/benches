class DivisionByZeroError extends Error {
    constructor(message = "Division by zero") {
        super(message);
        this.name = "DivisionByZeroError";
    }
}

function divide(a, b) {
    if (b === 0) {
        throw new DivisionByZeroError();
    }
    return a / b;
}

function main() {
    console.log("JavaScript (Bun) Division Example");
    
    try {
        const result1 = divide(10, 2);
        console.log(`10 / 2 = ${result1.toFixed(2)}`);
        
        const result2 = divide(10, 0);
        console.log(`10 / 0 = ${result2.toFixed(2)}`);
    } catch (error) {
        if (error instanceof DivisionByZeroError) {
            console.log(`Error: ${error.message}`);
        } else {
            console.log(`Unexpected error: ${error}`);
        }
    }
    
    console.log("Program completed");
}

main();
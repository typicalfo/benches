class DivisionByZeroError extends Error {
    constructor(message: string = "Division by zero") {
        super(message);
        this.name = "DivisionByZeroError";
    }
}

function divide(a: number, b: number): number {
    if (b === 0) {
        throw new DivisionByZeroError();
    }
    return a / b;
}

function main(): void {
    console.log("TypeScript (Bun) Division Example");
    
    try {
        const result1: number = divide(10, 2);
        console.log(`10 / 2 = ${result1.toFixed(2)}`);
        
        const result2: number = divide(10, 0);
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
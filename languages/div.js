class DivError extends Error {
    constructor(message = "division by zero") {
        super(message);
        this.name = "DivError";
    }
}

function div(x, y) {
    if (y === 0) {
        throw new DivError();
    }
    return x / y;
}

function main() {
    const x = 1.0;
    const y = 0.0;
    
    try {
        const z = div(x, y);
        console.log(`The result is: ${z}`);
    } catch (err) {
        console.error(`Division failed: ${err.message}`);
    }
}

main();
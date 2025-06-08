<?php

class DivError extends Exception {
    public function __construct($message = "division by zero", $code = 0, Throwable $previous = null) {
        parent::__construct($message, $code, $previous);
    }
}

function div($x, $y) {
    if ($y == 0.0) {
        throw new DivError();
    }
    return $x / $y;
}

function main() {
    $x = 1.0;
    $y = 0.0;
    
    try {
        $z = div($x, $y);
        echo "The result is: $z\n";
    } catch (DivError $e) {
        fwrite(STDERR, "Division failed: " . $e->getMessage() . "\n");
    }
}

main();

?>
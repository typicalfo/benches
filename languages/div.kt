class DivError(message: String = "division by zero") : Exception(message)

fun div(x: Double, y: Double): Double {
    if (y == 0.0) {
        throw DivError()
    }
    return x / y
}

fun main() {
    val x = 1.0
    val y = 0.0
    
    try {
        val z = div(x, y)
        println("The result is: $z")
    } catch (e: DivError) {
        System.err.println("Division failed: ${e.message}")
    }
}
import scala.util.{Try, Success, Failure}

class DivError(message: String = "division by zero") extends Exception(message)

object Division {
  def div(x: Double, y: Double): Double = {
    if (y == 0.0) throw new DivError()
    x / y
  }
  
  def main(args: Array[String]): Unit = {
    val x = 1.0
    val y = 0.0
    
    Try(div(x, y)) match {
      case Success(z) => println(s"The result is: $z")
      case Failure(e: DivError) => System.err.println(s"Division failed: ${e.getMessage}")
      case Failure(e) => System.err.println(s"Unexpected error: ${e.getMessage}")
    }
  }
}
import Foundation

enum DivError: Error {
    case divisionByZero
    
    var localizedDescription: String {
        switch self {
        case .divisionByZero:
            return "division by zero"
        }
    }
}

func div(x: Double, y: Double) throws -> Double {
    if y == 0.0 {
        throw DivError.divisionByZero
    }
    return x / y
}

func main() {
    let x: Double = 1.0
    let y: Double = 0.0
    
    do {
        let z = try div(x: x, y: y)
        print("The result is: \(z)")
    } catch let error as DivError {
        fputs("Division failed: \(error.localizedDescription)\n", stderr)
    } catch {
        fputs("Unexpected error: \(error)\n", stderr)
    }
}

main()
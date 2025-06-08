class DivError extends Exception {
    public DivError(String message) {
        super(message);
    }
}

public class div {
    public static double divide(double x, double y) throws DivError {
        if (y == 0.0) {
            throw new DivError("division by zero");
        }
        return x / y;
    }
    
    public static void main(String[] args) {
        double x = 1.0;
        double y = 0.0;
        
        try {
            double z = divide(x, y);
            System.out.println("The result is: " + z);
        } catch (DivError e) {
            System.err.println("Division failed: " + e.getMessage());
        }
    }
}
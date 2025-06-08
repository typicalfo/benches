using System;

public class DivError : Exception
{
    public DivError(string message) : base(message) { }
}

public class Program
{
    public static double Div(double x, double y)
    {
        if (y == 0.0)
        {
            throw new DivError("division by zero");
        }
        return x / y;
    }
    
    public static void Main(string[] args)
    {
        double x = 1.0;
        double y = 0.0;
        
        try
        {
            double z = Div(x, y);
            Console.WriteLine($"The result is: {z}");
        }
        catch (DivError e)
        {
            Console.Error.WriteLine($"Division failed: {e.Message}");
        }
    }
}
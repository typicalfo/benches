import std.stdio;
import std.conv;

class DivisionByZeroError : Exception
{
    this(string msg = "Division by zero")
    {
        super(msg);
    }
}

double divide(double a, double b)
{
    if (b == 0.0)
    {
        throw new DivisionByZeroError();
    }
    return a / b;
}

void main()
{
    writeln("D Division Example");
    
    try
    {
        double result1 = divide(10.0, 2.0);
        writefln("10 / 2 = %.2f", result1);
        
        double result2 = divide(10.0, 0.0);
        writefln("10 / 0 = %.2f", result2);
    }
    catch (DivisionByZeroError e)
    {
        writefln("Error: %s", e.msg);
    }
    
    writeln("Program completed");
}
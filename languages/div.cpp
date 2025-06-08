#include <iostream>
#include <stdexcept>

class DivError : public std::runtime_error {
public:
    DivError() : std::runtime_error("division by zero") {}
};

double div(double x, double y) {
    if (y == 0.0) {
        throw DivError();
    }
    return x / y;
}

int main() {
    double x = 1.0;
    double y = 0.0;
    
    try {
        double z = div(x, y);
        std::cout << "The result is: " << z << std::endl;
    } catch (const DivError& e) {
        std::cerr << "Division failed: " << e.what() << std::endl;
    }
    
    return 0;
}
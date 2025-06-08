#include <stdio.h>
#include <stdlib.h>

typedef enum {
    DIV_SUCCESS,
    DIV_ERROR_ZERO
} div_result_t;

div_result_t divide(double x, double y, double *result) {
    if (y == 0.0) {
        return DIV_ERROR_ZERO;
    }
    *result = x / y;
    return DIV_SUCCESS;
}

int main() {
    double x = 1.0;
    double y = 0.0;
    double z;
    
    div_result_t status = divide(x, y, &z);
    
    if (status == DIV_SUCCESS) {
        printf("The result is: %f\n", z);
    } else {
        fprintf(stderr, "Division failed: division by zero\n");
    }
    
    return 0;
}
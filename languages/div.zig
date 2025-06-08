const std = @import("std");
const print = std.debug.print;

const DivisionError = error{
    DivisionByZero,
};

fn divide(a: f64, b: f64) DivisionError!f64 {
    if (b == 0.0) {
        return DivisionError.DivisionByZero;
    }
    return a / b;
}

pub fn main() void {
    print("Zig Division Example\n");
    
    const result1 = divide(10.0, 2.0) catch |err| {
        print("Error: {}\n", .{err});
        return;
    };
    print("10 / 2 = {d:.2}\n", .{result1});
    
    const result2 = divide(10.0, 0.0) catch |err| {
        print("Error: {}\n", .{err});
        print("Program completed\n");
        return;
    };
    print("10 / 0 = {d:.2}\n", .{result2});
    
    print("Program completed\n");
}
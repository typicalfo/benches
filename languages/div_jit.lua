local ffi = require("ffi")

-- Use LuaJIT's FFI for better performance
ffi.cdef[[
    void printf(const char *fmt, ...);
]]

local DivisionByZeroError = {}
DivisionByZeroError.__index = DivisionByZeroError

function DivisionByZeroError:new(message)
    local obj = {
        message = message or "Division by zero"
    }
    setmetatable(obj, self)
    return obj
end

function DivisionByZeroError:__tostring()
    return self.message
end

local function divide(a, b)
    if b == 0.0 then
        error(DivisionByZeroError:new(), 2)
    end
    return a / b
end

local function main()
    print("Lua JIT Division Example")
    
    local success1, result1 = pcall(divide, 10.0, 2.0)
    if success1 then
        ffi.C.printf("10 / 2 = %.2f\n", result1)
    else
        print("Error: " .. tostring(result1))
        return
    end
    
    local success2, result2 = pcall(divide, 10.0, 0.0)
    if success2 then
        ffi.C.printf("10 / 0 = %.2f\n", result2)
    else
        print("Error: " .. tostring(result2))
        print("Program completed")
        return
    end
    
    print("Program completed")
end

main()
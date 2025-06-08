function div(x, y)
    if y == 0 then
        error("division by zero")
    end
    return x / y
end

function main()
    local x, y = 1.0, 0.0
    
    local status, result = pcall(div, x, y)
    
    if status then
        print("The result is: " .. result)
    else
        io.stderr:write("Division failed: " .. result .. "\n")
    end
end

main()
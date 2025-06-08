class DivError < StandardError
  def initialize(message = "division by zero")
    super(message)
  end
end

def div(x, y)
  raise DivError if y == 0.0
  x / y
end

def main
  x, y = 1.0, 0.0
  
  begin
    z = div(x, y)
    puts "The result is: #{z}"
  rescue DivError => e
    warn "Division failed: #{e.message}"
  end
end

main if __FILE__ == $0
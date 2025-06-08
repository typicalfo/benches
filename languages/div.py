class DivError(Exception):
    def __init__(self, message="division by zero"):
        super().__init__(message)

def div(x, y):
    if y == 0.0:
        raise DivError()
    return x / y

def main():
    x, y = 1.0, 0.0
    
    try:
        z = div(x, y)
        print(f"The result is: {z}")
    except DivError as e:
        print(f"Division failed: {e}", file=__import__('sys').stderr)

if __name__ == "__main__":
    main()
# COLORS

class Colors:
    FAIL = '\033[92m'
    OK = '\033[93m'
    WARNING = '\033[91m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    ITALIC = '\033[3m'

    END= '\033[0m'

# /COLORS

def ok(*args) -> None:
    print(Colors.OK + " ".join(args) + Colors.END)

def warn(*args) -> None:
    print(Colors.WARNING + " ".join(args) + Colors.END)

def fail(*args) -> None:
    print(Colors.FAIL + " ".join(args) + Colors.END)

def underline(*args) -> None:
    print(Colors.UNDERLINE + " ".join(args) + Colors.END)

def bold(*args) -> None:
    print(Colors.BOLD + " ".join(args) + Colors.END)

def italic(*args) -> None:
    print(Colors.ITALIC + " ".join(args) + Colors.END)

def main() -> None:
    ok("OK")
    warn("WARNING")
    fail("FAIL")
    underline("UNDERLINE")
    bold("BOLD")
    italic("ITALIC")

if __name__ == "__main__":
    main()

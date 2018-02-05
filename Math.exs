defmodule Math do
    def sum(1), do: 1
    def sum(n), do: n + sum(n-1)

    def gcd(x, 0), do: x
    def gcd(x, y), do: gcd(y, rem(x,y))

    def factorial(0), do: 1
    def factorial(n) when n > 0, do: n * factorial(n - 1)
end
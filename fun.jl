function fib(n)
    if n == 0 || n == 1
        n
    elseif n > 1
        fib(n-1) + fib(n-2)
    else
        throw(DomainError(n, "'n' must no be negative."))
    end
end

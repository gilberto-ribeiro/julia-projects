function pratica(n, max=10)
    acertos = 0
    for i in 1:n
        x = rand(2:max)
        y = rand(2:max)
        printstyled(i, ". ", bold = true, color = :cyan)
        print(x, " \U00D7 ", y, " = ")
        z = parse(Int64, readline(stdin))
        if x*y == z
            printstyled("(Acertou)", bold = false, color = :green)
            acertos += 1
        else
            printstyled("(Errou: ", x*y, ")", bold = false, color = :red)
        end
        print("\n\n")
    end
    printstyled("Voce acertou ", acertos, " de ", n, bold = true, color = :yellow)
end

function imprimir_tabuada(n=10)
    np1 = length(string(n^2)) + 1
    np2 = length(string(n))
    printstyled(lpad('\U00D7', np2), bold = true, color = :blue)
    for i in 1:n
        printstyled(lpad(i, np1), bold = true, color = :red)
    end
    println()
    for i in 1:n
        printstyled(lpad(i, np2), bold = true, color = :red)
        for j in 1:n
            if i == j
                printstyled(lpad(i*j, np1), bold = true, color = :yellow)
            else
                print(lpad(i*j, np1))
            end
        end
        println()
    end
end

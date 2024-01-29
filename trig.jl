function fatorial(n)
    if n == 0
        1
    elseif n >= 1
        n * fatorial(n-1)
    else
        err = DomainError(n, "'n' must not be negative")
        throw(err)
    end
end

function seno(angulo)
    n = 10
    radiano = deg2rad(angulo)
    x = radiano
    seno = 0
    for i in 0:n
        seno += (-1)^i * (x^(2i+1)) / fatorial(2i+1)
    end
    seno
end

function tabela_seno(angulo_maximo, incremento)
    for angulo in 0:incremento:angulo_maximo
        println(seno(angulo))
    end
end

function format(num)
    pattern = "-0.000"
    n = length(pattern)
    d = length(split(pattern, '.')[2])
    if num < 0
        rpad(round(num, digits=d), n, '0')    
    else
        rpad(round(num, digits=d), n-1, '0')
    end
end

function imprimir_tabela_seno(incremento, angulo_maximo)
    println("angulo"," | ","cosseno"," | ","seno")
    for angulo in 0:incremento:angulo_maximo
        rad = deg2rad(angulo)
        seno = sin(rad)
        cosseno = cos(rad)
        println(lpad(angulo, 6), " | ",
        lpad(format(cosseno), 7), " | ",
        lpad(format(seno), 7))
    end
end

imprimir_tabela_seno(10, 360)

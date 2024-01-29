# Data

pizzas = [
    ("hawaiian", 'S', 10.5),
    ("mexicana", 'S', 13.0),
    ("hawaiian", 'L', 16.5),
    ("bbq chicken", 'L', 20.75),
    ("sicilian", 'S', 12.25),
    ("bbq chicken", 'M', 16.75),
    ("mexicana", 'M', 16.0),
    ("thai chicken", 'L', 20.75),
]

# Accessor functions

name(pizza) = pizza[1]
portion(pizza) = pizza[2]
price(pizza) = pizza[3]

# Table

function print_table(pizzas)
    print("| ")
    printstyled(rpad("name", 12), color=:cyan)
    print(" | ")
    printstyled(rpad("size", 4), color=:cyan)
    print(" | ")
    printstyled(rpad("price", 5), color=:cyan)
    println(" |")
    for pz in pizzas
        println("| ",
        rpad(name(pz), 12),
        " | ",
        rpad(portion(pz), 4),
        " | ",
        lpad(price(pz), 5),
        " |"
        )
    end
end

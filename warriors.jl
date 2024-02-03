abstract type Warrior end

mutable struct Archer <: Warrior
    name::String
    health::Int64
    arrows::Int64
end

mutable struct Pikeman <: Warrior
    name::String
    health::Int64
end

mutable struct Knight <: Warrior
    name::String
    health::Int64
    mounted::Bool
end

function health(w::Warrior)
    println(w.name, ": ", w.health)
end

function shoot!(archer::Archer)
    if archer.arrows > 0
        archer.arrows -= 1
    end
    archer
end

function resupply!(archer::Archer)
    archer.arrows = 24
    archer
end

function mount!(knight::Knight)
    knight.mounted = true
    knight
end

function unmount!(knight::Knight)
    knight.mounted = false
    knight
end

function attack!(a::Archer, b::Archer)
    if a.arrows > 0
        shoot!(a)
        damage = 6 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
#    a.health, b.health
    health(a); health(b)
end

function attack!(a::Archer, b::Knight)
    if a.arrows > 0
        shoot!(a)
        damage = rand(1:6)
        if b.mounted
            damage += 3
        end
        b.health = max(b.health - damage, 0)
    end
#    a.health, b.health
    health(a); health(b)
end

function attack!(a::Archer, b::Pikeman)
    if a.arrows > 0
        shoot!(a)
        damage = 4 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
#    a.health, b.health
    health(a); health(b)
end

function attack!(a::Knight, b::Knight)
    a.health = max(a.health - rand(1:6), 0)
    b.health = max(b.health - rand(1:6), 0)
    health(a); health(b)
end

function battle!(a::Warrior, b::Warrior)
    attack!(a, b)
        if a.health == 0 && b.health == 0
            println(a.name, " and ", b.name, " destroyed each other")
        elseif a.health == 0
            println(b.name, " defeated ", a.name)
        elseif b.health == 0
            println(a.name, " defeated ", b.name)
        else
            println(b.name, " survived attack from ", a.name)
    end
end

function heal!(w::Warrior, points)
    w.health += points
    health(w)
end

# Abstract types

abstract type Tank end

# Concrete types

mutable struct SmallTank <: Tank
    propellant::Float64
end

mutable struct MediumTank <: Tank
    propellant::Float64

# Inner constructor
    function MediumTank(amount::Real)
        tank = new(0)
        propellant!(tank, amount)
        tank
    end 
end

mutable struct LargeTank <: Tank
    propellant::Float64

# Inner constructor
    function LargeTank()
        tank = new(0)
        refill!(tank, true)
        tank
    end
end

mutable struct FlexiTank <: Tank
    drymass::Float64
    totalmass::Float64
    propellant::Float64

# Inner constructor
    function FlexiTank(drymass::Real, totalmass::Real)
        tank = new(drymass, totalmass, 0)
        refill!(tank, true)
        tank
    end
end

# Accessor functions (getters)

drymass(::SmallTank) = 40.0
drymass(::MediumTank) = 250.0
drymass(::LargeTank) = 950.0
drymass(tank::FlexiTank) = tank.drymass

totalmass(::SmallTank) = 410.0
totalmass(::MediumTank) = 2300.0
totalmass(::LargeTank) = 10200.0
totalmass(tank::FlexiTank) = tank.totalmass

propellant(tank::Tank) = tank.propellant

mass(tank::Tank) = drymass(tank) + propellant(tank)

isempty(tank::Tank) = propellant(tank) <= 0

function status(tank::Tank)
    println(rpad("Dry mass:", 11), lpad(drymass(tank), 8))
#    println(rpad("Total mass:", 11), lpad(totalmass(tank), 8))
    println(rpad("Propellant:", 11), lpad(propellant(tank), 8))
    println(rpad("Mass:", 11), lpad(mass(tank), 8))
end

# Accessor functions (setters)

function propellant!(tank::Tank, amount::Real)
    if amount > 0
        if 0 <= amount + drymass(tank) <= totalmass(tank)
            tank.propellant = amount
        else
            msg = "Propellant mass plus dry mass must be less than total mass"
            throw(DomainError(amount, msg))
        end
    else
        msg = "Propellant mass must not be negative"
        throw(DomainError(amount, msg))
    end
end

# Actions

function refill!(tank::Tank, quiet::Bool = false)
    propellant!(tank, totalmass(tank) - drymass(tank))
    if ! quiet
        status(tank)
    end
end

function consume!(tank::Tank, amount::Real, quiet::Bool = false)
    remaining = max(propellant(tank) - amount, 0)
    propellant!(tank, remaining)
    if ! quiet
        status(tank)
    end
end

# Outter constructors

function SmallTank()
    tank = SmallTank(0)
    refill!(tank, true)
    tank
end

function MediumTank()
    tank = MediumTank(0)
    refill!(tank, true)
    tank
end

#function LargeTank()
#    tank = LargeTank(0)
#    refill!(tank, true)
#    tank
#end

#function FlexiTank(drymass::Real, totalmass::Real)
#    tank = FlexiTank(drymass, totalmass, 0)
#    refill!(tank, true)
#    tank
#end

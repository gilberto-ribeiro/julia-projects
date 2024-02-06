# Abstract type

abstract type Engine end

# Concrete types

mutable struct CustomEngine <: Engine
    mass::Float64
    thrust::Float64
    Isp::Float64
end

struct Rutheford <: Engine end

struct Merlin <: Engine end

# Accessor functions (getters)

mass(engine::CustomEngine) = egine.mass
thrust(engine::CustomEngine) = egine.thrust
Isp(engine::CustomEngine) = egine.Isp

mass(::Rutheford) = 35.0
thrust(::Rutheford) = 25000.0
Isp(::Rutheford) = 311.0

mass(::Merlin) = 470.0
thrust(::Merlin) = 845e3
Isp(::Merlin) = 282.0

# Others

g = 9.80665

function mass_flow(thrust::Real, Isp::Real)
    thrust / (Isp * g)
end

function mass_flow(engine::Engine)
    thrust(engine) / (Isp(engine) * g)
end

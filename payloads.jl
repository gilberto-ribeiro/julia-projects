# Concrete types

struct Payload
    mass::Float64
end

# Accessor functions (getters)

mass(payload::Payload) = payload.mass

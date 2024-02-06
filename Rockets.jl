include("tanks.jl")
include("engines.jl")
include("payloads.jl")

struct Rocket
    payload::Payload
    tank::Tank
    engine::Engine
end


abstract type AbstractPitotTube end

struct Pitot <: AbstractPitotTube
    "Type of Pitot tube (Prandtl, Cole, etc)"
    type::String
    "Tag of the tube - book keeping"
    tag::String
    "Discharge Coefficient"
    Cd::Float64
end
Base.broadcastable(P::Pitot) = Ref(P) # It doesn't broadcast

raw"""
    `Pitot(;Cd=1.0, type="Prandtl", tag="")`

Standard interface for single degree of freedom Pitot tubes. 

The velocity of a Pitot tube is given by

``
V = C_d ⋅ \sqrt{2ΔP/ρ}
``
"""
Pitot(;Cd=1.0, type="Prandtl", tag="") = Pitot(type, tag, Cd)

"Return the discharge coefficient of a Pitot tube"
dischcoef(p::Pitot) = p.Cd

"Calculates the velocity measured by a Pitot tube"
velocity(ΔP, ρ=1.09) = sqrt(2ΔP/ρ)
velocity(p::Pitot, ΔP, ρ=1.09) = p.Cd * sqrt(2ΔP / ρ)

(P::Pitot)(ΔP, ρ=1.09) = velocity(P, ΔP, ρ)

"Calculate the dynamic pressure measured by the Pitot tube"
dynamicpress(ΔP) = ΔP
dynamicpress(p::Pitot, ΔP) = p.Cd^2 * ΔP

"Return the pressure differential required by a Pitot tube to achieve a given velocity"
pressdiff(V, ρ=1.09) = ρ*V^2 / 2
pressdiff(p::Pitot, V, ρ=1.09) = ρ*V^2/(2*p.Cd^2)

    

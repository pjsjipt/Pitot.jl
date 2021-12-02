using Pitot
using Test

@testset "Pitot.jl" begin

    P = Pitot()
    @test 1.0 ≈ P.Cd
    @test velocity(P, 50.0, 1.0) ≈ 10.0
    @test dynamicpress(P, 50.0) ≈ 50.0
    @test pressdiff(P, 10.0, 1.0) ≈ 50.0

    P = Pitot(Cd=0.9)
    @test 0.9 == P.Cd
    @test velocity(P, 50.0, 1.0) ≈ 9.0
    @test dynamicpress(P, 50.0) ≈ 40.5
    @test pressdiff(P, 9.0, 1.0) ≈ 50.0

end

module TestRadTrans

using Test
using Dates: DateTime
using Canopy.RadTrans.Blackbody
using Canopy.RadTrans.Solar

@time @testset "Canopy.RadTrans.Blackbody" begin
    @test isapprox(ephoton(450e-9), 4.414e-19, rtol=1e-3)  # blue
    @test isapprox(ephoton(700e-9), 2.838e-19, rtol=1e-3)  # red

    @test isapprox(energy2photon(600, 0.5e-6), 2508e-6, rtol=1e-3)

    @test isapprox(planck(500e-9, 5772), 2.624e13, rtol=1e-3)  # sun
    @test isapprox(planck(10e-6, 288), 8.114e6, rtol=1e-3)  # earth

    @test isapprox(stefan_boltzmann(5772), 6.294e7, rtol=1e-3)  # sun
    @test isapprox(stefan_boltzmann(255), 239.8, rtol=1e-3)  # earth

    @test isapprox(blackbody_temp(240), 255, rtol=1e-3)  # earth
    @test isapprox(blackbody_temp(149.6), 226.6, rtol=1e-3)  # venus
end

@time @testset "Canopy.RadTrans.Solar" begin
    @test isapprox(eccentricity(-1), 0.01712, rtol=1e-3)  # 1000 AD
    @test isapprox(eccentricity(DateTime(1000)), eccentricity(-1), rtol=1e-6)
    @test isapprox(eccentricity(1), 0.01627, rtol=1e-3)  # 3000 AD
    @test isapprox(eccentricity(DateTime(3000)), eccentricity(1), rtol=1e-6)

    # TODO:
end

end  # module

include("../src/primefield.jl")

@testset "Field Element Ops" begin
    @testset "Addition" begin
        a = FieldElement(7, 13)
        b = FieldElement(12, 13)
        @test a+b == FieldElement(6, 13)
    end
end
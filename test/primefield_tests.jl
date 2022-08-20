@testset "Field Element Ops" begin
    @testset "Addition" begin
        a = FieldElement(7, 13)
        b = FieldElement(12, 13)
        @test a+b == FieldElement(6, 13)
    end
    @testset "Subtraction" begin
        a = FieldElement(29, 31)
        b = FieldElement(4, 31)
        @test a-b == FieldElement(25, 31)
    end
end
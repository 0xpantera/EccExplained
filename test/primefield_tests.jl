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
    @testset "Multiplication" begin
        a = FieldElement(24, 31)
        b = FieldElement(19, 31)
        @test a*b == FieldElement(22, 31)
    end
    @testset "Exponentiation" begin
        a = FieldElement(17, 31)
        @test a^3 == FieldElement(15, 31)
        a = FieldElement(5, 31)
        b = FieldElement(18, 31)
        @test a^5 * b == FieldElement(16, 31)
    end
    @testset "Division" begin
        a = FieldElement(3, 31)
        b = FieldElement(24, 31)
        @test a/b == FieldElement(4, 31)
        a = FieldElement(17, 31)
        @test a^-3 == FieldElement(29, 31)
        a = FieldElement(4, 31)
        b = FieldElement(11, 31)
        @test a^-4*b == FieldElement(13, 31)
    end
end
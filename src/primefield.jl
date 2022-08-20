import Base: show, ==

struct FieldElement
    n::Integer
    p::Integer

    FieldElement(n, p) = 
        (n >= p) || (n < 0) ? throw(DomainError("Num $n not in field")) : new(n,p)
end

function show(io::IO, z::FieldElement)
    print(io, "FieldElement_$(z.p)($(z.n))")
end

function ==(x::FieldElement, y::FieldElement)
    (x.n == y.n) && (x.p == y.p)
end

z = FieldElement(4, 31)
a = FieldElement(4, 31)
b = FieldElement(5, 31)
print(z)
z == a
z == b
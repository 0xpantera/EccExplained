struct FieldElement
    n::Integer
    p::Integer

    FieldElement(n, p) = 
        (n >= p) || (n < 0) ? throw(DomainError("Num $n not in field")) : new(n,p)
end

function Base.show(io::IO, z::FieldElement)
    print(io, "FieldElement_$(z.p)($(z.n))")
end

function Base.:(==)(x::FieldElement, y::FieldElement)
    (x.n == y.n) && (x.p == y.p)
end

function Base.:+(x::FieldElement, y::FieldElement)
    if x.p != y.p
        throw(DomainError("Can't add two nums in different fields"))
    else
        n = mod(x.n + y.n, x.p)
        FieldElement(n, x.p)
    end
end

function Base.:-(x::FieldElement, y::FieldElement)
    if x.p != y.p
        throw(DomainError("Can't subtract two nums in different fields"))
    else
        n = mod(x.n - y.n, x.p)
        FieldElement(n, x.p)
    end
end
abstract type FiniteField <: Number end

struct FieldElement <: FiniteField
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

function Base.:*(x::FieldElement, y::FieldElement)
    if x.p != y.p
        throw(DomainError("Can't multiply two nums in different fields"))
    else
        n = mod(x.n * y.n, x.p)
        FieldElement(n, x.p)
    end
end

function Base.:*(x::Integer, y::FieldElement)
    FieldElement(mod(x * y.n, y.p), y.p)
end

function Base.:^(x::FieldElement, k::Integer)
    n = powermod(x.n, mod(k, (x.p - 1)), x.p)
    FieldElement(n, x.p)
end

function Base.inv(x::FieldElement)
    n = powermod(x.n, mod(-1, (x.p - 1)), x.p)
    FieldElement(n, x.p)
end

function Base.div(x::FieldElement, y::FieldElement)
    x / y
end

function Base.:/(x::FieldElement, y::FieldElement)
    if x.p != y.p
        throw(DomainError("Can't divide two nums in different fields"))
    else
       n = mod(x.n * powermod(y.n, x.p - 2, x.p), x.p)
        FieldElement(n, x.p)
    end
    
end
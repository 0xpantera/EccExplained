primitive type Infinity <: Number 8 end

function Infinity(x::Real)
    if x < 0
        reinterpret(Infinity, Int8(-1))
    elseif x > 0
        reinterpret(Infinity, Int8(1))
    else
        throw(DomainError("x can't be 0"))
    end
end

function Base.show(io::IO, z::Infinity)
    z == Infinity(1) ? print(io, "∞") : print(io, "-∞")
end

const ∞ = Infinity(1)

Base.:+(x::Infinity) = x
Base.:-(x::Infinity) = x == ∞ ? Infinity(-1) : ∞
Base.inv(x::Infinity) = x

Finite = Union{Integer, FiniteField}

==(::Infinity, ::Finite) = false
==(::Finite, ::Infinity) = false

Base.:+(x::Infinity, ::Integer...) = x
Base.:+(x::Infinity, y::Infinity) = x == y ? x : NaN

Base.:-(x::Infinity, ::Integer...) = x

Base.:*(n::Signed, x::Infinity) = n == 0 ? 0 : n < 0 ? -x : x
Base.:^(x::Infinity, n::Integer) = x


struct Point
    a::Number 
    b::Number
    x::Number
    y::Number

    Point(x, y, a, b) = 
        y^2 != x^3 + a*x + b ? throw(DomainError("($x, $y) is not on the curve")) : new(x, y, a, b)
end

function Base.:(==)(p::Point, q::Point)
    (p.x == q.x) && (p.y == q.y) && (p.a == q.a) && (p.b == q.b)
end
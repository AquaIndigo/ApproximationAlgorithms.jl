struct SetCover <: ApproximationProblem
    sets::Vector{Set{Int}}
    weights::Vector
    n::Int
    function SetCover(sets, weights, n)
        @assert length(sets) == length(weights)
        @assert all(>(0), weights)
        return new(sets, weights, n)
    end
end

## H_n factor approximation
function solve(prob::SetCover)
    len = length(prob.sets)
    sets = copy(prob.sets)
    weights = copy(prob.weights)
    c = Set{Int}()
    res = 0
    ss = Int[]
    for i in 0:(len-1)
        idx = argmin(x -> weights[x] / length(setdiff(sets[x], c)), 1:(len - i))
        union!(c, sets[idx])
        res += weights[idx]
        push!(ss, idx)
        deleteat!(sets, idx)
        deleteat!(weights, idx)
        length(c) == prob.n && break
    end
    length(c) != prob.n && error("No solution")
    return ss, res
end

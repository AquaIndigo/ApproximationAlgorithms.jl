struct CardinalityVertexCover <: ApproximationProblem
    edges::Vector{Tuple{Int, Int}}
    n::Int
end

function solve(prob::CardinalityVertexCover)
    return 0
end

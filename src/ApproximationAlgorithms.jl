module ApproximationAlgorithms

# Write your package code here.
abstract type ApproximationProblem end
function solve(prob::ApproximationProblem) end

include("cardinality_vertex_cover.jl")
include("set_cover.jl")

export solve, ApproximationProblem, SetCover
end

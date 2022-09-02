struct VertexCover <: ApproximationProblem
    edges::Vector{Tuple{Int, Int}}
    weights::Vector{Float64}
    n::Int
    function VertexCover(edges, weights)
        n = length(weights)
        @assert all(>(0), weights)
        new(edges, weights, n)
    end
end

function solve(prob::VertexCover)
    adj_table = Dict{Int, Vector{Int}}()
    for (u, v) in prob.edges
        adj_table[u] = push!(get!(adj_table, u, Int[]), v)        
        adj_table[v] = push!(get!(adj_table, v, Int[]), u)
    end
    degrees = [length(adj_table[i]) for i in 1:prob.n]
    zero_dg_vertices = Set(findall(==(0), degrees))
    remaining = Set(1:prob.n)
    res, res_w = Int[], 0.0
    while true
        setdiff!(remaining, zero_dg_vertices)
        empty!(zero_dg_vertices)
        isempty(remaining) && break
        maxc = maximum(u -> prob.weights[u] / degrees[u], remaining)
        vs = Set(u for u in remaining if prob.weights[u] / degrees[u] == maxc)

        setdiff!(remaining, vs)
        append!(res, vs)
        res_w += sum(prob.weights[v] for v in vs)
        for v in vs, u in adj_table[v]
            degrees[u] -= 1
            degrees[v] -= 1
            degrees[u] == 0 && push!(zero_dg_vertices, u)
        end
    end
    return res, res_w
end

@testset "vertex_cover.jl" begin
    edges = Tuple{Int, Int}[]
    for i in 1:10
        iseven(i) && continue
        append!(edges, (i, j) for j in 2:2:10)
    end
    weights = ones(10)
    prob = VertexCover(edges, weights)
    vs, w = solve(prob)
    @test sort(vs) == collect(1:10)
    @test w ≈ 10.0
end

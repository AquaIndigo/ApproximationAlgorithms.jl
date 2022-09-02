@testset "set_cover.jl" begin
    sets = Set.([[1], [2], [3], [1, 2, 3]])
    weights = 1 ./ [1, 2, 3]
    push!(weights, 1 + eps(1.0))
    prob = SetCover(sets, weights, 3)
    @test solve(prob) == ([3, 2, 1], sum(weights[1:3]))
end

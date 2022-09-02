using ApproximationAlgorithms
using Test

for testfile in readdir("./")
    testfile == "runtests.jl" && continue
    include(testfile)
end
